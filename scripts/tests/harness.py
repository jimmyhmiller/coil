#!/usr/bin/env python3
"""The step runner behind `dev.py test fast` and `dev.py test comprehensive`.

A tier is a fixed, ordered list of steps run one after another. Every step:

- has a budget in scripts/tests/budgets.toml (a step without one fails);
- is timed, and is reported as slow, with a warning, when it takes longer than its
  budget. Time never fails a step: a busy machine makes every step slower. Only a
  step that runs ten times its budget (at least ten minutes) is killed, as hung;
- has its process tree watched: a process over the tier's memory limit is killed
  and fails the step, and the peak is reported;
- prints one line: `#12 diag/types   4.1s  budget 7s  peak 0.41GB  cum 88.3s`.

The serial total is compared with the tier's own limits, and over them is a
warning too. COIL_BUDGET_SCALE multiplies every budget and limit (CI runners are
slower than a laptop); it is the only knob.
"""

from __future__ import annotations

import argparse
import math
import os
import re
import shlex
import signal
import statistics
import subprocess
import sys
import tempfile
import threading
import time
import tomllib
from dataclasses import dataclass, field
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent.parent
BUDGETS = ROOT / "scripts" / "tests" / "budgets.toml"

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
    # Per-process memory limit override in GB (comprehensive's heavy steps).
    memory_gb: float | None = None


def scale() -> float:
    raw = os.environ.get("COIL_BUDGET_SCALE", "1")
    try:
        value = float(raw)
    except ValueError:
        raise SystemExit(f"COIL_BUDGET_SCALE is not a number: {raw!r}")
    if value <= 0:
        raise SystemExit("COIL_BUDGET_SCALE must be positive")
    return value


def load_budgets() -> dict:
    with BUDGETS.open("rb") as handle:
        return tomllib.load(handle)


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
    """Polls a step's process tree: enforces the per-process memory limit and the
    whole-compiler refusal, and records the largest process it saw."""

    def __init__(self, pid: int, limit_bytes: float, refuse_whole_compiler: bool):
        super().__init__(daemon=True)
        self.pid = pid
        self.limit = limit_bytes
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
                if rss > self.limit:
                    self.violation = (f"process {pid} used {rss / 1e9:.2f} GB, over the "
                                      f"{self.limit / 1e9:.2f} GB limit: {command[:160]}")
                elif self.refuse and WHOLE_COMPILER.search(command):
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
    budget: float | None
    peak: int
    ok: bool
    reason: str
    log: Path
    slow: bool = False


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


def run_step(step: Step, index: int, budget: float | None, limit_gb: float, refuse: bool,
             env: dict[str, str], logs: Path) -> Result:
    log = logs / f"{index:02d}-{step.name.replace('/', '-')}.log"
    # Not a budget: the point past which a step is taken to have hung.
    timeout = max(budget * 10, 600) if budget is not None else 600
    started = time.monotonic()
    with log.open("wb") as out:
        out.write(f"+ (cd {step.cwd}) {shlex.join(step.argv)}\n".encode())
        out.flush()
        proc = subprocess.Popen(step.argv, cwd=step.cwd, env={**env, **step.env},
                                stdin=subprocess.DEVNULL, stdout=out, stderr=subprocess.STDOUT,
                                start_new_session=True)
        watch = Watch(proc.pid, (step.memory_gb or limit_gb) * 1e9, refuse and not step.whole_compiler)
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
        reason = f"killed as hung after {timeout:.0f}s (ten times its budget, at least 600s)"
    elif proc.returncode != 0:
        reason = f"exit status {proc.returncode}"
    elif peak > (step.memory_gb or limit_gb) * 1e9:
        reason = f"a process peaked at {peak / 1e9:.2f} GB, over the {(step.memory_gb or limit_gb):.2f} GB limit"
    elif budget is None:
        reason = "no budget entry in scripts/tests/budgets.toml"
    slow = budget is not None and seconds > budget
    return Result(step, seconds, budget, peak, not reason, reason, log, slow)


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


def run_tier(tier: str, steps: list[Step], compiler: str, *, total_key: str | None,
             hard_key: str | None, limit_gb: float, refuse_whole_compiler: bool,
             only: list[str] | None = None, verbose: bool = False,
             rebaseline: int = 0, budget_section: str | None = None,
             extra_env: dict[str, str] | None = None) -> int:
    budgets = load_budgets()
    section = budget_section or tier
    step_budgets = budgets.get(section, {}).get("steps", {})
    factor = scale()
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

    rounds = max(1, rebaseline)
    timings: dict[str, list[float]] = {s.name: [] for s in steps}
    status = 0
    for round_index in range(rounds):
        with tempfile.TemporaryDirectory(prefix=f"coil-{tier}-") as raw:
            scratch = Path(raw)
            logs = scratch / "logs"
            logs.mkdir()
            env = compiler_env(compiler, scratch)
            env.update(extra_env or {})
            if rebaseline:
                print(f"== {tier}: rebaseline round {round_index + 1} of {rounds}")
            print(f"== {tier}: {len(steps)} steps, compiler {compiler}, budget scale {factor:g}", flush=True)
            results: list[Result] = []
            cumulative = 0.0
            wall_started = time.monotonic()
            for index, step in enumerate(steps, 1):
                raw_budget = step_budgets.get(step.name)
                budget = None if raw_budget is None else raw_budget * factor
                if rebaseline:
                    budget = None if raw_budget is None else max(budget, 10 ** 6)
                result = run_step(step, index, budget, limit_gb * (1 if not rebaseline else 4),
                                  refuse_whole_compiler, env, logs)
                if rebaseline and result.reason.startswith("no budget"):
                    result.ok, result.reason = True, ""
                cumulative += result.seconds
                results.append(result)
                timings[step.name].append(result.seconds)
                shown = f"{result.budget:.0f}s" if result.budget is not None and not rebaseline else "-"
                mark = "FAIL" if not result.ok else ("slow" if result.slow and not rebaseline else "ok  ")
                print(f"{mark} #{index:<2} {step.name:<28} {result.seconds:6.1f}s  budget {shown:>5}  "
                      f"peak {result.peak / 1e9:4.2f}GB  cum {cumulative:6.1f}s", flush=True)
                if result.ok and result.slow and not rebaseline:
                    print(f"     WARNING took {result.seconds:.1f}s, over its {result.budget:.0f}s budget")
                if not result.ok:
                    print(f"     {result.reason}")
                    print("     ---- last lines of " + str(result.log.name) + " ----")
                    print("\n".join("     | " + line for line in tail(result.log).splitlines()))
                elif verbose:
                    print("\n".join("     | " + line for line in tail(result.log, 400).splitlines()))
            wall = time.monotonic() - wall_started
            failed = [r for r in results if not r.ok]
            print(f"== {tier}: slowest steps")
            for result in sorted(results, key=lambda r: -r.seconds)[:10]:
                print(f"     {result.seconds:6.1f}s  {result.step.name}")
            print(f"== {tier}: serial total {cumulative:.1f}s of steps, {wall:.1f}s wall")
            if not only and not rebaseline and total_key is not None:
                total = budgets.get(section, {}).get(total_key)
                hard = budgets.get(section, {}).get(hard_key) if hard_key else None
                if total is None:
                    print(f"{tier}: no {section}.{total_key} in budgets.toml")
                    status = 1
                elif hard is not None and wall > hard * factor:
                    print(f"{tier}: WARNING serial wall time {wall:.1f}s is over the limit "
                          f"{hard * factor:.0f}s")
                elif wall > total * factor:
                    print(f"{tier}: WARNING serial wall time {wall:.1f}s is over its "
                          f"{total * factor:.0f}s budget")
            slow = [r for r in results if r.ok and r.slow]
            if slow and not rebaseline:
                print(f"{tier}: WARNING {len(slow)} step(s) over budget: "
                      + ", ".join(f"{r.step.name} {r.seconds:.1f}s/{r.budget:.0f}s" for r in slow))
            if failed:
                print(f"{tier}: FAILED ({len(failed)} of {len(results)} steps: "
                      f"{', '.join(r.step.name for r in failed)})")
                status = 1
    if rebaseline:
        write_rebaseline(section, timings)
        return status
    if status == 0:
        print(f"{tier}: PASS")
    return status


def write_rebaseline(section: str, timings: dict[str, list[float]]) -> None:
    """Budgets become twice the median of the rounds, rounded up to a whole second
    and at least 3 s. Only this tier's [<section>.steps] table is rewritten; review
    the diff."""
    lines = BUDGETS.read_text().splitlines()
    header = f"[{section}.steps]"
    try:
        start = lines.index(header)
    except ValueError:
        raise SystemExit(f"budgets.toml has no {header} table to rewrite")
    end = start + 1
    while end < len(lines) and not lines[end].startswith("["):
        end += 1
    # Entries for steps this run did not time (another phase, or --only) stay.
    kept = {}
    for line in lines[start + 1:end]:
        if line.startswith('"'):
            kept[line.split('"')[1]] = line
    for name, seconds in timings.items():
        median = statistics.median(seconds)
        kept[name] = (f'"{name}" = {max(3, math.ceil(median * 2))}'
                      f"  # median {median:.1f}s of {len(seconds)}")
    body = list(kept.values()) + [""]
    BUDGETS.write_text("\n".join(lines[:start + 1] + body + lines[end:]) + "\n")
    print(f"rewrote {header} in {BUDGETS.relative_to(ROOT)}")


def common_arguments(parser: argparse.ArgumentParser) -> None:
    parser.add_argument("--compiler", default="build/bin/coil")
    parser.add_argument("--only", action="append",
                        help="run only steps with this name or name/ prefix (repeatable)")
    parser.add_argument("--list", action="store_true", help="print the steps and their budgets")
    parser.add_argument("--verbose", action="store_true")
    parser.add_argument("--rebaseline", type=int, default=0, metavar="N",
                        help="run N rounds and rewrite this tier's budgets from the median")


def list_steps(section: str, steps: list[Step]) -> None:
    budgets = load_budgets().get(section, {}).get("steps", {})
    total = 0.0
    for index, step in enumerate(steps, 1):
        budget = budgets.get(step.name)
        total += budget or 0
        print(f"#{index:<2} {step.name:<28} budget {budget if budget is not None else 'MISSING':>5}"
              f"{'  [quick]' if step.quick else ''}  {shlex.join(step.argv)}")
    print(f"sum of budgets: {total:.0f}s")
