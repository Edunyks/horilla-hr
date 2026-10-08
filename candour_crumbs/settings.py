from candour.settings import TEMPLATES

TEMPLATES[0]["OPTIONS"]["context_processors"].append(
    "candour_crumbs.context_processors.breadcrumbs",
)
