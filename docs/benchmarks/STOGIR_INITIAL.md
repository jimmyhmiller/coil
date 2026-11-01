# Initial stogir backend comparison

Measured 2026-11-01 on Apple M2 Max, macOS arm64. Compiler and harness: Coil `a94a62a6314d7d6924e313bc5f5ae0d9b78c0369`; independent stogir source: `ca8d754`. The compiler was rebuilt from the committed tree. All 113 vendored Coil implementation files match the independent library byte-for-byte.

The identical Coil source and inputs run through LLVM, TPDE and stogir with `-O3 --no-debug`. Each of its integer recurrence, dependent memory and FP recurrence kernels runs 200,000,000 iterations with seed 12345. Five measured samples follow one warmup round. Backend order rotates; compile, platform link and run are measured separately. Every executable exits successfully and prints exactly the LLVM baseline output. Compiler/source hashes and the complete SDK/stdlib source digest were unchanged across the run.

| Backend | Compile ms, median [range] | Link ms, median [range] | Run ms, median [range] |
| --- | ---: | ---: | ---: |
| llvm | 168.8 [166.8–198.9] | 34.9 [34.0–37.7] | 1706.6 [1674.4–1791.5] |
| tpde | 141.2 [138.1–146.9] | 36.5 [34.6–38.0] | 1920.1 [1840.8–1933.6] |
| stogir | 146.7 [144.9–152.0] | 35.8 [34.7–39.3] | 2097.1 [2057.2–2145.8] |

For this workload, stogir compiles about 13% faster than LLVM and 4% slower than TPDE; its executable runs about 23% slower than LLVM and 9% slower than TPDE. These are initial end-to-end wall-clock results on one small mixed kernel. Compile time includes the shared frontend; run time includes process startup/capture/reaping. They do not isolate selector cost, measure in-process JIT latency, establish scaling behavior, or describe a representative workload suite.

The native fixture passes all three engines, but stogir currently passes 6/9 full corpus programs. Known gaps include pinned-register shim calls, narrow bit operations/i128, and tail-call stack behavior. The latter can exhaust the stack on deep recursion. Public stateful JIT selection and DWARF are not implemented. Do not treat this result as general backend readiness.

Reproduction and methodology: [native benchmark harness](../../scripts/benchmarks/NATIVE_BACKENDS.md). Evidence: [raw samples](stogir-initial.csv), [input hashes and toolchain stamp](stogir-initial-inputs.json). Earlier smoke runs and an interrupted run were excluded.
