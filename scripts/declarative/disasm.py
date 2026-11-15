#!/usr/bin/env python3
"""Disassemble the `code: xx xx ...` line that `the fuzzer (scripts/tests/declarative.py builds it) run as `fuzz 1 SEED`` prints.

    fuzz 1 7 | python3 scripts/declarative/disasm.py [a64|x64]
"""
import subprocess, sys, tempfile, os
arch = sys.argv[1] if len(sys.argv) > 1 else "a64"
line = next(l for l in sys.stdin if l.startswith("code:"))
data = bytes(int(x, 16) for x in line.split()[1:])
d = tempfile.mkdtemp()
if arch == "a64":
    src, obj = os.path.join(d, "code.s"), os.path.join(d, "code.o")
    words = [int.from_bytes(data[i:i + 4], "little") for i in range(0, len(data), 4)]
    open(src, "w").write(".text\n_code:\n" + "".join(f"  .inst 0x{w:08x}\n" for w in words))
    subprocess.run(["clang", "-c", "-arch", "arm64", src, "-o", obj], check=True)
    out = subprocess.run(["/opt/homebrew/opt/llvm/bin/llvm-objdump", "-d", "--no-show-raw-insn", obj],
                         capture_output=True, text=True).stdout
    print("\n".join(out.splitlines()[5:]))
else:
    raw = os.path.join(d, "code.bin")
    open(raw, "wb").write(data)
    print(subprocess.run(["objdump", "-D", "-b", "binary", "-mi386:x86-64", "-Mintel", raw],
                         capture_output=True, text=True).stdout)
