import django_filters

from candour.filters import CandourFilterSet
from whatsapp.models import WhatsappCredientials


class CredentialsViewFilter(CandourFilterSet):
    search = django_filters.CharFilter(
        field_name="meta_phone_number", lookup_expr="icontains"
    )

    class Meta:
        model = WhatsappCredientials
        fields = ["meta_phone_number", "search"]
