from typing import Any

from django.utils.decorators import method_decorator
from django.utils.translation import gettext_lazy as _

from attendance.filters import AttendanceGeneralSettingFilter
from attendance.models import AttendanceGeneralSetting
from candour_views.cbv_methods import login_required
from candour_views.generic.cbv.views import CandourListView, CandourNavView


@method_decorator(login_required, name="dispatch")
class CheckInCheckOutListView(CandourListView):
    """
    List view of the page
    """

    def __init__(self, **kwargs: Any) -> None:
        super().__init__(**kwargs)
        self.view_id = "check-in-check-out"

    model = AttendanceGeneralSetting
    filter_class = AttendanceGeneralSettingFilter
    show_toggle_form = False

    columns = [
        (_("Company"), "company_col"),
        (_("Check in/Check out"), "check_in_check_out_col"),
    ]

    bulk_select_option = False


@method_decorator(login_required, name="dispatch")
class CheckInCheckOutNavBar(CandourNavView):
    """
    Nav bar
    """

    nav_title = _("Enable Check In/Check out")
    filter_instance = AttendanceGeneralSettingFilter()
    search_swap_target = "#listContainer"
