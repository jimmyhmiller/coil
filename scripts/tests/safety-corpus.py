#!/usr/bin/env python3
"""Every runtime-corpus program, built with --use coil.safety, must behave exactly
as its reference: the same stdout and exit status.

A difference is a check that fires on correct code -- usually library code that
wraps or truncates on purpose but spells it `+` or `cast` instead of the raw
`primitive/` operation -- or a program the dialect cannot compile.

Usage: scripts/tests/safety-corpus.py COMPILER
"""
import concurrent.futures
import os
import shlex
import subprocess
import sys
import tempfile
from pathlib import Path

ROOT = Path(__file__).resolve().parents[2]
BASE = ROOT / "tests/compiler/oracle/arm64"


def one(compiler: str, entry: str, scratch: Path) -> str | None:
    parts = shlex.split(entry)
    if parts[0] == "R":
        parts.pop(0)
    source, *args = parts
    ident = source.replace("/", "_").replace(".", "_")
    exe = scratch / ident
    built = subprocess.run([compiler, "build", source, "-o", str(exe), "--use", "coil.safety"],
                           cwd=ROOT, capture_output=True, timeout=600)
    if built.returncode:
        errors = [l for l in built.stderr.decode(errors="replace").splitlines() if l.startswith("error")]
        return f"FAIL build: {source}: " + " | ".join(errors[:3])
    ran = subprocess.run([source, *args], executable=str(exe), cwd=ROOT, capture_output=True,
                         stdin=subprocess.DEVNULL, timeout=60)
    want = (BASE / "reference" / f"{ident}.stdout").read_bytes()
    want_code = int((BASE / "reference" / f"{ident}.exit").read_text())
    if ran.stdout == want and ran.returncode == want_code:
        return None
    report = [l for l in ran.stderr.decode(errors="replace").splitlines()
              if l.startswith("panic") or l.lstrip().startswith(("at ", "in generic"))]
    return f"FAIL run: {source}: exit={ran.returncode} want={want_code} " + " | ".join(report[:3])


def main() -> int:
    compiler = sys.argv[1]
    entries = [l for l in (BASE / "corpus.txt").read_text().splitlines() if l.strip() and not l.startswith("#")]
    jobs = int(os.environ.get("COIL_JOBS") or 4)
    with tempfile.TemporaryDirectory(prefix="coil-safety-corpus-") as scratch, \
            concurrent.futures.ThreadPoolExecutor(max_workers=jobs) as pool:
        results = list(pool.map(lambda e: one(compiler, e, Path(scratch)), entries))
    failures = [r for r in results if r]
    for line in failures:
        print(line)
    print(f"safety corpus: {len(entries) - len(failures)} passed, {len(failures)} failed")
    return 1 if failures else 0


if __name__ == "__main__":
    raise SystemExit(main())
