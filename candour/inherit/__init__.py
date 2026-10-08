"""
candour/inherit/

Extension infrastructure for Candour — model field injection and CBV replacement.

Key public symbols re-exported here for convenience:

    from candour.inherit import CandourViewInheritMixin   # view extension
    from candour.inherit import CandourModelBase           # model metaclass
    from candour.inherit import INJECTION_MAP              # migration routing
    from candour.inherit import VIEW_REGISTRY              # registered views
"""

from candour.inherit.extension_registry import INJECTION_MAP
from candour.inherit.model_inherit import EXTENSION_REGISTRY, CandourModelBase
from candour.inherit.view_inherit import CandourViewInheritMixin
from candour.inherit.view_registry import VIEW_REGISTRY

__all__ = [
    "CandourViewInheritMixin",
    "CandourModelBase",
    "INJECTION_MAP",
    "EXTENSION_REGISTRY",
    "VIEW_REGISTRY",
]
