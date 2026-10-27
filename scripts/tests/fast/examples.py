#!/usr/bin/env python3
"""FAST: the examples workspace, ten real packages, built, run and tested.

    examples.py build              build every package, run six on their bundled data
    examples.py test [PKG...]      `coil test` in each package (all ten by default)
    examples.py arm64              `coil test --backend arm64` in huffman and calc
    examples.py safety             huffman under coil.safety: a compress/decompress round trip
    examples.py fmt                `coil fmt --check` in each package

Each package is tested on its own (`coil test` at the workspace root costs twice
the time and six times the memory). statemachine's compile-error tests import
coil.test.compile, which links the in-process compiler: without a prebuilt
coil.jit unit that is a whole-compiler build, so FAST runs its other test files
and COMPREHENSIVE runs that one against an installed toolchain.
"""

from __future__ import annotations

import os
import shutil
import subprocess
import sys
import tempfile
from pathlib import Path

ROOT = Path(__file__).resolve().parents[3]
EXAMPLES = ROOT / "examples"
PACKAGES = ("calc", "config", "huffman", "logscan", "lru", "mandelbrot",
            "pathfind", "statemachine", "wordfreq")
# Test files FAST leaves to COMPREHENSIVE: they need the coil.jit unit.
NEEDS_JIT_UNIT = {"statemachine": ["machine_test", "runner_test"]}

COIL = os.environ.get("COIL") or shutil.which("coil") or "coil"
failures: list[str] = []


def scratch() -> Path:
    base = os.environ.get("COIL_TEST_SCRATCH")
    return Path(tempfile.mkdtemp(prefix="examples-", dir=base))


def run(argv: list[str], cwd: Path, *, want: int = 0, stdin: bytes | None = None,
        timeout: int = 60) -> subprocess.CompletedProcess[bytes]:
    result = subprocess.run(argv, cwd=cwd, input=stdin, capture_output=True, timeout=timeout,
                            stdin=None if stdin is not None else subprocess.DEVNULL)
    if result.returncode != want:
        fail(f"{' '.join(argv)} (in {cwd.relative_to(ROOT)}) exited {result.returncode}, want {want}",
             result)
    return result


def fail(message: str, result: subprocess.CompletedProcess[bytes] | None = None) -> None:
    failures.append(message)
    print(f"FAIL {message}")
    if result is not None:
        out = (result.stdout + result.stderr).decode(errors="replace")
        print("\n".join("     " + line for line in out.splitlines()[-40:]))


def expect(name: str, text: str, *needles: str) -> None:
    missing = [n for n in needles if n not in text]
    if missing:
        fail(f"{name}: output lacks {missing!r}:\n{text[-2000:]}")
    else:
        print(f"ok   {name}")


def build() -> None:
    out = scratch()
    for package in PACKAGES:
        run([COIL, "build", "-o", str(out / package)], EXAMPLES / package)
    built = {p: out / p for p in PACKAGES if (out / p).is_file()}

    def output(package: str, *args: str, want: int = 0) -> str:
        if package not in built:
            return ""
        result = run([str(built[package]), *args], EXAMPLES / package, want=want)
        return (result.stdout + result.stderr).decode(errors="replace")

    expect("calc evaluates a session",
           output("calc", "data/session.txt"), "> 1 + 2 * 3\n7\n", "2 ^ 3 ^ 2\n512", "area = 84")
    expect("config accepts a valid file", output("config", "data/server.json"),
           "data/server.json: ok", "workers    8")
    expect("config reports every problem", output("config", "data/broken.json", want=1),
           "data/broken.json: 7 problems", "routes[2]: timeoutMs 900000 is outside 1..300000")
    malformed = run([str(built["config"]), "data/malformed.json"], EXAMPLES / "config", want=1) \
        if "config" in built else None
    if malformed is not None:
        expect("config locates a JSON syntax error",
               (malformed.stdout + malformed.stderr).decode(errors="replace"),
               "data/malformed.json: 3:42: expected an integer")
    expect("huffman demo round-trips", output("huffman", "demo", "data/sample.txt"),
           "data/sample.txt: 3636 bytes", "round trip: identical")
    if "huffman" in built:
        packed, unpacked = out / "sample.huf", out / "sample.out"
        run([str(built["huffman"]), "compress", "data/sample.txt", str(packed)], EXAMPLES / "huffman")
        run([str(built["huffman"]), "decompress", str(packed), str(unpacked)], EXAMPLES / "huffman")
        if unpacked.is_file() and unpacked.read_bytes() == (EXAMPLES / "huffman/data/sample.txt").read_bytes():
            print("ok   huffman compress then decompress gives back the input")
        else:
            fail("huffman compress then decompress did not give back the input")
    expect("wordfreq ranks words across files",
           output("wordfreq", "--top", "5", "data/austen.txt", "data/hugo.txt"),
           "    1      28    2.5%  you", "files: 2   words: 1110   unique: 510")
    expect("logscan reports an access log", output("logscan", "data/access.txt"),
           "data/access.txt: 420 requests, 10 malformed lines", "/api/cart                         46",
           "latency     p50 16ms  p90 115ms  p99 3501ms  max 3688ms")
    expect("pathfind solves and refuses mazes", output("pathfind", "data/maze.txt", "data/walled.txt"),
           "A*        49 steps, cost 50", "Dijkstra  49 steps, cost 50", "A*        no path")


def test(selected: list[str]) -> None:
    passed = 0
    for package in selected or PACKAGES:
        result = run([COIL, "test", *NEEDS_JIT_UNIT.get(package, [])], EXAMPLES / package, timeout=120)
        text = result.stdout.decode(errors="replace")
        for line in text.splitlines():
            if line.startswith("test result: ok."):
                passed += int(line.split()[3])
        if result.returncode == 0:
            print(f"ok   coil test in examples/{package}")
    print(f"examples: {passed} tests passed")


def arm64() -> None:
    for package in ("huffman", "calc"):
        if run([COIL, "test", "--backend", "arm64"], EXAMPLES / package, timeout=120).returncode == 0:
            print(f"ok   coil test --backend arm64 in examples/{package}")


def safety() -> None:
    out = scratch()
    binary = out / "huffman-safe"
    run([COIL, "build", "--use", "coil.safety", "-o", str(binary)], EXAMPLES / "huffman")
    if not binary.is_file():
        return
    sample = EXAMPLES / "huffman/data/sample.txt"
    run([str(binary), "compress", str(sample), str(out / "s.huf")], EXAMPLES / "huffman")
    run([str(binary), "decompress", str(out / "s.huf"), str(out / "s.out")], EXAMPLES / "huffman")
    if (out / "s.out").is_file() and (out / "s.out").read_bytes() == sample.read_bytes():
        print("ok   huffman under coil.safety round-trips its sample")
    else:
        fail("huffman under coil.safety did not round-trip its sample")


def fmt() -> None:
    for package in PACKAGES:
        result = subprocess.run([COIL, "fmt", "--check"], cwd=EXAMPLES / package,
                                capture_output=True, timeout=30, stdin=subprocess.DEVNULL)
        if result.returncode == 0:
            print(f"ok   examples/{package} is fmt-clean")
        else:
            fail(f"examples/{package} is not fmt-clean", result)


def main(argv: list[str]) -> int:
    if not argv:
        print(__doc__)
        return 2
    command, rest = argv[0], argv[1:]
    unknown = [p for p in rest if p not in PACKAGES]
    if unknown:
        print(f"unknown example package(s): {unknown}")
        return 2
    {"build": lambda: build(), "test": lambda: test(rest), "arm64": lambda: arm64(),
     "safety": lambda: safety(), "fmt": lambda: fmt()}[command]()
    if failures:
        print(f"examples {command}: {len(failures)} failed")
        return 1
    print(f"examples {command}: PASS")
    return 0


if __name__ == "__main__":
    raise SystemExit(main(sys.argv[1:]))
