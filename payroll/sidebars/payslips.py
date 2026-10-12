"""Payroll-only sidebar section: Payslips."""

from django.urls import reverse_lazy
from django.utils.translation import gettext_lazy as _

from payroll.sidebars import ICON_DIR

MENU = _("Payslips")
IMG_SRC = f"{ICON_DIR}/receipt-outline.svg"

SUBMENUS = [
    {
        "menu": _("Payslips"),
        "redirect": reverse_lazy("view-payslip"),
    },
]
