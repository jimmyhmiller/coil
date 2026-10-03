#!/usr/bin/env python3
"""Sparse constants retain link-time semantics and compile cost independent of holes."""
from pathlib import Path
import os
import platform
import re
import subprocess
import sys
import tempfile
import time

ROOT = Path(__file__).resolve().parents[2]
sys.path.insert(0, str(Path(__file__).resolve().parent))
import cleanup_on_signal  # noqa: E402
cleanup_on_signal.install()
COMPILER = Path(sys.argv[1]).resolve()
# The fixture's static storage: storage, empty and callbacks are one
# 708334-element array of 8-byte values each, nested is two.
FIXTURE_DATA_BYTES = 5 * 708334 * 8


def run(args, expected=0, env=None):
    result = subprocess.run(list(map(str, args)), cwd=ROOT, text=True,
                            capture_output=True, env=env)
    assert result.returncode == expected, (args, result.returncode, result.stdout, result.stderr)
    return result


with tempfile.TemporaryDirectory(prefix=".coil-sparse-static-", dir=ROOT) as directory:
    work = Path(directory)
    native = work / "native.c"
    native.write_text('''#include <stdint.h>
extern int64_t *sparse_storage(void), *sparse_nested(void), *sparse_empty(void);
extern int64_t *sparse_records(void);
typedef int64_t (*callback)(void);
extern callback *sparse_callbacks(void);
static int failed;
__attribute__((constructor)) static void before_main(void) {
  int64_t *a = sparse_storage(), *n = sparse_nested(), *z = sparse_empty();
  if ((uintptr_t)a % 8 || (uintptr_t)n % 8 || (uintptr_t)z % 8) failed = 1;
  for (int i = 0; i < 708334; ++i) {
    if (a[i] != (i == 0 ? 1 : i == 708333 ? 42 : 0) || z[i]) failed = 2;
    if (n[i] || n[708334+i] != (i == 708333 ? 73 : 0)) failed = 3;
  }
  a[350000] = 99;
  int64_t *records = sparse_records();
  if ((uintptr_t)records % 32) failed = 5;
  for (int i = 0; i < 128; ++i) {
    int64_t want = i == 72 ? 11 : i == 73 ? 22 : i == 76 ? 33 : i == 77 ? 44 : 0;
    if (records[i] != want) failed = 6;
  }
  callback *callbacks = sparse_callbacks();
  if (callbacks[0] || callbacks[708332] || callbacks[708333]() != 81) failed = 7;
}
int64_t sparse_native_check(void) {
  return failed ? failed : sparse_storage()[350000] == 99 ? 0 : 4;
}
''')
    obj = work / "native.o"
    run(["cc", "-c", native, "-o", obj])
    fixture = ROOT / "tests/compiler/features/sparse_static.coil"
    backends = ["llvm"] + (["arm64"] if platform.machine() == "arm64" else [])
    # Keep the explicit initializers and native checks identical while changing
    # the number of implicit zero elements. This separates sparse-array growth
    # from the compiler's fixed process footprint.
    small_native = work / "native-small.c"
    small_native.write_text(native.read_text().replace('708334', '128')
                            .replace('708333', '127').replace('708332', '126')
                            .replace('350000', '64'))
    small_obj = work / "native-small.o"
    run(["cc", "-c", small_native, "-o", small_obj])
    small_fixture = work / "small.coil"
    small_fixture.write_text(fixture.read_text().replace('708334', '128').replace('708333', '127'))
    pattern = (r"(\d+)\s+maximum resident set size" if sys.platform == "darwin"
               else r"Maximum resident set size \(kbytes\):\s*(\d+)")
    for backend in backends:
        # The arm64 backend builds its object in the compiler's tracked arena.
        # Resident pages vary with host memory pressure, so compare the actual
        # object-phase allocation instead of subtracting two RSS peaks.
        trace_env = {**os.environ, "COIL_TRACE": "1"} if backend == "arm64" else None
        small_binary = work / (backend + '-small')
        baseline = run(["/usr/bin/time", "-l" if sys.platform == "darwin" else "-v", COMPILER,
                        "build", small_fixture, "--backend", backend, "-O0",
                        "--link-flag", small_obj, "-o", small_binary], env=trace_env)
        small_peak = int(re.search(pattern, baseline.stderr)[1]) * (1 if sys.platform == "darwin" else 1024)
        run([small_binary])
        print(f"baseline {backend}: 128-element arrays; peak {small_peak} B", flush=True)
        binary = work / backend
        start = time.monotonic()
        result = run(["/usr/bin/time", "-l" if sys.platform == "darwin" else "-v", COMPILER, "build", fixture, "--backend", backend,
                      "-O0", "--link-flag", obj, "-o", binary], env=trace_env)
        elapsed = time.monotonic() - start
        pattern = (r"(\d+)\s+maximum resident set size" if sys.platform == "darwin"
                   else r"Maximum resident set size \(kbytes\):\s*(\d+)")
        peak = int(re.search(pattern, result.stderr)[1]) * (1 if sys.platform == "darwin" else 1024)
        assert max(small_peak, peak) < 512 * 1024 * 1024, (backend, small_peak, peak)
        # The sparse-static regression guard is relative: a 708334-element sparse
        # array must cost no more than the same program with 128 elements, beyond
        # the data the object itself must contain. The absolute RSS ceiling above
        # still catches gross runaway growth.
        # LLVM's object writer keeps runs of zeros as fill fragments, so it may
        # grow by nothing. The arm64 backend builds objects in memory: each large
        # static's section holds its bytes, holes included, and the finished image
        # is one more copy. It may grow by those two copies and no more; an
        # outgrown buffer left behind in the arena (as its data section once did,
        # 125 MB for this fixture) exceeds that.
        materialized = 0 if backend == "llvm" else 2 * FIXTURE_DATA_BYTES
        if backend == "arm64":
            allocation_pattern = r"coil-profile\tallocated\tbackend\.arm64-object\t(\d+)"
            small_allocations = re.findall(allocation_pattern, baseline.stderr)
            large_allocations = re.findall(allocation_pattern, result.stderr)
            assert len(small_allocations) == len(large_allocations) == 1, (
                'missing or duplicate arm64 object allocation trace',
                small_allocations, large_allocations)
            allocated_growth = int(large_allocations[0]) - int(small_allocations[0])
            assert allocated_growth < 16 * 1024 * 1024 + materialized, (
                backend, 'sparse hole count grew compiler allocation',
                small_allocations[0], large_allocations[0])
        else:
            assert peak - small_peak < 16 * 1024 * 1024, (
                backend, 'sparse hole count grew compiler memory', small_peak, peak)
        run([binary])
        growth = (f"object allocation growth {allocated_growth} B" if backend == "arm64"
                  else f"RSS growth {peak-small_peak} B")
        print(f"PASS {backend}: constructor visibility, holes, nested arrays, mutation; {elapsed:.3f}s / {peak} B ({growth})")
    ir = run([COMPILER, "emit-ir", fixture]).stdout
    assert "target datalayout" in ir and "zeroinitializer" in ir
    assert len(ir) < 1_000_000, len(ir)
    globals_with_holes = [line for line in ir.splitlines() if line.startswith('@') and '70833' in line]
    assert globals_with_holes and all(len(line) < 2000 for line in globals_with_holes), globals_with_holes
    for initializer, phrase in [
        ("(array i64 2) :elements [(2 1)]", "out of bounds"),
        ("(array i64 2) :elements [(-1 1)]", "out of bounds"),
        ("(array i64 2) :elements [(0 1) (0 2)]", "increasing"),
        ("(array i64 2) :elements [(1 1) (0 2)]", "increasing"),
        ("i64 :elements []", "array"),
        ("(array i64 2) :elements [(0 true)]", "type"),
        ("(array i64 2) :elements [(0)]", "INDEX VALUE"),
        ("(array i64 2) :elements [(0 (runtime))]", "constant"),
    ]:
        source = work / "bad.coil"
        source.write_text('(module sparse.bad) (import "coil.primitive" :as p) '
                          '(extern runtime [] (-> i64)) '
                          f'(defn main [] (-> i64) (p/alloc-static {initializer}) 0)')
        failed = run([COMPILER, "emit-obj", source, "-o", work / "bad.o"], 1)
        assert phrase in failed.stdout + failed.stderr, (initializer, failed.stdout, failed.stderr)
print("sparse static initialization: passed")
