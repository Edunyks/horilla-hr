from django.apps import AppConfig


class BackupConfig(AppConfig):
    default_auto_field = "django.db.models.BigAutoField"
    name = "candour_backup"

    def ready(self):
        from django.urls import include, path

        from candour.urls import urlpatterns

        urlpatterns.append(
            path("backup/", include("candour_backup.urls")),
        )
        super().ready()
