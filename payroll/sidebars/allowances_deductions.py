"""Payroll-only sidebar section: Pay Components (allowances and deductions)."""

from django.urls import reverse_lazy
from django.utils.translation import gettext_lazy as _

from payroll.sidebars import ICON_DIR

MENU = _("Pay Components")
IMG_SRC = f"{ICON_DIR}/swap-vertical-outline.svg"

SUBMENUS = [
    {
        "menu": _("Allowances"),
        "redirect": reverse_lazy("view-allowance"),
        "accessibility": "payroll.sidebar.allowance_accessibility",
        "match_prefixes": ["/payroll/allowance-detail-view/"],
    },
    {
        "menu": _("Deductions"),
        "redirect": reverse_lazy("view-deduction"),
        "accessibility": "payroll.sidebar.deduction_accessibility",
        "match_prefixes": ["/payroll/deduction-detail-view/"],
    },
]
