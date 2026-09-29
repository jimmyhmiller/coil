#!/usr/bin/env python3
"""C symbols are global to the linker but declarations are not: each module's
extern is its own claim about the callee, so declarations of one symbol may differ
in integer width, and only a real ABI conflict is an error."""

from __future__ import annotations

import argparse
import pathlib
import platform
import subprocess
import tempfile

ROOT = pathlib.Path(__file__).resolve().parents[2]
FEATURES = ROOT / "tests/compiler/features"


def run(compiler: str, *args: str) -> subprocess.CompletedProcess:
    return subprocess.run([compiler, *args], cwd=ROOT, capture_output=True, text=True, timeout=300)


def expect_error(result: subprocess.CompletedProcess, fragment: str, what: str) -> None:
    text = result.stdout + result.stderr
    if result.returncode == 0 or fragment not in text:
        raise RuntimeError(f"{what}: expected an error containing {fragment!r}, got exit "
                           f"{result.returncode}:\n{text}")


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("--compiler", required=True)
    compiler = str(pathlib.Path(parser.parse_args().compiler).resolve())

    # Three declarations of `mkdir` (coil.fs's mode_t, i64, i32) each build and run.
    scoped = FEATURES / "extern_symbol_scoped_signatures.coil"
    result = run(compiler, "run", str(scoped))
    if result.returncode != 0:
        raise RuntimeError(f"width-scoped externs failed:\n{result.stdout}{result.stderr}")

    with tempfile.TemporaryDirectory(prefix=".coil-extern-scoping-", dir=ROOT) as raw:
        tmp = pathlib.Path(raw)

        # A register-class conflict is still one symbol, one callee: rejected.
        klass = tmp / "class_conflict.coil"
        klass.write_text("(module class-conflict)\n"
                         "(extern read2 :as \"read\" :cc c [f64 (ptr i8) i64] (-> i64))\n"
                         "(defn main [] (-> i64) (read2 0.0 c\"\" 0))\n")
        expect_error(run(compiler, "check", str(klass)),
                     "C symbol 'read' is declared twice with incompatible signatures",
                     "register-class conflict")

        # wasm imports are typed per symbol, so widths must agree there.
        expect_error(run(compiler, "build", str(scoped), "--target", "wasm32-unknown-unknown",
                         "-o", str(tmp / "out.wasm")),
                     "One C symbol, one signature", "wasm width conflict")

    # An export-c of a C symbol defines it for the whole program: every extern of
    # that symbol, the standard library's included, binds to the definition.
    interposed = FEATURES / "export_c_interposes_extern.coil"
    result = run(compiler, "run", str(interposed))
    if result.returncode != 0:
        raise RuntimeError(f"export-c interposition (llvm) failed:\n{result.stdout}{result.stderr}")
    result = run(compiler, "interp", str(interposed))
    if result.returncode != 0:
        raise RuntimeError(f"export-c interposition (interp) failed:\n{result.stdout}{result.stderr}")
    if platform.machine() == "arm64":
        with tempfile.TemporaryDirectory(prefix=".coil-extern-scoping-", dir=ROOT) as raw:
            exe = pathlib.Path(raw) / "interposed"
            built = run(compiler, "build", str(interposed), "--backend", "arm64", "-o", str(exe))
            if built.returncode != 0:
                raise RuntimeError(f"export-c interposition (arm64 build) failed:\n{built.stdout}{built.stderr}")
            if subprocess.run([str(exe)], cwd=ROOT).returncode != 0:
                raise RuntimeError("export-c interposition (arm64 backend) ran libc's mkdir")

    # ...but only a definition the extern's declaration could have called.
    collision = FEATURES.parent / "oracle/diag/inputs/60-export-stdlib-symbol-collision.coil"
    expect_error(run(compiler, "check", str(collision)),
                 "but 'coil.fs.mkdir' declares that symbol as",
                 "incompatible export-c over a stdlib extern")
    print("extern scoping: ok")


if __name__ == "__main__":
    main()
