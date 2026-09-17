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
    "undeclared-width": (
        "(defstruct P [T N] [(v (vec T N))])",
        "0",
        "vec width 'N' is a type parameter; declare it as a value parameter, (const N i64), or run `coil lint --fix`"),
    "undeclared-width-argument": (
        "(defstruct B [(const N i64)] [(v i64)])\n"
        "(defn f [T N] [(b (B N))] (-> i64) (.v b))",
        "0",
        "got type N; declare it as a value parameter, (const N i64), or run `coil lint --fix`"),
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


OLD_FILE = """(module old-syntax)
(import "coil.primitive" :as p)
(import "coil.simd" :as v)

(defstruct Px [(r :u8) (g :u8)])
(defstruct Bits :layout bits :backing :u16 [(a :bits :u4) (b :bits 12)])
(defstruct Packet [T N] [(values (vec T N))])
(defsum Shape (Circle [(r :i64)]) (Rect [(w :i64) (h :i64)]))
(extern memcmp :cc c [(ptr i8) (ptr i8) :u64] (-> :i32))

(defn seed [T N] [(value T)] (-> (vec T N))
  (v/vinsert (v/vzero [T N]) 0 value))

(defn packet-first [T N] [(packet (Packet T N))] (-> T)
  (v/vextract (.values packet) 0))

(defn tag [] (-> Keyword) :i64)

(defn main [] (-> :i64)
  (let [x (p/cast :u8 200)
        bytes (seed [:u8 16] (p/cast :u8 21))
        packet (Packet :values bytes)
        size (p/sizeof :i32)]
    (tag)
    (+ (+ (p/cast :i64 (packet-first packet)) (p/cast :i64 x)) (+ size (: 0 :i64)))))
"""

# The keyword `:i64` returned by `tag` is a Keyword value and must survive.
NEW_FILE = """(module old-syntax)
(import "coil.primitive" :as p)
(import "coil.simd" :as v)

(defstruct Px [(r u8) (g u8)])
(defstruct Bits :layout bits :backing u16 [(a :bits u4) (b :bits 12)])
(defstruct Packet [T (const N i64)] [(values (vec T N))])
(defsum Shape (Circle [(r i64)]) (Rect [(w i64) (h i64)]))
(extern memcmp :cc c [(ptr i8) (ptr i8) u64] (-> i32))

(defn seed [T (const N i64)] [(value T)] (-> (vec T N))
  (v/vinsert (v/vzero [T N]) 0 value))

(defn packet-first [T (const N i64)] [(packet (Packet T N))] (-> T)
  (v/vextract (.values packet) 0))

(defn tag [] (-> Keyword) :i64)

(defn main [] (-> i64)
  (let [x (p/cast u8 200)
        bytes (seed [u8 16] (p/cast u8 21))
        packet (Packet :values bytes)
        size (p/sizeof i32)]
    (tag)
    (+ (+ (p/cast i64 (packet-first packet)) (p/cast i64 x)) (+ size (: 0 i64)))))
"""

PROJECT_CHUNKS = """(module widths.chunks)
(import "coil.simd" :as v)
(defstruct Lanes [T N] [(values (vec T N))])
(defn lanes-first [T N] [(l (Lanes T N))] (-> T) (v/vextract (.values l) 0))
"""

# `Holder`'s N reaches a width only through another module's struct, and
# `chunk-count`'s only through coil.simd's `Chunk`.
PROJECT_MAIN = """(module widths.main)
(import "coil.simd" :as v)
(import "widths.chunks" :as c)
(defstruct Holder [T N] [(inner (c/Lanes T N))])
(defn holder-first [T N] [(h (Holder T N))] (-> T) (c/lanes-first (.inner h)))
(defn chunk-count [T N] [(k (v/Chunk T N))] (-> :i64) 1)
(defn main [] (-> :i64)
  (let [h (Holder :inner (c/Lanes :values (v/vsplat [:u8 8] (cast :u8 7))))]
    (cast :i64 (holder-first h))))
"""


def expect_file(path: pathlib.Path, expected: str, what: str) -> None:
    actual = path.read_text()
    if actual != expected:
        raise AssertionError(f"{what}: expected\n{expected}\ngot\n{actual}")


def migration(compiler: str) -> None:
    with tempfile.TemporaryDirectory(prefix=".coil-const-generic-migration-", dir=ROOT) as raw:
        work = pathlib.Path(raw)
        source = work / "old.coil"

        # Report and --diff describe the migration and write nothing.
        source.write_text(OLD_FILE)
        report = run([compiler, "lint", str(source)], ok=False)
        output = report.stdout + report.stderr
        for fragment in ("a keyword in type position is a Keyword constant",
                         "a generic parameter used as a width is a value parameter"):
            if fragment not in output:
                raise AssertionError(f"migration report omitted {fragment!r}\n{output}")
        expect_file(source, OLD_FILE, "lint without --fix")
        run([compiler, "lint", str(source), "--diff"], ok=False)
        expect_file(source, OLD_FILE, "lint --diff")

        run([compiler, "lint", str(source), "--fix"])
        expect_file(source, NEW_FILE, "lint --fix")
        result = run([compiler, "run", str(source)], ok=False)
        if result.returncode != 225:
            raise AssertionError(f"migrated file: expected exit 225, got {result.returncode}\n{result.stderr}")
        run([compiler, "lint", str(source), "--fix"])
        expect_file(source, NEW_FILE, "second lint --fix")

        project = work / "widths"
        (project / "src").mkdir(parents=True)
        (project / "Coil.toml").write_text(
            '[package]\nname = "widths"\nentry = "src/main.coil"\nsource-roots = ["src"]\n')
        (project / "src/chunks.coil").write_text(PROJECT_CHUNKS)
        (project / "src/main.coil").write_text(PROJECT_MAIN)
        build = subprocess.run([compiler, "build", "-o", str(project / "out")], cwd=project,
                               text=True, capture_output=True, stdin=subprocess.DEVNULL, timeout=180)
        if "obsolete Coil syntax" not in build.stderr:
            raise AssertionError(f"project build did not offer the migration\n{build.stderr}")
        fixed = subprocess.run([compiler, "lint", "--fix"], cwd=project, text=True,
                               capture_output=True, timeout=180)
        if fixed.returncode != 0:
            raise AssertionError(f"project lint --fix failed\n{fixed.stdout}{fixed.stderr}")
        chunks = (project / "src/chunks.coil").read_text()
        main = (project / "src/main.coil").read_text()
        for expected, text in (("(defstruct Lanes [T (const N i64)]", chunks),
                               ("(defn lanes-first [T (const N i64)]", chunks),
                               ("(defstruct Holder [T (const N i64)]", main),
                               ("(defn holder-first [T (const N i64)]", main),
                               ("(defn chunk-count [T (const N i64)] [(k (v/Chunk T N))] (-> i64) 1)", main),
                               ("(v/vsplat [u8 8] (cast u8 7))", main)):
            if expected not in text:
                raise AssertionError(f"project migration omitted {expected!r}\n{chunks}{main}")
        build = subprocess.run([compiler, "build", "-o", str(project / "out")], cwd=project,
                               text=True, capture_output=True, stdin=subprocess.DEVNULL, timeout=180)
        if build.returncode != 0 or "obsolete Coil syntax" in build.stderr:
            raise AssertionError(f"migrated project did not build cleanly\n{build.stderr}")
        ran = subprocess.run([str(project / "out")], timeout=60)
        if ran.returncode != 7:
            raise AssertionError(f"migrated project: expected exit 7, got {ran.returncode}")
    print("const generics migration: lint --fix, report, diff, idempotence, project imports", flush=True)


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
    migration(compiler)
    print(f"const generics gate passed in {time.monotonic() - started:.2f}s", flush=True)
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
