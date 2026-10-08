import datetime
from typing import Any

from django import forms
from django.apps import apps
from django.contrib import messages
from django.http import HttpResponse
from django.utils.decorators import method_decorator
from django.utils.translation import gettext_lazy as _

from base.templatetags.candourfilters import is_asset_fine_enabled
from employee.models import Employee
from candour.http.response import CandourRedirect
from candour.methods import get_candour_model_class
from candour_views.cbv_methods import login_required
from candour_views.generic.cbv.views import CandourFormView
from payroll.forms.component_forms import AssetFineForm, LoanAccountForm
from payroll.models.models import LoanAccount


@method_decorator(login_required, name="dispatch")
class AssetFineFormView(CandourFormView):
    """
    form view for create asset assign form
    """

    model = LoanAccount
    form_class = AssetFineForm
    new_display_title = _("Asset Fine")

    def dispatch(self, request, *args, **kwargs):
        if not is_asset_fine_enabled(request):
            return CandourRedirect(request, message=_("Asset fine is not enabled."))
        return super().dispatch(request, *args, **kwargs)

    def form_valid(self, form: AssetFineForm) -> HttpResponse:
        if apps.is_installed("asset"):
            Asset = get_candour_model_class(app_label="asset", model="asset")
        asset_id = self.request.GET["asset_id"]
        employee_id = self.request.GET["employee_id"]
        asset = Asset.objects.get(id=asset_id)
        employee = Employee.objects.get(id=employee_id)
        if form.is_valid():
            instance = form.save(commit=False)
            instance.employee_id = employee
            instance.type = "fine"
            instance.provided_date = datetime.date.today()
            instance.asset_id = asset
            instance.save()
            messages.success(self.request, _("Asset fine added"))
            return HttpResponse(
                "<script>$('#dynamicCreateModal').toggleClass('oh-modal--show'); $('#reloadMessagesButton').click()</script>"
            )
        return super().form_valid(form)
