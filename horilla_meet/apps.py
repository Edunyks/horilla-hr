from django.apps import AppConfig
from django.conf import settings


class HorillaMeetConfig(AppConfig):
    default_auto_field = "django.db.models.BigAutoField"
    name = "horilla_meet"
    verbose_name = "Meet"

    def ready(self):
        from horilla.modules import is_enabled, mount_disabled_urls

        if not is_enabled("horilla_meet"):
            # Switched off by ENABLED_MODULES: models stay, URLs only 404.
            mount_disabled_urls("meet/", "horilla_meet.urls")
            return super().ready()

        from django.urls import include, path

        from horilla.urls import urlpatterns
        from horilla_meet import signals

        settings.APPS.append("horilla_meet")

        urlpatterns.append(
            path("meet/", include("horilla_meet.urls")),
        )
        super().ready()
