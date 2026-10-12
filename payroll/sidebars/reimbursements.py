"""Payroll-only sidebar section: Reimbursements (and leave/bonus encashments)."""

from django.urls import reverse_lazy
from django.utils.translation import gettext_lazy as _

from payroll.sidebars import ICON_DIR

MENU = _("Reimbursements")
IMG_SRC = f"{ICON_DIR}/card-outline.svg"

SUBMENUS = [
    {
        "menu": _("Encashments & Reimbursements"),
        "redirect": reverse_lazy("view-reimbursement"),
        "match_prefixes": [
            "/payroll/detail-view-reimbursement/",
            "/payroll/reimbursement-individual-view/",
            "/payroll/detail-view-leave-encashment/",
            "/payroll/detail-view-bonus-encashment/",
        ],
    },
]
