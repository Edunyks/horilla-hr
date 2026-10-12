from django.apps import AppConfig
from django.conf import settings


class OnboardingConfig(AppConfig):
    default_auto_field = "django.db.models.BigAutoField"
    name = "onboarding"

    def ready(self):
        from horilla.modules import is_enabled, mount_disabled_urls

        if not is_enabled("onboarding"):
            # Switched off by ENABLED_MODULES: models stay, URLs only 404.
            mount_disabled_urls("onboarding/", "onboarding.urls")
            return super().ready()

        from django.urls import include, path

        from horilla.urls import urlpatterns

        settings.APPS.append("onboarding")
        urlpatterns.append(
            path("onboarding/", include("onboarding.urls")),
        )
        super().ready()
