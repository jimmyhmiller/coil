#!/usr/bin/env python3
"""Front-end cost of the compiler on fixed workloads: time, instructions, memory.

    python3 scripts/dev.py benchmark frontend                  # every workload
    python3 scripts/dev.py benchmark frontend compiler-check   # some of them
    ... --compiler build/bin/coil-candidate --save base.json
    ... --compare base.json

For each workload this runs the compiler once under `/usr/bin/time -l` and
COIL_TRACE=1 and reports wall time, instructions retired, peak resident memory,
and per phase the time it took and the memory live when it ended (the
compilation arena's own accounting). Runs are serial: one heavy process at a
time.
"""

import argparse
import json
import os
import re
import shutil
import subprocess
import sys
import tempfile
import time
from pathlib import Path

ROOT = Path(__file__).resolve().parents[2]

HELLO = '(module hello)\n(import "coil.io" :use *)\n(defn main [] (-> i64) (println "hello") 0)\n'

# name -> (working directory, arguments after the compiler)
WORKLOADS = {
    "hello-check": (None, ["check", "hello.coil"]),
    "calc-check": ("examples/calc", ["check", "src/main.coil"]),
    "statemachine-check": ("examples/statemachine", ["check", "src/main.coil"]),
    "compiler-check": ("src/compiler", ["check", "main.coil"]),
    "compiler-lint": ("src/compiler", ["lint"]),
}

# The phases reported: top-level spans, in pipeline order.
PHASES = [
    "frontend.load", "lint.target-load", "frontend.expand", "lint.target-expand",
    "frontend.expand.stage3-rounds", "frontend.expand.round.run-expand",
    "frontend.transforms-and-check", "lint.target-check", "frontend.check.typecheck",
    "frontend.monomorphize",
]

def run(compiler, name, scratch):
    cwd, args = WORKLOADS[name]
    where = scratch if cwd is None else ROOT / cwd
    if name == "hello-check":
        (scratch / "hello.coil").write_text(HELLO)
    env = dict(os.environ, COIL_TRACE="1")
    started = time.monotonic()
    proc = subprocess.run(["/usr/bin/time", "-l", compiler, *args], cwd=where, env=env,
                          capture_output=True, text=True, errors="replace")
    wall = time.monotonic() - started
    out = proc.stderr
    result = {"wall_s": round(wall, 2), "exit": proc.returncode}
    m = re.search(r"(\d+)\s+maximum resident set size", out)
    result["peak_rss_mb"] = round(int(m.group(1)) / 2 ** 20) if m else None
    m = re.search(r"(\d+)\s+instructions retired", out)
    result["instructions_g"] = round(int(m.group(1)) / 1e9, 1) if m else None
    phases = {}
    for line in out.splitlines():
        if line.startswith("coil-trace end "):
            parts = line.split()
            if parts[2] in PHASES:
                phases.setdefault(parts[2], {"ms": 0})["ms"] += int(parts[3].rstrip("ms"))
        elif line.startswith("coil-profile\tarena.live\t"):
            _, _, span, value = line.split("\t")
            if span in PHASES:
                phases.setdefault(span, {"ms": 0})["live_mb"] = round(int(value) / 2 ** 20)
    result["phases"] = {p: phases[p] for p in PHASES if p in phases}
    return result


def show(name, r, base=None):
    def delta(key, now, then):
        if then is None or now is None or then == 0:
            return ""
        return f" ({(now - then) / then * 100:+.0f}%)"
    b = base or {}
    print(f"{name}: exit {r['exit']}  wall {r['wall_s']}s{delta('w', r['wall_s'], b.get('wall_s'))}"
          f"  instructions {r['instructions_g']}G{delta('i', r['instructions_g'], b.get('instructions_g'))}"
          f"  peak {r['peak_rss_mb']} MB{delta('p', r['peak_rss_mb'], b.get('peak_rss_mb'))}")
    bp = b.get("phases", {})
    for p, v in r["phases"].items():
        then = bp.get(p, {})
        live = f"  live {v['live_mb']} MB" if "live_mb" in v else ""
        was = f"   was {then.get('ms')} ms" + (f", {then['live_mb']} MB" if "live_mb" in then else "") if then else ""
        print(f"    {p:34s} {v['ms']:6d} ms{live}{was}")


def main():
    ap = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    ap.add_argument("names", nargs="*", help="workloads (default: all): " + ", ".join(WORKLOADS))
    ap.add_argument("--compiler", default=shutil.which("coil") or "coil")
    ap.add_argument("--save", help="write the results as JSON")
    ap.add_argument("--compare", help="a JSON file an earlier run saved")
    args = ap.parse_args()
    names = args.names or list(WORKLOADS)
    for n in names:
        if n not in WORKLOADS:
            sys.exit(f"unknown workload {n}; one of {', '.join(WORKLOADS)}")
    base = json.loads(Path(args.compare).read_text()) if args.compare else {}
    compiler = str(Path(args.compiler).resolve()) if os.sep in args.compiler else args.compiler
    version = subprocess.run([compiler, "--version"], capture_output=True, text=True).stdout.strip()
    print(f"compiler: {version}")
    results = {}
    with tempfile.TemporaryDirectory(prefix="coil-frontend-") as tmp:
        for n in names:
            results[n] = run(compiler, n, Path(tmp))
            show(n, results[n], base.get(n))
    if args.save:
        Path(args.save).write_text(json.dumps(results, indent=1))


if __name__ == "__main__":
    main()
