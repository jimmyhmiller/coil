#!/usr/bin/env python3
"""Generate and verify Coil compiler snapshots without per-stage shell wrappers."""

from __future__ import annotations

import argparse
import concurrent.futures
import os
import shlex
import shutil
import subprocess
import sys
import tempfile
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
ORACLE = ROOT / "tests/compiler/oracle"
TARGET_X86 = "x86_64-apple-macosx11.0.0"
TARGET_FULL = "arm64-apple-darwin25.5.0"

# Stages whose output is host-sensitive, and the triple they are pinned to.
#
# These dumps are meant to be target-INDEPENDENT — they compare frontend output,
# not machine code — but they are not, because src/stdlib/os.coil selects the
# errno accessor (`__error` on darwin, `__errno_location` elsewhere) with an
# expression macro on `target-os`, and io.coil's staged printers pull os-errno
# into every program. Emitted natively, the snapshot records whichever host ran
# it last: the macOS-blessed references differ from a Linux run in exactly that
# one region, out of 23,121 tokens.
#
# Pinning a triple makes the independence real rather than aspirational — both
# hosts then produce identical bytes from one shared reference, with no
# per-platform duplication. Linux, because that is the platform that had no
# representation at all. Requires the compiler to apply --target in these dumps.
TARGET_PINNED = "x86_64-pc-linux-gnu"
PINNED_STAGES = ("checked", "expand", "mono", "resolved")


def stage_extra(stage: str) -> list[str]:
    """The --target arguments a stage's dump must be invoked with."""
    if stage == "x86":
        return ["--target", TARGET_X86]
    if stage == "full":
        return ["--target", TARGET_FULL]
    if stage in PINNED_STAGES:
        return ["--target", TARGET_PINNED]
    return shlex.split(os.environ.get("COIL_SELF_ARGS", ""))
STAGES = ("read", "ast", "load", "resolved", "checked", "expand", "mono", "ir", "diag", "x86", "full")
COMMAND = {
    "read": "dump-read", "ast": "dump-ast", "load": "dump-load",
    "resolved": "dump-resolved", "checked": "dump-checked",
    "expand": "dump-expand", "mono": "dump-mono", "ir": "dump-ir",
    "full": "emit-ir", "x86": "emit-ir",
}

# Intermediate representations are high-signal only when each snapshot has a reason
# to exist. Broad examples/apps/stdlib coverage belongs to the runtime and CLI gates;
# duplicating every program through every compiler stage produced 100+ MB of golden
# files and made harmless cross-cutting changes obscure real regressions.
STAGE_INPUTS = {
    "read": ["tests/compiler/oracle/stages/surface.coil"],
    "ast": ["tests/compiler/oracle/stages/surface.coil"],
    "load": [
        "tests/compiler/oracle/load/fixtures/edge.coil",
        "tests/compiler/features/scoped_namespace.coil",
    ],
    "resolved": [
        "tests/compiler/oracle/resolved/fixtures/app.coil",
        "tests/compiler/oracle/resolved/fixtures/helper2.coil",
        "tests/compiler/features/scoped_namespace.coil",
    ],
    "checked": ["tests/compiler/oracle/stages/surface.coil"],
    "expand": [
        "tests/compiler/oracle/features/meta_stage3.coil",
        "src/examples/metaprogramming/condlint.coil",
    ],
    "mono": [
        "src/examples/generics.coil",
        "src/examples/sums.coil",
        "src/examples/dyn_write.coil",
    ],
    "ir": [
        "tests/compiler/oracle/ir/fixtures/call.coil",
        "tests/compiler/oracle/ir/fixtures/iadd.coil",
        "tests/compiler/oracle/ir/fixtures/ret0.coil",
        "tests/compiler/oracle/features/export_c.coil",
    ],
    # Shared macOS/Linux IR baselines: one program per materially different path.
    "full": [
        "src/examples/conventions.coil",
        "src/examples/generics.coil",
        "src/examples/dyn_write.coil",
        "src/examples/per-arch.coil",
        "tests/compiler/oracle/features/export_c.coil",
        "tests/compiler/oracle/features/meta_stage3.coil",
        "tests/compiler/oracle/features/fs_lib.coil",
        "tests/compiler/oracle/ir/fixtures/call.coil",
    ],
}


def jobs() -> int:
    """Concurrency for the corpus gates. Each unit is a subprocess, so oversubscribing
    the efficiency cores still pays; COIL_JOBS=1 restores serial execution when a
    failure needs to be read without interleaving."""
    override = os.environ.get("COIL_JOBS")
    if override:
        return max(1, int(override))
    return max(1, os.cpu_count() or 1)


def rel(path: Path) -> str:
    return path.relative_to(ROOT).as_posix()


def mangle(path: str) -> str:
    return path.replace("/", "_")


def read_list(path: Path) -> list[str]:
    return [line.strip() for line in path.read_text().splitlines() if line.strip() and not line.lstrip().startswith("#")]


def write_list(path: Path, entries: list[str]) -> None:
    path.write_text("".join(f"{entry}\n" for entry in sorted(entries)))


def run(compiler: Path, command: str, source: str, *extra: str) -> subprocess.CompletedProcess[bytes]:
    return subprocess.run([str(compiler), command, source, *extra], cwd=ROOT, stdout=subprocess.PIPE, stderr=subprocess.PIPE)


def reset(directory: Path) -> None:
    shutil.rmtree(directory, ignore_errors=True)
    directory.mkdir(parents=True)


def snapshot_simple(compiler: Path, stage: str, inputs: list[str], *, command: str | None = None,
                    extra: tuple[str, ...] = (), suffix: str = ".dump", allow_fail: bool = False,
                    expected_failures: set[str] | None = None) -> list[str]:
    base = ORACLE if stage == "read" else ORACLE / stage
    reference = base / "reference"
    corpus = base / "corpus.txt"
    reset(reference)
    accepted: list[str] = []
    for source in inputs:
        result = run(compiler, command or COMMAND[stage], source, *extra)
        if result.returncode and allow_fail:
            first = result.stderr.decode(errors="replace").splitlines()[:1]
            print(f"SKIP {source}: {first[0] if first else 'compiler failed'}")
            continue
        if result.returncode and source not in (expected_failures or set()):
            sys.stderr.buffer.write(result.stderr)
            raise SystemExit(f"snapshot {stage} failed: {source}")
        (reference / f"{mangle(source)}{suffix}").write_bytes(result.stdout)
        accepted.append(source)
    write_list(corpus, accepted)
    return accepted


def snapshot_diag(compiler: Path) -> int:
    base = ORACLE / "diag"
    reference = base / "reference"
    reset(reference)
    inputs = [rel(path) for path in sorted((base / "inputs").glob("*.coil"))]
    write_list(base / "corpus.txt", inputs)
    root_prefix = f"{ROOT}/".encode()
    for source in inputs:
        result = run(compiler, "emit-ir", source)
        (reference / f"{mangle(source)}.diag").write_bytes((result.stdout + result.stderr).replace(root_prefix, b""))
    build_inputs = [rel(path) for path in sorted((base / "build-inputs").glob("*.coil"))]
    write_list(base / "build-corpus.txt", build_inputs)
    with tempfile.TemporaryDirectory() as temp:
        temp_path = Path(temp)
        for source in build_inputs:
            output = temp_path / Path(source).stem
            target = ["--target", TARGET_FULL] if source.endswith("14-shim-bad-gpr.coil") else []
            result = subprocess.run([str(compiler), "build", source, "-o", str(output), *target], cwd=ROOT,
                                    stdout=subprocess.PIPE, stderr=subprocess.STDOUT)
            normalized = normalize_build_diag(
                result.stdout.replace(root_prefix, b"").replace(f"{temp}/".encode(), b""))
            stem = reference / f"{mangle(source)}"
            Path(f"{stem}.diag").write_bytes(normalized)
            Path(f"{stem}.exit").write_text(f"{result.returncode}\n")
    print(f"snapshot diag: {len(inputs)} diagnostics, {len(build_inputs)} build diagnostics")
    return 0


def snapshot(compiler: Path, stage: str) -> int:
    if not compiler.is_file() or not os.access(compiler, os.X_OK):
        raise SystemExit(f"reference compiler is not executable: {compiler}")
    if stage == "all":
        for item in STAGES:
            snapshot(compiler, item)
        return 0
    if stage == "diag":
        return snapshot_diag(compiler)
    if stage == "read":
        inputs = STAGE_INPUTS[stage] + [rel(path) for path in sorted((ORACLE / "negative").glob("*.coil"))]
        accepted = snapshot_simple(compiler, stage, inputs)
    elif stage == "ast":
        inputs = STAGE_INPUTS[stage] + [rel(path) for path in sorted((ORACLE / "ast/negative").glob("*.coil"))]
        accepted = snapshot_simple(compiler, stage, inputs)
    elif stage in ("load", "resolved", "checked", "expand", "mono", "ir"):
        inputs = list(STAGE_INPUTS[stage])
        expected_failures: set[str] = set()
        if stage == "checked":
            expected_failures = {rel(path) for path in sorted((ORACLE / "checked/fixtures").glob("*.coil"))}
            inputs += sorted(expected_failures)
        # Same --target as the gate, or blessing and gating disagree by construction.
        accepted = snapshot_simple(compiler, stage, inputs, expected_failures=expected_failures,
                                   extra=tuple(stage_extra(stage)))
    elif stage == "full":
        accepted = snapshot_simple(compiler, stage, STAGE_INPUTS[stage],
                                   command=os.environ.get("COIL_IR_CMD", "emit-ir"),
                                   extra=tuple(stage_extra(stage)))
    elif stage == "x86":
        inputs = [rel(path) for path in sorted((ORACLE / "features").glob("*x86*.coil"))]
        accepted = snapshot_simple(compiler, stage, inputs, extra=("--target", TARGET_X86))
    else:
        raise SystemExit(f"unknown snapshot stage: {stage}")
    print(f"snapshot {stage}: {len(accepted)} files")
    return 0


def normalize_build_diag(output: bytes) -> bytes:
    """Discard platform linker prose while retaining Coil's stable diagnostic."""
    marker = b"error: linker/ar failed with exit status:"
    at = output.find(marker)
    return output[at:] if at >= 0 else output


def gate_diag(compiler: Path, verbose: bool) -> int:
    base = ORACLE / "diag"
    reference = base / "reference"
    failures: list[str] = []
    root_prefix = f"{ROOT}/".encode()
    for source in read_list(base / "corpus.txt"):
        result = run(compiler, "emit-ir", source)
        got = (result.stdout + result.stderr).replace(root_prefix, b"")
        want = (reference / f"{mangle(source)}.diag").read_bytes()
        if got != want:
            failures.append(source)
            if verbose:
                print(f"FAIL diag: {source}")
    with tempfile.TemporaryDirectory() as temp:
        for source in read_list(base / "build-corpus.txt"):
            output = Path(temp) / Path(source).stem
            target = ["--target", TARGET_FULL] if source.endswith("14-shim-bad-gpr.coil") else []
            result = subprocess.run([str(compiler), "build", source, "-o", str(output), *target], cwd=ROOT,
                                    stdout=subprocess.PIPE, stderr=subprocess.STDOUT)
            got = normalize_build_diag(
                result.stdout.replace(root_prefix, b"").replace(f"{temp}/".encode(), b""))
            stem = reference / mangle(source)
            want = normalize_build_diag(Path(f"{stem}.diag").read_bytes())
            want_code = int(Path(f"{stem}.exit").read_text())
            if got != want or result.returncode != want_code:
                failures.append(source)
                if verbose:
                    print(f"FAIL build diagnostic: {source}")
    print(f"gate diag: {'PASS' if not failures else f'{len(failures)} failed'}")
    return 1 if failures else 0


def gate(compiler: Path, stage: str, verbose: bool) -> int:
    if stage == "all":
        failed_stages: list[str] = []
        for item in STAGES:
            if gate(compiler, item, verbose):
                failed_stages.append(item)
        if failed_stages:
            joined = " ".join(failed_stages)
            print(f"gate all: failed stages: {joined}")
            print(f"refresh once with: {sys.executable} scripts/oracle.py refresh --compiler {compiler}")
            return 1
        print("gate all: PASS")
        return 0
    if stage == "diag":
        return gate_diag(compiler, verbose)
    base = ORACLE if stage == "read" else ORACLE / stage
    suffix = ".dump"
    extra = stage_extra(stage)
    failures: list[str] = []
    passed = 0
    for source in read_list(base / "corpus.txt"):
        result = run(compiler, COMMAND[stage], source, *extra)
        reference = base / "reference" / f"{mangle(source)}{suffix}"
        expected_code = 1 if stage == "checked" and source.startswith("tests/compiler/oracle/checked/fixtures/") else 0
        if result.returncode == expected_code and reference.is_file() and result.stdout.rstrip(b"\n") == reference.read_bytes().rstrip(b"\n"):
            passed += 1
            continue
        failures.append(source)
        if verbose:
            reason = result.stderr.decode(errors="replace").splitlines()[:1]
            print(f"FAIL {stage}: {source}: {reason[0] if reason else 'output mismatch'}")
            if not reason and reference.is_file():
                got_lines = result.stdout.decode(errors="replace").splitlines()
                want_lines = reference.read_text(errors="replace").splitlines()
                for line_no, (want, got) in enumerate(zip(want_lines, got_lines), 1):
                    if want != got:
                        print(f"  first difference at line {line_no}")
                        print(f"  expected: {want}")
                        print(f"       got: {got}")
                        break
                else:
                    print(f"  line counts: expected {len(want_lines)}, got {len(got_lines)}")
    print(f"gate {stage}: {passed} passed, {len(failures)} failed")
    return 1 if failures else 0


def refresh_mismatched_snapshots(compiler: Path, verbose: bool) -> int:
    """Refresh every currently mismatched stage in one deliberate transaction.

    The initial audit always runs every stage. This prevents the slow and error-prone
    pattern of discovering one mismatch, blessing it, rerunning from the beginning,
    and repeating. Only failing stages are rewritten; a final all-stage audit proves
    that the refreshed set is internally consistent.
    """
    failed_stages: list[str] = []
    print("=== snapshot mismatch audit (all stages; no writes) ===")
    for stage in STAGES:
        if gate(compiler, stage, verbose):
            failed_stages.append(stage)
    if not failed_stages:
        print("refresh: snapshots already match; wrote nothing")
        return 0

    print(f"=== refreshing mismatched stages once: {' '.join(failed_stages)} ===")
    for stage in failed_stages:
        snapshot(compiler, stage)

    print("=== final snapshot audit (all stages) ===")
    return gate(compiler, "all", verbose)


def runtime_one(entry: str, compiler: Path, action: str, platform: str, verbose: bool,
                reference: Path, excluded: set[str]) -> tuple[bool, list[str]]:
    """Build and run one corpus entry. Returns (passed, lines to report)."""
    parts = shlex.split(entry)
    rust_reference = parts[0] == "R"
    if rust_reference:
        parts.pop(0)
    source, *program_args = parts
    identity = source.replace("/", "_").replace(".", "_")
    fixed_prefix = "coil-arm64" if platform in ("arm64", "linux") else "coil-x64"
    executable = Path("/tmp") / f"{fixed_prefix}-fixed-{identity}"
    build = [str(compiler), "build", source, "-o", str(executable)]
    if action == "gate" and platform != "linux":
        build += ["--backend", platform]
    elif action == "snapshot" and rust_reference and platform == "arm64":
        build += ["--backend", "arm64"]
    result = subprocess.run(build, cwd=ROOT, stdout=subprocess.DEVNULL, stderr=subprocess.PIPE, timeout=120)
    if platform == "linux" and source in excluded:
        if result.returncode and b"not a general-purpose register on the target architecture" in result.stderr:
            return True, []
        return False, [f"FAIL architecture diagnostic: {source}"]
    if result.returncode:
        report = [f"FAIL build: {source}"]
        if verbose:
            report.append(str(result.stderr.decode(errors="replace").splitlines()[:3]))
        return False, report
    ran = subprocess.run([str(executable), *program_args], stdin=subprocess.DEVNULL,
                         stdout=subprocess.PIPE, stderr=subprocess.PIPE, timeout=30)
    stdout_file = reference / f"{identity}.stdout"
    stderr_file = reference / f"{identity}.stderr"
    exit_file = reference / f"{identity}.exit"
    if action == "snapshot":
        stdout_file.write_bytes(ran.stdout)
        stderr_file.write_bytes(ran.stderr)
        exit_file.write_text(f"{ran.returncode}\n")
        return True, []
    if stdout_file.is_file() and ran.stdout == stdout_file.read_bytes() and ran.returncode == int(exit_file.read_text()):
        return True, []
    return False, [f"FAIL run: {source} exit={ran.returncode}"]


def runtime(compiler: Path, action: str, platform: str, verbose: bool) -> int:
    """Corpus entries are independent — each builds to its own fixed path and only
    reads stdin from /dev/null — so they run concurrently. Reporting stays in corpus
    order regardless of completion order, which keeps failure output diffable."""
    source_platform = "arm64" if platform == "linux" else platform
    base = ORACLE / source_platform
    reference = base / "reference"
    excluded = set(read_list(ORACLE / "linux/arm64-only.txt")) if platform == "linux" else set()
    entries = read_list(base / "corpus.txt")
    with concurrent.futures.ThreadPoolExecutor(max_workers=jobs()) as pool:
        results = list(pool.map(
            lambda entry: runtime_one(entry, compiler, action, platform, verbose, reference, excluded),
            entries))
    failures = 0
    passed = 0
    for ok, report in results:
        for line in report:
            print(line)
        if ok:
            passed += 1
        else:
            failures += 1
    print(f"runtime {action} {platform}: {passed} passed, {failures} failed")
    return 1 if failures else 0


def coverage() -> int:
    corpus = read_list(ORACLE / "full/corpus.txt")
    excluded = set(read_list(ORACLE / "linux/arm64-only.txt"))
    mac = ORACLE / "full/reference"
    linux = ORACLE / "linux/full-reference"
    expected_mac = {f"{mangle(source)}.dump" for source in corpus}
    expected_linux = {f"{mangle(source)}.dump" for source in corpus if source not in excluded}
    actual_mac = {path.name for path in mac.glob("*.dump")}
    actual_linux = {path.name for path in linux.glob("*.dump")}
    problems = []
    for label, expected, actual in (("macOS", expected_mac, actual_mac), ("Linux", expected_linux, actual_linux)):
        problems += [f"MISSING {label}: {name}" for name in sorted(expected - actual)]
        problems += [f"ORPHAN {label}: {name}" for name in sorted(actual - expected)]
    if problems:
        print("\n".join(problems))
        print(f"coverage: {len(problems)} problem(s)")
        return 1
    print(f"coverage: PASS ({len(corpus)} shared full-pipeline entries)")
    return 0


def linux_ir(compiler: Path, action: str, verbose: bool) -> int:
    corpus = read_list(ORACLE / "full/corpus.txt")
    excluded = set(read_list(ORACLE / "linux/arm64-only.txt"))
    reference = ORACLE / "linux/full-reference"
    reference.mkdir(parents=True, exist_ok=True)
    failures = 0
    passed = 0
    for source in corpus:
        result = run(compiler, "emit-ir", source, *shlex.split(os.environ.get("COIL_SELF_ARGS", "")))
        if source in excluded:
            if result.returncode and b"not a general-purpose register on the target architecture" in result.stderr:
                passed += 1
            else:
                failures += 1
                print(f"FAIL architecture diagnostic: {source}")
            continue
        output = reference / f"{mangle(source)}.dump"
        if action == "snapshot":
            if result.returncode:
                failures += 1
                print(f"FAIL snapshot: {source}")
            else:
                output.write_bytes(result.stdout)
                passed += 1
        elif result.returncode == 0 and output.is_file() and result.stdout.rstrip(b"\n") == output.read_bytes().rstrip(b"\n"):
            passed += 1
        else:
            failures += 1
            print(f"FAIL Linux IR: {source}")
            if verbose and result.stderr:
                print(result.stderr.decode(errors="replace").splitlines()[0])
    print(f"Linux IR {action}: {passed} passed, {failures} failed")
    return 1 if failures else 0


def interpreter(compiler: Path, live: bool, verbose: bool) -> int:
    base = ORACLE / "arm64"
    reference = base / "reference"
    failures = 0
    passed = 0
    for line in read_list(base / "corpus.txt"):
        parts = shlex.split(line)
        special_backend = parts[0] == "R"
        if special_backend:
            parts.pop(0)
        source, *program_args = parts
        identity = source.replace("/", "_").replace(".", "_")
        interpreted = subprocess.run([str(compiler), "interp", source, *program_args], cwd=ROOT,
                                     stdin=subprocess.DEVNULL, stdout=subprocess.PIPE,
                                     stderr=subprocess.DEVNULL, timeout=60)
        if live:
            executable = Path("/tmp") / f"coil-interp-compiled-{identity}"
            build = [str(compiler), "build", source, "-o", str(executable)]
            if special_backend:
                build += ["--backend", "arm64"]
            built = subprocess.run(build, cwd=ROOT, stdout=subprocess.DEVNULL, stderr=subprocess.PIPE, timeout=120)
            if built.returncode:
                failures += 1
                print(f"FAIL interpreter comparison build: {source}")
                continue
            compiled = subprocess.run([source, *program_args], executable=str(executable), cwd=ROOT,
                                      stdin=subprocess.DEVNULL, stdout=subprocess.PIPE,
                                      stderr=subprocess.DEVNULL, timeout=30)
            want_stdout, want_code = compiled.stdout, compiled.returncode
        else:
            want_stdout = (reference / f"{identity}.stdout").read_bytes()
            want_code = int((reference / f"{identity}.exit").read_text())
        if interpreted.stdout == want_stdout and interpreted.returncode == want_code:
            passed += 1
        else:
            failures += 1
            print(f"FAIL interpreter: {source} exit={interpreted.returncode} want={want_code}")
            if verbose:
                print(f"stdout bytes: got={len(interpreted.stdout)} want={len(want_stdout)}")
    label = "live" if live else "snapshot"
    print(f"interpreter {label}: {passed} passed, {failures} failed")
    return 1 if failures else 0


def main() -> int:
    # Long all-stage audits must show progress as each stage finishes. Without line
    # buffering a non-interactive invocation appears hung until the entire transaction
    # exits, which invites users and agents to interrupt it or start redundant runs.
    if hasattr(sys.stdout, "reconfigure"):
        sys.stdout.reconfigure(line_buffering=True)
    parser = argparse.ArgumentParser(description=__doc__)
    sub = parser.add_subparsers(dest="action", required=True)
    for action in ("gate", "snapshot"):
        command = sub.add_parser(action)
        command.add_argument("stage", choices=("all", *STAGES))
        command.add_argument("--compiler", default=os.environ.get("COIL_REF_BIN", "build/bin/coil"))
        if action == "gate":
            command.add_argument("--verbose", action="store_true", default=os.environ.get("VERBOSE") == "1")
    command = sub.add_parser("refresh", help="audit all stages, refresh every mismatch once, then re-audit")
    command.add_argument("--compiler", default=os.environ.get("COIL_REF_BIN", "build/bin/coil"))
    command.add_argument("--verbose", action="store_true", default=os.environ.get("VERBOSE") == "1")
    command = sub.add_parser("runtime")
    command.add_argument("operation", choices=("gate", "snapshot"))
    command.add_argument("platform", choices=("arm64", "x64", "linux"))
    command.add_argument("--compiler", default="build/bin/coil")
    command.add_argument("--verbose", action="store_true")
    command = sub.add_parser("linux-ir")
    command.add_argument("operation", choices=("gate", "snapshot"))
    command.add_argument("--compiler", default="build/bin/coil")
    command.add_argument("--verbose", action="store_true")
    command = sub.add_parser("interpreter")
    command.add_argument("mode", choices=("snapshot", "live"), nargs="?", default="snapshot")
    command.add_argument("--compiler", default="build/bin/coil")
    command.add_argument("--verbose", action="store_true")
    sub.add_parser("coverage")
    args = parser.parse_args()
    os.chdir(ROOT)
    if args.action == "coverage":
        return coverage()
    compiler = Path(args.compiler)
    if not compiler.is_absolute():
        compiler = ROOT / compiler
    if args.action == "snapshot":
        return snapshot(compiler, args.stage)
    if args.action == "refresh":
        return refresh_mismatched_snapshots(compiler, args.verbose)
    if args.action == "runtime":
        return runtime(compiler, args.operation, args.platform, args.verbose)
    if args.action == "linux-ir":
        return linux_ir(compiler, args.operation, args.verbose)
    if args.action == "interpreter":
        return interpreter(compiler, args.mode == "live", args.verbose)
    return gate(compiler, args.stage, args.verbose)


if __name__ == "__main__":
    raise SystemExit(main())
