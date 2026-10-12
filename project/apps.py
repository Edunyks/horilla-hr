from django.apps import AppConfig
from django.conf import settings


class ProjectConfig(AppConfig):
    default_auto_field = "django.db.models.BigAutoField"
    name = "project"

    def ready(self):
        from horilla.modules import is_enabled, mount_disabled_urls

        if not is_enabled("project"):
            # Switched off by ENABLED_MODULES: models stay, URLs only 404.
            mount_disabled_urls("project/", "project.urls")
            return super().ready()

        from django.urls import include, path

        from horilla.urls import urlpatterns

        settings.APPS.append("project")
        urlpatterns.append(
            path("project/", include("project.urls")),
        )
        settings.APP_URLS.append("project.urls")
        super().ready()
