"""Payroll-only sidebar section: Salary Structures."""

from django.urls import reverse_lazy
from django.utils.translation import gettext_lazy as _

from payroll.sidebars import ICON_DIR

MENU = _("Salary Structures")
IMG_SRC = f"{ICON_DIR}/layers-outline.svg"

SUBMENUS = [
    {
        "menu": _("Salary Structures"),
        "redirect": reverse_lazy("view-salary-structure"),
        "accessibility": "payroll.sidebars.salary_structures.accessibility",
        "match_prefixes": ["/payroll/salary-structure-detail-view/"],
    },
]


def accessibility(request, submenu, user_perms, *args, **kwargs):
    return request.user.has_perm("payroll.view_salarystructure")
