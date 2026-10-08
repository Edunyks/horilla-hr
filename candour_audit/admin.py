"""
admin.py
"""

from django.contrib import admin

from candour_audit.models import AuditTag, CandourAuditInfo, CandourAuditLog

# Register your models here.

admin.site.register(AuditTag)
