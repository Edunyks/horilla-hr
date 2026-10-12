from django.apps import AppConfig
from django.conf import settings
from django.utils.translation import gettext_lazy as _


class HelpdeskConfig(AppConfig):
    default_auto_field = "django.db.models.BigAutoField"
    name = "helpdesk"
    # Drives the app-level section header in the Roles/Permissions UI
    # (base/views.py's _permission_app_label() reads AppConfig.verbose_name)
    # -- without this, Django defaults it to "Helpdesk" from the app label.
    verbose_name = _("Ticket")

    def ready(self):
        from horilla.modules import is_enabled, mount_disabled_urls

        if not is_enabled("helpdesk"):
            # Switched off by ENABLED_MODULES: models stay, URLs only 404.
            mount_disabled_urls("helpdesk/", "helpdesk.urls")
            return super().ready()

        from django.urls import include, path

        from horilla.urls import urlpatterns

        settings.APPS.append("helpdesk")
        urlpatterns.append(
            path("helpdesk/", include("helpdesk.urls")),
        )
        super().ready()
