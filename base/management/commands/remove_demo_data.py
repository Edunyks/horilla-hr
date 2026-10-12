"""
Remove demo (dummy) data while keeping core functional / configuration data.

Counterpart of ``load_demo_data``. Deletes demo people (users + employees) and
transactional records (attendance, leave requests, payslips, tickets,
candidates, projects, ...). Keeps the setup an organisation would otherwise
have to re-enter: companies, departments, job positions/roles, work types,
employee types, shifts, holidays, leave types, attendance/payroll/leave
settings, allowances/deductions/tax brackets, mail templates and automations,
tags, pipelines/stage templates, roles & permissions.

Dry run by default -- pass ``--execute`` to actually delete.
"""

from django.apps import apps
from django.contrib.auth import get_user_model
from django.contrib.contenttypes.models import ContentType
from django.core.management.base import BaseCommand, CommandError
from django.db import transaction
from django.db.models import PROTECT, ProtectedError, Q

# Transactional / demo-content models, deleted wholesale. Order matters only
# for PROTECT foreign keys: children before parents. Anything not listed
# here (and not reached by cascade from a listed model or a deleted
# employee/user) is kept as core configuration.
TRANSACTIONAL_MODELS = (
    # base
    "base.WorkTypeRequestComment",
    "base.WorkTypeRequest",
    "base.ShiftRequestComment",
    "base.ShiftRequest",
    "base.BaserequestFile",
    "base.RotatingWorkTypeAssign",
    "base.RotatingShiftAssign",
    "base.RosterPublishLog",
    "base.Roster",
    "base.AnnouncementComment",
    "base.AnnouncementView",
    "base.Announcement",
    "base.Attachment",
    "base.EmailLog",
    "base.PenaltyAccounts",
    "base.DriverViewed",
    # employee / documents
    "employee.EmployeeNote",
    "employee.NoteFiles",
    "employee.DisciplinaryAction",
    "employee.BonusPoint",
    "horilla_documents.Document",
    "horilla_documents.DocumentRequest",
    # attendance
    "attendance.AttendanceRequestComment",
    "attendance.AttendanceRequestFile",
    "attendance.AttendanceConflictResolution",
    "attendance.AttendanceLateComeEarlyOut",
    "attendance.AttendanceDailyHours",
    "attendance.AttendanceSummaryHours",
    "attendance.WorkRecords",
    "attendance.AttendanceOverTime",
    "attendance.AttendanceActivity",
    "attendance.Attendance",
    "attendance.BatchAttendance",
    # leave
    "leave.LeaveRequestConditionApproval",
    "leave.LeaverequestComment",
    "leave.LeaverequestFile",
    "leave.LeaveRequest",
    "leave.LeaveallocationrequestComment",
    "leave.LeaveAllocationRequest",
    "leave.AvailableLeave",
    "leave.EmployeePastLeaveRestrict",
    # asset
    "asset.AssetServiceRequestNote",
    "asset.AssetServiceRequest",
    "asset.AssetRequestComment",
    "asset.AssetRequest",
    "asset.ReturnImages",
    "asset.AssetAssignment",
    "asset.AssetDocuments",
    "asset.AssetReport",
    "asset.AssetItem",
    "asset.Asset",
    "asset.AssetLot",
    # payroll
    "payroll.ReimbursementrequestComment",
    "payroll.ReimbursementFile",
    "payroll.Reimbursement",
    "payroll.ReimbursementMultipleAttachment",
    "payroll.LoanAccount",
    "payroll.Payslip",
    "payroll.WorkRecord",
    "payroll.Contract",
    # recruitment / onboarding
    "onboarding.CandidateTask",
    "onboarding.CandidateStage",
    "onboarding.OnboardingPortal",
    "recruitment.CandidateDocument",
    "recruitment.CandidateDocumentRequest",
    "recruitment.InterviewSchedule",
    "recruitment.CandidateRating",
    "recruitment.SkillZoneCandidate",
    "recruitment.RecruitmentSurveyAnswer",
    "recruitment.StageNote",
    "recruitment.StageFiles",
    "recruitment.RejectedCandidate",
    "recruitment.Resume",
    "recruitment.Candidate",
    "recruitment.Stage",
    "recruitment.Recruitment",
    # offboarding (pipelines, stages and task templates are kept)
    "offboarding.OffboardingNote",
    "offboarding.EmployeeTask",
    "offboarding.ResignationLetter",
    "offboarding.OffboardingEmployee",
    # pms (question templates, key-result library, bonus settings are kept)
    "pms.MeetingsAnswer",
    "pms.Meetings",
    "pms.KeyResultFeedback",
    "pms.Answer",
    "pms.AnonymousFeedback",
    "pms.Feedback",
    "pms.Comment",
    "pms.EmployeeKeyResult",
    "pms.EmployeeObjective",
    "pms.Objective",
    "pms.EmployeeBonusPoint",
    # project
    "project.TimeSheet",
    "project.Task",
    "project.ProjectStage",
    "project.Project",
    # helpdesk (ticket types are kept)
    "helpdesk.Attachment",
    "helpdesk.Comment",
    "helpdesk.ClaimRequest",
    "helpdesk.Ticket",
    "helpdesk.FAQ",
    "helpdesk.FAQCategory",
)


def _resolve(label):
    try:
        model = apps.get_model(label)
    except LookupError:  # app not installed
        return None
    # Proxies share their concrete model's table (e.g. OnboardingCandidate ->
    # Candidate); deleting through them would skip the PROTECT ordering above.
    return None if model._meta.proxy else model


def _history_model(model):
    """django-simple-history shadow model for ``model``, if it has one."""
    hist = getattr(getattr(model, "history", None), "model", None)
    # Subclasses inherit the parent's ``history`` manager; skip those.
    if getattr(hist, "instance_type", None) is not model:
        return None
    return hist


class Command(BaseCommand):
    help = (
        "Remove demo data (demo users, employees and transactional records) "
        "while keeping core configuration. Dry run unless --execute is given."
    )

    def add_arguments(self, parser):
        parser.add_argument(
            "--execute",
            action="store_true",
            help="Actually delete. Without it, only prints what would be removed.",
        )
        parser.add_argument(
            "--keep-user",
            action="append",
            default=[],
            metavar="USERNAME_OR_EMAIL",
            help=(
                "Keep this login (and its employee record). Repeatable. "
                "Superusers are always kept."
            ),
        )
        parser.add_argument(
            "--no-input",
            "--noinput",
            action="store_false",
            dest="interactive",
            help="Do not prompt for confirmation.",
        )

    def handle(self, *args, **options):
        execute = options["execute"]
        User = get_user_model()
        Employee = apps.get_model("employee", "Employee")

        keep = Q(is_superuser=True)
        for ident in options["keep_user"]:
            keep |= Q(username=ident) | Q(email=ident)
        kept_users = User._base_manager.filter(keep)
        missing = [
            i
            for i in options["keep_user"]
            if not kept_users.filter(Q(username=i) | Q(email=i)).exists()
        ]
        if missing:
            raise CommandError(f"--keep-user not found: {', '.join(missing)}")
        if not kept_users.exists():
            raise CommandError(
                "No superuser found -- refusing to delete every login. "
                "Create one first or pass --keep-user."
            )

        users_qs = User._base_manager.exclude(pk__in=kept_users.values("pk"))
        employees_qs = Employee._base_manager.exclude(
            employee_user_id__in=kept_users.values("pk")
        )

        models = [m for m in map(_resolve, TRANSACTIONAL_MODELS) if m is not None]

        self.stdout.write(
            "Keeping logins: "
            + ", ".join(kept_users.values_list("username", flat=True))
        )
        self.stdout.write("Rows to remove:")
        for model in models:
            n = model._base_manager.count()
            if n:
                self.stdout.write(f"  {n:7d}  {model._meta.label}")
        self.stdout.write(f"  {employees_qs.count():7d}  {Employee._meta.label}")
        self.stdout.write(f"  {users_qs.count():7d}  {User._meta.label}")

        if not execute:
            self.stdout.write(
                self.style.WARNING(
                    "\nDry run -- nothing deleted. Re-run with --execute to remove."
                )
            )
            return

        if options["interactive"]:
            confirm = input(
                "\nThis permanently deletes the rows above (back up first).\n"
                "Type 'yes' to continue: "
            )
            if confirm.lower() != "yes":
                self.stdout.write("Aborted.")
                return

        deleted_types = set()
        try:
            with transaction.atomic():
                for model in models:
                    _, per_model = model._base_manager.all().delete()
                    deleted_types.update(per_model)
                # Self-references such as reporting_manager_id are PROTECT;
                # null them out so demo employees can be deleted together.
                for rel in Employee._meta.related_objects:
                    fk = rel.field
                    if fk.null and fk.remote_field.on_delete is PROTECT:
                        rel.related_model._base_manager.filter(
                            **{f"{fk.name}__in": employees_qs}
                        ).update(**{fk.name: None})
                _, per_model = employees_qs.delete()
                deleted_types.update(per_model)
                _, per_model = users_qs.delete()
                deleted_types.update(per_model)

                # Purge history / audit rows of the records we removed so old
                # demo names don't linger in history views. Rows that still
                # belong to kept records (e.g. the superusers) stay.
                purged = 0
                for label in deleted_types:
                    model = apps.get_model(label)
                    pk_name = model._meta.pk.attname
                    alive = model._base_manager.values(pk_name)
                    hist = _history_model(model)
                    if hist is not None:
                        purged += hist._base_manager.exclude(
                            **{f"{pk_name}__in": alive}
                        ).delete()[0]
                    if apps.is_installed("auditlog"):
                        LogEntry = apps.get_model("auditlog", "LogEntry")
                        ct = ContentType.objects.filter(
                            app_label=model._meta.app_label,
                            model=model._meta.model_name,
                        ).first()
                        if ct is not None:
                            alive_pks = [
                                str(pk) for pk in alive.values_list(pk_name, flat=True)
                            ]
                            purged += (
                                LogEntry.objects.filter(content_type=ct)
                                .exclude(object_pk__in=alive_pks)
                                .delete()[0]
                            )
        except ProtectedError as e:
            blockers = sorted({o._meta.label for o in e.protected_objects})
            raise CommandError(
                "Nothing deleted: rows are protected by "
                f"{', '.join(blockers)}. Remove those first."
            ) from e

        self.stdout.write(
            self.style.SUCCESS(
                f"\nDemo data removed ({purged} history/audit row(s) purged). "
                "Kept superusers may still use demo passwords -- change them."
            )
        )
