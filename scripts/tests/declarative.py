#!/usr/bin/env python3
"""The native backend's own tests, from its sources (src/declarative/tests).

    scripts/tests/declarative.py <coil> [--count N]

On the host's machine (macOS on AArch64, Linux on x86-64), each test built by
COIL and run:

  - the split: the backend's sources hold no Coil outside lang/, adapter/ and
    tests/, so that everything else is written in the languages;
  - rules: every rewrite rule and every fact, checked against the meanings of
    the nodes;
  - toy: the languages' second client, a calculator;
  - link: an object written by the backend and linked in memory, then linked
    by the system linker into a C program, twice (the second with LINK_BASE=1);
  - variadic, results, passing: calls, several results, arguments;
  - cir-interp, direct: CIR's reference interpreter (made from cir.ops), and
    hand-built functions compiled straight from CIR;
  - cir-fuzz: COUNT random CIR functions, compiled straight from CIR, against
    that interpreter;
  - fuzz: COUNT random graphs through the whole pipeline, in chunks under a
    time limit so that code that never returns fails, a failing chunk run again
    a seed at a time to name the seeds; every transformation must have fired.
"""

from __future__ import annotations

import argparse
import os
import platform
import shutil
import subprocess
import sys
import tempfile
from pathlib import Path

ROOT = Path(__file__).resolve().parents[2]
sys.path.insert(0, str(ROOT / "scripts" / "compiler"))
import project_config  # noqa: E402

SOURCES = ROOT / "src" / "declarative"
CHUNK = 250
SINGLES = ["rules", "toy", "variadic", "results", "passing", "cir-interp", "direct"]


def fail(message: str) -> None:
    raise SystemExit(f"declarative: FAIL — {message}")


def check_split() -> None:
    allowed = {"lang", "adapter", "tests"}
    stray = [p.relative_to(SOURCES) for p in SOURCES.rglob("*.coil")
             if p.relative_to(SOURCES).parts[0] not in allowed and p.name != "generate.coil"]
    in_adapter = [p.relative_to(SOURCES) for p in (SOURCES / "adapter").glob("*.coil") if p.name != "machine.coil"]
    if stray or in_adapter:
        fail("the sources hold Coil that should be written in a language: "
             + " ".join(str(p) for p in stray + in_adapter))
    print("ok   the split: no Coil outside lang/, adapter/machine.coil and tests/")


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    parser.add_argument("compiler")
    parser.add_argument("--count", type=int, default=2000, help="programs each fuzzer runs (default 2000)")
    args = parser.parse_args()
    host = (sys.platform, platform.machine().lower())
    if host not in {("darwin", "arm64"), ("linux", "x86_64")}:
        fail(f"the backend compiles for macOS on AArch64 and Linux on x86-64, not {host}")
    coil = str(Path(args.compiler).resolve())
    for variable in project_config.PROJECT_VARIABLES:
        os.environ.pop(variable, None)
    check_split()
    work = Path(tempfile.mkdtemp(prefix="declarative-tests."))
    (work / "out").mkdir()

    def build(name: str) -> Path:
        exe = work / name
        result = subprocess.run([coil, "build", str(SOURCES / "tests" / f"{name}.coil"), "--release", "-O1",
                                 "-o", str(exe)], cwd=SOURCES, stdout=subprocess.PIPE,
                                stderr=subprocess.STDOUT, text=True)
        if result.returncode != 0:
            fail(f"tests/{name}.coil did not build:\n{result.stdout[-3000:]}")
        return exe

    def run(argv: list, label: str, env: dict | None = None, timeout: int | None = None) -> str:
        try:
            result = subprocess.run([str(a) for a in argv], cwd=work, stdout=subprocess.PIPE,
                                    stderr=subprocess.STDOUT, text=True, timeout=timeout,
                                    env={**os.environ, **(env or {})})
        except subprocess.TimeoutExpired:
            fail(f"{label} did not finish in {timeout} s")
        if result.returncode != 0:
            fail(f"{label} exited {result.returncode}:\n{result.stdout[-3000:]}")
        return result.stdout

    for name in SINGLES:
        out = run([build(name)], name)
        print(f"ok   {name}: {out.strip().splitlines()[-1] if out.strip() else ''}")

    link = build("link")
    cc = os.environ.get("CC", "cc")
    for base in (None, "1"):
        env = {"LINK_BASE": base} if base else None
        run([link], "link", env)
        aot = work / "link-aot"
        built = subprocess.run([cc, str(SOURCES / "tests" / "link-main.c"), str(work / "out" / "link.o"),
                                "-o", str(aot)], stdout=subprocess.PIPE, stderr=subprocess.STDOUT, text=True)
        if built.returncode != 0:
            fail(f"the system linker rejected the backend's object:\n{built.stdout}")
        run([aot], "link, linked by the system linker")
    print("ok   link: in memory and by the system linker, twice")

    out = run([build("cir-fuzz"), args.count], "cir-fuzz")
    print(f"ok   cir-fuzz: {out.strip().splitlines()[-1]}")

    fuzz = build("fuzz")
    fired: dict[str, int] = {}
    for start in range(1, args.count + 1, CHUNK):
        n = min(CHUNK, args.count + 1 - start)
        try:
            result = subprocess.run([str(fuzz), str(n), str(start)], cwd=work, stdout=subprocess.PIPE,
                                    stderr=subprocess.STDOUT, text=True, timeout=300)
            ok = result.returncode == 0
            out = result.stdout
        except subprocess.TimeoutExpired:
            ok, out = False, ""
        if not ok:
            bad = []
            for seed in range(start, start + n):
                try:
                    one = subprocess.run([str(fuzz), "1", str(seed)], cwd=work, stdout=subprocess.DEVNULL,
                                         stderr=subprocess.DEVNULL, timeout=60)
                    if one.returncode != 0:
                        bad.append(seed)
                except subprocess.TimeoutExpired:
                    bad.append(seed)
            fail(f"fuzz: seeds {bad} fail ({fuzz} 1 SEED shows one); the chunk said:\n{out[-2000:]}")
        for line in out.splitlines():
            if line.startswith("fired:"):
                for item in line.split()[1:]:
                    name, count = item.split("=")
                    fired[name] = fired.get(name, 0) + int(count)
    never = [name for name, count in fired.items() if count == 0]
    if not fired:
        fail("fuzz: the fuzzer reported no transformations")
    if never:
        fail("fuzz: never fired, so not tested by these programs: " + " ".join(never))
    print(f"ok   fuzz: {args.count} programs, every transformation fired ({len(fired)})")
    shutil.rmtree(work, ignore_errors=True)
    print("declarative: PASS")
    return 0


if __name__ == "__main__":
    sys.exit(main())
