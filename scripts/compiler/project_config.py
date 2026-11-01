"""The environment variables a project's configuration lives in.

`coil` publishes these to the compilers it starts. A program it started used to inherit
them too, and so did everything that program started, so a shell opened from a Coil
application could carry another project's configuration into a build or a test run,
which then failed in ways that look like compiler bugs. The build and test tools start
from none of it.
"""
from __future__ import annotations

import os

PROJECT_VARIABLES = (
    "COIL_NAMESPACE_ROOTS", "COIL_NAMESPACE_EXCLUDES", "COIL_READERS", "COIL_MODULE_MAP",
    "COIL_MANIFEST_PROVIDERS", "COIL_MANIFEST_PATH", "COIL_PACKAGE_NAME", "COIL_UNITS",
    "COIL_WORKSPACE_PACKAGES", "COIL_STDLIB", "COIL_STDLIB_PROFILE", "COIL_PRELUDE",
    "COIL_CORE_PROVIDERS", "COIL_META_JIT", "COIL_PROJECT_CHILD",
)


def clear() -> None:
    for name in PROJECT_VARIABLES:
        os.environ.pop(name, None)
