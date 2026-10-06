#!/usr/bin/env python3
"""Sum results follow the C aggregate rules on every backend.

A sum is integer words (tag, then payload). The native backends and native_call
always returned one like a C struct of those words: in registers up to 16 bytes,
through a hidden result pointer beyond. The LLVM backend returned it as a
first-class value instead, which AArch64 spreads over w0 and x1..x7 -- so a sum
with two to seven payload words crossing between the backends (a JIT session
calling its host, a native metaprogram calling an LLVM unit) read garbage, and a
large sum cost instruction selection a pass over every field.

Run the fixture at each optimization level, under ASan, and on the native
backend; check the LLVM signatures; then link each backend's producer object
into the other backend's consumer, which calls through raw function addresses.
"""
from pathlib import Path
import platform
import re
import subprocess
import sys
import tempfile

ROOT = Path(__file__).resolve().parents[2]
sys.path.insert(0, str(Path(__file__).resolve().parent))
import cleanup_on_signal  # noqa: E402
cleanup_on_signal.install()
COMPILER = Path(sys.argv[1]).resolve()
FEATURES = ROOT / "tests/compiler/features"


def run(command):
    result = subprocess.run(list(map(str, command)), cwd=ROOT, capture_output=True,
                            text=True, timeout=180)
    assert result.returncode == 0, (command, result.returncode, result.stdout, result.stderr)
    return result


def passes(executable, label):
    out = run([executable]).stdout
    assert out.strip().endswith("failures: 0"), (label, out)


with tempfile.TemporaryDirectory(prefix=".coil-sum-return-abi-", dir=ROOT / "build") as raw:
    work = Path(raw)
    machine = platform.machine()
    native = ("arm64" if machine == "arm64" and sys.platform == "darwin"
              else "x64" if machine in ("x86_64", "AMD64") else None)
    variants = [["-O0"], ["-O2"], ["-O2", "--sanitize=address"]]
    if native:
        variants.append(["--backend", native])
    for i, flags in enumerate(variants):
        executable = work / f"v{i}"
        run([COMPILER, "build", FEATURES / "sum_return_abi.coil", *flags, "-o", executable])
        passes(executable, flags)
        print(f"PASS: {' '.join(flags)}: sums of 0/1/2/3/8 payload words through direct, generic, fnptr and dyn calls")

    ir = run([COMPILER, "emit-ir", FEATURES / "sum_return_abi.coil"]).stdout
    assert "target datalayout" in ir, ir
    for name in ("mk3", "mk8", "forward8"):
        sig = re.search(r"^define[^\n]*@sum-return-abi\." + name + r"\([^\n]*", ir, re.M)
        assert sig and "sret(" in sig.group(0), (name, sig and sig.group(0))
    assert not re.search(r"\bret %sum-return-abi-types\.S\d", ir), "a sum must not be returned as an LLVM aggregate"
    print("PASS: sums beyond 16 bytes return through sret")

    if native:
        pairs = [("llvm", native), (native, "llvm"), ("llvm", "llvm")]
        for lib_backend, use_backend in pairs:
            obj = work / f"lib-{lib_backend}.o"
            executable = work / f"use-{lib_backend}-{use_backend}"
            run([COMPILER, "emit-obj", FEATURES / "sum_return_abi_lib.coil",
                 "--backend", lib_backend, "-o", obj])
            run([COMPILER, "build", FEATURES / "sum_return_abi_use.coil",
                 "--backend", use_backend, "--link-flag", obj, "-o", executable])
            passes(executable, (lib_backend, use_backend))
            print(f"PASS: sums returned by {lib_backend} code read correctly by {use_backend} code")
