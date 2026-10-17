#!/usr/bin/env python3
"""The freestanding contract: Coil programs link and run with no OS and no libc.

Each program in src/examples/freestanding is compiled for a bare-metal target,
linked with ld.lld --gc-sections against its own boot stub and linker script, and
must leave ZERO undefined symbols: no libc, no runtime, nothing the image does not
supply itself. The aarch64 and riscv32 images then boot under QEMU and must print
what they promise. The ESP32-C3 firmware is linked and checked but not run (it
needs Espressif's QEMU fork).

    freestanding.py [--compiler COIL]

Needs ld.lld, clang (to assemble the boot stubs), llvm-nm, qemu-system-aarch64
and qemu-system-riscv32; `brew install lld qemu` adds what LLVM does not ship.
"""

from __future__ import annotations

import argparse
import os
import shutil
import subprocess
import sys
import tempfile
from pathlib import Path

ROOT = Path(__file__).resolve().parents[2]
SRC = ROOT / "src/examples/freestanding"


class Failed(Exception):
    pass


def llvm_tool(name: str) -> str | None:
    """`name` from `llvm-config --bindir`, else from PATH."""
    try:
        bindir = subprocess.run(["llvm-config", "--bindir"], capture_output=True, text=True,
                                check=True).stdout.strip()
        candidate = Path(bindir) / name
        if candidate.is_file():
            return str(candidate)
    except (OSError, subprocess.CalledProcessError):
        pass
    return shutil.which(name)


def run(argv: list[str], label: str, timeout: int = 120) -> str:
    result = subprocess.run(argv, capture_output=True, text=True, timeout=timeout,
                            stdin=subprocess.DEVNULL)
    if result.returncode != 0:
        raise Failed(f"{label}: exit {result.returncode}\n{result.stdout}{result.stderr}")
    return result.stdout + result.stderr


def link_clean(tools: dict[str, str], argv: list[str], elf: Path, label: str) -> None:
    """Link, then require the image to have no undefined symbols."""
    run([tools["ld.lld"], "--gc-sections", *argv, "-o", str(elf)], f"{label}: link")
    result = subprocess.run([tools["llvm-nm"], "--undefined-only", str(elf)],
                            capture_output=True, text=True)
    # An absent or unreadable image would also print nothing: the exit status is
    # what says llvm-nm read it.
    if result.returncode != 0:
        raise Failed(f"{label}: llvm-nm could not read {elf.name}: {result.stderr}")
    if result.stdout.strip():
        raise Failed(f"{label}: undefined symbols in the linked image:\n{result.stdout}")


def boot(argv: list[str], want: str, label: str) -> None:
    """Run QEMU until the program powers it off, and require `want` in its output."""
    try:
        result = subprocess.run(argv, capture_output=True, text=True, timeout=30,
                                stdin=subprocess.DEVNULL)
    except subprocess.TimeoutExpired as error:
        out = (error.stdout or b"").decode(errors="replace") if isinstance(error.stdout, bytes) else (error.stdout or "")
        raise Failed(f"{label}: QEMU did not power off within 30 s; output so far: {out!r}")
    out = result.stdout + result.stderr
    if result.returncode != 0 or want not in out:
        raise Failed(f"{label}: want {want!r} and exit 0, got exit {result.returncode}: {out!r}")


def aarch64(coil: str, tools: dict[str, str], work: Path) -> int:
    boot_o = work / "aarch64-start.o"
    run([tools["clang"], "-target", "aarch64-unknown-none", "-c", str(SRC / "start.s"),
         "-o", str(boot_o)], "aarch64: assemble start.s")
    programs = {
        "hello": "from coil (bare metal)",
        "uart": "PL011 via typed registers",
        "arena": "stdlib arena on bare metal: 42",
        "fail": "fatal: out of memory at box!",
    }
    failures = 0
    for name, want in programs.items():
        label = f"aarch64/{name}"
        try:
            obj, elf = work / f"{name}.o", work / f"{name}.elf"
            run([coil, "emit-obj", str(SRC / f"{name}.coil"), "-o", str(obj),
                 "--target", "aarch64-unknown-none"], f"{label}: emit-obj")
            link_clean(tools, ["-T", str(SRC / "virt.ld"), str(boot_o), str(obj)], elf, label)
            boot([tools["qemu-system-aarch64"], "-M", "virt", "-cpu", "cortex-a57", "-nographic",
                  "-kernel", str(elf)], want, label)
            print(f"ok   {label}")
        except (Failed, subprocess.TimeoutExpired) as error:
            failures += 1
            print(f"FAIL {error}")
    return failures


def riscv32(coil: str, tools: dict[str, str], work: Path) -> int:
    label = "riscv32/answer"
    try:
        base = SRC / "riscv32"
        boot_o, obj, elf = work / "rv-start.o", work / "answer.o", work / "answer.elf"
        run([tools["clang"], "--target=riscv32-unknown-elf", "-march=rv32imc", "-mabi=ilp32",
             "-c", str(base / "start.s"), "-o", str(boot_o)], f"{label}: assemble start.s")
        run([coil, "emit-obj", str(base / "answer.coil"), "-o", str(obj),
             "--target", "riscv32-unknown-none-elf"], f"{label}: emit-obj")
        link_clean(tools, ["-m", "elf32lriscv", "-T", str(base / "virt.ld"), str(boot_o), str(obj)],
                   elf, label)
        boot([tools["qemu-system-riscv32"], "-M", "virt", "-bios", "none", "-nographic",
              "-kernel", str(elf)], "coil rv32imc: ok", label)
        print(f"ok   {label}")
        return 0
    except (Failed, subprocess.TimeoutExpired) as error:
        print(f"FAIL {error}")
        return 1


def esp32c3(coil: str, tools: dict[str, str], work: Path) -> int:
    label = "esp32c3/firmware"
    try:
        base = SRC / "esp32c3"
        obj, elf = work / "firmware.o", work / "firmware.elf"
        run([coil, "emit-obj", str(base / "firmware.coil"), "-o", str(obj),
             "--target", "riscv32-unknown-none-elf"], f"{label}: emit-obj")
        link_clean(tools, ["-m", "elf32lriscv", "-T", str(base / "esp32c3.ld"), str(obj)], elf, label)
        print(f"ok   {label} (linked; running it needs Espressif's QEMU)")
        return 0
    except (Failed, subprocess.TimeoutExpired) as error:
        print(f"FAIL {error}")
        return 1


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    parser.add_argument("--compiler", default=os.environ.get("COIL") or shutil.which("coil") or "coil")
    args = parser.parse_args()
    tools = {name: llvm_tool(name) for name in ("ld.lld", "clang", "llvm-nm")}
    tools |= {name: shutil.which(name) for name in ("qemu-system-aarch64", "qemu-system-riscv32")}
    missing = [name for name, path in tools.items() if not path]
    if missing:
        print(f"FAIL freestanding needs {', '.join(missing)} (brew install lld qemu)")
        return 1
    coil = str(Path(args.compiler).resolve()) if os.sep in args.compiler else args.compiler
    with tempfile.TemporaryDirectory(prefix="coil-freestanding-", dir=os.environ.get("COIL_TEST_SCRATCH")) as raw:
        work = Path(raw)
        failures = aarch64(coil, tools, work) + riscv32(coil, tools, work) + esp32c3(coil, tools, work)
    print(f"freestanding: {'FAILED' if failures else 'PASS'}")
    return 1 if failures else 0


if __name__ == "__main__":
    sys.exit(main())
