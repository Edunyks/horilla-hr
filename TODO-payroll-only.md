# TODO: payroll-only build (temporary — delete when done)

Goal: run Horilla for payroll only. Hide the other modules behind a feature
flag (do **not** delete them) and rework the sidebar so it still looks full.

Reference schema: `sql/payroll_only_schema.sql` (251 tables).

## Why a flag, not deletion

- `payroll` migration 0001 depends on `asset`; `base` migrations depend on
  `attendance` and `leave`. Removing apps from `INSTALLED_APPS` breaks
  `migrate`.
- ~330 `apps.is_installed(...)` checks; `employee` alone references other
  modules ~100 times.
- Deleting code makes upstream Horilla merges painful and isn't reversible.

## Modules

- **Keep on:** employee, attendance, leave, payroll, base, plus asset
  (migration dependency, loan asset fines) and the support apps
  (horilla_auth, horilla_theme, horilla_audit, horilla_documents,
  horilla_views, horilla_widgets, horilla_crumbs, horilla_automations,
  horilla_tour, accessibility).
- **Switch off:** recruitment, onboarding, offboarding, pms, project,
  helpdesk, report, biometric, facedetection, geofencing, horilla_meet,
  whatsapp, horilla_ldap, horilla_backup, horilla_dbtemplate.
  - Decide whether `report` stays for payroll reports.
  - Decide whether to hide asset's own sidebar/pages while keeping its tables.

## Commit 1: feature flag

- [ ] Add `ENABLED_MODULES` setting (env-driven, default = all) in
      `horilla/settings/base.py`.
- [ ] Add helper `horilla/modules.py` → `is_enabled(name)` (installed AND
      listed in `ENABLED_MODULES`).
- [ ] In each optional app's `AppConfig.ready()` (e.g.
      `recruitment/apps.py:24`): skip the `urlpatterns.append(...)`,
      `settings.APPS.append(...)`, signals and scheduler start when the
      module is disabled. Models and migrations stay as they are.
- [ ] Replace `apps.is_installed("<optional module>")` with
      `is_enabled(...)` across the codebase (mechanical; leave checks on
      always-on apps alone).
- [ ] `horilla/config.py` `sidebar()`: use `is_enabled` instead of
      `apps.is_installed`.
- [ ] Settings menu registrations (`condition = ... is_installed(...)`)
      → `is_enabled`.
- [ ] Gate APScheduler jobs of disabled modules (`*/scheduler.py`).
- [ ] Tests: flag off → module URLs 404, sidebar entry absent, settings
      entry absent; flag on → unchanged behaviour.

## Commit 2: sidebar for a payroll-only build

- [ ] Let `SIDEBARS` (`horilla/settings/base.py:454`) accept dotted module
      paths, e.g. `"payroll.sidebars.contracts"`, checking the owning app
      with `is_enabled` (change in `horilla/config.py` `sidebar()`).
- [ ] Split `payroll/sidebar.py` into top-level sections: Payslips,
      Contracts, Salary Structures, Allowances & Deductions (currently
      commented out at `payroll/sidebar.py:26`), Loans & Advances,
      Reimbursements & Encashments, Income Tax.
- [ ] Order: Dashboard → Employees → Attendance → Leave → payroll sections
      → Payroll Reports → Configuration (~11 sections).
- [ ] Make the payroll dashboard the home page when only payroll is on.
- [ ] Remove or hide what points at disabled modules: home dashboard
      widgets, quick-create, employee profile tabs (asset, pms, helpdesk),
      global search entries, `horilla_tour` steps.
- [ ] Check active-link highlighting (`match_prefixes`) still works after
      the split.
- [ ] Screenshot the sidebar with the flag on and off.

## Finish

- [ ] Regenerate `sql/payroll_only_schema.sql` if models change.
- [ ] Delete this file.
