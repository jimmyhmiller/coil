#!/usr/bin/env python3
"""Revert the print-i fix in a stdlib COPY and confirm the suite catches it.

If the restored sexp-i64-roundtrips-every-value property is a real regression
test, reintroducing the original bug must turn the suite red.
"""
import os, shutil, subprocess

MR = "/private/tmp/claude-501/-Users-jimmyhmiller-Documents-Code-projects-coil/37eccc5b-d0f3-4c26-bf3b-5c1f2feefe0f/scratchpad/mutroot"
SRC = "/Users/jimmyhmiller/Documents/Code/projects/coil/.claude/worktrees/property-testing"

# refresh the snapshot so it carries the fix
shutil.rmtree(os.path.join(MR, "src"))
shutil.copytree(os.path.join(SRC, "src"), os.path.join(MR, "src"))

FRM = "(Ok [_] (print-u w (primitive/isub 0 n))))"
TO = "(Ok [_] (print-int w (primitive/isub 0 n))))"

path = os.path.join(MR, "src/stdlib/fmt.coil")
orig = open(path).read()
assert FRM in orig, "fixed print-i not found"
open(path, "w").write(orig.replace(FRM, TO, 1))

for seed in (1, 2, 3, 4, 5):
    env = dict(os.environ, COIL_STDLIB_DIR=MR, COIL_PBT_SEED=str(seed))
    p = subprocess.run(["coil", "test", "tests/prop/stdlib_props_test.coil"],
                       cwd=SRC, env=env, capture_output=True, text=True, timeout=600)
    out = p.stdout + p.stderr
    lines = out.splitlines()
    killers = set()
    for i, l in enumerate(lines):
        if "FAILED after" in l:
            for j in range(i, -1, -1):
                if lines[j].startswith("test ") and "..." in lines[j]:
                    killers.add(lines[j].split()[1]); break
    res = [l for l in lines if l.startswith("test result:")]
    print(f"seed {seed}: {res[0] if res else out.strip()[:80]}")
    print(f"         caught by: {', '.join(sorted(killers)) or '*** NOTHING — REGRESSION WOULD SLIP THROUGH ***'}")

open(path, "w").write(orig)
