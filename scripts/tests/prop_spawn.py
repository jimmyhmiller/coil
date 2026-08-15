#!/usr/bin/env python3
"""Does a property survive a test binary that has THREADS in it?

`coil test` runs each test in its own process, and a `defprop` inside that test
runs its cases in a process of its own again — nested isolation. Both used to be
`fork()`. fork in a process with more than one thread hands the child an address
space whose locks are held by threads that do not exist in it, so the child
DEADLOCKS on its first call into whatever owns one, or is SIGKILLed by libSystem's
atfork handler on macOS. The test runner learned this first and moved to
posix_spawn; the property runner kept forking, which put the hazard back one level
down and made it worse:

  * the watchdog turns the child's deadlock into `TIMED OUT ... on case 0`, so the
    tool reports a bug in a property that is perfectly true;
  * the reported counterexample is whatever case 0 happened to draw, so the
    "reproduction" reproduces nothing;
  * `--no-fork` makes it disappear, which reads as "property testing is flaky"
    rather than as one specific, fixable thing.

None of this is exotic. A test binary that links a Go c-archive, CoreFoundation, a
sanitizer runtime, or anything else that starts a thread at load time is in exactly
this position, and none of it is under the runner's control.

THE FIXTURE. `rt.c` is a stand-in for such a runtime: a background thread started
from a constructor holds a mutex most of the time, and the one entry point takes
that mutex. A forked child inherits the lock held by a thread that no longer
exists; a spawned one gets a fresh process image and does not care.

Two directions are asserted, because a fix that isolates less is not a fix:

  1. A property that ALWAYS HOLDS must pass. (Forking: `TIMED OUT on case 0`.)
  2. A property that CRASHES must still bisect to the crashing case and shrink to
     the minimal input — the crash path spawns a process per candidate, and that
     is the same hazard again, several hundred times over.

    python3 scripts/tests/prop_spawn.py --coil build/bin/coil
"""
import argparse, os, pathlib, shutil, subprocess, sys, tempfile

RUNTIME_C = """
#include <pthread.h>
#include <unistd.h>

/* A stand-in for a linked language runtime: a thread started before main owns a
   lock that every entry point takes, and holds it most of the time — so a fork()
   lands inside the held window with near-certainty. */
static pthread_mutex_t m = PTHREAD_MUTEX_INITIALIZER;

static void *worker(void *arg) {
  (void)arg;
  for (;;) {
    pthread_mutex_lock(&m);
    usleep(2000);
    pthread_mutex_unlock(&m);
    usleep(50);
  }
  return 0;
}

__attribute__((constructor))
static void rt_init(void) {
  pthread_t t;
  pthread_create(&t, 0, worker, 0);
}

long rt_call(long x) {
  pthread_mutex_lock(&m);
  long r = x + 1;
  pthread_mutex_unlock(&m);
  return r;
}
"""

HOLDS = """(module spawn-holds-probe)
(import "coil.primitive" :as primitive)
(import "coil.prop" :use *)
(import "coil.assert" :use *)

(extern rt_call :cc c [i64] (-> i64))

;; True for every input. Any failure reported here is the runner's, not the
;; property's — and under a forking runner every run reports one.
(defprop runtime-increments [(n i64)]
  (= (rt_call n) (primitive/iadd n 1)))
"""

CRASHES = """(module spawn-crash-probe)
(import "coil.primitive" :as primitive)
(import "coil.prop" :use *)
(import "coil.assert" :use *)

(extern rt_call :cc c [i64] (-> i64))
(extern abort :cc c [] (-> i64))

;; Crashes for anything past 1000, so the minimal crashing input is exactly 1001.
;; The runtime call is in the body on purpose: every bisection probe and every
;; shrink candidate is a fresh process that has to reach it.
(defprop no-big-values [(n i64)]
  (if (> (rt_call n) 1001) (do (abort) true) true))
"""


def check(condition: bool, message: str) -> None:
    if not condition:
        raise SystemExit(f"prop-spawn gate FAIL — {message}")


def main() -> int:
    ap = argparse.ArgumentParser()
    ap.add_argument("--coil", default="build/bin/coil")
    args = ap.parse_args()
    coil = str(pathlib.Path(args.coil).resolve())

    cc = os.environ.get("CC") or shutil.which("cc")
    check(cc is not None and shutil.which("ar") is not None,
          "no `cc`/`ar` to build the threaded fixture with; this gate cannot run")

    with tempfile.TemporaryDirectory(prefix="coil-prop-spawn-") as td:
        tmp = pathlib.Path(td)
        (tmp / "rt.c").write_text(RUNTIME_C)
        build = subprocess.run([cc, "-c", str(tmp / "rt.c"), "-o", str(tmp / "rt.o")],
                               capture_output=True, text=True)
        check(build.returncode == 0, f"could not compile the threaded fixture:\n{build.stderr}")
        ar = subprocess.run(["ar", "rcs", str(tmp / "librt.a"), str(tmp / "rt.o")],
                            capture_output=True, text=True)
        check(ar.returncode == 0, f"could not archive the threaded fixture:\n{ar.stderr}")

        def run(src: pathlib.Path, db: pathlib.Path, *extra):
            return subprocess.run(
                [coil, "test", str(src), "--link-flag", str(tmp / "librt.a"), *extra],
                cwd=tmp, env={**os.environ, "COIL_PBT_DB": str(db)},
                capture_output=True, text=True, timeout=600)

        # ---- 1. a true property must pass ---------------------------------
        holds = tmp / "holds_test.coil"
        holds.write_text(HOLDS)
        # --timeout 5 so a runner that deadlocks says so in seconds rather than
        # after the default minute.
        ok = run(holds, tmp / "db-holds", "--cases", "20", "--timeout", "5")
        check(ok.returncode == 0 and "FAILED" not in ok.stdout,
              "a property that holds for every input failed against a test binary that "
              "has threads. That is the runner's process handling, not the property: a "
              "forked child inherits the runtime's lock without its owner and hangs "
              f"until the watchdog kills it.\n{ok.stdout}\n{ok.stderr}")

        # ---- 2. crash bisection + shrinking must still work ---------------
        crashes = tmp / "crash_test.coil"
        crashes.write_text(CRASHES)
        bad = run(crashes, tmp / "db-crash", "--cases", "300")
        check(bad.returncode != 0 and "CRASHED" in bad.stdout,
              f"a property that aborts was not reported as a crash:\n{bad.stdout}\n{bad.stderr}")
        check("n = 1001" in bad.stdout,
              "the crash was not minimized to its smallest input (n = 1001). Every "
              "shrink candidate runs in its own process against the threaded runtime, "
              f"so this is where a candidate that cannot start shows up:\n{bad.stdout}")

    print("prop-spawn gate: PASS")
    return 0


if __name__ == "__main__":
    sys.exit(main())
