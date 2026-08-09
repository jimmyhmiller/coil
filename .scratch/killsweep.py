#!/usr/bin/env python3
"""Is the lone-'-' mutation killed on EVERY seed, or only some?

Compares the old property (random (slice u8)) against the new alphabet-shaped
one by running the mutated stdlib under a dozen seeds.
"""
import os, subprocess

MR = "/private/tmp/claude-501/-Users-jimmyhmiller-Documents-Code-projects-coil/37eccc5b-d0f3-4c26-bf3b-5c1f2feefe0f/scratchpad/mutroot"
SRC = "/Users/jimmyhmiller/Documents/Code/projects/coil/.claude/worktrees/property-testing"
FILE, FRM, TO = "str.coil", "(mut ok) (< (if neg 1 0) n)]", "(mut ok) true]"

orig = open(os.path.join(SRC, "src/stdlib", FILE)).read()
dst = os.path.join(MR, "src/stdlib", FILE)
open(dst, "w").write(orig.replace(FRM, TO, 1))

killed_by_old = killed_by_new = 0
seeds = list(range(1, 13))
for s in seeds:
    env = dict(os.environ, COIL_STDLIB_DIR=MR, COIL_PBT_SEED=str(s))
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
    old = "str-parse-int-agrees-with-hand-parser" in killers
    new = "str-parse-int-grammar-over-numeric-alphabet" in killers
    killed_by_old += old
    killed_by_new += new
    print(f"seed {s:2}: old-property={'KILL' if old else 'miss'}  new-property={'KILL' if new else 'miss'}")

open(dst, "w").write(orig)
n = len(seeds)
print(f"\nlone-'-' bug caught by the ORIGINAL property: {killed_by_old}/{n} seeds")
print(f"lone-'-' bug caught by the NEW alphabet property: {killed_by_new}/{n} seeds")
