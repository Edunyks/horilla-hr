"""
AppConfig for the candour_theme app
"""

from django.apps import AppConfig
from django.conf import settings
from django.utils.translation import gettext_lazy as _


class CandourThemeConfig(AppConfig):
    """App configuration class for candour_theme."""

    default_auto_field = "django.db.models.BigAutoField"
    name = "candour_theme"
    verbose_name = _("Appearance")

    def ready(self):
        """Run app initialization logic (executed after Django setup).
        Used to auto-register URLs and connect signals if required.
        """
        try:
            # Auto-register this app's URLs and add to installed apps
            from django.urls import include, path

            from candour.urls import urlpatterns

            settings.APPS.append(("candour_theme"))
            # Add app URLs to main urlpatterns
            urlpatterns.append(
                path("theme/", include("candour_theme.urls")),
            )

            __import__("candour_theme.signals")
        except Exception as e:
            import logging

            logging.warning("CandourThemeConfig.ready failed: %s", e)

        super().ready()
