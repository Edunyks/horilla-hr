"""
Payroll-only sidebar section: Payroll Reports.

Lives with payroll but serves pages of the ``report`` app, so it is hidden
when that module is switched off.
"""

from django.urls import reverse_lazy
from django.utils.translation import gettext_lazy as _

from horilla.modules import is_enabled
from payroll.sidebars import ICON_DIR

MENU = _("Payroll Reports")
IMG_SRC = f"{ICON_DIR}/bar-chart-outline.svg"
ACCESSIBILITY = "payroll.sidebars.reports.menu_accessibility"

SUBMENUS = [
    {
        "menu": _("Payroll Report"),
        "redirect": reverse_lazy("payroll-report"),
        "accessibility": "payroll.sidebars.reports.payroll_report_accessibility",
        "match_prefixes": ["/report/payroll-pivot/"],
    },
    {
        "menu": _("Standard Reports"),
        "redirect": reverse_lazy("standard-report-catalog"),
        "accessibility": "report.sidebar.standard_accessibility",
    },
    {
        "menu": _("Explorer"),
        "redirect": reverse_lazy("report-explorer"),
        "accessibility": "report.sidebar.standard_accessibility",
        "match_prefixes": [
            "/report/employee-report/",
            "/report/employee-pivot/",
            "/report/attendance-report/",
            "/report/attendance-pivot/",
            "/report/leave-report/",
            "/report/leave-pivot/",
        ],
    },
]


def menu_accessibility(request, menu, user_perms, *args, **kwargs):
    return is_enabled("report")


def payroll_report_accessibility(request, submenu, user_perms, *args, **kwargs):
    return request.user.is_superuser or request.user.has_perm("payroll.view_payslip")
