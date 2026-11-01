# Optimization-sensitive periodic stencil

Measured 2026-11-01 on Apple M2 Max, macOS arm64. Benchmark source/harness: `cc7d9f8e`. Compiler: `a94a62a6314d7d6924e313bc5f5ae0d9b78c0369`, unchanged from the initial comparison.

This workload deliberately exposes an optimization opportunity absent from the first serialized recurrence kernels: a periodic three-point stencil over 16,384 u32 cells in two buffers. Each pass depends on the preceding pass, while cells within a pass can be computed independently. It uses wrapping integer arithmetic, no explicit SIMD, and a position-weighted output checksum. All four variants compile the same Coil source and run 200,000 passes with seed 12345 (3,276,800,000 cell updates).

Five measured rounds follow one warmup, rotating variant order. `llvm` uses LLVM `-O3`; the additional `llvm-o0` control uses LLVM `-O0`. TPDE and stogir receive `-O3`; all variants use `--no-debug`. Compile, platform link and process runtime are timed separately. Every full output and exit status matches the LLVM `-O3` baseline. Compiler, SDK/stdlib source digest, harness and kernel hashes are unchanged across the completed run.

| Variant | Whole-command compile ms, median | Runtime ms, median [range] | Runtime / LLVM O3 |
| --- | ---: | ---: | ---: |
| llvm | 218.8 | 313.3 [308.2–690.9] | 1.00× |
| llvm-o0 | 232.4 | 4629.8 [4501.0–4821.2] | 14.78× |
| tpde | 209.8 | 4115.1 [3979.6–4138.6] | 13.14× |
| stogir | 190.5 | 7452.4 [7437.4–7739.8] | 23.79× |

LLVM `-O3` is **14.78× faster than LLVM `-O0`**, **13.14× faster than TPDE**, and **23.79× faster than stogir** here.

The actual acceptance criteria are **10× faster IR-to-machine-code generation than LLVM O3, with runtime no more than 10% slower**. The whole-command compile column includes frontend/startup and cannot establish that code-generation target. Runtime is far outside the target. A separate, consistently bounded IR-to-machine-code measurement remains necessary.

This rerun clears inherited Coil project configuration before spawning compilers. A first diagnostic run inherited settings from an unrelated caller project; its samples are superseded. This clean run includes a large LLVM outlier, visible in the reported range; no individual samples were discarded.

The LLVM `-O3` object retains the pass loop and emits an inner loop processing eight cells per iteration with SIMD loads, lane extraction, vector adds and stores. An excerpt from `llvm-objdump -d llvm.o`:

```asm
ldur q1, [x15, #-0x8]
ldur q0, [x15, #0x8]
ldp q4, q5, [x15, #-0x10]
ext.16b v3, v1, v0, #0xc
add.4s v1, v1, v4
add.4s v4, v0, v5
add.4s v3, v3, v3
add.4s v2, v2, v2
add.4s v1, v1, v2
add.4s v2, v4, v3
stp q1, q2, [x16, #-0x10]
```

This establishes real automatic vectorization, rather than an eliminated workload. Other loop and scalar code-generation differences also contribute; the entire speedup is not attributed solely to SIMD. This is a targeted optimizer benchmark, not a representative application suite. Wall times include process startup, capture and reaping; this does not measure in-process JIT latency. The known stogir correctness/coverage gaps from the [initial report](STOGIR_INITIAL.md) still apply.

Reproduce with the [Coil harness](../../scripts/benchmarks/NATIVE_BACKENDS.md), source `scripts/benchmarks/native-stencil.coil`, `--iterations 200000 --samples 5 --llvm-o0`. Preserve [raw samples](stogir-stencil.csv) and [input hashes/toolchain stamp](stogir-stencil-inputs.json). Smoke samples are excluded.

Existing single-run compiler timing diagnostics report LLVM optimization 20 ms
and object emission 8 ms; the native whole-object phases report stogir 7 ms and
TPDE 1 ms. These have different boundaries (native includes CIR lowering and
module work), millisecond rounding and no repeated-sample summary, so they are
**not** a validated IR-to-machine-code comparison or proof of the 10× target.

## Why stogir loses to TPDE here

The generated scalar hot path executes approximately 57 instructions per cell
for stogir versus 29 for TPDE (static count along the taken inner-loop path,
not a hardware instruction-counter measurement). Neither scalar loop uses the
LLVM loop's automatic SIMD. The stogir-specific loss is visible before SIMD:

- A u32 zero-extension frequently becomes `mov #32; lsl; mov #32; lsr`, while
  TPDE emits one `ubfx`. Redundant `ubfx` after zero-extending `ldr wN` also remains.
- Array indexing uses separately materialized constant 4, multiply, add and
  address bitcast instructions; TPDE selects `add ..., index, lsl #2`.
- A loop comparison is materialized as a Boolean, extended, compared with zero,
  materialized again and then branched on. TPDE uses compare and conditional branch.
- No-op moves and branches survive in the emitted block layout.

The adapter routes much arithmetic through `builder.emit!`, which validates and
appends graph nodes rather than calling the operation-specific folding builders.
Some other construction paths, such as conversions, do use checked/folding APIs.
The current graph preparation verifies, places and schedules nodes; this is not
the complete upstream IR optimizer. Consequently these results measure this
incomplete Coil port/integration, not the performance of Dmitry Stogov's original
optimizing library. “Optimizing” does not yet describe all operations on this path.

These are confirmed code-quality defects, but instruction counts alone do not
assign an exact share of the 1.81× stogir/TPDE runtime difference to each defect.
They provide concrete fixes to test before attributing the difference to register
allocation or adding expensive optimization passes. Automatic vectorization is
separately required to address this workload's much larger gap to LLVM O3.
