"""Payroll-only sidebar section: Contracts."""

from django.urls import reverse_lazy
from django.utils.translation import gettext_lazy as _

from payroll.sidebars import ICON_DIR

MENU = _("Contracts")
IMG_SRC = f"{ICON_DIR}/document-text-outline.svg"

SUBMENUS = [
    {
        "menu": _("Contracts"),
        "redirect": reverse_lazy("view-contract"),
        "accessibility": "payroll.sidebar.dasbhoard_accessibility",
        "match_prefixes": ["/payroll/contracts-detail-view/"],
    },
]
