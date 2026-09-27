"""Let a termination signal unwind `with` blocks.

These gates build in temporary directories under the checkout (so a candidate
finds this checkout's library by walking up), cleaned by TemporaryDirectory.
Python cleans those up on an exception or Ctrl-C, but SIGTERM and SIGHUP -- a
gate timeout, a killed parent -- end the process without unwinding, and the
directory is left in the tree. Turning them into SystemExit runs the cleanup.
"""
import signal
import sys


def _exit(signum, _frame):
    raise SystemExit(128 + signum)


def install() -> None:
    for sig in (signal.SIGTERM, signal.SIGHUP):
        signal.signal(sig, _exit)
