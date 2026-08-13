#!/usr/bin/env python3
"""Does `--no-fork` reach the REUSE phase, not just generation?

The property runner has two phases that can run a property body, and the reuse
phase runs first. While a saved counterexample exists it is the ONLY phase that
runs, so a `--no-fork` that gated generation alone was, in the common case,
completely inert — and inert in a way that reads as bugs in other features:

  * a property under a debugger never stopped in the debugger, because the body
    was still executing in a forked child;
  * `--seed` appeared to be ignored, because the seed steers generation and
    generation was never reached.

Both were reported as separate problems before the cause was found. That is what
this test exists to prevent recurring.

THE OBSERVABLE. `prop-run` prints "(replaying the saved counterexample)" only
AFTER the replay returns. With a saved CRASHING input:

  forking    the child dies, the parent survives to print the line and minimize
  --no-fork  the crash takes this process down inside the replay, so the line
             never prints

So the line's presence is a direct read on which process ran the body. Asserted in
both directions, plus two guards that the change did not over-apply: an ordinary
(non-crashing) saved failure must still replay and report under `--no-fork`, and a
passing property must still pass.

    python3 scripts/tests/prop_nofork.py --coil build/bin/coil
"""
import argparse, os, pathlib, subprocess, sys, tempfile

CRASHER = """(module nofork-crash-probe)
(import "coil.primitive" :as primitive)
(import "coil.prop" :use *)
(import "coil.assert" :use *)

(extern abort :cc c [] (-> i64))

;; Aborts on ~1% of values, so 300 cases find one with near-certainty.
(defprop crashes-on-a-value [(n i64)]
  (if (> (primitive/irem (if (< n 0) (primitive/isub 0 n) n) 1000) 990)
      (do (abort) true)
      true))
"""

FALSIFIER = """(module nofork-false-probe)
(import "coil.primitive" :as primitive)
(import "coil.prop" :use *)
(import "coil.assert" :use *)

;; Returns false rather than crashing: the process survives either way, so the
;; replay must still report under --no-fork.
(defprop fails-on-a-value [(n i64)]
  (<= (primitive/irem (if (< n 0) (primitive/isub 0 n) n) 1000) 990))
"""

PASSER = """(module nofork-pass-probe)
(import "coil.primitive" :as primitive)
(import "coil.prop" :use *)
(import "coil.assert" :use *)

(defprop always-holds [(n i64)]
  (= n n))
"""

REPLAY_LINE = "replaying the saved counterexample"


def check(condition: bool, message: str) -> None:
    if not condition:
        raise SystemExit(f"prop-nofork gate FAIL — {message}")


def main() -> int:
    ap = argparse.ArgumentParser()
    ap.add_argument("--coil", default="build/bin/coil")
    args = ap.parse_args()
    coil = str(pathlib.Path(args.coil).resolve())

    with tempfile.TemporaryDirectory(prefix="coil-prop-nofork-") as td:
        tmp = pathlib.Path(td)

        def run(src: pathlib.Path, db: pathlib.Path, *extra):
            return subprocess.run(
                [coil, "test", str(src), "--cases", "300", *extra],
                cwd=tmp, env={**os.environ, "COIL_PBT_DB": str(db)},
                capture_output=True, text=True)

        # ---- a saved CRASH: the observable case ----------------------------
        crasher = tmp / "crash_test.coil"
        crasher.write_text(CRASHER)
        db = tmp / "db-crash"

        seed_run = run(crasher, db)
        saved = db / "crashes-on-a-value" / "failing"
        check(saved.is_file(),
              f"no counterexample was saved to {saved}, so the reuse phase has "
              f"nothing to replay and this gate would test nothing:\n{seed_run.stdout}")

        forked = run(crasher, db)
        check(REPLAY_LINE in forked.stdout,
              "the forking replay did not survive a saved crash to report it; the "
              f"reuse phase itself is broken:\n{forked.stdout}")

        nofork = run(crasher, db, "--no-fork")
        check(REPLAY_LINE not in nofork.stdout,
              "--no-fork still forked the REUSE phase: the saved crash was caught by "
              "a child instead of taking this process down. The flag gates generation "
              f"only, which is inert whenever a counterexample is saved:\n{nofork.stdout}")

        # ---- guards: the change must not over-apply ------------------------
        falsifier = tmp / "false_test.coil"
        falsifier.write_text(FALSIFIER)
        db2 = tmp / "db-false"
        run(falsifier, db2)
        check((db2 / "fails-on-a-value" / "failing").is_file(),
              "a falsifying property saved no counterexample")
        replayed = run(falsifier, db2, "--no-fork")
        check(REPLAY_LINE in replayed.stdout,
              "an ordinary (non-crashing) saved failure stopped being replayed under "
              f"--no-fork; only a CRASH should end the process:\n{replayed.stdout}")

        passer = tmp / "pass_test.coil"
        passer.write_text(PASSER)
        ok = run(passer, tmp / "db-pass", "--no-fork")
        check(ok.returncode == 0 and "FAILED" not in ok.stdout,
              f"a passing property no longer passes under --no-fork:\n{ok.stdout}")

    print("prop-nofork gate: PASS")
    return 0


if __name__ == "__main__":
    sys.exit(main())
