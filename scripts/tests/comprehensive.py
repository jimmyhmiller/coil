#!/usr/bin/env python3
"""COMPREHENSIVE: the release tier, run before a release or a risky merge.

    python3 scripts/dev.py test comprehensive              # build, install privately, run all
    python3 scripts/dev.py test comprehensive --no-x64     # without the x64 Linux host
    python3 scripts/dev.py test comprehensive --compiler C --only jit   # one slice, no build

With no `--compiler`, it runs `dev.py build full --no-install` once, installs that
compiler into a private prefix (which warms its coil.jit unit), and runs every
step against that one install: FAST, the compile-error tests, the coil.jit SDK and
REPL, JIT sessions, generated units, the all-namespaces check, the wasm
self-host, memory caps and the breadth lanes. The user's own `coil` is never
touched. The x64 steps run on the x86-64 Linux host (`COIL_X64_HOST`, default
computer.jimmyhmiller.com); when it is unreachable they fail and say so, and
`--no-x64` leaves them out.

With `--compiler`, nothing is built: the steps run against that compiler, which
must be an installed one (<prefix>/bin/coil beside <prefix>/lib/coil) for the
steps that need the coil.jit unit. `--only` picks steps by name or name prefix;
CI uses it to run its slices.

Steps run serially. Each step's time and largest process are reported, with a
warning for a process past the step's memory line; neither ever fails a step.
"""

from __future__ import annotations

import argparse
import os
import shutil
import sys
import tempfile
import time
from pathlib import Path

sys.path.insert(0, str(Path(__file__).resolve().parent))
import harness  # noqa: E402
from harness import Step  # noqa: E402

PY = sys.executable
ROOT = harness.ROOT
MEMORY_LINE_GB = 6.0       # an ordinary comprehensive step
HEAVY_LINE_GB = 16.0       # a step that compiles the whole compiler
HANG_SECONDS = 3600
X64_HOST = os.environ.get("COIL_X64_HOST", "computer.jimmyhmiller.com")


def build_steps(prefix: Path) -> list[Step]:
    return [
        Step("build/full", [PY, "scripts/dev.py", "build", "full", "--no-install"],
             whole_compiler=True, memory_gb=HEAVY_LINE_GB),
        Step("build/install", [PY, "scripts/dev.py", "install", "--source", "build/bin/coil",
                               "--dest", str(prefix / "bin" / "coil")],
             whole_compiler=True, memory_gb=HEAVY_LINE_GB),
    ]


def steps(x64: bool) -> list[Step]:
    installed = "scripts/tests/installed-toolchain.sh"
    corpus = [PY, "scripts/oracle.py", "corpus"]
    result = [
        Step("fast", [PY, "scripts/tests/fast.py", "--compiler", "{compiler}"]),
        # Compile-error tests link the in-process compiler through the warmed unit.
        Step("compile-errors", [PY, "scripts/tests/compile-errors.py"]),
        Step("installed/layout", [installed, "layout"]),
        Step("installed/allns", [installed, "allns"], whole_compiler=True, memory_gb=HEAVY_LINE_GB),
        Step("installed/jit-sdk", [installed, "jit-sdk"]),
        Step("installed/repl", [installed, "repl"]),
        Step("jit/repl-forms", [PY, "scripts/tests/jit-single-form.py"]),
        # The tpde JIT backend exists where the native one does: macOS arm64.
        *([Step("jit/repl-forms-tpde", [PY, "scripts/tests/jit-single-form.py", "{compiler}", "--backend", "tpde"])]
          if sys.platform == "darwin" and os.uname().machine == "arm64" else []),
        Step("jit/sessions", [PY, "scripts/tests/jit-static-session.py"]),
        Step("generated/modules", [PY, "scripts/tests/generated-modules.py"]),
        Step("memory/generated-units", [PY, "scripts/tests/generated-unit-memory.py", "--units", "64"]),
        Step("memory/namespace-index", [PY, "scripts/tests/project-scan-memory.py", "--full"]),
        Step("memory/self-build", [PY, "scripts/tests/self-build-expansion-memory.py", "{compiler}"],
             whole_compiler=True, memory_gb=HEAVY_LINE_GB),
        Step("extern-prototypes", [PY, "scripts/tests/extern-prototypes.py", "{compiler}"],
             whole_compiler=True, memory_gb=HEAVY_LINE_GB),
        Step("aggregates", [PY, "scripts/tests/aggregate-ir-scan.py", "{compiler}"],
             whole_compiler=True, memory_gb=HEAVY_LINE_GB),
        Step("wasm/self-host", [PY, "scripts/tests/wasm-self-host.py"],
             whole_compiler=True, memory_gb=HEAVY_LINE_GB),
        Step("bootstrap-imports", [PY, "scripts/tests/bootstrap-imports.py", "--compiler", "{compiler}"],
             whole_compiler=True, memory_gb=HEAVY_LINE_GB),
        Step("install-pairing", [PY, "scripts/tests/install-pairing.py"]),
        Step("corpus/safety-all", [*corpus, "safety", "--all"]),
        Step("corpus/opt3", [*corpus, "opt3"]),
        Step("corpus/meta-interp-all", [*corpus, "meta-interp", "--all"]),
        Step("guide-demos", [PY, "scripts/tests/guide-demos.py"]),
        Step("regex-reference", ["coil", "test", "tests/comprehensive/regex_reference_test.coil"]),
        Step("prop", ["sh", "scripts/tests/prop.sh", "-q", "{compiler}"]),
        Step("fuzz", [PY, "scripts/tests/fuzz_gate.py", "--compiler", "{compiler}"]),
        Step("simd", [PY, "scripts/tests/simd.py", "full"]),
        # Bare-metal images link with no undefined symbols and run under QEMU.
        Step("freestanding", [PY, "scripts/tests/freestanding.py", "--compiler", "{compiler}"]),
    ]
    if x64:
        result.append(Step("x64/host", [PY, "scripts/tests/x64-host.py", "--host", X64_HOST],
                           whole_compiler=True))
    return result


def bind(steps: list[Step], compiler: str, prefix: Path | None) -> list[Step]:
    """Fill in the compiler path, and point the JIT scripts at the warmed unit."""
    unit = prefix / "lib" / "coil" / "units" / "llvm" / "jit-llvm" / "coil.compiler.jit_api" if prefix else None
    for step in steps:
        step.argv = [arg.replace("{compiler}", compiler) for arg in step.argv]
        if unit is not None and unit.is_dir():
            step.env["COIL_TEST_JIT_UNIT"] = str(unit)
    return steps


def installed_prefix(compiler: str) -> Path | None:
    prefix = Path(compiler).resolve().parent.parent
    return prefix if (prefix / "lib" / "coil" / "stdlib").is_dir() else None


def main(argv: list[str] | None = None) -> int:
    parser = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    harness.common_arguments(parser)
    parser.set_defaults(compiler=None)
    parser.add_argument("--no-x64", action="store_true", help="leave out the x64 Linux host steps")
    args = parser.parse_args(argv)
    if args.compiler is None and args.only:
        raise SystemExit("--only needs --compiler: a slice runs against an existing compiler")
    if args.list:
        prefix = Path("<prefix>")
        harness.list_steps(([] if args.compiler else build_steps(prefix)) + steps(not args.no_x64))
        return 0
    started = time.monotonic()
    work = Path(tempfile.mkdtemp(prefix="coil-comprehensive-"))
    try:
        if args.compiler is None:
            prefix = work / "prefix"
            status = harness.run_tier(
                "comprehensive", build_steps(prefix), shutil.which("coil") or "coil",
                target_seconds=None, memory_gb=HEAVY_LINE_GB, hang_seconds=HANG_SECONDS,
                refuse_whole_compiler=False, verbose=args.verbose)
            if status:
                print("comprehensive: the build failed; nothing else ran")
                return status
            compiler = str(prefix / "bin" / "coil")
        else:
            compiler = harness.resolve_compiler(args.compiler)
            prefix = installed_prefix(compiler)
        selected = bind(steps(not args.no_x64), compiler, prefix)
        status = harness.run_tier(
            "comprehensive", selected, compiler, target_seconds=None,
            memory_gb=MEMORY_LINE_GB, hang_seconds=HANG_SECONDS, refuse_whole_compiler=False,
            only=args.only, verbose=args.verbose)
    finally:
        shutil.rmtree(work, ignore_errors=True)
    wall = time.monotonic() - started
    print(f"== comprehensive: {wall:.1f}s wall in all")
    print("comprehensive: PASS" if status == 0 else "comprehensive: FAILED")
    return status


if __name__ == "__main__":
    raise SystemExit(main())
