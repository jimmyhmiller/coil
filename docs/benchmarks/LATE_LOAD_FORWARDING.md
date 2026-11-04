# Constant-expression CSE and late load forwarding

Source 4b550a03; standalone 0aa04ad. Previous delivered source fac9b96e. CSE-only intermediate 11da3c99.

The compact graph and existing affected-node worklist remain the optimization architecture. A lazy exact-key index handles constant-only CSE after raw cloning. Exact-width aliasing loads are reconsidered after affected scalar/control cleanup, reusing the bounded alias finder. No extra IR or repeated whole forwarding pass is added. Arbitrary observation roots retain values, effects, and unreachable-observation diagnostics.

A discovered shared alias bug is corrected: named address constants store string-table IDs rather than numeric displacements. Native regression execution fails before the numeric guard (expected 11, got 0) and passes afterward. Fixed numeric function addresses remain valid offsets.

## Unchanged small workload

`coil-stogir/benchmarks/opcode-properties.coil`, 10,000,000 rounds, checksum `9979482367440117777`, SHA256 `0393b0c9df47004a76c6825c43382aee448966f4f200c04e5372d43b2197c8fb`.

| Backend | IR-to-code ms | Runtime wall ms | Runtime CPU ms | Kernel instructions |
|---|---:|---:|---:|---:|
| delivered-stogir | 8.1765 | 85.807958 | 61.554 | 58 |
| cse-stogir | 8.0185 | 64.368125 | 61.441 | 47 |
| current-stogir | 8.133 | 64.772792 | 62.167 | 46 |
| llvm | 34.276 | 62.971625 | 34.289 | 24 |
| tpde | 0.244 | 270.611542 | 265.391 | 83 |

Four rotating compile samples and nine runtime samples after excluded warmups; caches disabled and serial codegen. Runtime uses ordinary build executables including the stronger plural-object LLVM reference (24 instructions); codegen uses emit-obj. Raw distributions and kernel disassemblies are retained here. CPU is serial child user+system accounting and supplements process wall time; scheduling noise prevents claiming a runtime gain from the wall medians alone.

The new kernel performs one table load instead of four and contains 46 instructions versus 58 in the installed backend. Its CPU runtime is essentially unchanged and approximately 1.81× LLVM. Code generation is approximately 4.21× faster than LLVM on this small case. The 5× compiler-generation and within-10% compiler-runtime goal remains unmet; these are not compiler bootstrap acceptance measurements.

## Validation

Standalone mem2ssa native and AddressSanitizer suites pass, including 2,115 late-forwarding combinations, direct-return edges, unreachable observations and symbolic-offset regressions. Candidate-built stogir O3 mem2ssa, module execution, iterative folding, SCCP control and fold-decision suites pass with the exact workload checksum. FAST and installed checks are pending.

## Remaining gaps

The kernel still has redundant moves and narrow extensions and reconstructs wide invariant constants in its loop. Measure those gaps against upstream matching, allocation and loop handling before adding new rules. Attribution remains centralized in LICENSE, NOTICE and provenance.

Reproduce code generation with the candidate and the exact unchanged source:

```sh
COIL_LIBRARY_STATE=0 COIL_TPDE_SERIAL=1 COIL_CODEGEN_TIMINGS=1 build/bin/coil-candidate emit-obj /path/to/coil-stogir/benchmarks/opcode-properties.coil --backend stogir -O3 --no-debug -o /tmp/opcode-properties.o
```

Repeat with `--backend llvm` and `--backend tpde`. Runtime uses `build` with the same flags instead of `emit-obj`, then runs the produced executable. Exclude the first sample, alternate backend order, and preserve all codegen records rather than measuring only one subphase. The report's raw JSON retains every included compile, wall-runtime and CPU-runtime sample.
