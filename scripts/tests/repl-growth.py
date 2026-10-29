#!/usr/bin/env python3
"""Measure how `coil repl` grows with the number of accepted submissions.

    repl-growth.py [COMPILER] [--submissions N] [--max-rss-slope-kb K]
                   [--max-time-slope-ms T] [--max-env-slope-kb E] [--rss-cap-mb M]

Submits N forms, alternating a new `defn` and a call to it, and samples the
REPL's resident set and the wall time of each submission once its answer is
printed. Reports the slope of each over the second half of the run (the first
half includes warm-up: the first call of each kind JIT-links library code). The
resident-size slope is that of the least resident size in each window of 16
submissions, which steps over the compaction of the session's state.

Then it runs the same submissions again under COIL_TRACE, which makes the
session report after every accept what each account of compiler memory holds
(`memory.unit`, `memory.env.pool`, `memory.jit.images`, …, the same tree `:memory`
prints) and how many bytes the compiler state it serves owns
(`memory.env.owned`), and reports the slope of each: what grows, named by
whoever holds it.

It fails only on what is asked: `--max-rss-slope-kb`, `--max-time-slope-ms` and
`--max-env-slope-kb` (what the compiler state owns) bound the slopes.
`--rss-cap-mb` stops the run (and fails) before a growing session can take the
machine down.
"""
import argparse
import os
import re
import tempfile
from pathlib import Path
import subprocess
import sys
import time

ROOT = Path(__file__).resolve().parents[2]
sys.path.insert(0, str(Path(__file__).resolve().parent))
import cleanup_on_signal  # noqa: E402
cleanup_on_signal.install()

PROMPT = b"coil> "


def rss_kb(pid: int) -> int:
    out = subprocess.run(["ps", "-o", "rss=", "-p", str(pid)],
                         capture_output=True, text=True, check=True).stdout
    return int(out.strip())


def read_until_prompt(stream) -> bytes:
    """Read the REPL's answer up to and including its next prompt."""
    buf = bytearray()
    while not buf.endswith(PROMPT):
        b = stream.read1(4096) if hasattr(stream, "read1") else stream.read(1)
        if not b:
            raise AssertionError(f"repl exited; output so far:\n{buf.decode(errors='replace')}")
        buf += b
    return bytes(buf)


def slope(ys: list[float]) -> float:
    """Least-squares slope of ys against 0..n-1."""
    n = len(ys)
    mx = (n - 1) / 2
    my = sum(ys) / n
    num = sum((i - mx) * (y - my) for i, y in enumerate(ys))
    den = sum((i - mx) ** 2 for i in range(n))
    return num / den if den else 0.0


def main() -> int:
    p = argparse.ArgumentParser()
    p.add_argument("compiler", nargs="?", default=os.environ.get("COIL", "coil"))
    p.add_argument("--submissions", type=int, default=40)
    p.add_argument("--max-rss-slope-kb", type=float)
    p.add_argument("--max-time-slope-ms", type=float)
    p.add_argument("--max-env-slope-kb", type=float)
    p.add_argument("--rss-cap-mb", type=int, default=3072)
    args = p.parse_args()

    proc = subprocess.Popen([args.compiler, "repl"], cwd=ROOT,
                            stdin=subprocess.PIPE, stdout=subprocess.PIPE,
                            stderr=subprocess.DEVNULL)
    rss: list[int] = []
    times: list[float] = []
    try:
        read_until_prompt(proc.stdout)
        for i in range(args.submissions):
            form = submission(i)
            start = time.perf_counter()
            proc.stdin.write(form.encode() + b"\n")
            proc.stdin.flush()
            answer = read_until_prompt(proc.stdout)[:-len(PROMPT)].decode(errors="replace")
            times.append((time.perf_counter() - start) * 1000)
            want = "; ok" if i % 2 == 0 else str(i // 2 + 1)
            if answer.strip() != want:
                print(f"submission {i} ({form}) answered {answer.strip()!r}, wanted {want!r}")
                return 1
            rss.append(rss_kb(proc.pid))
            if rss[-1] > args.rss_cap_mb * 1024:
                print(f"stopped at submission {i}: RSS {rss[-1] // 1024} MB is over the "
                      f"{args.rss_cap_mb} MB cap")
                return 1
    finally:
        proc.kill()
        proc.wait()

    accounts = account_slopes(args)
    if accounts is None:
        return 1

    half = len(rss) // 2
    # The session's state lives in a pool that is compacted every few
    # submissions, so resident size is a sawtooth. Its floor -- the least of
    # each window of submissions -- is what the session keeps.
    window = 16
    floors = [float(min(rss[i:i + window])) for i in range(half, len(rss) - window + 1, window)]
    rss_slope = slope(floors) / window if len(floors) > 1 else slope([float(r) for r in rss[half:]])
    time_slope = slope(times[half:])
    print(f"submissions: {len(rss)}")
    print(f"rss: first {rss[0] // 1024} MB, last {rss[-1] // 1024} MB, "
          f"slope {rss_slope:.0f} KB/submission (floor of each {window} submissions, second half)")
    print(f"time: first {times[0]:.1f} ms, median {sorted(times)[len(times) // 2]:.1f} ms, "
          f"last {times[-1]:.1f} ms, slope {time_slope:.2f} ms/submission (second half)")
    for name, (first, last, per) in accounts.items():
        print(f"{name}: first {first // 1024} KB, last {last // 1024} KB, "
              f"slope {per / 1024:.1f} KB/submission (second half)")
    failed = False
    if args.max_rss_slope_kb is not None and rss_slope > args.max_rss_slope_kb:
        print(f"FAIL: RSS slope {rss_slope:.0f} KB is over {args.max_rss_slope_kb:.0f} KB")
        failed = True
    if args.max_time_slope_ms is not None and time_slope > args.max_time_slope_ms:
        print(f"FAIL: time slope {time_slope:.2f} ms is over {args.max_time_slope_ms:.2f} ms")
        failed = True
    env_slope = accounts.get("memory.env.owned", (0, 0, 0.0))[2] / 1024
    if args.max_env_slope_kb is not None and env_slope > args.max_env_slope_kb:
        print(f"FAIL: the compiler state grows {env_slope:.1f} KB a submission, over {args.max_env_slope_kb:.1f} KB")
        failed = True
    return 1 if failed else 0


def submission(i: int) -> str:
    k = i // 2
    return (f"(defn grow{k} [(x i64)] (-> i64) (+ x {k}))" if i % 2 == 0
            else f"(grow{k} 1)")


def account_slopes(args) -> dict[str, tuple[int, int, float]] | None:
    """Each memory.* count the session traces after an accept: first, last and
    slope per submission over the second half. None when the traced session
    went over the RSS cap (it is stopped there, like the first)."""
    env = dict(os.environ, COIL_TRACE="1")
    with tempfile.TemporaryFile() as trace:
        proc = subprocess.Popen([args.compiler, "repl"], cwd=ROOT, env=env,
                                stdin=subprocess.PIPE, stdout=subprocess.PIPE, stderr=trace)
        try:
            read_until_prompt(proc.stdout)
            for i in range(args.submissions):
                proc.stdin.write(submission(i).encode() + b"\n")
                proc.stdin.flush()
                read_until_prompt(proc.stdout)
                resident = rss_kb(proc.pid)
                if resident > args.rss_cap_mb * 1024:
                    print(f"stopped the traced run at submission {i}: RSS {resident // 1024} MB "
                          f"is over the {args.rss_cap_mb} MB cap")
                    return None
        finally:
            proc.kill()
            proc.wait()
        trace.seek(0)
        series: dict[str, list[int]] = {}
        for line in trace.read().decode(errors="replace").splitlines():
            m = re.match(r"coil-trace count (memory\.\S+) (-?\d+)$", line)
            if m:
                series.setdefault(m[1], []).append(int(m[2]))
    out = {}
    for name, ys in sorted(series.items()):
        half = len(ys) // 2
        out[name] = (ys[0], ys[-1], slope([float(y) for y in ys[half:]]) if len(ys) - half > 1 else 0.0)
    return out


if __name__ == "__main__":
    sys.exit(main())
