#!/usr/bin/env python3
"""COMPREHENSIVE: the compiler builds for wasm64 and checks itself under node.

This is the web playground's compiler and the interpreted metaprogram engine's
biggest user: a single static module that validates, and that runs `coil check`
over the compiler's own arm64 entry without falling back to a host engine.
"""

from __future__ import annotations

import os
import shutil
import subprocess
import sys
import tempfile
from pathlib import Path

ROOT = Path(__file__).resolve().parents[2]
COIL = os.environ.get("COIL") or shutil.which("coil") or "coil"


def run(*argv: str) -> subprocess.CompletedProcess[str]:
    print("+", " ".join(argv), flush=True)
    return subprocess.run(argv, cwd=ROOT, text=True, capture_output=True)


def main() -> int:
    for tool in ("node", "wasm-tools"):
        if not shutil.which(tool):
            print(f"FAIL the wasm self-host needs {tool} on PATH")
            return 1
    with tempfile.TemporaryDirectory(prefix="wasm-self-host-", dir=os.environ.get("COIL_TEST_SCRATCH")) as raw:
        wasm = str(Path(raw) / "coilc.wasm")
        built = run(COIL, "build", "src/compiler/main_wasm.coil", "--target", "wasm64-unknown-unknown",
                    "--wasm-stack-size=64", "-o", wasm)
        if built.returncode:
            print("FAIL the compiler does not build for wasm64\n" + (built.stdout + built.stderr)[-3000:])
            return 1
        valid = run("wasm-tools", "validate", "--features=memory64", wasm)
        if valid.returncode:
            print("FAIL the wasm64 compiler does not validate\n" + valid.stderr[-2000:])
            return 1
        printed = run("wasm-tools", "print", wasm).stdout
        if sum(line.startswith("(module") for line in printed.splitlines()) != 1:
            print("FAIL the wasm compiler is not a single static module")
            return 1
        env = dict(os.environ, COIL_WASM_META_TRACE="1")
        print("+ node run-coil-wasm.mjs coilc.wasm check src/compiler/main_a64.coil", flush=True)
        checked = subprocess.run(["node", "src/tooling/wasm-host/run-coil-wasm.mjs", wasm, "check",
                                  "src/compiler/main_a64.coil"], cwd=ROOT, env=env,
                                 stdout=subprocess.DEVNULL, stderr=subprocess.PIPE, text=True)
        if checked.returncode or "meta_run_wasm" in checked.stderr or "WALL1" in checked.stderr:
            print("FAIL the wasm compiler cannot check the compiler\n" + checked.stderr[-3000:])
            return 1
    print("wasm self-host: PASS")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
