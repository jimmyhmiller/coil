#!/usr/bin/env python3
"""Typed compile-time generic parameters: semantics and diagnostics."""

from __future__ import annotations

import argparse
import pathlib
import subprocess
import tempfile
import time


ROOT = pathlib.Path(__file__).resolve().parents[2]
FEATURES = ROOT / "tests/compiler/features"
FIXTURES = ["const_generic_values"]

# name -> (top-level forms, body expression, expected diagnostic fragment)
NEGATIVE = {
    "keyword-identity": (
        "(defstruct Q [(const U Keyword)] [(v i64)])\n"
        "(defn m [(q (Q (const :meters)))] (-> i64) (.v q))",
        "(m (Q [(const :feet)] :v 1))",
        "(test.const-generic-negative.keyword-identity.Q :meters)"),
    "bool-identity": (
        "(defstruct F [(const On bool)] [(v i64)])\n"
        "(defn m [(f (F true))] (-> i64) (.v f))",
        "(m (F [false] :v 1))",
        "(test.const-generic-negative.bool-identity.F true)"),
    "const-form": (
        "(defstruct F [(const On bool)] [(v i64)])\n"
        "(defn m [(f (F (const 1.5)))] (-> i64) (.v f))",
        "0",
        "constant generic argument expects (const VALUE)"),
}


def run(command: list[str], *, ok: bool = True) -> subprocess.CompletedProcess[str]:
    result = subprocess.run(command, cwd=ROOT, text=True, capture_output=True, timeout=180)
    if ok and result.returncode:
        raise AssertionError(f"{' '.join(command)}\nexit {result.returncode}\n{result.stdout}{result.stderr}")
    return result


def diagnostics(compiler: str) -> None:
    with tempfile.TemporaryDirectory(prefix=".coil-const-generic-negative-", dir=ROOT) as directory:
        for name, (forms, expression, expected) in NEGATIVE.items():
            source = pathlib.Path(directory) / f"{name}.coil"
            source.write_text(
                f"(module test.const-generic-negative.{name})\n"
                f"{forms}\n"
                f"(defn main [] (-> i64) (do {expression} 0))\n"
            )
            result = run([compiler, "check", str(source)], ok=False)
            output = result.stdout + result.stderr
            if result.returncode != 1 or expected not in output:
                raise AssertionError(f"negative {name}: expected exit 1 containing {expected!r}, "
                                     f"got {result.returncode}\n{output}")
    print(f"const generics diagnostics: {len(NEGATIVE)} rejected programs", flush=True)


def semantics(compiler: str) -> None:
    for fixture in FIXTURES:
        run([compiler, "run", str(FEATURES / f"{fixture}.coil")])
        print(f"const generics: {fixture}", flush=True)


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--compiler", required=True)
    args = parser.parse_args()
    compiler = str(pathlib.Path(args.compiler).resolve())
    started = time.monotonic()
    diagnostics(compiler)
    semantics(compiler)
    print(f"const generics gate passed in {time.monotonic() - started:.2f}s", flush=True)
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
