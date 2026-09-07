#!/usr/bin/env python3
"""Sparse constants retain link-time semantics and compile cost independent of holes."""
from pathlib import Path
import platform
import re
import subprocess
import sys
import tempfile
import time

ROOT = Path(__file__).resolve().parents[2]
COMPILER = Path(sys.argv[1]).resolve()


def run(args, expected=0):
    result = subprocess.run(list(map(str, args)), cwd=ROOT, text=True, capture_output=True)
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
int64_t native_check(void) __asm__("SPARSE_CHECK");
int64_t native_check(void) {
  return failed ? failed : sparse_storage()[350000] == 99 ? 0 : 4;
}
'''.replace('SPARSE_CHECK', '_sparse-native-check' if sys.platform == 'darwin' else 'sparse-native-check'))
    obj = work / "native.o"
    run(["cc", "-c", native, "-o", obj])
    fixture = ROOT / "tests/compiler/features/sparse_static.coil"
    backends = ["llvm"] + (["arm64"] if platform.machine() == "arm64" else [])
    for backend in backends:
        binary = work / backend
        start = time.monotonic()
        result = run(["/usr/bin/time", "-l" if sys.platform == "darwin" else "-v", COMPILER, "build", fixture, "--backend", backend,
                      "-O0", "--link-flag", obj, "-o", binary])
        elapsed = time.monotonic() - start
        pattern = (r"(\d+)\s+maximum resident set size" if sys.platform == "darwin"
                   else r"Maximum resident set size \(kbytes\):\s*(\d+)")
        peak = int(re.search(pattern, result.stderr)[1]) * (1 if sys.platform == "darwin" else 1024)
        assert peak < 450_000_000, (backend, peak)
        run([binary])
        print(f"PASS {backend}: constructor visibility, holes, nested arrays, mutation; {elapsed:.3f}s / {peak} B")
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
