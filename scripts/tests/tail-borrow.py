#!/usr/bin/env python3
"""Tail calls must preserve temporaries borrowed by aggregate arguments."""
from pathlib import Path
import re
import subprocess
import sys
import tempfile

ROOT = Path(__file__).resolve().parents[2]
compiler = Path(sys.argv[1]).resolve()
source = ROOT / "tests/compiler/features/tail_borrowed_temporary.coil"

def run(*args):
    result = subprocess.run(list(map(str, args)), cwd=ROOT, capture_output=True,
                            text=True, timeout=120)
    assert result.returncode == 0, (args, result.returncode, result.stdout, result.stderr)
    return result.stdout

ir = run(compiler, "emit-ir", source)
assert "target datalayout" in ir
for name, forced in (("walk", False), ("spin", True)):
    body = re.search(r'define[^\n]*@"?tail-borrowed-temporary\.' + name +
                     r'"?\([^\n]*\)\s*\{(.*?)\n\}', ir, re.S)
    assert body, (name, ir[-4000:])
    assert ("musttail" in body.group(1)) == forced, (name, body.group(1))
with tempfile.TemporaryDirectory(prefix="coil-tail-borrow-") as tmp:
    for optimization in ("-O0", "-O3"):
        binary = Path(tmp) / optimization[1:]
        run(compiler, "build", source, optimization, "-o", binary)
        run(binary)
print("PASS: borrowed tail arguments preserve their frame; scalar recursion retains guaranteed TCO")
