"""Payroll-only sidebar section: Loans (loans, salary advances, fines)."""

from django.urls import reverse_lazy
from django.utils.translation import gettext_lazy as _

from payroll.sidebars import ICON_DIR

MENU = _("Loans")
IMG_SRC = f"{ICON_DIR}/cash-outline.svg"

SUBMENUS = [
    {
        "menu": _("Loans & Salary Advances"),
        "redirect": reverse_lazy("view-loan"),
        "accessibility": "payroll.sidebar.loan_accessibility",
        "match_prefixes": ["/payroll/loan-detail-view/"],
    },
]
