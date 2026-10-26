#!/usr/bin/env python3
"""The C ABI in both directions, on every backend: tests/cabi/.

abi.coil is one self-checking program (see its header for what it covers),
linked with abi.c and with lib.coil, a second Coil object whose sum and array
results abi.coil calls through raw addresses. It is built

  - by LLVM at -O0, and at -O2 under AddressSanitizer (which traps a read past
    an exact-size C object or a store past a coerced aggregate's slot);
  - by the host's native backend (arm64 on Apple silicon, x64 on x86-64);
  - across backends: a native program linking an LLVM-built lib.o, and an LLVM
    program linking a native lib.o, so both must agree where each result travels.

Then one emit-ir pins what the IR must say: large sums and arrays return through
sret, never as first-class LLVM aggregates, and only scalar self-recursion is a
forced tail call.

Usage: c-abi.py [--compiler COIL]     (default: $COIL, then `coil` on PATH)
"""
from __future__ import annotations

import argparse
import os
import platform
import re
import shutil
import subprocess
import sys
import tempfile
from pathlib import Path

ROOT = Path(__file__).resolve().parents[2]
FIXTURE = ROOT / "tests" / "cabi"


def native_backend() -> str | None:
    machine = platform.machine()
    if machine == "arm64" and sys.platform == "darwin":
        return "arm64"
    if machine in ("x86_64", "AMD64"):
        return "x64"
    return None


def run(command: list, label: str) -> subprocess.CompletedProcess:
    result = subprocess.run([str(c) for c in command], cwd=ROOT, capture_output=True, text=True,
                            timeout=180, stdin=subprocess.DEVNULL)
    if result.returncode != 0:
        raise SystemExit(f"FAIL {label}: exit {result.returncode}\n$ {' '.join(map(str, command))}\n"
                         f"{result.stdout[-4000:]}{result.stderr[-4000:]}")
    return result


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    parser.add_argument("--compiler", default=os.environ.get("COIL") or shutil.which("coil") or "coil")
    coil = parser.parse_args().compiler
    native = native_backend()
    failures = []
    with tempfile.TemporaryDirectory(prefix="coil-c-abi-", dir=os.environ.get("COIL_TEST_SCRATCH")) as raw:
        work = Path(raw)
        c_object = work / "abi_c.o"
        run(["cc", "-O1", "-c", FIXTURE / "abi.c", "-o", c_object], "compile abi.c")
        libs = {"llvm": work / "lib-llvm.o"}
        run([coil, "emit-obj", FIXTURE / "lib.coil", "-O2", "-o", libs["llvm"]], "emit lib.coil (llvm)")
        if native:
            libs[native] = work / f"lib-{native}.o"
            run([coil, "emit-obj", FIXTURE / "lib.coil", "--backend", native, "-o", libs[native]],
                f"emit lib.coil ({native})")
        # the tpde backend targets arm64 Mach-O, and x86-64 Mach-O (run under
        # Rosetta) with --target
        tpde = native == "arm64"
        if tpde:
            libs["tpde"] = work / "lib-tpde.o"
            run([coil, "emit-obj", FIXTURE / "lib.coil", "--backend", "tpde", "-o", libs["tpde"]],
                "emit lib.coil (tpde)")
        x64_target = ["--target", "x86_64-apple-macosx11.0.0"]
        rosetta = tpde and subprocess.run(["arch", "-x86_64", "/usr/bin/true"],
                                          capture_output=True).returncode == 0
        if rosetta:
            x64_c_object = work / "abi_c_x64.o"
            run(["cc", "-arch", "x86_64", "-O1", "-c", FIXTURE / "abi.c", "-o", x64_c_object], "compile abi.c (x86-64)")
            libs["llvm-x64"] = work / "lib-llvm-x64.o"
            libs["tpde-x64"] = work / "lib-tpde-x64.o"
            run([coil, "emit-obj", FIXTURE / "lib.coil", "-O2", *x64_target, "-o", libs["llvm-x64"]],
                "emit lib.coil (llvm, x86-64)")
            run([coil, "emit-obj", FIXTURE / "lib.coil", "--backend", "tpde", *x64_target, "-o", libs["tpde-x64"]],
                "emit lib.coil (tpde, x86-64)")

        variants = [("llvm -O0", ["-O0"], "llvm"),
                    ("llvm -O2 + ASan", ["-O2", "--sanitize=address"], "llvm")]
        if native:
            variants += [(native, ["--backend", native], native),
                         (f"{native} program + llvm lib", ["--backend", native], "llvm"),
                         (f"llvm program + {native} lib", ["-O2"], native)]
        else:
            print("note: no native backend runs on this host; native and cross-backend variants skipped")
        if tpde:
            variants += [("tpde", ["--backend", "tpde"], "tpde"),
                         ("tpde program + llvm lib", ["--backend", "tpde"], "llvm"),
                         ("llvm program + tpde lib", ["-O2"], "tpde")]
        if rosetta:
            variants += [("tpde x86-64", ["--backend", "tpde", *x64_target], "tpde-x64"),
                         ("tpde x86-64 program + llvm lib", ["--backend", "tpde", *x64_target], "llvm-x64"),
                         ("llvm x86-64 program + tpde lib", ["-O2", *x64_target], "tpde-x64")]
        for index, (label, flags, lib) in enumerate(variants):
            executable = work / f"abi-{index}"
            run([coil, "build", FIXTURE / "abi.coil", *flags,
                 "--link-flag", x64_c_object if lib.endswith("-x64") else c_object,
                 "--link-flag", libs[lib], "-o", executable, "--quiet"], f"build {label}")
            ran = subprocess.run([str(executable)], cwd=ROOT, capture_output=True, text=True, timeout=60)
            if ran.returncode == 0 and ran.stdout.strip().endswith("failures: 0"):
                print(f"ok   {label}")
            else:
                failures.append(label)
                print(f"FAIL {label}: exit {ran.returncode}\n{ran.stdout[-3000:]}{ran.stderr[-3000:]}")

        ir = run([coil, "emit-ir", FIXTURE / "abi.coil"], "emit-ir").stdout
        problems = []
        if "target datalayout" not in ir:
            problems.append("emit-ir produced no module")
        for name in ("mk3", "mk8", "forward8", "mka3", "mka32"):
            signature = re.search(r'^define[^\n]*@"?cabi\.main\.' + name + r'"?\([^\n]*', ir, re.M)
            if not signature or "sret(" not in signature.group(0):
                problems.append(f"{name} must return through sret: {signature and signature.group(0)}")
        if re.search(r"\bret %cabi\.types\.S\d", ir):
            problems.append("a sum is returned as a first-class LLVM aggregate")
        # Two words, or an HFA of up to four floats, return in registers as the
        # ABI's coerced value; any other array goes through sret.
        for found in re.finditer(r"\bret \[(\d+) x ([^\]]+)\] %([\w.]+)", ir):
            count, element, value = int(found.group(1)), found.group(2), found.group(3)
            hfa = element in ("float", "double") and count <= 4
            if not hfa and not value.startswith("abi.ret.coerce"):
                problems.append(f"an array is returned as a first-class LLVM aggregate: {found.group(0)}")
        for name, forced in (("walk", False), ("spin", True)):
            body = re.search(r'define[^\n]*@"?cabi\.main\.' + name + r'"?\([^\n]*\)[^\n{]*\{(.*?)\n\}', ir, re.S)
            if not body:
                problems.append(f"no definition of {name} in the IR")
            elif ("musttail" in body.group(1)) != forced:
                problems.append(f"{name}: musttail {'missing' if forced else 'present'} "
                                f"({'scalar recursion must be a guaranteed tail call' if forced else 'a tail call must not free the temporary its argument borrows'})")
        for symbol in ("alias.function$1", "alias.data$1"):
            if symbol not in ir:
                problems.append(f"the IR does not name the linker symbol {symbol}")
        if problems:
            failures.append("emit-ir")
            print("FAIL emit-ir:\n  " + "\n  ".join(problems))
        else:
            print("ok   emit-ir: sret results, tail calls and linker names")
    if failures:
        print(f"c-abi: FAILED ({', '.join(failures)})")
        return 1
    print("c-abi: PASS")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
