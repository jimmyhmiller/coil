#!/usr/bin/env python3
"""The runtime corpus and the diagnostic goldens.

corpus: tests/corpus/*.coil are a handful of large, self-checking programs, each
covering one area of the language. Every lane builds or runs each program its own
way and compares stdout and the exit status with tests/corpus/reference/:

    python3 scripts/oracle.py corpus arm64|llvm|x64|interp|safety|meta-interp|opt3 [--all] [--compiler C]
    python3 scripts/oracle.py corpus bless [--compiler C]     # rewrite the references (LLVM lane)

tests/corpus/corpus.txt lists the programs. After the file name come options:
`safety` and `meta-interp` put a program in those lanes (`--all` runs every
program there), `interp-refused=TEXT` says the interpreter must refuse it with a
diagnostic containing TEXT, and everything after `--` is the program's argv.

diag: tests/diag/{compile,link,no-hang}/*.coil and their goldens in reference/.
`compile` and `no-hang` run `coil check`; `link` runs `coil build`. A golden holds
the combined output, then `exit: N`. An input whose first line is `; args: …` uses
those arguments instead of the default (`-o {out}` for link).

    python3 scripts/oracle.py diag gate|bless [compile|link|no-hang|all]
"""

from __future__ import annotations

import argparse
import os
import re
import shlex
import subprocess
import sys
import tempfile
from dataclasses import dataclass, field
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
CORPUS = ROOT / "tests" / "corpus"
DIAG = ROOT / "tests" / "diag"
DIAG_SETS = ("compile", "link", "no-hang")
LANES = ("arm64", "llvm", "x64", "interp", "safety", "meta-interp", "opt3")
BUILD_TIMEOUT = 120
RUN_TIMEOUT = 30


@dataclass
class Program:
    source: str
    safety: bool = False
    meta_interp: bool = False
    interp_refused: str | None = None
    args: list[str] = field(default_factory=list)

    @property
    def stem(self) -> str:
        return Path(self.source).stem


def read_corpus() -> list[Program]:
    programs = []
    for raw in (CORPUS / "corpus.txt").read_text().splitlines():
        line = raw.strip()
        if not line or line.startswith("#"):
            continue
        words = shlex.split(line)
        program = Program(str((CORPUS / words[0]).relative_to(ROOT)))
        options, args = (words[1:], []) if "--" not in words else (
            words[1:words.index("--")], words[words.index("--") + 1:])
        program.args = args
        for option in options:
            if option == "safety":
                program.safety = True
            elif option == "meta-interp":
                program.meta_interp = True
            elif option.startswith("interp-refused="):
                program.interp_refused = option.split("=", 1)[1]
            else:
                raise SystemExit(f"corpus.txt: unknown option {option!r} for {words[0]}")
        if not (ROOT / program.source).is_file():
            raise SystemExit(f"corpus.txt names a missing program: {program.source}")
        programs.append(program)
    return programs


def lane_build_flags(lane: str) -> list[str]:
    return {
        "arm64": ["--backend", "arm64"],
        "meta-interp": ["--backend", "arm64"],
        "x64": ["--backend", "x64"],
        "llvm": [],
        "safety": ["--use", "coil.safety"],
        "opt3": ["-O3"],
    }[lane]


def lane_env(lane: str) -> dict[str, str]:
    env = os.environ.copy()
    env.pop("COIL_META_INTERP", None)
    if lane == "meta-interp":
        env["COIL_META_INTERP"] = "1"
    return env


def reference(program: Program) -> tuple[bytes, int]:
    base = CORPUS / "reference" / program.stem
    stdout = Path(f"{base}.stdout")
    exit_file = Path(f"{base}.exit")
    if not stdout.is_file() or not exit_file.is_file():
        raise FileNotFoundError(f"no reference for {program.source}; run `oracle.py corpus bless`")
    return stdout.read_bytes(), int(exit_file.read_text())


def first_difference(want: bytes, got: bytes) -> str:
    want_lines = want.decode(errors="replace").splitlines()
    got_lines = got.decode(errors="replace").splitlines()
    for number, (a, b) in enumerate(zip(want_lines, got_lines), 1):
        if a != b:
            return f"line {number}: expected {a!r}, got {b!r}"
    return f"expected {len(want_lines)} lines, got {len(got_lines)}"


def run_program(compiler: str, program: Program, lane: str, scratch: Path) -> tuple[bytes, bytes, int] | str:
    """The program's stdout, stderr and exit status in this lane, or why it failed."""
    env = lane_env(lane)
    if lane == "interp":
        command = [compiler, "interp", program.source, *program.args]
    else:
        executable = scratch / f"{program.stem}-{lane}"
        build = [compiler, "build", program.source, *lane_build_flags(lane), "-o", str(executable)]
        try:
            built = subprocess.run(build, cwd=ROOT, env=env, capture_output=True, timeout=BUILD_TIMEOUT)
        except subprocess.TimeoutExpired:
            return f"build did not finish in {BUILD_TIMEOUT}s"
        if built.returncode:
            return "build failed:\n" + (built.stdout + built.stderr).decode(errors="replace")[-3000:]
        command = [str(executable), *program.args]
    try:
        ran = subprocess.run(command, cwd=ROOT, env=env, stdin=subprocess.DEVNULL,
                             capture_output=True, timeout=RUN_TIMEOUT)
    except subprocess.TimeoutExpired:
        return f"did not finish in {RUN_TIMEOUT}s"
    return ran.stdout, ran.stderr, ran.returncode


def corpus(compiler: str, lane: str, everything: bool, only: list[str] | None) -> int:
    programs = read_corpus()
    if only:
        programs = [p for p in programs if p.stem in only]
    if lane == "safety" and not everything:
        programs = [p for p in programs if p.safety]
    if lane == "meta-interp" and not everything:
        programs = [p for p in programs if p.meta_interp]
    failures = 0
    with tempfile.TemporaryDirectory(prefix="coil-corpus-", dir=os.environ.get("COIL_TEST_SCRATCH")) as raw:
        scratch = Path(raw)
        for program in programs:
            if lane == "interp" and program.interp_refused is not None:
                result = subprocess.run([compiler, "interp", program.source, *program.args], cwd=ROOT,
                                        env=lane_env(lane), stdin=subprocess.DEVNULL,
                                        capture_output=True, timeout=RUN_TIMEOUT)
                if result.returncode != 0 and program.interp_refused.encode() in result.stderr:
                    print(f"ok   {program.stem} (refused by the interpreter, as it must be)")
                else:
                    failures += 1
                    print(f"FAIL {program.stem}: the interpreter must refuse it with "
                          f"{program.interp_refused!r}; exit {result.returncode}\n"
                          + result.stderr.decode(errors="replace")[-1500:])
                continue
            outcome = run_program(compiler, program, lane, scratch)
            if isinstance(outcome, str):
                failures += 1
                print(f"FAIL {program.stem} [{lane}]: {outcome}")
                continue
            stdout, stderr, code = outcome
            want_stdout, want_code = reference(program)
            if stdout == want_stdout and code == want_code:
                print(f"ok   {program.stem} [{lane}]")
                continue
            failures += 1
            detail = first_difference(want_stdout, stdout) if stdout != want_stdout else "stdout matches"
            print(f"FAIL {program.stem} [{lane}]: exit {code} (want {want_code}); {detail}")
            tail = stderr.decode(errors="replace")[-2000:]
            if tail:
                print("  stderr:\n" + "\n".join("    " + line for line in tail.splitlines()))
    print(f"corpus {lane}: {len(programs) - failures} passed, {failures} failed")
    return 1 if failures else 0


def bless(compiler: str, only: list[str] | None) -> int:
    """Write each program's reference from the LLVM lane, after checking that the
    arm64 lane agrees with it, so a reference never records one backend's bug."""
    (CORPUS / "reference").mkdir(exist_ok=True)
    failures = 0
    with tempfile.TemporaryDirectory(prefix="coil-corpus-bless-") as raw:
        for program in read_corpus():
            if only and program.stem not in only:
                continue
            llvm = run_program(compiler, program, "llvm", Path(raw))
            arm64 = run_program(compiler, program, "arm64", Path(raw))
            if isinstance(llvm, str) or isinstance(arm64, str):
                failures += 1
                print(f"FAIL {program.stem}: {llvm if isinstance(llvm, str) else arm64}")
                continue
            if llvm[0] != arm64[0] or llvm[2] != arm64[2]:
                failures += 1
                print(f"FAIL {program.stem}: arm64 and LLVM disagree "
                      f"(exit {arm64[2]} vs {llvm[2]}; {first_difference(llvm[0], arm64[0])})")
                continue
            base = CORPUS / "reference" / program.stem
            Path(f"{base}.stdout").write_bytes(llvm[0])
            Path(f"{base}.exit").write_text(f"{llvm[2]}\n")
            print(f"blessed {program.stem} (exit {llvm[2]}, {len(llvm[0])} bytes)")
    return 1 if failures else 0


def normalize(output: bytes, scratch: Path) -> bytes:
    text = output.decode(errors="replace")
    text = text.replace(f"{scratch}/", "{tmp}/").replace(str(scratch), "{tmp}")
    text = text.replace(f"{ROOT}/", "")
    # A diagnostic inside the library names wherever this toolchain keeps it.
    text = re.sub(r"\S*/lib/coil/stdlib/", "<stdlib>/", text)
    text = text.replace("src/stdlib/", "<stdlib>/")
    # The platform linker's own prose varies; Coil's line about it does not.
    marker = "error: linker/ar failed with exit status:"
    at = text.find(marker)
    if at >= 0:
        text = text[at:]
    return text.encode()


def diag_inputs(which: str) -> list[Path]:
    sets = DIAG_SETS if which == "all" else (which,)
    inputs = []
    for name in sets:
        inputs += sorted((DIAG / name).glob("*.coil"))
    return inputs


def diag_command(compiler: str, source: Path, scratch: Path) -> list[str]:
    kind = source.parent.name
    relative = str(source.relative_to(ROOT))
    first = source.read_text().splitlines()[:1]
    out = scratch / source.stem
    if first and first[0].startswith("; args:"):
        extra = [a.replace("{out}", str(out)).replace("{tmp}", str(scratch))
                 for a in shlex.split(first[0][len("; args:"):])]
    else:
        extra = ["-o", str(out)] if kind == "link" else []
    return [compiler, "build" if kind == "link" else "check", relative, *extra]


def diag_output(compiler: str, source: Path, scratch: Path) -> bytes:
    command = diag_command(compiler, source, scratch)
    timeout = 60 if source.parent.name == "no-hang" else BUILD_TIMEOUT
    try:
        result = subprocess.run(command, cwd=ROOT, stdin=subprocess.DEVNULL, stdout=subprocess.PIPE,
                                stderr=subprocess.STDOUT, timeout=timeout)
    except subprocess.TimeoutExpired:
        return f"TIMEOUT: did not finish in {timeout}s\n".encode()
    return normalize(result.stdout, scratch) + f"exit: {result.returncode}\n".encode()


def diag(compiler: str, action: str, which: str, only: list[str] | None) -> int:
    failures = 0
    inputs = [p for p in diag_inputs(which) if not only or p.stem in only]
    if not inputs:
        raise SystemExit(f"diag {which}: no inputs")
    with tempfile.TemporaryDirectory(prefix="coil-diag-", dir=os.environ.get("COIL_TEST_SCRATCH")) as raw:
        scratch = Path(raw)
        for source in inputs:
            got = diag_output(compiler, source, scratch)
            golden = source.parent / "reference" / f"{source.stem}.diag"
            if action == "bless":
                golden.parent.mkdir(exist_ok=True)
                golden.write_bytes(got)
                print(f"blessed {golden.relative_to(ROOT)}")
                continue
            if not golden.is_file():
                failures += 1
                print(f"FAIL {source.relative_to(ROOT)}: no golden; run `oracle.py diag bless`")
                continue
            want = golden.read_bytes()
            if got == want:
                print(f"ok   {source.relative_to(ROOT)}")
                continue
            failures += 1
            print(f"FAIL {source.relative_to(ROOT)}: {first_difference(want, got)}")
            print("  got:\n" + "\n".join("    " + line for line in got.decode(errors="replace").splitlines()[:60]))
    if action == "gate":
        print(f"diag {which}: {len(inputs) - failures} passed, {failures} failed")
    return 1 if failures else 0


def default_compiler() -> str:
    return os.environ.get("COIL") or str(ROOT / "build" / "bin" / "coil")


def main() -> int:
    if hasattr(sys.stdout, "reconfigure"):
        sys.stdout.reconfigure(line_buffering=True)
    parser = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    sub = parser.add_subparsers(dest="action", required=True)
    command = sub.add_parser("corpus")
    command.add_argument("lane", choices=(*LANES, "bless"))
    command.add_argument("--all", action="store_true", help="every program, not only the lane's own")
    command.add_argument("--only", action="append", help="one program by stem (repeatable)")
    command.add_argument("--compiler", default=default_compiler())
    command = sub.add_parser("diag")
    command.add_argument("operation", choices=("gate", "bless"))
    command.add_argument("set", choices=(*DIAG_SETS, "all"), nargs="?", default="all")
    command.add_argument("--only", action="append", help="one input by stem (repeatable)")
    command.add_argument("--compiler", default=default_compiler())
    args = parser.parse_args()
    os.chdir(ROOT)
    compiler = str(Path(args.compiler).resolve()) if os.sep in args.compiler else args.compiler
    if args.action == "corpus":
        if args.lane == "bless":
            return bless(compiler, args.only)
        return corpus(compiler, args.lane, args.all, args.only)
    return diag(compiler, args.operation, args.set, args.only)


if __name__ == "__main__":
    raise SystemExit(main())
