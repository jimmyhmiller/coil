#!/usr/bin/env python3
"""Does `coil lint --fix` still DO anything?

One question, deliberately narrow: given a file the modernization checker is
guaranteed to have findings in, does --fix change it at all?

WHY THIS EXISTS AS ITS OWN CHECK. `modernize-fast` already covers this, but it
builds with `--backend arm64`, which on Linux emits Mach-O that GNU ld cannot
link — so that gate is red on Linux for a reason unrelated to linting. When the
checkers were silently disabled (every module with an `import` was skipped, so
`lint --fix` reported success and changed nothing), the new failure had nowhere
to appear: on Linux it hid behind the known red, and on macOS nobody had run it.
A gate that cannot distinguish its own failure modes did not fail to detect the
bug — it detected it and the signal was unreadable.

So this asks ONE thing, on the host backend, and can only fail for one reason.

    python3 scripts/tests/lint_fires.py --coil build/bin/coil
"""
import argparse, pathlib, subprocess, sys, tempfile

# Every construct here has a modern spelling the checker suggests. The `import`
# matters: the bug only appeared for modules that had one.
PROBE = """(module lint-fires-probe)
(import "coil.primitive" :as primitive)
(defn main [] (-> i64)
  (let [(mut x) 0]
    (primitive/store! x 2)
    (if (primitive/icmp-ge (primitive/load x) 2) 0 1)))
"""

def main() -> int:
    ap = argparse.ArgumentParser()
    ap.add_argument("--coil", default="build/bin/coil")
    args = ap.parse_args()

    with tempfile.TemporaryDirectory() as td:
        probe = pathlib.Path(td) / "probe.coil"
        probe.write_text(PROBE)
        proc = subprocess.run(
            [args.coil, "lint", str(probe), "--fix"],
            capture_output=True, text=True, timeout=300)
        after = probe.read_text()

    if after == PROBE:
        print("gate-lint-fires: FAIL — `lint --fix` left the file byte-identical")
        print(f"  exit={proc.returncode} (a silent success is the failure being tested for)")
        print("  the checkers are not firing; see mz-user-module? in src/stdlib/modernize.coil")
        return 1

    # It changed something — confirm it changed the RIGHT things, so a fix that
    # merely perturbs the file cannot pass. Since the place-syntax transition
    # (aa550b5) the modern spelling of a store is `set!`, not `store!`.
    missing = [s for s in ("(set! x 2)", "(load x)") if s not in after]
    if "primitive/icmp-ge" in after or "primitive/store!" in after or missing:
        print("gate-lint-fires: FAIL — rewrote, but not into the expected modern spellings")
        print(f"  missing={missing}")
        print(after)
        return 1

    print("gate-lint-fires: PASS (checkers fire and rewrite to the modern spellings)")
    return 0

if __name__ == "__main__":
    sys.exit(main())
