from django.apps import AppConfig
from django.utils.translation import gettext_lazy as _


class CandourAuthConfig(AppConfig):
    default_auto_field = "django.db.models.BigAutoField"
    name = "candour_auth"
    verbose_name = _("Candour Auth")
