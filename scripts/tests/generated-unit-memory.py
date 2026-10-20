#!/usr/bin/env python3
"""Bound retained state across actual sequential generated-unit pipelines.

A reader provider emits N generated units, each compiled and linked into one
program. Its peak RSS may exceed a one-unit build's by at most 32 MiB, and stay
under 640 MB, which fails when a completed unit's compiler state is retained.

Usage: generated-unit-memory.py [COMPILER] [--units N]
  COMPILER defaults to $COIL. FAST runs 16 units, COMPREHENSIVE the default 64.
"""
import argparse
import json
import os
from pathlib import Path
import re
import subprocess
import sys
import tempfile

ROOT = Path(__file__).resolve().parents[2]
sys.path.insert(0, str(Path(__file__).resolve().parent))
import cleanup_on_signal  # noqa: E402
cleanup_on_signal.install()


def provider_source(units: int) -> str:
    facade = "(module generated.memory.facade) (defn main [] (-> i64) 0)"
    return (
        '(module generated.memory.reader) (import "coil.meta" :as meta) '
        '(import "coil.str" :use *) (import "coil.slice" :use *) (import "coil.alloc" :use *) '
        '(import "coil.primitive" :as p) '
        '(defn sconcat [(a (dyn Allocator)) (x (slice u8)) (y (slice u8))] (-> (slice u8)) '
        '(match (concat a x y) (Some [v] v) (None [] (p/error "out of memory")))) '
        '(defn sconcat3 [(a (dyn Allocator)) (x (slice u8)) (y (slice u8)) (z (slice u8))] (-> (slice u8)) '
        '(sconcat a x (sconcat a y z))) '
        '(defn read-source [(context Code)] (-> Code) '
        f'(let [a (meta/expansion-allocator)] (for [i 0 {units}] '
        '(let [index (p/int->str i) name (sconcat a "generated.memory.unit" index) '
        'symbol (sconcat a "value" index) declaration (sconcat3 a "(module " name ") ") '
        'interface (sconcat a declaration (sconcat3 a "(extern " symbol " :cc c [] (-> i64)) ")) '
        'exported (sconcat a interface (sconcat3 a "(export " symbol ")")) '
        'body (sconcat a declaration (sconcat a (sconcat3 a "(defn " symbol " [] (-> i64) ") (sconcat a index ")")))] '
        '(meta/generated-unit! name exported body)) 0)) '
        + f" (p/code-read {json.dumps(facade)} context)) "
        + '(reader-provider "generated.memory.reader" read-source)')


def build_peak(compiler: str, directory: Path, units: int) -> int:
    """Build a program of `units` generated units and run it; its peak RSS."""
    directory.mkdir()
    source = directory / "source.input"
    source.write_text("generated memory regression\n")
    (directory / "provider.coil").write_text(provider_source(units))
    env = dict(os.environ, COIL_NAMESPACE_ROOTS=str(directory))
    command = ["/usr/bin/time", "-l" if sys.platform == "darwin" else "-v", compiler, "build", str(source),
               "--use", "generated.memory.reader", "--backend", "llvm", "-O0", "-o", str(directory / "program")]
    result = subprocess.run(command, cwd=ROOT, env=env, text=True, capture_output=True)
    if result.returncode:
        raise SystemExit(f"FAIL building {units} generated units:\n{result.stdout}{result.stderr}")
    for line in result.stderr.splitlines():
        if "generated.unit.arena-" in line:
            print(line, flush=True)
    pattern = (r"(\d+)\s+maximum resident set size" if sys.platform == "darwin"
               else r"Maximum resident set size \(kbytes\):\s*(\d+)")
    match = re.search(pattern, result.stderr)
    if not match:
        raise SystemExit("FAIL time did not report peak RSS")
    peak = int(match.group(1)) * (1 if sys.platform == "darwin" else 1024)
    print(json.dumps({"units": units, "peak_rss_bytes": peak}), flush=True)
    subprocess.run([str(directory / "program")], check=True)
    return peak


def main():
    parser = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    parser.add_argument("compiler", nargs="?", default=os.environ.get("COIL"))
    parser.add_argument("--units", type=int, default=64)
    parser.add_argument("--no-baseline", action="store_true",
                        help="skip the one-unit build and check only the 640 MB cap (FAST)")
    args = parser.parse_args()
    if not args.compiler:
        parser.error("give a compiler or set COIL")
    if args.units < 2:
        parser.error("--units must be at least 2: the bound compares against a one-unit build")
    compiler = str(Path(args.compiler).resolve()) if os.sep in args.compiler else args.compiler
    with tempfile.TemporaryDirectory(prefix="coil-unit-memory-",
                                     dir=os.environ.get("COIL_TEST_SCRATCH")) as raw:
        one = None if args.no_baseline else build_peak(compiler, Path(raw) / "one", 1)
        many = build_peak(compiler, Path(raw) / "many", args.units)
    # The peak does not depend on the unit count: about 450 MB for 1, 16 or 64
    # units on this host, set by the facade's own compile. Retaining a completed
    # unit's compiler state costs about 3 MB per unit (643 MB at 64 units) and
    # leaking stage-3 arenas about 13 MB per unit (1.3 GB at 64), so N units may
    # cost no more than 32 MiB over one, and nothing may pass 640 MB. FAST checks
    # only the cap at 16 units; COMPREHENSIVE compares 64 units against one, where
    # a per-unit leak is four times as visible.
    if one is not None:
        growth = many - one
        print(f"{args.units} units peak {many} B, one unit {one} B, growth {growth} B")
        if growth >= 32 * 1024 * 1024:
            raise SystemExit(f"FAIL {args.units} units used {growth} B more than one: unit state was retained")
    else:
        print(f"{args.units} units peak {many} B")
    if many >= 640 * 1024 * 1024:
        raise SystemExit("FAIL a generated-unit build passed 640 MB: completed facade or unit state was retained")
    print("generated unit memory: PASS")


if __name__ == "__main__":
    main()
