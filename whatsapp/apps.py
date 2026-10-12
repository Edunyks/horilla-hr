from django.apps import AppConfig


class WhatsappConfig(AppConfig):
    default_auto_field = "django.db.models.BigAutoField"
    name = "whatsapp"

    def ready(self):
        from horilla.modules import is_enabled, mount_disabled_urls

        if not is_enabled("whatsapp"):
            # Switched off by ENABLED_MODULES: models stay, URLs only 404.
            mount_disabled_urls("whatsapp/", "whatsapp.urls")
            return super().ready()

        from django.urls import include, path

        from horilla.urls import urlpatterns

        urlpatterns.append(
            path("whatsapp/", include("whatsapp.urls")),
        )
        super().ready()
