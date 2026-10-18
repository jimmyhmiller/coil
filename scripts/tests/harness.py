#!/usr/bin/env python3
"""The step runner behind `dev.py test fast` and `dev.py test comprehensive`.

A tier is a fixed, ordered list of steps run one after another. Every step:

- passes or fails on its exit status alone. Time and memory never fail a step: a
  busy machine makes every step slower and bigger. They are measured and reported;
- is timed, and is killed as hung only past the tier's hang limit (or its own);
- has its process tree watched for its largest process, and a step whose largest
  process passes the tier's memory line gets a warning;
- prints one line: `ok   #12 diag/types   4.1s  peak 0.41GB  cum 88.3s`.

At the end the tier reports its slowest steps, its largest, and its serial total,
with a warning when the total passes the tier's target.
"""

from __future__ import annotations

import argparse
import os
import re
import shlex
import signal
import subprocess
import sys
import tempfile
import threading
import time
from dataclasses import dataclass, field
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent.parent

# Commands that compile the whole compiler. FAST must never run one: each costs
# minutes and several GB. They belong to COMPREHENSIVE, after `build full`.
WHOLE_COMPILER = re.compile(
    r"src/compiler/(main\w*|jit_api|jit_sdk)\.coil"
    r"|lib/coil/compiler/jit_api\.coil"
    r"|allns\.coil"
    r"|dev\.py\s+(install|build)\b"
    r"|rebootstrap"
)


@dataclass
class Step:
    name: str
    argv: list[str]
    cwd: Path = ROOT
    env: dict[str, str] = field(default_factory=dict)
    quick: bool = False
    # Comprehensive steps may run whole-compiler commands; FAST steps may not.
    whole_compiler: bool = False
    # The memory line for this step's largest process, in GB, when it is not the
    # tier's (comprehensive's steps that compile the whole compiler).
    memory_gb: float | None = None
    # Seconds after which this step is killed as hung, when not the tier's.
    hang_seconds: float | None = None


def process_table() -> list[tuple[int, int, int, str]]:
    out = subprocess.run(["ps", "-axo", "pid=,ppid=,rss=,command="],
                         capture_output=True).stdout.decode("utf-8", "replace")
    rows = []
    for line in out.splitlines():
        parts = line.split(None, 3)
        if len(parts) < 3:
            continue
        try:
            rows.append((int(parts[0]), int(parts[1]), int(parts[2]) * 1024,
                         parts[3] if len(parts) > 3 else ""))
        except ValueError:
            continue
    return rows


def descendants(root: int, rows: list[tuple[int, int, int, str]]) -> list[tuple[int, int, str]]:
    children: dict[int, list[int]] = {}
    info: dict[int, tuple[int, str]] = {}
    for pid, ppid, rss, command in rows:
        children.setdefault(ppid, []).append(pid)
        info[pid] = (rss, command)
    found, stack = [], [root]
    while stack:
        pid = stack.pop()
        if pid in info:
            found.append((pid, info[pid][0], info[pid][1]))
        stack.extend(children.get(pid, []))
    return found


class Watch(threading.Thread):
    """Polls a step's process tree: enforces the whole-compiler refusal, and records
    the largest process it saw."""

    def __init__(self, pid: int, refuse_whole_compiler: bool):
        super().__init__(daemon=True)
        self.pid = pid
        self.refuse = refuse_whole_compiler
        self.peak = 0
        self.peak_command = ""
        self.violation: str | None = None
        self.done = threading.Event()

    def run(self) -> None:
        # ps costs real CPU on a loaded machine; a short spike between polls is
        # still caught afterwards through the reaped children's ru_maxrss.
        while not self.done.wait(0.25):
            for pid, rss, command in descendants(self.pid, process_table()):
                if rss > self.peak:
                    self.peak, self.peak_command = rss, command
                if self.violation:
                    continue
                if self.refuse and WHOLE_COMPILER.search(command):
                    self.violation = f"whole-compiler command refused in this tier: {command[:200]}"
            if self.violation:
                kill_group(self.pid)
                return


def kill_group(pid: int) -> None:
    try:
        os.killpg(pid, signal.SIGKILL)
    except (ProcessLookupError, PermissionError):
        pass


@dataclass
class Result:
    step: Step
    seconds: float
    peak: int
    peak_command: str
    ok: bool
    reason: str
    log: Path
    # The memory line in bytes; the step's largest process passed it when `big`.
    memory_line: float = 0
    big: bool = False


def referenced_files(argv: list[str]) -> list[Path]:
    files = []
    for arg in argv:
        path = Path(arg)
        if not path.is_absolute():
            path = ROOT / arg
        try:
            if path.is_file() and path.suffix in (".sh", ".py", ".mjs") and ROOT in path.resolve().parents:
                files.append(path)
        except OSError:
            continue
    return files


def structural_refusals(steps: list[Step]) -> list[str]:
    """A FAST step whose command line or script names a whole-compiler build."""
    problems = []
    for step in steps:
        if step.whole_compiler:
            continue
        text = shlex.join(step.argv)
        if WHOLE_COMPILER.search(text):
            problems.append(f"{step.name}: command names a whole-compiler build: {text}")
        for script in referenced_files(step.argv):
            for number, line in enumerate(script.read_text(errors="replace").splitlines(), 1):
                stripped = line.strip()
                if stripped.startswith("#"):
                    continue
                if WHOLE_COMPILER.search(stripped):
                    problems.append(f"{step.name}: {script.relative_to(ROOT)}:{number} "
                                    f"names a whole-compiler build: {stripped[:120]}")
    return problems


def run_step(step: Step, index: int, memory_gb: float, hang_seconds: float, refuse: bool,
             env: dict[str, str], logs: Path) -> Result:
    log = logs / f"{index:02d}-{step.name.replace('/', '-')}.log"
    timeout = step.hang_seconds or hang_seconds
    line = (step.memory_gb or memory_gb) * 1e9
    started = time.monotonic()
    with log.open("wb") as out:
        out.write(f"+ (cd {step.cwd}) {shlex.join(step.argv)}\n".encode())
        out.flush()
        proc = subprocess.Popen(step.argv, cwd=step.cwd, env={**env, **step.env},
                                stdin=subprocess.DEVNULL, stdout=out, stderr=subprocess.STDOUT,
                                start_new_session=True)
        watch = Watch(proc.pid, refuse and not step.whole_compiler)
        watch.start()
        timed_out = False
        deadline = started + timeout
        while True:
            waited, status, usage = os.wait4(proc.pid, os.WNOHANG)
            if waited:
                break
            if time.monotonic() > deadline:
                timed_out = True
                kill_group(proc.pid)
                waited, status, usage = os.wait4(proc.pid, 0)
                break
            time.sleep(0.02)
        proc.returncode = os.waitstatus_to_exitcode(status)
        # Anything the step left running in its group goes too.
        kill_group(proc.pid)
        watch.done.set()
        watch.join()
    seconds = time.monotonic() - started
    # ru_maxrss (bytes on macOS, KiB on Linux) covers every descendant the step's
    # process reaped, including ones too short-lived for the poller to see.
    reaped = usage.ru_maxrss if sys.platform == "darwin" else usage.ru_maxrss * 1024
    peak = max(watch.peak, reaped)
    reason = ""
    if watch.violation:
        reason = watch.violation
    elif timed_out:
        reason = f"killed as hung after {timeout:.0f}s"
    elif proc.returncode != 0:
        reason = f"exit status {proc.returncode}"
    return Result(step, seconds, peak, watch.peak_command, not reason, reason, log, line, peak > line)


def tail(path: Path, lines: int = 120) -> str:
    text = path.read_text(errors="replace").splitlines()
    return "\n".join(text[-lines:])


def compiler_env(compiler: str, scratch: Path) -> dict[str, str]:
    """The environment every step sees: COIL names the compiler under test, and a
    `coil` on PATH runs it, so a nested `coil` (a test that compiles code) uses the
    same toolchain. It is a symlink, not a wrapper script: a coil.jit session finds
    its library by resolving the `coil` it was started from to the real binary."""
    bindir = scratch / "bin"
    bindir.mkdir(parents=True, exist_ok=True)
    (bindir / "coil").symlink_to(compiler)
    env = os.environ.copy()
    env["COIL"] = compiler
    env["PATH"] = f"{bindir}{os.pathsep}{env.get('PATH', '')}"
    env["COIL_TEST_SCRATCH"] = str(scratch)
    env.pop("COIL_META_INTERP", None)
    return env


def resolve_compiler(raw: str) -> str:
    path = Path(raw).expanduser()
    if not path.is_absolute():
        found = None
        if os.sep not in raw:
            from shutil import which
            found = which(raw)
        path = Path(found) if found else ROOT / path
    path = path.resolve()
    if not (path.is_file() and os.access(path, os.X_OK)):
        raise SystemExit(f"test compiler is not executable: {path}")
    # Steps change directory. A compiler that finds its library only from inside
    # this checkout would turn every step into "cannot find the coil standard
    # library"; fail once, here, with the real problem.
    with tempfile.TemporaryDirectory(prefix="coil-preflight-") as cwd:
        probe = Path(cwd) / "probe.coil"
        probe.write_text('(import "coil.io" :use *)\n(defn main [] (-> i64) (do (stdout) 0))\n')
        checked = subprocess.run([str(path), "check", str(probe)], cwd=cwd, capture_output=True, text=True)
    if checked.returncode != 0:
        raise SystemExit(f"test compiler {path} cannot find its standard library from an unrelated "
                         f"directory:\n{(checked.stdout + checked.stderr).strip()}\n"
                         "Build the candidate under this checkout, or install compiler and library together.")
    return str(path)


def run_tier(tier: str, steps: list[Step], compiler: str, *, target_seconds: float | None,
             memory_gb: float, hang_seconds: float, refuse_whole_compiler: bool,
             only: list[str] | None = None, verbose: bool = False,
             extra_env: dict[str, str] | None = None) -> int:
    """Run STEPS in order and report. TARGET_SECONDS is the serial total the tier
    aims for (None: none); MEMORY_GB the line a step's largest process is warned
    at; HANG_SECONDS when a step is killed as hung."""
    if only:
        steps = [s for s in steps if any(s.name == o or s.name.startswith(o.rstrip("/") + "/") for o in only)]
        if not steps:
            raise SystemExit(f"{tier}: no step matches {only}")
    names = [s.name for s in steps]
    if len(set(names)) != len(names):
        raise SystemExit(f"{tier}: duplicate step names")
    if refuse_whole_compiler:
        problems = structural_refusals(steps)
        if problems:
            print("\n".join(problems))
            print(f"{tier}: FAILED (whole-compiler commands belong to COMPREHENSIVE)")
            return 1

    with tempfile.TemporaryDirectory(prefix=f"coil-{tier}-") as raw:
        scratch = Path(raw)
        logs = scratch / "logs"
        logs.mkdir()
        env = compiler_env(compiler, scratch)
        env.update(extra_env or {})
        print(f"== {tier}: {len(steps)} steps, compiler {compiler}", flush=True)
        results: list[Result] = []
        cumulative = 0.0
        wall_started = time.monotonic()
        for index, step in enumerate(steps, 1):
            result = run_step(step, index, memory_gb, hang_seconds, refuse_whole_compiler, env, logs)
            cumulative += result.seconds
            results.append(result)
            mark = "FAIL" if not result.ok else "ok  "
            print(f"{mark} #{index:<2} {step.name:<28} {result.seconds:6.1f}s  "
                  f"peak {result.peak / 1e9:4.2f}GB  cum {cumulative:6.1f}s", flush=True)
            if result.big:
                print(f"     WARNING its largest process reached {result.peak / 1e9:.2f} GB, past the "
                      f"{result.memory_line / 1e9:.1f} GB line: {result.peak_command[:160]}")
            if not result.ok:
                print(f"     {result.reason}")
                print("     ---- last lines of " + str(result.log.name) + " ----")
                print("\n".join("     | " + line for line in tail(result.log).splitlines()))
            elif verbose:
                print("\n".join("     | " + line for line in tail(result.log, 400).splitlines()))
        wall = time.monotonic() - wall_started
    report(tier, results, cumulative, wall, target_seconds if not only else None)
    failed = [r for r in results if not r.ok]
    if failed:
        print(f"{tier}: FAILED ({len(failed)} of {len(results)} steps: "
              f"{', '.join(r.step.name for r in failed)})")
        return 1
    print(f"{tier}: PASS")
    return 0


def report(tier: str, results: list[Result], cumulative: float, wall: float,
           target_seconds: float | None) -> None:
    """Where the tier stands: its slowest steps, its largest, and its total."""
    print(f"== {tier}: slowest steps")
    for result in sorted(results, key=lambda r: -r.seconds)[:10]:
        print(f"     {result.seconds:6.1f}s  {result.step.name}")
    print(f"== {tier}: largest steps (peak of one process)")
    for result in sorted(results, key=lambda r: -r.peak)[:10]:
        print(f"     {result.peak / 1e9:5.2f}GB  {result.step.name}")
    target = f", target {target_seconds:.0f}s" if target_seconds is not None else ""
    print(f"== {tier}: serial total {cumulative:.1f}s of steps, {wall:.1f}s wall{target}")
    if target_seconds is not None and wall > target_seconds:
        print(f"{tier}: WARNING the serial wall time {wall:.1f}s is past the {target_seconds:.0f}s target")
    big = [r for r in results if r.big]
    if big:
        print(f"{tier}: WARNING {len(big)} step(s) past the memory line: "
              + ", ".join(f"{r.step.name} {r.peak / 1e9:.2f}GB/{r.memory_line / 1e9:.1f}GB" for r in big))


def common_arguments(parser: argparse.ArgumentParser) -> None:
    parser.add_argument("--compiler", default="build/bin/coil")
    parser.add_argument("--only", action="append",
                        help="run only steps with this name or name/ prefix (repeatable)")
    parser.add_argument("--list", action="store_true", help="print the steps")
    parser.add_argument("--verbose", action="store_true")


def list_steps(steps: list[Step]) -> None:
    for index, step in enumerate(steps, 1):
        print(f"#{index:<2} {step.name:<28}{'  [quick]' if step.quick else ''}  {shlex.join(step.argv)}")
