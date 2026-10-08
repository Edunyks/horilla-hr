"""Candour ``AppLauncher`` for the database-backed template app."""

from django.apps import AppConfig
from django.utils.translation import gettext_lazy as _


class CandourDBTemplateConfig(AppConfig):
    """Candour app config: registers ``candour_dbtemplate`` and auto-imports signal handlers."""

    default = True

    name = "candour_dbtemplate"
    verbose_name = _("Database Templates")
    default_auto_field = "django.db.models.BigAutoField"

    def ready(self):
        from . import signals

        return super().ready()
