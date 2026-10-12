"""Horilla ``AppLauncher`` for the database-backed template app."""

from django.apps import AppConfig
from django.utils.translation import gettext_lazy as _


class HorillaDBTemplateConfig(AppConfig):
    """Horilla app config: registers ``horilla_dbtemplate`` and auto-imports signal handlers."""

    default = True

    name = "horilla_dbtemplate"
    verbose_name = _("Database Templates")
    default_auto_field = "django.db.models.BigAutoField"

    def ready(self):
        from horilla.modules import is_enabled

        if not is_enabled("horilla_dbtemplate"):
            # Switched off by ENABLED_MODULES: models stay, signals do not run.
            return super().ready()

        from . import signals

        return super().ready()
