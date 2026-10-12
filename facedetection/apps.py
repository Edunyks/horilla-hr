from django.apps import AppConfig


class FacedetectionConfig(AppConfig):
    default_auto_field = "django.db.models.BigAutoField"
    name = "facedetection"

    def ready(self):
        from horilla.modules import is_enabled, mount_disabled_urls

        if not is_enabled("facedetection"):
            # Switched off by ENABLED_MODULES: models stay, URLs only 404.
            mount_disabled_urls("api/facedetection/", "facedetection.urls")
            return super().ready()

        from django.urls import include, path

        from horilla.urls import urlpatterns

        urlpatterns.append(
            path("api/facedetection/", include("facedetection.urls")),
        )
        super().ready()
