#!/usr/bin/env python3
"""The native backend's own tests, from its sources (src/declarative/tests).

    scripts/tests/declarative.py <coil> [--count N]

On the host's machine (macOS on AArch64, Linux on x86-64), each test built by
COIL and run:

  - the split: the backend holds no Coil outside lang/ (the languages), rt/
    (the runtime their output stands on), adapter/ (from the compiler's CIR)
    and tests/, so that everything else is written in the languages;
  - rules: every rewrite rule and every fact, checked against the meanings of
    the nodes;
  - toy: the languages' independent calculator and storage/analysis clients,
    under LLVM O1 and native O0;
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
import json
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
    allowed = {"lang", "rt", "adapter", "tests"}
    stray = [p.relative_to(SOURCES) for p in SOURCES.rglob("*.coil")
             if p.relative_to(SOURCES).parts[0] not in allowed]
    if stray:
        fail("the backend holds Coil that should be written in a language: "
             + " ".join(str(p) for p in stray))
    for source in (SOURCES / "native").glob("*.pass"):
        declarations = [line.strip() for line in source.read_text().splitlines()
                        if line.strip() and not line.lstrip().startswith("#")]
        if not declarations or declarations[0] != "library declarative":
            fail(f"native infrastructure must use the strict declarative language: {source.name}")
    print("ok   the split: no Coil outside lang/, rt/, adapter/ and tests/")


def check_library_boundary(coil: str, work: Path) -> None:
    boundary = work / "boundary"
    boundary.mkdir()
    (boundary / "Coil.toml").write_text(
        '[package]\nname = "declarative-boundary"\n'
        f'source-roots = [".", {json.dumps(str(SOURCES / "lang"))}]\n'
        '[readers]\n".pass" = "lang.readers"\n'
        '[modules]\n"boundary.value" = "value.pass"\n')
    driver = boundary / "check.coil"
    driver.write_text('(module boundary.check)\n(import "boundary.value" :as value)\n')
    cases = [
        ('library declarative\nfn value() -> u32 = typed[u32](7);\n', None),
        ('library declarative\nfn value() -> u32 { typed[u32](7); }\n', "function equations, not statement bodies"),
        ('library declarative\nrewrite value!() -> u32 { create value = do { typed[u32](7); }; result = value; }\n',
         "procedural control and assignment are not allowed"),
    ]
    index_source = ('library declarative\nrecord Cell { value: u64; }\n'
                    'record Table { chunks: list[list[Cell]] capacity CAPACITY; count: i64; }\n'
                    'stable-index append!(table: ref[Table], cell: Cell) {\n'
                    ' chunks = chunks; count = count; shift = typed[i64](SHIFT); lookup = at; length = size; }\n')
    for capacity, shift in [("0", "1"), ("1", "32"), ("1", "0 - 1"), ("2", "31")]:
        cases.append((index_source.replace("CAPACITY", capacity).replace("SHIFT", shift),
                      "invalid stable-index capacity or chunk shift"))
    cases.extend([
        ('library declarative\nfollow value(n: u32) -> u32 { start = n; start = n; view = node; stop = true; next = node; result = node; }\n',
         "duplicate property: start"),
        ('library declarative\nfollow value(n: u32) -> u32 { start = n; view = node; stop = true; next = node; }\n',
         "missing required property: result"),
        ('library declarative\nfollow value(n: u32) -> u32 { start = n; view = node; stop = true; next = node; result = node; typo = n; }\n',
         "unknown property: typo"),
    ])
    for source, diagnostic in cases:
        (boundary / "value.pass").write_text(source)
        result = subprocess.run([coil, "check", str(driver)], cwd=boundary,
                                stdout=subprocess.PIPE, stderr=subprocess.STDOUT, text=True)
        if diagnostic is None:
            if result.returncode != 0:
                fail(f"a declarative equation was rejected:\n{result.stdout[-3000:]}")
        elif result.returncode == 0 or diagnostic not in result.stdout:
            fail(f"the declarative boundary did not produce the expected rejection:\n{result.stdout[-3000:]}")
    print("ok   declarative boundary: equations accepted; procedural forms, invalid storage and malformed schemas rejected")


def check_pipeline_diagnostics(coil: str, work: Path) -> None:
    fixture = work / "pipeline"
    fixture.mkdir()
    original = SOURCES / "tests"
    shutil.copytree(original / "toy", fixture / "toy")
    manifest = (original / "Coil.toml").read_text()
    (fixture / "Coil.toml").write_text(
        manifest.replace('path = ".."', f"path = {json.dumps(str(SOURCES))}"))
    driver = fixture / "check.coil"
    driver.write_text('(module toy.pipeline-check)\n(import "toy.steps" :as steps)\n')
    source = fixture / "toy" / "steps.pipeline"
    cases = [
        ("plan broken { run absent.run; }", "no step absent.run"),
        ("plan broken { include broken; }", "no earlier plan named broken"),
        ("plan broken { run measure.depth-of; }", "pipeline steps cannot take arguments"),
        ("plan broken { repeat { run known.solve; } }", "repeat needs an observed pass"),
        ("plan broken { repeat { observe known.solve; } }", "observed pass must report a change count"),
        ("plan broken { observe tidy.run; }", "observe is only allowed directly in a repeat block"),
        ("plan p {} plan p-timed {}", "duplicate pipeline export p-timed"),
    ]
    for body, diagnostic in cases:
        source.write_text(f"schedule for unit\n{body}\n")
        result = subprocess.run([coil, "check", str(driver)], cwd=fixture,
                                stdout=subprocess.PIPE, stderr=subprocess.STDOUT, text=True)
        if result.returncode == 0 or diagnostic not in result.stdout or "steps.pipeline" not in result.stdout:
            fail(f"pipeline did not report {diagnostic!r} at its source:\n{result.stdout[-3000:]}")
    print("ok   pipeline diagnostics: invalid steps, fixed points and plan exports rejected")


def check_translation_diagnostics(coil: str, work: Path) -> None:
    fixture = work / "translation"
    fixture.mkdir()
    (fixture / "Coil.toml").write_text(
        '[package]\nname = "translation-check"\n'
        f'source-roots = [".", {json.dumps(str(SOURCES / "lang"))}]\n'
        '[readers]\n".translate" = "lang.readers"\n'
        '[modules]\n"check.rules" = "rules.translate"\n'
        '"check.cir" = "cir.ops"\n"check.nodes" = "nodes.ir"\n')
    shutil.copyfile(SOURCES / "cir" / "cir.ops", fixture / "cir.ops")
    shutil.copyfile(SOURCES / "backend" / "nodes.ir", fixture / "nodes.ir")
    driver = fixture / "check.coil"
    driver.write_text('(module translation.check)\n(import "check.rules" :as rules)\n')
    cases = [
        ("MISSING(a) => NEG(a) at ptr;", "unknown source operation"),
        ("SUB(a, b) => MISSING(a, b) at ptr;", "unknown target node"),
        ("SUB(a, b) => SUB(b, missing) at ptr;", "unbound operand missing"),
        ("SUB(a, b) => SUB(a, b) at ctrl;", "unknown graph value type"),
        ("SUB(a, b) => SUB(a, b) at f32;", "f32 is outside target type set int"),
        ("ROTL(a, n) => SHL(a, n) at ptr;", "translation requires a value operation without immediates"),
        ("SUB(a, b) => NEG(a, b) at ptr;", "expected a pure node with matching operand count"),
    ]
    source = fixture / "rules.translate"
    for rule, diagnostic in cases:
        source.write_text(f"translate from check.cir to check.nodes {{ {rule} }}\n")
        result = subprocess.run([coil, "check", str(driver)], cwd=fixture,
                                stdout=subprocess.PIPE, stderr=subprocess.STDOUT, text=True)
        if result.returncode == 0 or diagnostic not in result.stdout or "rules.translate" not in result.stdout:
            fail(f"translation did not report {diagnostic!r} at its source:\n{result.stdout[-3000:]}")
    print("ok   translation diagnostics: unknown operations, unbound operands and invalid nodes rejected")


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
    check_library_boundary(coil, work)
    check_pipeline_diagnostics(coil, work)
    check_translation_diagnostics(coil, work)

    def build(name: str, *, backend: str | None = None, level: int = 1) -> Path:
        exe = work / (name if backend is None else f"{name}-{backend}-O{level}")
        flags = ["--release", f"-O{level}"] + (["--backend", backend] if backend else [])
        result = subprocess.run([coil, "build", str(SOURCES / "tests" / f"{name}.coil"), *flags,
                                 "-o", str(exe)], cwd=SOURCES / "tests", stdout=subprocess.PIPE,
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
        if name == "toy":
            out = run([build(name, backend="native", level=0)], "toy, native O0")
            print(f"ok   toy/native-O0: {out.strip().splitlines()[-1] if out.strip() else ''}")
            out = run([build(name, backend="native", level=3)], "toy, native O3")
            print(f"ok   toy/native-O3: {out.strip().splitlines()[-1] if out.strip() else ''}")

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
