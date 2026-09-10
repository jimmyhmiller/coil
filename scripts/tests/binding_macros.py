#!/usr/bin/env python3
"""Behavioral gate for public binding macros and their primitive boundary."""
from pathlib import Path
import os
import subprocess
import sys
import tempfile

ROOT = Path(__file__).resolve().parents[2]
FIX = ROOT / "tests/compiler/binding_macros"
COMPILER = str(Path(sys.argv[1]).resolve())


def run(arguments, *, environment=None, success=True, contains=None, input=None):
    result = subprocess.run([COMPILER, *map(str, arguments)], cwd=ROOT,
                            env=environment, input=input, capture_output=True, text=True)
    output = result.stdout + result.stderr
    if (result.returncode == 0) != success or (contains and contains not in output):
        raise AssertionError(f"{arguments}: exit {result.returncode}\n{output}")
    return result


for name in ("primitive", "public", "destructuring", "nested", "code", "ownership",
             "methods", "closure", "anonymous", "loop_macro", "declaration_bundle",
             "order_views", "ignored_owner", "signatures", "reload", "combined_libraries"):
    run(["run", FIX / f"{name}.coil"])
    print(f"PASS {name}", flush=True)

run(["run", FIX / "arc_closure.coil", "--use", "coil.arc.auto"])
print("PASS ARC closure", flush=True)
entry = run(["run", FIX / "code_entry.coil"], input="(a) (b) (c)\n")
assert entry.stdout.strip() == "[(a) (c)]", entry.stdout
print("PASS Code entry parameter pattern", flush=True)
quoted = run(["run", FIX / "quoted_entry.coil"], input="()\n")
assert quoted.stdout.strip() == "(quote (let [value 42] value))", quoted.stdout
print("PASS quoted binding data", flush=True)

# This helper contains several recovered macros and quoted siblings. A later
# quote must not erase the traversal's record of an earlier expansion.
recovered = run(["run", ROOT / "tests/metaprogramming/compile-and-run/borrowlike_bad.coil"],
                success=False, contains="use after my-free")
assert (recovered.stdout + recovered.stderr).count("error: use after my-free") == 2
print("PASS quoted siblings in parse recovery", flush=True)

errors = {
    "marker": "expected an identifier",
    "duplicate": "duplicate identifier",
    "field": "has no field",
    "field_duplicate": "duplicate constructor field",
    "keyword": "misplaced keyword",
    "literal": "expected an identifier",
    "mut_leaf": "mutable pattern leaves",
    "named": "has no parameter :a",
    "nominal": "constructor pattern requires",
    "nonsequence": "sequence pattern expects",
    "repeated_whole": "repeated whole-value name",
    "rest": "one final suffix pattern",
    "short_array": "more elements than the array contains",
    "short_code": "too few Code elements",
    "whole": "expected an identifier",
    "owning_element": "cannot move an owning element",
    "partial_move": "cannot move an owning field",
}
for name, message in errors.items():
    run(["check", FIX / f"bad_{name}.coil"], success=False, contains=message)
    print(f"PASS rejects {name}", flush=True)
run(["check", FIX / "sequential_macro_shadow.coil"], success=False,
    contains="not callable")

# Shape failure must remain unconditional in an optimized runtime build.
with tempfile.TemporaryDirectory(prefix="coil-binding-test-") as directory:
    binary = Path(directory) / "short"
    run(["build", FIX / "short_slice.coil", "-O3", "-o", binary])
    outcome = subprocess.run([str(binary)], capture_output=True)
    if outcome.returncode == 0:
        raise AssertionError("short slice pattern continued after a failed shape check")

# Native and interpreted macro engines must implement the same Code projections.
for settings in ({"COIL_META_INTERP": "1"}, {"COIL_META_ARENA": "poison"}):
    run(["run", FIX / "code.coil"], environment=os.environ | settings)
print("PASS binding macro gate", flush=True)
