#!/usr/bin/env python3
"""Field access through traits: semantics, and the errors when no impl answers."""

from __future__ import annotations

import argparse
import pathlib
import subprocess
import tempfile
import time


ROOT = pathlib.Path(__file__).resolve().parents[2]
FEATURES = ROOT / "tests/compiler/features"
FIXTURES = ["field_access_traits"]

PRELUDE = """(defstruct Plain [(w i64)])
(defstruct Other [(v i64)])
(impl FieldGet (Field Other :computed)
  (get-field [(self (Field Other :computed)) (target Other)] (-> i64) (.v target)))
"""

# name -> (extra top-level forms, body expression, expected diagnostic fragment)
NEGATIVE = {
    "no-impl": (
        "",
        "(.missing (Plain :w 1))",
        "struct 'test.field-negative.no-impl.Plain' has no field 'missing'"),
    "no-writer": (
        "",
        "(let [(mut o) (Other :v 1)] (set! (.computed o) 2))",
        "is read-only: it has no `set-field!` implementation"),
    "not-a-place": (
        "",
        "(.missing 7)",
        "field access needs a pointer or reference"),
    "wrong-target-type": (
        "(defstruct Third [(v i64)])",
        "(.computed (Third :v 1))",
        "has no field 'computed'"),
    "ambiguous": (
        "(deftrait OtherGet [Self T V]\n"
        "  (get-field [(self Self) (target T)] (-> V)))\n"
        "(impl OtherGet (Field Other :computed)\n"
        "  (get-field [(self (Field Other :computed)) (target Other)] (-> i64) 2))",
        "(.computed (Other :v 1))",
        "ambiguous field implementations"),
}


def run(command: list[str], *, ok: bool = True) -> subprocess.CompletedProcess[str]:
    result = subprocess.run(command, cwd=ROOT, text=True, capture_output=True, timeout=180)
    if ok and result.returncode:
        raise AssertionError(f"{' '.join(command)}\nexit {result.returncode}\n{result.stdout}{result.stderr}")
    return result


def diagnostics(compiler: str) -> None:
    with tempfile.TemporaryDirectory(prefix=".coil-field-negative-", dir=ROOT) as directory:
        for name, (forms, expression, expected) in NEGATIVE.items():
            source = pathlib.Path(directory) / f"{name}.coil"
            source.write_text(
                f"(module test.field-negative.{name})\n"
                f"{PRELUDE}{forms}\n"
                f"(defn main [] (-> i64) (do {expression} 0))\n"
            )
            result = run([compiler, "check", str(source)], ok=False)
            output = result.stdout + result.stderr
            if result.returncode != 1 or expected not in output:
                raise AssertionError(f"negative {name}: expected exit 1 containing {expected!r}, "
                                     f"got {result.returncode}\n{output}")
    print(f"field access diagnostics: {len(NEGATIVE)} rejected programs", flush=True)


def semantics(compiler: str) -> None:
    for fixture in FIXTURES:
        run([compiler, "run", str(FEATURES / f"{fixture}.coil")])
        print(f"field access: {fixture}", flush=True)


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--compiler", required=True)
    args = parser.parse_args()
    compiler = str(pathlib.Path(args.compiler).resolve())
    started = time.monotonic()
    diagnostics(compiler)
    semantics(compiler)
    print(f"field access gate passed in {time.monotonic() - started:.2f}s", flush=True)
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
