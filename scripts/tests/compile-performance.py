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
snapshot = re.search(r"define[^\n]*@test\.aggregate-spill-snapshot\.snapshot\([^\n]*\)[^\n{]*\{(.*?)\n\}", ir, re.S)
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
copy = re.search(r"define[^\n]*@test\.aggregate-store-copy\.copy-block\([^\n]*\)[^\n{]*\{(.*?)\n\}", copy_ir, re.S)
assert copy, "copy-block function missing from emitted IR"
assert "@llvm.memmove." in copy.group(1) and "i64 16384" in copy.group(1), copy.group(1)
assert not re.search(r"(?:load|store) %test\.aggregate-store-copy\.Block", copy.group(1)), copy.group(1)
items = re.search(r"define[^\n]*@test\.aggregate-store-copy\.copy-items\([^\n]*\)[^\n{]*\{(.*?)\n\}", copy_ir, re.S)
assert items and "@llvm.memmove." in items.group(1), "array assignment must use an overlap-safe bulk copy"
assert not re.search(r"(?:load|store) \[2048 x", items.group(1)), items.group(1)
result_source = "tests/compiler/features/aggregate_call_result_copy.coil"
for level in ("-O0", "-O3"):
    invoke("run", result_source, level)
result_ir = invoke("emit-ir", result_source)
assert "target datalayout" in result_ir, result_ir
def function_body(ir, prefix, name):
    fn = re.search(r"define[^\n]*@" + re.escape(prefix + name) + r"\([^\n]*\)[^\n{]*\{(.*?)\n\}", ir, re.S)
    assert fn, f"{name} missing from emitted IR"
    return fn.group(1)


# An aggregate is a memory value: it moves by memcpy, never as an LLVM
# first-class load or store, which SROA and instruction selection expand field
# by field (seconds per copy of a 3 KB struct).
block_prefix = "test.aggregate-call-result-copy."
for name in ("make-block", "forward", "store-result", "hold", "pass-result", "reuse"):
    body = function_body(result_ir, block_prefix, name)
    assert not re.search(r"(?:load|store) (?:%test\.aggregate-call-result-copy\.(?:Block|Holder)|\[4096 x i8\])[ ,]", body), \
        (name, "a big aggregate must move as memory, not as an LLVM aggregate value", body)
# It is built where it is going: a returned local in the caller's result slot,
# a forwarded call's result in this function's own, a payload in its sum.
assert "alloca %test.aggregate-call-result-copy.Block" not in function_body(result_ir, block_prefix, "make-block"), \
    "a returned local is built in the caller's result slot"
forward = function_body(result_ir, block_prefix, "forward")
assert re.search(r"@test\.aggregate-call-result-copy\.make-block\(ptr sret\([^)]*\) align 8 %0,", forward), forward
assert "@llvm.mem" not in forward, ("a forwarded result is written once, by its callee", forward)
hold = function_body(result_ir, block_prefix, "hold")
assert re.search(r"make-block\(ptr sret\([^)]*\) align 8 %vf", hold), ("a payload is built in its sum", hold)
# An assignment's new value may read the old one, so it is built aside and copied.
assert re.search(r"@llvm\.mem(?:cpy|move)\.[^\n]*i64 4096", function_body(result_ir, block_prefix, "store-result"))

dest_source = "tests/compiler/features/aggregate_destinations.coil"
for level in ("-O0", "-O3"):
    invoke("run", dest_source, level)
dest_ir = invoke("emit-ir", dest_source)
assert "target datalayout" in dest_ir, dest_ir
dest_prefix = "test.aggregate-destinations."
for name in ("mk", "build"):
    body = function_body(dest_ir, dest_prefix, name)
    assert "alloca" not in body and "@llvm.memcpy" not in body, (name, "built in the caller's result slot", body)
pick = function_body(dest_ir, dest_prefix, "pick")
assert len(re.findall(r"\(ptr sret\([^)]*\) align 8 %0,", pick)) == 2 and "@llvm.memcpy" not in pick, \
    ("each branch of an if writes the result itself", pick)
some = function_body(dest_ir, dest_prefix, "some")
assert re.search(r"@test\.aggregate-destinations\.mk\(ptr sret\([^)]*\) align 8 %vf", some), some
main = function_body(dest_ir, "", "main")
assert re.search(r"@test\.aggregate-destinations\.wrap\(ptr sret\([^)]*\) align 8 %stack\.slot", main), \
    ("a binding's slot receives its initializer's result directly", main)
invoke("run", "tests/compiler/features/declaration_index.coil")
invoke("run", "tests/compiler/features/syntax_accessors.coil")
print("PASS: aggregate snapshots, assignments, big call results and destinations preserve evaluation order, overlap, and self-assignment with bulk copies; declaration indexes preserve exact, ambiguous, missing, growing, and republished model queries")
