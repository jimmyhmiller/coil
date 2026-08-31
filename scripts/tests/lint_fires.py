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
        print("  the checkers are not firing; see mz-user-module? in src/stdlib/lints/modernize.coil")
        return 1

    # It changed something — confirm it changed the RIGHT things, so a fix that
    # merely perturbs the file cannot pass.
    # `set!`, not `store!`: modernize rewrites `primitive/store!` to the bare
    # `store!`, and field_syntax_lint then rewrites that to the generalized
    # `set!` ("use generalized `set!` instead of the low-level store primitive").
    # Both rounds have to land, which is what makes this a useful check -- so
    # `primitive/store!` surviving the fix is itself a failure, not just an
    # absent `set!`.
    missing = [s for s in ("(set! x 2)", "(load x)") if s not in after]
    if "primitive/icmp-ge" in after or "primitive/store!" in after or missing:
        print("gate-lint-fires: FAIL — rewrote, but not into the expected modern spellings")
        print(f"  missing={missing}")
        print(after)
        return 1

    # A source column is not an indentation budget. Generated/minified input can
    # place a fixable form extremely far into one physical line; when that form
    # wraps, continuation padding must stay bounded instead of repeating the source
    # column for every new line. This used to turn the 4 MB Doom frontend output
    # into 55 MB (52 MB of spaces) and drive lint into tens of gigabytes of memory.
    with tempfile.TemporaryDirectory() as td:
        deep = pathlib.Path(td) / "deep-column.coil"
        deep_before = (
            '(module lint-deep-column)\n'
            '(import "coil.primitive" :as primitive)\n'
            '(defn main [] (-> bool)\n'
            + (' ' * 200_000)
            + '(primitive/icmp-ne 1 2))\n'
        )
        deep.write_text(deep_before)
        deep_proc = subprocess.run(
            [args.coil, "lint", str(deep), "--fix"],
            capture_output=True, text=True, timeout=300)
        deep_after = deep.read_text()

    if deep_proc.returncode != 0 or "primitive/icmp-ne" in deep_after:
        print("gate-lint-fires: FAIL — deep-column fix did not complete")
        print(f"  exit={deep_proc.returncode}")
        print(deep_proc.stderr)
        return 1
    if len(deep_after) > len(deep_before) + 1024:
        print("gate-lint-fires: FAIL — deep-column fix emitted unbounded continuation padding")
        print(f"  before={len(deep_before)} bytes, after={len(deep_after)} bytes")
        return 1

    print("gate-lint-fires: PASS (checkers fire; deep-column layout stays bounded)")
    return 0

if __name__ == "__main__":
    sys.exit(main())
