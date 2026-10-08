from django.apps import AppConfig
from django.utils.translation import gettext_lazy as _


class CandourDoumentsConfig(AppConfig):
    default_auto_field = "django.db.models.BigAutoField"
    name = "candour_documents"
    verbose_name = _("Documents")
