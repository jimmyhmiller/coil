#!/usr/bin/env python3
"""Benchmark the same full Mal evaluator workload on Coil and Chez."""

from __future__ import annotations

import argparse
import subprocess
import tempfile
import time
from pathlib import Path

ROOT = Path(__file__).resolve().parents[3]
APPS = ROOT / "tests/scheme/apps"
SOURCES = ["mal_stage1.coil", "mal_stage3.coil", "mal_stage4.coil", "mal_stage5.coil"]


def portable(path: Path) -> str:
    lines = path.read_text().splitlines()
    kept: list[str] = []
    skipped_depth = 0
    for line in lines:
        if skipped_depth:
            skipped_depth += line.count("(") - line.count(")")
            continue
        if line.startswith(("(module ", "(import ", "(export ")):
            skipped_depth = line.count("(") - line.count(")")
            continue
        kept.append(line)
    return "\n".join(kept) + "\n"


def chez_source(iterations: int, force_collect: bool = False) -> str:
    bodies = [portable(APPS / name) for name in SOURCES]
    coil_record = """(define (mal-object type value)
  (runtime/make-mal-record type value #f))
(define (mal-object? x) (runtime/mal-record? x))
(define (mal-type x) (runtime/mal-record-kind x))
(define (mal-value x) (runtime/mal-record-value x))
(define (mal-value-set! x value) (runtime/mal-record-value-set! x value))
(define (mal-meta x) (runtime/mal-record-meta x))
(define (mal-meta-set! x value) (runtime/mal-record-meta-set! x value))
"""
    portable_record = """(define (mal-object type value)
  (vector 'mal-object type value #f))
(define (mal-object? x)
  (and (vector? x) (= (vector-length x) 4)
       (eq? (vector-ref x 0) 'mal-object)))
(define (mal-type x) (vector-ref x 1))
(define (mal-value x) (vector-ref x 2))
(define (mal-value-set! x value) (vector-set! x 2 value))
(define (mal-meta x) (vector-ref x 3))
(define (mal-meta-set! x value) (vector-set! x 3 value))
"""
    if coil_record not in bodies[0]:
        raise RuntimeError("Mal record compatibility block changed")
    bodies[0] = bodies[0].replace(coil_record, portable_record)
    stage5 = bodies[-1]
    start = stage5.index("(defn mal5-run ")
    stop = stage5.index("(define (mal5-step", start)
    stage5 = stage5[:start] + """(define (mal5-run ast env)
  (let loop ((state (mal5-bounce ast env)))
    (if (mal5-bounce? state)
        (loop (mal5-step (mal5-bounce-ast state) (mal5-bounce-env state)))
        state)))

""" + stage5[stop:]
    stage5 = stage5.replace("(host/make-mal-time-procedure)",
                            "(lambda () (mal-number 0))")
    workload = portable(APPS / "mal_full_bench.coil").replace(
        '(mal-full-bench-loop 100 "")',
        f'(mal-full-bench-loop {iterations} "")')
    if force_collect:
        workload = workload.replace('(begin\n        (mal5-rep',
                                    '(begin\n        (collect)\n        (mal5-rep')
    return """(define (gc-root-permanent x) #f)
(define (collect) #f)
""" + "".join(bodies[:-1]) + stage5 + workload + """
(display (mal-full-benchmark))
(newline)
"""


def timed(argv: list[str], repeat: int) -> tuple[float, str]:
    best = float("inf")
    output = ""
    for _ in range(repeat):
        started = time.perf_counter()
        proc = subprocess.run(argv, cwd=ROOT, capture_output=True, text=True,
                              timeout=300)
        if proc.returncode != 0:
            raise RuntimeError(
                f"benchmark command failed ({proc.returncode}): {argv!r}\n"
                f"stdout:\n{proc.stdout}\nstderr:\n{proc.stderr}")
        best = min(best, time.perf_counter() - started)
        output = proc.stdout
    return best, output


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--compiler", default=str(ROOT / "build/bin/coil"))
    parser.add_argument("--chez", default="scheme")
    parser.add_argument("--repeat", type=int, default=5)
    parser.add_argument("--iterations", type=int, default=100)
    parser.add_argument("--force-collect", action="store_true",
                        help="diagnostic: collect at the start of every iteration")
    args = parser.parse_args()
    with tempfile.TemporaryDirectory(prefix="coil-mal-full-bench-") as tmp:
        directory = Path(tmp)
        binary = directory / "mal-full-coil"
        source = directory / "mal-full-chez.scm"
        source.write_text(chez_source(args.iterations, args.force_collect))
        coil_cli = APPS / "mal_full_bench_cli.coil"
        if args.iterations != 100:
            bench = (APPS / "mal_full_bench.coil").read_text().replace(
                '(mal-full-bench-loop 100 "")',
                f'(mal-full-bench-loop {args.iterations} "")').replace(
                    '(module scheme-mal-full-bench)',
                    '(module scheme-mal-full-bench-generated)')
            if args.force_collect:
                bench = bench.replace('(begin\n        (mal5-rep',
                                      '(begin\n        (collect)\n        (mal5-rep')
            (directory / "mal_full_bench.coil").write_text(bench)
            cli = coil_cli.read_text().replace(
                '"scheme-mal-full-bench"', '"scheme-mal-full-bench-generated"')
            coil_cli = directory / "mal_full_bench_cli.coil"
            coil_cli.write_text(cli)
        subprocess.run([args.compiler, "build", str(coil_cli),
                        "-o", str(binary), "--quiet"], cwd=ROOT, timeout=600, check=True)
        coil = timed([str(binary)], args.repeat)
        chez = timed([args.chez, "--script", str(source)], args.repeat)
    if coil[1] != chez[1]:
        raise RuntimeError(f"different outputs: Coil={coil[1]!r}, Chez={chez[1]!r}")
    print(f"Full Mal evaluator ({args.iterations} mixed interpreter iterations, best of "
          f"{args.repeat})")
    print(f"Coil: {coil[0] * 1000:.1f} ms")
    print(f"Chez: {chez[0] * 1000:.1f} ms")
    print(f"Coil/Chez: {coil[0] / chez[0]:.2f}x")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
