from django.apps import AppConfig


class BackupConfig(AppConfig):
    default_auto_field = "django.db.models.BigAutoField"
    name = "horilla_backup"

    def ready(self):
        from horilla.modules import is_enabled, mount_disabled_urls

        if not is_enabled("horilla_backup"):
            # Switched off by ENABLED_MODULES: models stay, URLs only 404.
            mount_disabled_urls("backup/", "horilla_backup.urls")
            return super().ready()

        from django.urls import include, path

        from horilla.urls import urlpatterns

        urlpatterns.append(
            path("backup/", include("horilla_backup.urls")),
        )
        super().ready()
