from django.apps import AppConfig
from django.conf import settings


class CandourMeetConfig(AppConfig):
    default_auto_field = "django.db.models.BigAutoField"
    name = "candour_meet"
    verbose_name = "Meet"

    def ready(self):
        from django.urls import include, path

        from candour.urls import urlpatterns
        from candour_meet import signals

        settings.APPS.append("candour_meet")

        urlpatterns.append(
            path("meet/", include("candour_meet.urls")),
        )
        super().ready()
