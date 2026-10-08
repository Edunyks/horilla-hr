"""
Admin registration for the candour_theme app
"""

from django.contrib import admin

from candour_theme.models import CompanyTheme, CandourColorTheme

# Register your candour_theme models here.
admin.site.register(CandourColorTheme)
admin.site.register(CompanyTheme)
