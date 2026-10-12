"""
horilla/modules.py

Feature flag for Horilla's optional modules.

A module that is switched off stays in ``INSTALLED_APPS``: its models and
migrations are untouched, so ``migrate`` keeps working (``payroll`` 0001
depends on ``asset``; ``base`` depends on ``attendance`` and ``leave``) and the
module can be switched back on without data loss. Switching it off only hides
it: its pages and API endpoints 404 (see ``mount_disabled_urls``), its sidebar
and settings entries disappear, its signals and scheduled jobs do not run, and
every ``is_enabled(...)`` check elsewhere in the codebase treats it as absent.

``ENABLED_MODULES`` (settings, env-driven) lists the optional modules to keep
on. ``None`` -- the default -- means every installed module is on, so an
unconfigured deployment behaves exactly as before the flag existed. Apps that
are not in ``OPTIONAL_MODULES`` cannot be switched off this way; for them
``is_enabled`` is plain ``apps.is_installed``.
"""

from django.apps import apps
from django.conf import settings

# Modules ENABLED_MODULES can switch off. Everything else (employee,
# attendance, leave, payroll, base and the support apps) is always on.
OPTIONAL_MODULES = (
    "recruitment",
    "onboarding",
    "offboarding",
    "pms",
    "project",
    "helpdesk",
    "asset",
    "report",
    "biometric",
    "facedetection",
    "geofencing",
    "horilla_meet",
    "whatsapp",
    "horilla_ldap",
    "horilla_backup",
    "horilla_dbtemplate",
)

# Standalone HR modules. When payroll is on and none of these are, the build
# is "payroll only" and gets the payroll-first sidebar and home page.
STANDALONE_MODULES = (
    "recruitment",
    "onboarding",
    "offboarding",
    "pms",
    "project",
    "helpdesk",
)

# The ENABLED_MODULES value for a payroll-only build: Payroll Reports is the
# only optional module it keeps.
PAYROLL_ONLY_MODULES = ("report",)


def enabled_modules():
    """
    The configured ENABLED_MODULES as a set, or None when every module is on.
    """
    configured = getattr(settings, "ENABLED_MODULES", None)
    if configured is None:
        return None
    return {name.strip() for name in configured if name and name.strip()}


def is_enabled(name):
    """
    True if ``name`` is installed and not switched off by ENABLED_MODULES.

    Read on every call rather than cached, so ``override_settings`` works in
    tests. Note that URL mounting happens once, in ``AppConfig.ready()``, so
    changing the setting at runtime does not mount or unmount URLs.
    """
    if not apps.is_installed(name):
        return False
    if name not in OPTIONAL_MODULES:
        return True
    configured = enabled_modules()
    return configured is None or name in configured


def is_payroll_only():
    """
    True when payroll is on and every standalone HR module is off.
    """
    return is_enabled("payroll") and not any(
        is_enabled(name) for name in STANDALONE_MODULES
    )


def _module_disabled(request, *args, **kwargs):
    from django.http import Http404

    raise Http404("This module is switched off.")


def _not_found_patterns(patterns):
    """Copy ``patterns`` with every view replaced by a 404, keeping the names."""
    from django.urls import URLPattern, URLResolver

    stubbed = []
    for pattern in patterns:
        if isinstance(pattern, URLResolver):
            stubbed.append(
                URLResolver(
                    pattern.pattern,
                    _not_found_patterns(pattern.url_patterns),
                    pattern.default_kwargs,
                    pattern.app_name,
                    pattern.namespace,
                )
            )
        elif isinstance(pattern, URLPattern):
            stubbed.append(
                URLPattern(
                    pattern.pattern,
                    _module_disabled,
                    pattern.default_args,
                    pattern.name,
                )
            )
    return stubbed


def mount_disabled_urls(prefix, urlconf):
    """
    Mount a switched-off module's URLs so that every request 404s but every
    URL name still reverses.

    Leaving the URLs out entirely would turn any ``{% url %}`` or ``reverse()``
    in an always-on page that still names the module into a 500
    (NoReverseMatch). Pages hide those links through ``is_enabled``; this is
    the safety net for one that slips through, which now leads to a 404.
    """
    from django.urls import include, path

    from horilla.urls import urlpatterns

    module, app_name, namespace = include(urlconf)
    patterns = getattr(module, "urlpatterns", module)
    urlpatterns.append(
        path(prefix, (_not_found_patterns(patterns), app_name, namespace))
    )
