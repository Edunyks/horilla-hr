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
from django.urls import resolve, reverse

from horilla.config import sidebar
from horilla.menu import get_settings_menu
from horilla.modules import (
    OPTIONAL_MODULES,
    _module_disabled,
    is_enabled,
    is_payroll_only,
)
from horilla.scheduling import ScheduledJob
from horilla.testkit.factories import make_company, make_employee, make_user

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
        self.assertIn("payroll_sidebars_payslips", sidebar_apps)
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


class PayrollOnlySidebarTests(TestCase):
    """The payroll-only build splits payroll into top-level sections."""

    @classmethod
    def setUpTestData(cls):
        cls.admin = make_user("po-admin", is_superuser=True)
        cls.plain = make_user("po-plain")

    def _menus(self, user):
        request = RequestFactory().get("/")
        request.user = user
        request.session = SessionStore()
        request.session.create()
        sidebar(request)
        return request.MENUS

    def test_dotted_entries_resolve_to_their_owning_app(self):
        from horilla.config import resolve_sidebar_entry

        self.assertEqual(
            resolve_sidebar_entry("payroll.sidebars.contracts"),
            ("payroll", "payroll.sidebars.contracts"),
        )
        self.assertEqual(
            resolve_sidebar_entry("payroll"), ("payroll", "payroll.sidebar")
        )

    @override_settings(ENABLED_MODULES=PAYROLL_ONLY)
    def test_payroll_only_layout(self):
        labels = [str(menu["menu"]) for menu in self._menus(self.admin)]
        self.assertEqual(
            labels,
            [
                "Employee",
                "Attendance",
                "Leave",
                "Payslips",
                "Contracts",
                "Salary Structures",
                "Pay Components",
                "Loans",
                "Reimbursements",
                "Income Tax",
                "Payroll Reports",
                "Configuration",
            ],
        )
        # Section ids stay unique, they key the open/closed state.
        apps_ = [menu["app"] for menu in self._menus(self.admin)]
        self.assertEqual(len(apps_), len(set(apps_)))

    @override_settings(ENABLED_MODULES=None)
    def test_default_layout_is_unchanged(self):
        labels = [str(menu["menu"]) for menu in self._menus(self.admin)]
        self.assertIn("Payroll", labels)
        self.assertNotIn("Pay Components", labels)

    @override_settings(ENABLED_MODULES=[])
    def test_payroll_reports_needs_the_report_module(self):
        labels = [str(menu["menu"]) for menu in self._menus(self.admin)]
        self.assertIn("Contracts", labels)
        self.assertNotIn("Payroll Reports", labels)

    @override_settings(ENABLED_MODULES=PAYROLL_ONLY)
    def test_sections_without_visible_entries_are_dropped(self):
        labels = [str(menu["menu"]) for menu in self._menus(self.plain)]
        for label in ("Contracts", "Salary Structures", "Income Tax"):
            self.assertNotIn(label, labels)

    @override_settings(ENABLED_MODULES=PAYROLL_ONLY)
    def test_active_link_prefixes_survive_the_split(self):
        prefixes = {
            prefix
            for menu in self._menus(self.admin)
            for submenu in menu["submenu"]
            for prefix in submenu.get("match_prefixes", [])
        }
        for prefix in (
            "/payroll/contracts-detail-view/",
            "/payroll/salary-structure-detail-view/",
            "/payroll/allowance-detail-view/",
            "/payroll/deduction-detail-view/",
            "/payroll/loan-detail-view/",
            "/payroll/filing-status-detail-view/",
            "/payroll/detail-view-reimbursement/",
        ):
            self.assertIn(prefix, prefixes)


class PayrollHomeTests(TestCase):
    @classmethod
    def setUpTestData(cls):
        # Requests from a user without an employee record are logged out.
        cls.admin = make_user("home-admin", is_superuser=True)
        make_employee(
            company=make_company("Home Co"), email="home@test.horilla", user=cls.admin
        )

    def setUp(self):
        self.client.force_login(self.admin)

    @override_settings(ENABLED_MODULES=PAYROLL_ONLY)
    def test_payroll_dashboard_is_home_when_only_payroll_is_on(self):
        response = self.client.get(reverse("home-page"))
        self.assertRedirects(
            response, reverse("view-payroll-dashboard"), fetch_redirect_response=False
        )
        response = self.client.get(reverse("dashboard"))
        self.assertRedirects(
            response, reverse("view-payroll-dashboard"), fetch_redirect_response=False
        )

    @override_settings(ENABLED_MODULES=None)
    def test_home_is_unchanged_by_default(self):
        response = self.client.get(reverse("home-page"))
        self.assertRedirects(
            response, reverse("dashboard"), fetch_redirect_response=False
        )

    @override_settings(ENABLED_MODULES=PAYROLL_ONLY)
    def test_salary_structures_page(self):
        response = self.client.get(reverse("view-salary-structure"))
        self.assertEqual(response.status_code, 200)
        self.assertContains(response, reverse("salary-structure-nav-view"))


class HiddenEntryPointTests(TestCase):
    @classmethod
    def setUpTestData(cls):
        cls.admin = make_user("hidden-admin", is_superuser=True)

    def test_profile_tabs_of_disabled_modules_are_filtered(self):
        from horilla_views.generic.cbv.views import _profile_tab_enabled

        def recruitment_view(request):
            return None

        recruitment_view.__module__ = "recruitment.cbv.candidate_profile"

        def payroll_view(request):
            return None

        payroll_view.__module__ = "payroll.cbv.payslip"

        with override_settings(ENABLED_MODULES=PAYROLL_ONLY):
            self.assertFalse(_profile_tab_enabled({"view": recruitment_view}))
            self.assertTrue(_profile_tab_enabled({"view": payroll_view}))
        with override_settings(ENABLED_MODULES=None):
            self.assertTrue(_profile_tab_enabled({"view": recruitment_view}))

    def test_settings_search_skips_disabled_modules(self):
        import json

        from django.template import Context

        from base.templatetags.basefilters import settings_search_index

        request = RequestFactory().get("/")
        request.user = self.admin
        request.session = SessionStore()
        request.session.create()
        sidebar(request)  # registers the settings sections

        def sections():
            entries = json.loads(settings_search_index(Context({"request": request})))
            return {entry["section"] for entry in entries}

        with override_settings(ENABLED_MODULES=None):
            self.assertIn("Recruitment", sections())
        with override_settings(ENABLED_MODULES=PAYROLL_ONLY):
            self.assertNotIn("Recruitment", sections())
            self.assertIn("Payroll", sections())
