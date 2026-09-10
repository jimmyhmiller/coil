#!/usr/bin/env python3
"""Focused SIMD semantics, diagnostics, and backend regression gate."""

from __future__ import annotations

import argparse
import pathlib
import platform
import os
import re
import shutil
import subprocess
import tempfile
import time


ROOT = pathlib.Path(__file__).resolve().parents[2]
FEATURES = ROOT / "tests/compiler/features"
FIXTURES = [
    "generic_literal_inference", "vector_odd_layout", "simd_generic_width", "simd_core",
    "simd_arithmetic", "simd_memory", "simd_permute", "simd_scans",
    "simd_resize", "simd_float_edges", "simd_guard_page", "simd_portable",
    "vector_fma_single_rounding", "simd_bitmap", "simd_clmul", "simd_aggregate", "simd_scan_shapes",
]

NEGATIVE = {
    "width-zero": ("(p/vector-zero [(vec u8 0)])", "positive"),
    "width-negative": ("(p/vector-zero [(vec u8 -1)])", "positive"),
    "width-kind": ("(v/vsplat [u8 f32] 1)", "integer generic argument"),
    "lane-kind": ("(v/vsplat [(const 16) 4] 1)", "used as a type"),
    "lane-wide": ("(p/vector-zero [(vec i128 4)])", "lane"),
    "mask-arithmetic": ("(v/vadd (v/vsplat [bool 4] true) (v/vsplat [bool 4] false))", "lane type"),
    "shape-mismatch": ("(v/vadd (v/vzero [u8 4]) (v/vzero [u8 8]))", "conflicting"),
    "bitmap-wide": ("(v/mask->bits (v/mask-low [65] 3))", "at most 64"),
    "float-bits": ("(v/vand (v/vsplat [f32 4] 1.0) (v/vsplat [f32 4] 2.0))", "lane type"),
    "integer-divide": ("(v/vdiv (v/vsplat [i32 4] 1) (v/vsplat [i32 4] 2))", "lane type"),
    "bitcast-size": ("(v/vbitcast [u64 4 u8 4] (v/vzero [u8 4]))", "equal total bit sizes"),
    "convert-shape": ("(p/vector-convert [(vec u16 8)] (v/vzero [u8 4]))", "preserves lane count"),
    "widen-shape": ("(v/vwiden-low [u16 3 u8 8] (v/vzero [u8 8]))", "halve/double lane count"),
    "narrow-float-sat": ("(v/vnarrow-saturating [f32 8 f64 4] (v/vzero [f64 4]) (v/vzero [f64 4]))", "requires integer"),
    "masked-pointer": ("(v/vload-masked (cast (ptr u16) 0) (v/mask-low [4] 0) (v/vzero [u8 4]))", "conflicting"),
    "mask-memory": ("(v/vloadu [bool 4] (cast (ptr bool) 0))", "numeric lanes"),
    "float-index": ("(v/vtable (v/vzero [u8 16]) (v/vzero [f32 4]))", "indices must be integer"),
    "insert-type": ("(v/vinsert (v/vzero [u8 4]) 0 (cast u16 1))", "conflicting"),
}


def run(command: list[str], *, ok: bool = True) -> subprocess.CompletedProcess[str]:
    result = subprocess.run(command, cwd=ROOT, text=True, capture_output=True, timeout=180)
    if ok and result.returncode:
        raise AssertionError(f"{' '.join(command)}\nexit {result.returncode}\n{result.stdout}{result.stderr}")
    return result


def diagnostics(compiler: str) -> None:
    with tempfile.TemporaryDirectory(prefix=".coil-simd-negative-", dir=ROOT) as directory:
        for name, (expression, expected) in NEGATIVE.items():
            source = pathlib.Path(directory) / f"{name}.coil"
            source.write_text(
                f'(module test.simd-negative.{name})\n'
                '(import "coil.simd" :as v)\n(import "coil.primitive" :as p)\n'
                f'(defn main [] (-> i64) (do {expression} 0))\n'
            )
            result = run([compiler, "check", str(source)], ok=False)
            output = result.stdout + result.stderr
            if result.returncode != 1 or expected not in output:
                raise AssertionError(f"negative {name}: expected exit 1 containing {expected!r}, "
                                     f"got {result.returncode}\n{output}")
    print(f"SIMD diagnostics: {len(NEGATIVE)} rejected programs", flush=True)


def semantics(compiler: str, backend: str) -> None:
    for fixture in FIXTURES:
        # The interpreter's FFI table does not expose mmap/mprotect. Guard-page
        # safety is exercised by both native execution paths instead.
        if backend == "interp" and fixture == "simd_guard_page":
            continue
        command = [compiler, "interp" if backend == "interp" else "run", str(FEATURES / f"{fixture}.coil")]
        if backend not in {"llvm", "interp"}:
            command += ["--backend", backend]
        run(command)
        print(f"SIMD {backend}: {fixture}", flush=True)


def differential_source(lane: str, width: int) -> str:
    bits = int(lane[1:])
    unsigned = f"u{bits}"
    signed = f"i{bits}"
    pairs = {
        "vadd": f"(cast {lane} (p/iadd (cast u64 x) (cast u64 y)))",
        "vsub": f"(cast {lane} (p/isub (cast u64 x) (cast u64 y)))",
        "vmul": f"(cast {lane} (p/imul (cast u64 x) (cast u64 y)))",
        "vand": "(p/iand x y)", "vor": "(p/ior x y)", "vxor": "(p/ixor x y)",
        "vmin": "(if (< x y) x y)", "vmax": "(if (> x y) x y)",
        "vshl": f"(cast {lane} (p/ishl (cast u64 x) count))",
        "vshr-logical": f"(cast {lane} (p/ishr (cast u64 (cast {unsigned} x)) count))",
        "vshr-arithmetic": f"(cast {lane} (p/ishr (cast i64 (cast {signed} x)) (cast i64 count)))",
    }
    checks = "\n".join(
        f"      (let [got (v/{op} a b)]\n"
        f"        (for [i 0 {width}]\n"
        f"          (let [x (load (p/index ap i)) y (load (p/index bp i))\n"
        f"                count (p/iand (cast u64 y) (cast u64 {bits - 1}))]\n"
        f"            (assert-eq (v/vextract got i) {expected}))))"
        for op, expected in pairs.items()
    )
    return f'''(module test.simd-differential.{lane}-x{width})
(import "coil.simd" :as v)
(import "coil.primitive" :as p)

; Stateful noinline input generation keeps the vector operands nonconstant.
(defn next :inline (Never) [(state (ptr u64))] (-> u64)
  (let [x (p/iadd (p/imul (load state) (cast u64 6364136223846793005)) (cast u64 1442695040888963407))]
    (store! state x)
    (p/ixor x (p/ishr x (cast u64 32)))))

(defn main [] (-> i64)
  (let [state (p/alloc-stack u64)
        expected-mask (p/alloc-stack u64)
        aa (p/alloc-stack (array {lane} {width})) bb (p/alloc-stack (array {lane} {width}))
        ap (cast (ptr {lane}) aa) bp (cast (ptr {lane}) bb)]
    (store! state (cast u64 0x6a09e667f3bcc909))
    (for [round 0 128]
      (for [i 0 {width}]
        (store! (p/index ap i) (cast {lane} (next state)))
        (store! (p/index bp i) (cast {lane} (next state))))
      (let [a (v/vloadu [{lane} {width}] ap) b (v/vloadu [{lane} {width}] bp)]
{checks}
        (store! expected-mask (cast u64 0))
        (for [i 0 {width}]
          (when (< (load (p/index ap i)) (load (p/index bp i)))
            (store! expected-mask (p/ior (load expected-mask) (p/ishl (cast u64 1) (cast u64 i))))))
        (assert-eq (v/mask->bits (v/v< a b)) (load expected-mask))
        (let [selected (v/vselect (v/v< a b) a b)]
          (assert (v/mask-all? (v/v= selected (v/vmin a b)))))
        (assert (v/mask-all? (v/v= a (v/vreverse (v/vreverse a)))))
        (assert (v/mask-all? (v/v= a (v/vrotate-right (v/vrotate-left a b) b))))))
    0))
'''


def differential(compiler: str, backend: str) -> None:
    with tempfile.TemporaryDirectory(prefix=".coil-simd-differential-", dir=ROOT) as directory:
        for lane in ["u8", "i8", "u16", "i16", "u32", "i32", "u64", "i64"]:
            for width in [3, 8, 16, 32, 64]:
                source = pathlib.Path(directory) / f"{lane}-x{width}.coil"
                source.write_text(differential_source(lane, width))
                command = [compiler, "run", str(source)]
                if backend != "llvm":
                    command += ["--backend", backend]
                run(command)
            print(f"SIMD differential {backend}: {lane}, 5 widths, 128 inputs/width", flush=True)


def codegen(compiler: str) -> None:
    config = os.environ.get("LLVM_CONFIG", "llvm-config")
    bindir = pathlib.Path(run([config, "--bindir"]).stdout.strip())
    objdump = bindir / "llvm-objdump"
    with tempfile.TemporaryDirectory(prefix=".coil-simd-codegen-", dir=ROOT) as directory:
        library = pathlib.Path(directory) / ("probe.dylib" if platform.system() == "Darwin" else "probe.so")
        run([compiler, "build", str(FEATURES / "simd_codegen.coil"), "--shared", "-O3", "-o", str(library)])
        assembly = run([str(objdump), "--disassemble", str(library)]).stdout
        functions = dict(re.findall(r"^[0-9a-f]+ <_?(simd_\w+)>:\n(.*?)(?=\n\n|\Z)",
                                    assembly, re.M | re.S))
        for name in ["simd_lookup16", "simd_lookup32", "simd_lookup64", "simd_classify16", "simd_scan16"]:
            if not functions.get(name):
                raise AssertionError(f"codegen: missing disassembly for {name}")
        if re.search(r"\t(?:j[a-z]+|b(?:\.[a-z]+)?|bl|cbn?z|tbn?z|callq?)\s", functions["simd_scan16"]):
            raise AssertionError(f"codegen: fixed scan must not contain a runtime loop or call\n{functions['simd_scan16']}")
        if platform.machine() in {"arm64", "aarch64"}:
            for width in [16, 32, 64]:
                body = functions[f"simd_lookup{width}"]
                tables = re.findall(r"\btbl(?:\.\w+)?\s+[^\n{]+\{([^}]+)\}", body)
                if not any(len(re.findall(r"\bv\d+", registers)) == width // 16 for registers in tables):
                    raise AssertionError(f"codegen: expected NEON {width}-byte table lookup\n{body}")
            for name, pattern in [("simd_classify16", r"\baddv(?:\.|\s)"),
                                  ("simd_scan16", r"\badd(?:\.16b|\s+v\d+\.16b)")]:
                if not re.search(pattern, functions[name]):
                    raise AssertionError(f"codegen: missing vector operation in {name}\n{functions[name]}")
        elif platform.machine() in {"x86_64", "AMD64"}:
            for name, pattern in [("simd_classify16", r"\bpmovmskb\b"), ("simd_scan16", r"\bpaddb\b")]:
                if not re.search(pattern, functions[name]):
                    raise AssertionError(f"codegen: missing vector operation in {name}\n{functions[name]}")
    print("SIMD LLVM codegen: exported kernels retain vector instructions", flush=True)


def wasm(compiler: str) -> None:
    # Explicit opt-in: an absent runtime must not turn a requested test into a pass.
    for tool in ["wasm-tools", "wasmtime"]:
        if not shutil.which(tool):
            raise AssertionError(f"Wasm gate requires {tool}")
    with tempfile.TemporaryDirectory(prefix=".coil-simd-wasm-", dir=ROOT) as directory:
        for fixture in ["wasm_zeroed", "simd_portable"]:
            output = pathlib.Path(directory) / f"{fixture}.wasm"
            run([compiler, "build", str(FEATURES / f"{fixture}.coil"), "--backend", "wasm",
                 "--target", "wasm64-unknown-unknown", "-o", str(output)])
            run(["wasm-tools", "validate", str(output)])
            result = run(["wasmtime", "run", "--invoke", "main", str(output)])
            if result.stdout.strip() != "0":
                raise AssertionError(f"Wasm {fixture}: expected main = 0, got {result.stdout!r}")
            print(f"SIMD wasm64: {fixture}", flush=True)


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--compiler", required=True)
    parser.add_argument("--backend", action="append", choices=["llvm", "arm64", "x64", "interp"])
    parser.add_argument("--diagnostics-only", action="store_true")
    parser.add_argument("--differential", action="store_true", help="also run deterministic randomized scalar-oracle comparisons")
    parser.add_argument("--wasm", action="store_true", help="validate and execute the direct Wasm portable fixtures")
    args = parser.parse_args()
    compiler = str(pathlib.Path(args.compiler).resolve())
    started = time.monotonic()
    diagnostics(compiler)
    if not args.diagnostics_only:
        backends = args.backend or ["llvm", "arm64" if platform.machine() in {"arm64", "aarch64"} else "x64"]
        for backend in backends:
            semantics(compiler, backend)
            if args.differential and backend != "interp":
                differential(compiler, backend)
        if "llvm" in backends:
            codegen(compiler)
        if args.wasm:
            wasm(compiler)
    print(f"SIMD focused gate passed in {time.monotonic() - started:.2f}s", flush=True)
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
