"""Payroll-only sidebar section: Configuration."""

from django.urls import reverse_lazy
from django.utils.translation import gettext_lazy as _

from payroll.sidebars import ICON_DIR

MENU = _("Configuration")
IMG_SRC = f"{ICON_DIR}/settings-outline.svg"

SUBMENUS = [
    {
        "menu": _("Payroll Settings"),
        "redirect": reverse_lazy("payroll-settings-view"),
        "accessibility": "payroll.sidebar.payroll_settings_accessibility",
    },
    {
        "menu": _("Payslip Auto Generation"),
        "redirect": reverse_lazy("auto-payslip-settings-view"),
        "accessibility": "payroll.sidebar.payroll_settings_accessibility",
    },
    {
        "menu": _("Encashment Settings"),
        "redirect": reverse_lazy("encashment-settings-view"),
        "accessibility": "payroll.sidebar.encashment_settings_accessibility",
    },
]
