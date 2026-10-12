"""
Module: apps.py
Description: Configuration for the 'asset' app.
"""

from django.apps import AppConfig
from django.conf import settings


class AssetConfig(AppConfig):
    """
    Class: AssetConfig
    Description: Configuration class for the 'asset' app.

    Attributes:
        default_auto_field (str): Default auto-generated field type for primary keys.
        name (str): Name of the app.
    """

    default_auto_field = "django.db.models.BigAutoField"
    name = "asset"

    def ready(self):
        from horilla.modules import is_enabled, mount_disabled_urls

        if not is_enabled("asset"):
            # Switched off by ENABLED_MODULES: models stay, URLs only 404.
            mount_disabled_urls("asset/", "asset.urls")
            return super().ready()

        from django.urls import include, path

        from horilla.urls import urlpatterns

        settings.APPS.append("asset")
        urlpatterns.append(
            path("asset/", include("asset.urls")),
        )
        settings.APP_URLS.append("asset.urls")
        super().ready()
