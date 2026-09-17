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
FIXTURES = ["const_generic_values", "const_generic_arrays"]

# name -> (top-level forms, body expression, expected diagnostic fragment)
NEGATIVE = {
    "keyword-identity": (
        "(defstruct Q [(const U Keyword)] [(v i64)])\n"
        "(defn m [(q (Q :meters))] (-> i64) (.v q))",
        "(m (Q [(const :feet)] :v 1))",
        "(test.const-generic-negative.keyword-identity.Q :meters)"),
    "bool-identity": (
        "(defstruct F [(const On bool)] [(v i64)])\n"
        "(defn m [(f (F true))] (-> i64) (.v f))",
        "(m (F [false] :v 1))",
        "(test.const-generic-negative.bool-identity.F true)"),
    "type-for-constant": (
        "(defstruct B [(const N i64)] [(v i64)])\n"
        "(defn f [(b (B u8))] (-> i64) (.v b))",
        "0",
        "generic parameter 'N' of 'test.const-generic-negative.type-for-constant.B' expects a constant of type i64, got type u8"),
    "constant-for-type": (
        "(defstruct B [T] [(v T)])\n"
        "(defn f [(b (B 4))] (-> i64) 0)",
        "0",
        "expects a type, got constant 4"),
    "out-of-range": (
        "(defstruct B [(const N u8)] [(v i64)])\n"
        "(defn f [(b (B 300))] (-> i64) (.v b))",
        "0",
        "expects a constant of type u8, got 300 (out of range)"),
    "negative-unsigned": (
        "(defstruct B [(const N u64)] [(v i64)])\n"
        "(defn f [(b (B -1))] (-> i64) (.v b))",
        "0",
        "expects a constant of type u64, got -1 (out of range)"),
    "keyword-for-int": (
        "(defstruct B [(const N i64)] [(v i64)])\n"
        "(defn f [(b (B (const :x)))] (-> i64) (.v b))",
        "0",
        "expects a constant of type i64, got constant :x"),
    "value-param-type-mismatch": (
        "(defstruct B [(const N i64)] [(v i64)])\n"
        "(defn f [(const M u8)] [(b (B M))] (-> i64) (.v b))",
        "0",
        "expects a constant of type i64, got value parameter 'M' of type u8"),
    "value-param-as-type": (
        "(defn f [(const N i64)] [(x N)] (-> i64) 0)",
        "0",
        "'N' is a value parameter, not a type"),
    "value-param-bad-type": (
        "(defstruct B [(const N f64)] [(v i64)])",
        "0",
        "value parameters must be an integer type, bool or Keyword"),
    "bool-width": (
        "(defn f [(const N bool)] [(x (vec u8 N))] (-> i64) 0)",
        "0",
        "vec width must be a positive integer or an integer value parameter"),
    "explicit-type-for-constant": (
        "(defn g [(const N i64)] [] (-> i64) 0)",
        "(g [u8])",
        "generic parameter 'N' of 'test.const-generic-negative.explicit-type-for-constant.g' expects a constant of type i64, got type u8"),
    "bool-array-length": (
        "(defn f [(const N bool)] [(x (array u8 N))] (-> i64) 0)",
        "0",
        "array length must be a positive integer or an integer value parameter"),
    "conflicting-lengths": (
        "(defn f [(const N i64)] [(x (array i64 N)) (y (array i64 N))] (-> i64) 0)",
        "(f [1 2] [1 2 3])",
        "conflicting types for parameter 'N' (2 vs 3)"),
    "generic-length-literal": (
        "(defn f [(const N i64)] [] (-> i64) (let [xs (: [1 2] (array i64 N))] 0))",
        "0",
        "array literal has 2 elements but expected N"),
    "fixed-length-mismatch": (
        "(defn f [(x (array i64 3))] (-> i64) 0)\n"
        "(defn g [(const N i64)] [(x (array i64 N))] (-> i64) (f x))",
        "0",
        "(array i64 N)"),
    "value-in-comptime": (
        "(defn f [(const N i64)] [] (-> i64) (comptime N))",
        "0",
        "value parameter 'N' is not known inside comptime"),
    "type-param-as-value": (
        "(defn f [T] [(x T)] (-> i64) T)",
        "0",
        "unbound variable 'T'"),
    "keyword-type-spelling": (
        "(defn f [(x :i64)] (-> i64) 0)",
        "0",
        ":i64 is a Keyword constant, not a type; write the type as i64"),
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
