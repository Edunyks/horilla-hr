from django.apps import AppConfig


class GeofencingConfig(AppConfig):
    default_auto_field = "django.db.models.BigAutoField"
    name = "geofencing"

    def ready(self):
        from horilla.modules import is_enabled, mount_disabled_urls

        if not is_enabled("geofencing"):
            # Switched off by ENABLED_MODULES: models stay, URLs only 404.
            mount_disabled_urls("api/geofencing/", "geofencing.urls")
            return super().ready()

        from django.urls import include, path

        from horilla.urls import urlpatterns

        urlpatterns.append(
            path("api/geofencing/", include("geofencing.urls")),
        )
        super().ready()
