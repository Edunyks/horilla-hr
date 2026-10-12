"""
ENABLED_MODULES feature flag (horilla/modules.py).

A switched-off module keeps its models and migrations but must vanish from
the running app: no URLs, no sidebar entry, no settings entry, no scheduled
jobs. With the flag unset nothing may change.
"""

import os
import subprocess
import sys
from pathlib import Path
from unittest import mock

from django.apps import apps
from django.contrib.sessions.backends.db import SessionStore
from django.http import Http404
from django.test import RequestFactory, SimpleTestCase, TestCase, override_settings
from django.urls import resolve

from horilla.config import sidebar
from horilla.menu import get_settings_menu
from horilla.modules import (
    OPTIONAL_MODULES,
    _module_disabled,
    is_enabled,
    is_payroll_only,
)
from horilla.scheduling import ScheduledJob
from horilla.testkit.factories import make_user

BASE_DIR = Path(__file__).resolve().parent.parent.parent

PAYROLL_ONLY = ["report"]


class IsEnabledTests(SimpleTestCase):
    @override_settings(ENABLED_MODULES=None)
    def test_unset_means_every_installed_module_is_on(self):
        for name in OPTIONAL_MODULES:
            self.assertEqual(is_enabled(name), apps.is_installed(name), name)
        self.assertFalse(is_payroll_only())

    @override_settings(ENABLED_MODULES=PAYROLL_ONLY)
    def test_only_listed_optional_modules_are_on(self):
        self.assertTrue(is_enabled("report"))
        self.assertFalse(is_enabled("recruitment"))
        self.assertFalse(is_enabled("asset"))
        self.assertTrue(is_payroll_only())

    @override_settings(ENABLED_MODULES=[])
    def test_core_apps_cannot_be_switched_off(self):
        for name in ("base", "employee", "attendance", "leave", "payroll"):
            self.assertTrue(is_enabled(name), name)

    @override_settings(ENABLED_MODULES=None)
    def test_not_installed_is_never_enabled(self):
        self.assertFalse(is_enabled("no_such_app"))

    @override_settings(ENABLED_MODULES=PAYROLL_ONLY)
    def test_template_filter_follows_the_flag(self):
        from base.templatetags.horillafilters import app_installed

        self.assertFalse(app_installed("recruitment"))
        self.assertTrue(app_installed("payroll"))


class ReadyTests(SimpleTestCase):
    """A disabled module's AppConfig.ready() mounts only 404s."""

    def _run_ready(self, label):
        urlpatterns = []
        app_list = []
        with mock.patch("horilla.urls.urlpatterns", urlpatterns), mock.patch(
            "django.conf.settings.APPS", app_list
        ):
            apps.get_app_config(label).ready()
        return urlpatterns, app_list

    def _views(self, patterns):
        for pattern in patterns:
            if hasattr(pattern, "url_patterns"):
                yield from self._views(pattern.url_patterns)
            else:
                yield pattern.callback

    @override_settings(ENABLED_MODULES=[])
    def test_disabled_module_mounts_only_404s(self):
        for label in ("recruitment", "helpdesk", "project", "asset"):
            urlpatterns, app_list = self._run_ready(label)
            self.assertEqual(len(urlpatterns), 1, label)
            views = set(self._views(urlpatterns))
            self.assertEqual(views, {_module_disabled}, label)
            self.assertEqual(app_list, [], label)

    @override_settings(ENABLED_MODULES=None)
    def test_enabled_module_mounts_its_urls(self):
        urlpatterns, app_list = self._run_ready("helpdesk")
        self.assertEqual(len(urlpatterns), 1)
        self.assertNotIn(_module_disabled, set(self._views(urlpatterns)))
        self.assertEqual(app_list, ["helpdesk"])

    def test_disabled_view_is_a_404(self):
        with self.assertRaises(Http404):
            _module_disabled(RequestFactory().get("/recruitment/"))


class SchedulerTests(SimpleTestCase):
    def _job(self, module):
        func = mock.Mock(__module__=module, __name__="job")
        return ScheduledJob(func=func, trigger="interval", job_id=module)

    def test_jobs_of_disabled_modules_are_dropped(self):
        from base.management.commands.run_scheduler import Command

        with override_settings(ENABLED_MODULES=[]):
            self.assertFalse(Command._job_enabled(self._job("recruitment.scheduler")))
            self.assertTrue(Command._job_enabled(self._job("payroll.scheduler")))
            # Not an app at all (pg_backup is not in INSTALLED_APPS): kept.
            self.assertTrue(Command._job_enabled(self._job("pg_backup.scheduler")))
        with override_settings(ENABLED_MODULES=None):
            self.assertTrue(Command._job_enabled(self._job("recruitment.scheduler")))


class MenuTests(TestCase):
    @classmethod
    def setUpTestData(cls):
        cls.user = make_user("flag-admin", is_superuser=True)

    def _request(self):
        request = RequestFactory().get("/")
        request.user = self.user
        request.session = SessionStore()
        request.session.create()
        return request

    def _sidebar_apps(self):
        request = self._request()
        sidebar(request)
        return [menu["app"] for menu in request.MENUS]

    def _settings_titles(self):
        request = self._request()
        # Settings entries register when the sidebar modules are imported,
        # which the sidebar context processor does on every page.
        sidebar(request)
        return [str(entry["title"]) for entry in get_settings_menu(request)]

    @override_settings(ENABLED_MODULES=None)
    def test_flag_unset_shows_every_module(self):
        sidebar_apps = self._sidebar_apps()
        self.assertIn("recruitment", sidebar_apps)
        self.assertIn("asset", sidebar_apps)
        self.assertIn("Recruitment", self._settings_titles())

    @override_settings(ENABLED_MODULES=PAYROLL_ONLY)
    def test_disabled_modules_leave_the_sidebar(self):
        sidebar_apps = self._sidebar_apps()
        for name in ("recruitment", "onboarding", "pms", "helpdesk", "asset"):
            self.assertNotIn(name, sidebar_apps)
        self.assertIn("payroll", sidebar_apps)
        self.assertIn("employee", sidebar_apps)

    @override_settings(ENABLED_MODULES=PAYROLL_ONLY)
    def test_disabled_modules_leave_the_settings_menu(self):
        titles = self._settings_titles()
        self.assertNotIn("Recruitment", titles)
        self.assertNotIn("Offboarding", titles)
        self.assertNotIn("Assets", titles)
        self.assertIn("Payroll", titles)


class UrlTests(SimpleTestCase):
    """
    URLs are mounted once, at startup, so the flag-on case needs a fresh
    process started with the flag set.
    """

    def test_flag_unset_mounts_module_urls(self):
        for path in (
            "/recruitment/recruitment-view/",
            "/helpdesk/ticket-view/",
            "/api/recruitment/candidate/",
        ):
            self.assertIsNot(resolve(path).func, _module_disabled, path)

    def test_disabled_module_urls_404(self):
        script = (
            "import django\n"
            "django.setup()\n"
            "from django.urls import Resolver404, resolve, reverse\n"
            "from horilla.modules import _module_disabled\n"
            "for path in ('/recruitment/recruitment-view/', '/helpdesk/ticket-view/',"
            " '/asset/asset-category-view/'):\n"
            "    assert resolve(path).func is _module_disabled, path\n"
            "try:\n"
            "    resolve('/api/recruitment/candidate/')\n"
            "    raise SystemExit('API still mounted')\n"
            "except Resolver404:\n"
            "    pass\n"
            "# Names still reverse, so a stray link is a 404, not a 500.\n"
            "reverse('recruitment-view')\n"
            "assert resolve('/payroll/view-payslip/').func is not _module_disabled\n"
            "assert resolve('/report/explorer/').func is not _module_disabled\n"
            "print('ok')\n"
        )
        env = {
            **os.environ,
            "DJANGO_SETTINGS_MODULE": "horilla.settings",
            "ENABLED_MODULES": "payroll-only",
        }
        result = subprocess.run(
            [sys.executable, "-c", script],
            cwd=BASE_DIR,
            env=env,
            capture_output=True,
            text=True,
            timeout=300,
        )
        self.assertEqual(result.returncode, 0, result.stderr[-3000:])
        self.assertIn("ok", result.stdout)
