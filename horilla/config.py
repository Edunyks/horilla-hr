"""
horilla/config.py

Horilla app configurations
"""

import importlib
import logging

from django.conf import settings
from django.contrib.auth.context_processors import PermWrapper

from horilla.modules import is_enabled, is_payroll_only

logger = logging.getLogger(__name__)


def get_apps_in_base_dir():
    """
    The sidebar sections to render, in order: PAYROLL_ONLY_SIDEBARS when only
    payroll is on (see horilla.modules.is_payroll_only), SIDEBARS otherwise.
    """
    if is_payroll_only():
        return getattr(settings, "PAYROLL_ONLY_SIDEBARS", settings.SIDEBARS)
    return settings.SIDEBARS


def import_method(accessibility):
    module_path, method_name = accessibility.rsplit(".", 1)
    module = __import__(module_path, fromlist=[method_name])
    accessibility_method = getattr(module, method_name)
    return accessibility_method


def resolve_sidebar_entry(entry):
    """
    Map a SIDEBARS entry to (owning app, sidebar module path).

    An entry is either an app label ("payroll" -> "payroll.sidebar") or the
    dotted path of a sidebar module ("payroll.sidebars.contracts"), whose
    owning app is its first component.
    """
    if "." in entry:
        return entry.split(".", 1)[0], entry
    return entry, entry + ".sidebar"


ALL_MENUS = {}


def sidebar(request):

    base_dir_apps = get_apps_in_base_dir()

    if not request.user.is_anonymous:
        request.MENUS = []
        MENUS = request.MENUS

        for entry in base_dir_apps:
            app, module_path = resolve_sidebar_entry(entry)
            if is_enabled(app):
                try:
                    sidebar = importlib.import_module(module_path)

                except Exception as e:
                    logger.error(e)
                    continue

                if sidebar:
                    accessibility = None
                    if getattr(sidebar, "ACCESSIBILITY", None):
                        accessibility = import_method(sidebar.ACCESSIBILITY)

                    if hasattr(sidebar, "MENU") and (
                        not accessibility
                        or accessibility(
                            request,
                            sidebar.MENU,
                            PermWrapper(request.user),
                        )
                    ):
                        MENU = {}
                        MENU["menu"] = sidebar.MENU
                        # Section id for the template's open/closed state, so
                        # it must be unique: the dotted path for a section
                        # module, the app label otherwise.
                        MENU["app"] = entry.replace(".", "_")
                        MENU["img_src"] = sidebar.IMG_SRC
                        MENU["submenu"] = []
                        MENUS.append(MENU)
                        for submenu in sidebar.SUBMENUS:

                            accessibility = None

                            if submenu.get("accessibility"):
                                accessibility = import_method(submenu["accessibility"])
                            redirect: str = submenu["redirect"]
                            redirect = redirect.split("?")
                            submenu["redirect"] = redirect[0]

                            if not accessibility or accessibility(
                                request,
                                submenu,
                                PermWrapper(request.user),
                            ):
                                MENU["submenu"].append(submenu)
                        if "." in entry and not MENU["submenu"]:
                            # A single-purpose section with nothing the user
                            # may open would render as an empty button.
                            MENUS.remove(MENU)
        ALL_MENUS[request.session.session_key] = MENUS


def get_MENUS(request):
    # Rebuild at most once per request — accessibility checks hit the DB.
    cached = getattr(request, "_horilla_menus", None)
    if cached is not None:
        return {"sidebar": cached}
    ALL_MENUS[request.session.session_key] = []
    sidebar(request)
    menus = ALL_MENUS.get(request.session.session_key)
    request._horilla_menus = menus
    return {"sidebar": menus}


def load_ldap_settings():
    """
    Fetch LDAP settings dynamically from the database after Django is ready.

    Diagnostics here go through `logger`, and stay ASCII, on purpose. This runs
    from `horilla_ldap`'s AppConfig.ready(), so it executes during
    django.setup() for every management command and for runserver. Two
    consequences follow:

    * A bare `print()` of a non-ASCII character raises UnicodeEncodeError on a
      console that is not UTF-8 -- Windows defaults to cp1252 -- and that
      exception propagates out of django.setup(). A warning nobody needed to
      read took the whole process down. `logging` routes through a handler that
      absorbs encoding errors instead of raising them, so a diagnostic can no
      longer be fatal.
    * The likeliest caller is a database that predates the horilla_ldap app, so
      the table genuinely does not exist. That is an ordinary state, not an
      error, and it must not stop anything.
    """
    try:
        from django.db import connection

        from horilla_ldap.models import LDAPSettings

        # Ensure DB is ready before querying
        if not connection.introspection.table_names():
            logger.warning("Database is empty. Using default LDAP settings.")
            return settings.DEFAULT_LDAP_CONFIG

        ldap_config = LDAPSettings.objects.first()
        if ldap_config:
            return {
                "LDAP_SERVER": ldap_config.ldap_server,
                "BIND_DN": ldap_config.bind_dn,
                "BIND_PASSWORD": ldap_config.bind_password,
                "BASE_DN": ldap_config.base_dn,
            }
    except Exception as e:
        logger.warning("Could not load LDAP settings (%s)", e)
        return settings.DEFAULT_LDAP_CONFIG  # Return default on error

    return settings.DEFAULT_LDAP_CONFIG  # Fallback in case of an issue
