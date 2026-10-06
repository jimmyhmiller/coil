#!/usr/bin/env python3
"""Aggregate copy lowering and semantic declaration-index regressions."""
from pathlib import Path
import re
import subprocess
import sys

ROOT = Path(__file__).resolve().parents[2]
COMPILER = Path(sys.argv[1]).resolve()


def invoke(*args):
    result = subprocess.run([str(COMPILER), *args], cwd=ROOT,
                            capture_output=True, text=True, timeout=180)
    assert result.returncode == 0, (args, result.returncode, result.stdout, result.stderr)
    return result.stdout


source = "tests/compiler/features/aggregate_spill_snapshot.coil"
for level in ("-O0", "-O3"):
    invoke("run", source, level)
ir = invoke("emit-ir", source)
assert "target datalayout" in ir, ir
snapshot = re.search(r"define[^\n]*@test\.aggregate-spill-snapshot\.snapshot\([^\n]*\)\s*\{(.*?)\n\}", ir, re.S)
assert snapshot, "snapshot function missing from emitted IR"
body = snapshot.group(1)
assert "@llvm.memcpy." in body and "i64 6144" in body, body
assert not re.search(r"(?:load|store) \[128 x", body), body
assert body.index("@llvm.memcpy.") < body.index("@test.aggregate-spill-snapshot.replace-and-index"), body
copy_source = "tests/compiler/features/aggregate_store_copy.coil"
for level in ("-O0", "-O3"):
    invoke("run", copy_source, level)
copy_ir = invoke("emit-ir", copy_source)
assert "target datalayout" in copy_ir, copy_ir
copy = re.search(r"define[^\n]*@test\.aggregate-store-copy\.copy-block\([^\n]*\)\s*\{(.*?)\n\}", copy_ir, re.S)
assert copy, "copy-block function missing from emitted IR"
assert "@llvm.memmove." in copy.group(1) and "i64 16384" in copy.group(1), copy.group(1)
assert not re.search(r"(?:load|store) %test\.aggregate-store-copy\.Block", copy.group(1)), copy.group(1)
items = re.search(r"define[^\n]*@test\.aggregate-store-copy\.copy-items\([^\n]*\)\s*\{(.*?)\n\}", copy_ir, re.S)
assert items and "@llvm.memmove." in items.group(1), "array assignment must use an overlap-safe bulk copy"
assert not re.search(r"(?:load|store) \[2048 x", items.group(1)), items.group(1)
result_source = "tests/compiler/features/aggregate_call_result_copy.coil"
for level in ("-O0", "-O3"):
    invoke("run", result_source, level)
result_ir = invoke("emit-ir", result_source)
assert "target datalayout" in result_ir, result_ir
for name in ("make-block", "forward", "store-result", "hold", "pass-result", "reuse"):
    fn = re.search(r"define[^\n]*@test\.aggregate-call-result-copy\." + re.escape(name)
                   + r"\([^\n]*\)\s*\{(.*?)\n\}", result_ir, re.S)
    assert fn, f"{name} missing from emitted IR"
    assert not re.search(r"store (?:%test\.aggregate-call-result-copy\.Block|\[4096 x i8\]) %", fn.group(1)), \
        (name, "a big call result must be copied as memory, not stored as an LLVM aggregate", fn.group(1))
    if name != "reuse":
        assert re.search(r"@llvm\.mem(?:cpy|move)\.[^\n]*i64 4096", fn.group(1)), (name, fn.group(1))
    # A whole-struct load left unused reads to SROA as a typed access to every
    # field, which splits each copy of that struct into one load/store per field.
    assert not re.search(r"= load (?:%test\.aggregate-call-result-copy\.(?:Block|Holder)|\[4096 x i8\]),", fn.group(1)), \
        (name, "no unused aggregate load may survive emission", fn.group(1))
invoke("run", "tests/compiler/features/declaration_index.coil")
invoke("run", "tests/compiler/features/syntax_accessors.coil")
print("PASS: aggregate snapshots, assignments, and big call results preserve evaluation order, overlap, and self-assignment with bulk copies; declaration indexes preserve exact, ambiguous, missing, growing, and republished model queries")
