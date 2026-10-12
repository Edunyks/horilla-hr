"""A saved currency/position must be what the rest of payroll reads back.

The settings page saves to the PayrollSettings row whose company_id is the
selected company, but every reader used `PayrollSettings.objects.first()`.
HorillaCompanyManager matches `company_id = selected OR company_id IS NULL`,
so `.first()` returned the older shared (no-company) row -- usually created by
the context processor on the first request -- and the change never showed.
"""

from django.test import TestCase

from base.models import Company
from horilla.testkit.company import CompanyFilterTestMixin
from payroll.models.tax_models import PayrollSettings


class PayrollSettingsForCurrentCompanyTests(CompanyFilterTestMixin, TestCase):
    @classmethod
    def setUpTestData(cls):
        cls.company = Company.objects.create(
            company="Acme",
            hq=True,
            address="x",
            country="IN",
            state="KA",
            city="Bengaluru",
            zip="560001",
        )
        cls.shared = PayrollSettings.objects.create(
            currency_symbol="$", position="prefix"
        )
        cls.own = PayrollSettings.objects.create(
            currency_symbol="INR", position="postfix", company_id=cls.company
        )

    def test_selected_company_gets_its_own_row(self):
        self.set_company_context(str(self.company.id))
        self.assertEqual(PayrollSettings.for_current_company(), self.own)

    def test_all_companies_gets_shared_row(self):
        self.set_company_context("all")
        self.assertEqual(PayrollSettings.for_current_company(), self.shared)

    def test_company_without_own_row_falls_back_to_shared(self):
        self.own.delete()
        self.set_company_context(str(self.company.id))
        self.assertEqual(PayrollSettings.for_current_company(), self.shared)

    def test_currency_filter_uses_selected_company(self):
        from base.templatetags.horillafilters import currency_symbol_position

        self.set_company_context(str(self.company.id))
        self.assertEqual(currency_symbol_position("10.00"), "10.00 INR")
