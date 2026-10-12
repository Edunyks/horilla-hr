"""
payroll/sidebars

Top-level sidebar sections for a payroll-only build (see
PAYROLL_ONLY_SIDEBARS in horilla/settings/base.py). Each module here is a
sidebar section in its own right -- MENU, IMG_SRC, SUBMENUS and an optional
ACCESSIBILITY, like an app's sidebar.py -- referenced from the settings by
dotted path, e.g. "payroll.sidebars.contracts".

The default sidebar keeps using payroll/sidebar.py, which bundles all of this
into one "Payroll" section. Accessibility helpers are shared with it.
"""

ICON_DIR = "images/ionicons/ui_icons/svg"
