#!/usr/bin/env python3
"""WebAssembly programs, built and run under node (tests/wasm/).

- tests/wasm/wasm32.coil on wasm32, validated and run by tests/wasm/run.mjs,
  which checks each export's result (see the program's header). The module must
  export __stack_pointer, and its `write` import must be (i32, i32, i32) -> i32:
  size_t and ssize_t are 32-bit on wasm32.
- tests/bootstrap/errno.coil on the native wasm backend (wasm64), run as a
  standalone program: errno set by the host is the errno Coil reads.
- the externref misuse files: every way of putting a host reference in linear
  memory is a located checker error, never a compiler abort.

`--quick` runs only the wasm32 program. node and wasm-tools are required: a
missing tool fails the step rather than letting it pass having run nothing.

Usage: wasm.py [--quick] [--compiler COIL]
"""
from __future__ import annotations

import argparse
import os
import re
import shutil
import subprocess
import sys
import tempfile
from pathlib import Path

ROOT = Path(__file__).resolve().parents[3]
WASM = ROOT / "tests" / "wasm"
EXPECTED_EXPORTS = ("arraylist_record=6", "dyn_aggregate_return=42", "externref_roundtrip=7",
                    "use_stack=5", "aliased=42")
EXTERNREF_ERRORS = {
    "externref_misuse.coil": ("cast target: externref cannot be behind a pointer or reference",
                              "type ascription: externref cannot be an array, slice or vec element",
                              "externref cannot be an array, slice or vec element",
                              "externref cannot be a type argument",
                              "4 errors"),
    "externref_field.coil": ("field 'r': externref cannot be a field",),
}


class Failed(Exception):
    pass


def run(command: list, label: str, expect_ok: bool = True) -> subprocess.CompletedProcess:
    result = subprocess.run([str(c) for c in command], cwd=ROOT, capture_output=True, text=True,
                            timeout=120, stdin=subprocess.DEVNULL)
    if expect_ok and result.returncode != 0:
        raise Failed(f"{label}: exit {result.returncode}\n$ {' '.join(map(str, command))}\n"
                     f"{result.stdout[-3000:]}{result.stderr[-3000:]}")
    return result


def wasm32_program(coil: str, work: Path) -> None:
    module = work / "wasm32.wasm"
    run([coil, "build", WASM / "wasm32.coil", "--target", "wasm32-unknown-unknown", "-o", module, "--quiet"],
        "build wasm32.coil")
    run(["wasm-tools", "validate", module], "validate wasm32.wasm")
    printed = run(["wasm-tools", "print", module], "print wasm32.wasm").stdout
    if '(export "__stack_pointer"' not in printed:
        raise Failed("wasm32.wasm does not export __stack_pointer, so a host longjmp cannot restore SP")
    write = re.search(r'\(import "env" "write" \(func \(;\d+;\) \(type (\d+)\)\)\)', printed)
    signature = write and re.search(r"\(type \(;" + write.group(1) + r";\) \(func ([^\n]*)\)\)", printed)
    if not signature or signature.group(1) != "(param i32 i32 i32) (result i32)":
        raise Failed("on wasm32, write must be (i32 fd, i32 ptr, i32 size_t) -> i32 ssize_t; got "
                     + (signature.group(1) if signature else "no write import"))
    ran = run(["node", WASM / "run.mjs", module, *EXPECTED_EXPORTS], "run wasm32.wasm", expect_ok=False)
    if ran.returncode != 0:
        raise Failed(f"wasm32.wasm exports returned the wrong values:\n{ran.stdout}{ran.stderr[-3000:]}")
    print("ok   wasm32: layout, dyn returns, externref, shadow stack, aliased import, 32-bit size_t")


def wasm64_errno(coil: str, work: Path) -> None:
    module = work / "errno.wasm"
    run([coil, "build", ROOT / "tests/bootstrap/errno.coil", "--backend", "wasm",
         "--target", "wasm64-unknown-unknown", "-o", module, "--quiet"], "build errno.coil (wasm64)")
    run(["wasm-tools", "validate", "--features=memory64", module], "validate errno.wasm")
    run(["node", ROOT / "src/tooling/wasm-host/run-standalone.mjs", module], "run errno.wasm")
    print("ok   wasm64: errno round-trips between the host and Coil")


def externref_misuse(coil: str, work: Path) -> None:
    for name, wanted in EXTERNREF_ERRORS.items():
        result = run([coil, "build", WASM / name, "--target", "wasm32-unknown-unknown",
                      "-o", work / "misuse.wasm"], f"build {name}", expect_ok=False)
        output = result.stdout + result.stderr
        if result.returncode != 1:
            raise Failed(f"{name} must fail with a checker error (exit 1), got exit {result.returncode}:\n{output}")
        missing = [w for w in wanted if w not in output]
        if missing:
            raise Failed(f"{name}: missing {missing}:\n{output}")
    print("ok   externref: every linear-memory position is a located error")


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    parser.add_argument("--quick", action="store_true")
    parser.add_argument("--compiler", default=os.environ.get("COIL") or shutil.which("coil") or "coil")
    args = parser.parse_args()
    missing = [tool for tool in ("node", "wasm-tools") if not shutil.which(tool)]
    if missing:
        print(f"FAIL wasm needs {' and '.join(missing)} on PATH (brew install node wasm-tools)")
        return 1
    checks = [wasm32_program] if args.quick else [wasm32_program, wasm64_errno, externref_misuse]
    failures = 0
    with tempfile.TemporaryDirectory(prefix="coil-wasm-", dir=os.environ.get("COIL_TEST_SCRATCH")) as raw:
        for check in checks:
            try:
                check(args.compiler, Path(raw))
            except (Failed, subprocess.TimeoutExpired) as error:
                failures += 1
                print(f"FAIL {error}")
    print(f"wasm: {'FAILED' if failures else 'PASS'}")
    return 1 if failures else 0


if __name__ == "__main__":
    sys.exit(main())
