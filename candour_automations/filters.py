"""
candour_automations/filters.py
"""

from candour.filters import CandourFilterSet, django_filters
from candour_automations.models import MailAutomation


class AutomationFilter(CandourFilterSet):
    """
    AutomationFilter
    """

    search = django_filters.CharFilter(field_name="title", lookup_expr="icontains")

    class Meta:
        model = MailAutomation
        fields = "__all__"
