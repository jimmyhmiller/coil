#!/usr/bin/env python3
"""Mutation testing for tests/prop/stdlib_props_test.coil.

Injects one bug at a time into a COPY of the stdlib and runs the suite. A
mutation that nothing catches is a coverage hole in the property suite.
"""
import os, shutil, subprocess, sys

MR = "/private/tmp/claude-501/-Users-jimmyhmiller-Documents-Code-projects-coil/37eccc5b-d0f3-4c26-bf3b-5c1f2feefe0f/scratchpad/mutroot"
SRC = "/Users/jimmyhmiller/Documents/Code/projects/coil/.claude/worktrees/property-testing"

MUTATIONS = [
    ("al-slice reports len+1 (capacity slack leaks into the view)", "arraylist.coil",
     "(slice-new (load (field l data)) (load (field l len))))",
     "(slice-new (load (field l data)) (primitive/iadd (load (field l len)) 1)))"),

    ("al-extend! copies n-1 elements (silently drops the last)", "arraylist.coil",
     "(mem-copy [T] (primitive/index (load (field l data)) old) src n)",
     "(mem-copy [T] (primitive/index (load (field l data)) old) src (primitive/isub n 1))"),

    ("al-pop! returns the value but never shrinks len", "arraylist.coil",
     "(store! (field l len) (primitive/isub n 1))\n          (Some v)",
     "(Some v)"),

    ("str-find skips index 0 (never reports a match at the start)", "str.coil",
     "(str-find-from hay needle 0))", "(str-find-from hay needle 1))"),

    ("str-trim forgets the trailing-whitespace pass", "str.coil",
     "(loop (if (and (< (load lo) (load hi)) (str-ws? (slice-get s (primitive/isub (load hi) 1))))\n              (store! hi (primitive/isub (load hi) 1))\n              (break)))",
     ""),

    ("hm-remove! marks the slot EMPTY instead of a tombstone (breaks probe chains)",
     "hashmap.coil", "(store! (field e state) 2)  ; tombstone", "(store! (field e state) 0)"),

    ("hm-remove! forgets to decrement len", "hashmap.coil",
     "(store! (field m len) (primitive/isub (load (field m len)) 1))\n                              (store! (field m tombs)",
     "(store! (field m tombs)"),

    # The "rejects invalid input" half of str-parse-int-agrees-with-hand-parser:
    # stop at the first non-digit and return what was accumulated, instead of
    # rejecting. "12x" would parse as 12.
    ("str-parse-int accepts a numeric PREFIX instead of rejecting trailing junk",
     "str.coil", "(do (store! ok false) (break))", "(break)"),

    # A lone "-" becomes valid and parses as 0.
    ("str-parse-int accepts a lone '-' as 0", "str.coil",
     "(mut ok) (< (if neg 1 0) n)]", "(mut ok) true]"),
]


def run(file, frm, to):
    dst = os.path.join(MR, "src/stdlib", file)
    orig = open(os.path.join(SRC, "src/stdlib", file)).read()
    if frm not in orig:
        return None, "PATTERN NOT FOUND"
    open(dst, "w").write(orig.replace(frm, to, 1))
    env = dict(os.environ, COIL_STDLIB_DIR=MR, COIL_PBT_SEED="424242")
    p = subprocess.run(["coil", "test", "tests/prop/stdlib_props_test.coil"],
                       cwd=SRC, env=env, capture_output=True, text=True, timeout=600)
    out = p.stdout + p.stderr
    open(dst, "w").write(orig)
    return out, None


for name, file, frm, to in MUTATIONS:
    out, err = run(file, frm, to)
    print("== " + name)
    if err:
        print("   " + err)
        continue
    result = [l for l in out.splitlines() if l.startswith("test result:")]
    lines = out.splitlines()
    killers = []
    for i, l in enumerate(lines):
        if "FAILED after" in l or "FAILED (" in l:
            for j in range(i, -1, -1):
                if lines[j].startswith("test ") and "..." in lines[j]:
                    killers.append(lines[j].split()[1])
                    break
    killers = sorted(set(killers))
    if not result:
        print("   COMPILE ERROR / no result:")
        print("   " + "\n   ".join(out.strip().splitlines()[:6]))
        continue
    print("   " + result[0])
    print("   killed by: " + (", ".join(killers) if killers else "*** NOTHING — COVERAGE HOLE ***"))
