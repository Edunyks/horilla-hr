from django.apps import AppConfig
from django.conf import settings


class OffboardingConfig(AppConfig):
    default_auto_field = "django.db.models.BigAutoField"
    name = "offboarding"

    def ready(self):
        from horilla.modules import is_enabled, mount_disabled_urls

        if not is_enabled("offboarding"):
            # Switched off by ENABLED_MODULES: models stay, URLs only 404.
            mount_disabled_urls("offboarding/", "offboarding.urls")
            return super().ready()

        from django.urls import include, path

        from horilla.urls import urlpatterns

        settings.APPS.append("offboarding")
        urlpatterns.append(
            path("offboarding/", include("offboarding.urls")),
        )
        super().ready()
