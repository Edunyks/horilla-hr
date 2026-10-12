"""Payroll-only sidebar section: Income Tax."""

from django.urls import reverse_lazy
from django.utils.translation import gettext_lazy as _

from payroll.sidebars import ICON_DIR

MENU = _("Income Tax")
IMG_SRC = f"{ICON_DIR}/calculator-outline.svg"

SUBMENUS = [
    {
        "menu": _("Filing Statuses"),
        "redirect": reverse_lazy("filing-status-view"),
        "accessibility": "payroll.sidebar.federal_tax_accessibility",
        "match_prefixes": ["/payroll/filing-status-detail-view/"],
    },
]
