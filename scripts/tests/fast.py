#!/usr/bin/env python3
"""FAST: the pre-push tier. End-to-end tests of key functionality, run serially.

    python3 scripts/dev.py test fast --compiler <coil>           # every step, aiming for 5 minutes
    python3 scripts/dev.py test fast --compiler <coil> --quick   # inner loop, aiming for 60 s

It never builds, checks or installs the compiler: a step that runs a whole-compiler
command is refused before anything runs, and a process that tries one at run time
is killed. Each step's time and largest process are reported; a run past its target
time, or a step whose largest process passes 1.5 GB, gets a warning, never a
failure. Run `--list` to see the steps.

Everything here takes the compiler from $COIL (also first on PATH as `coil`) and
writes temporary files under $COIL_TEST_SCRATCH, which the harness removes.
"""

from __future__ import annotations

import argparse
import sys
from pathlib import Path

sys.path.insert(0, str(Path(__file__).resolve().parent))
import harness  # noqa: E402
from harness import Step  # noqa: E402

PY = sys.executable
FAST = "scripts/tests/fast"
MEMORY_LINE_GB = 1.5
TARGET_SECONDS = 300
QUICK_TARGET_SECONDS = 60
HANG_SECONDS = 600


def stdlib_suites() -> list[str]:
    return sorted(p.name for p in (harness.ROOT / "tests" / "stdlib").glob("*_test.coil"))


def steps(quick: bool) -> list[Step]:
    cli = f"{FAST}/cli.sh"
    corpus = [PY, "scripts/oracle.py", "corpus"]
    result = [
        # The examples workspace: ten real packages a user would write.
        Step("examples/build", [PY, f"{FAST}/examples.py", "build"]),
        Step("examples/test", [PY, f"{FAST}/examples.py", "test"]),
        Step("examples/test-core", [PY, f"{FAST}/examples.py", "test", "calc", "huffman"], quick=True),
        Step("examples/arm64", [PY, f"{FAST}/examples.py", "arm64"]),
        Step("examples/safety", [PY, f"{FAST}/examples.py", "safety"]),
        Step("examples/fmt", [PY, f"{FAST}/examples.py", "fmt"]),
        # The consolidated runtime corpus, one lane per way of running a program.
        Step("corpus/arm64", [*corpus, "arm64"], quick=True),
        Step("corpus/llvm", [*corpus, "llvm"], quick=True),
        Step("corpus/interp", [*corpus, "interp"]),
        Step("corpus/safety", [*corpus, "safety"]),
        Step("corpus/meta-interp", [*corpus, "meta-interp"]),
        # Compile and build diagnostics against byte-exact goldens.
        Step("diag/compile", [PY, "scripts/oracle.py", "diag", "gate", "compile"], quick=True),
        Step("diag/link", [PY, "scripts/oracle.py", "diag", "gate", "link"]),
        Step("diag/no-hang", [PY, "scripts/oracle.py", "diag", "gate", "no-hang"], quick=True),
        # The command-line contract.
        Step("cli/run", [cli, "run"], quick=True),
        Step("cli/usage", [cli, "usage"]),
        Step("cli/reference", [cli, "reference"]),
        Step("cli/new-project", [cli, "new-project"]),
        Step("cli/check", [cli, "check"]),
        Step("cli/fmt", [cli, "fmt"], quick=True),
        Step("cli/lint", [cli, "lint"]),
        Step("cli/objects", [cli, "objects"]),
        Step("cli/cross", [cli, "cross"]),
        Step("cli/cimport", [cli, "cimport"]),
        Step("cli/cexport", [cli, "cexport"]),
        Step("cli/debuginfo", [cli, "debuginfo"]),
        Step("cli/sanitizers", [cli, "sanitizers"]),
        Step("cli/safety-traps", [cli, "safety-traps"]),
        Step("cli/debug-checks", [cli, "debug-checks"]),
        Step("cli/debug-allocator", [cli, "debug-allocator"]),
        Step("cli/crash", [cli, "crash"]),
        Step("cli/test-runner", [cli, "test-runner"]),
        Step("cli/fuzz", [cli, "fuzz"]),
        # One workspace using every Coil.toml feature.
        Step("projects", [f"{FAST}/projects.sh"]),
        # The C ABI in both directions, and extern aliases.
        Step("c-abi", [PY, "scripts/tests/c-abi.py"], quick=True),
        # WebAssembly programs run under node.
        Step("wasm", [PY, f"{FAST}/wasm.py"]),
        Step("wasm/quick", [PY, f"{FAST}/wasm.py", "--quick"], quick=True),
        # Generated units, the namespace index and reader providers stay bounded.
        Step("memory/generated-units", [PY, "scripts/tests/generated-unit-memory.py", "--units", "16", "--no-baseline"]),
        Step("memory/project-scan", [PY, "scripts/tests/project-scan-memory.py"]),
        # REPL resident set and time per submission (reported, not yet bounded).
        Step("memory/repl-growth", [PY, "scripts/tests/repl-growth.py", "--submissions", "30"]),
        Step("readers", [f"{FAST}/readers.sh"]),
        # Macros, transforms, checkers and hygiene.
        Step("meta", [f"{FAST}/meta.sh"]),
        Step("simd", [PY, "scripts/tests/simd.py", "fast"]),
    ]
    result += [Step(f"stdlib/{name.removesuffix('_test.coil')}", ["coil", "test", f"tests/stdlib/{name}"])
               for name in stdlib_suites()]
    if quick:
        return [s for s in result if s.quick]
    # examples/test-core and wasm/quick are the quick tier's cut-down versions of
    # examples/test and wasm.
    return [s for s in result if s.name not in ("examples/test-core", "wasm/quick")]


def main(argv: list[str] | None = None) -> int:
    parser = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    harness.common_arguments(parser)
    parser.add_argument("--quick", action="store_true", help="the <= 60 s inner-loop subset")
    args = parser.parse_args(argv)
    tier = "quick" if args.quick else "fast"
    selected = steps(args.quick)
    if args.list:
        harness.list_steps(selected)
        return 0
    return harness.run_tier(
        tier, selected, harness.resolve_compiler(args.compiler),
        target_seconds=QUICK_TARGET_SECONDS if args.quick else TARGET_SECONDS,
        memory_gb=MEMORY_LINE_GB, hang_seconds=HANG_SECONDS,
        refuse_whole_compiler=True, only=args.only, verbose=args.verbose)


if __name__ == "__main__":
    raise SystemExit(main())
