# Upstream-aligned scalar selection checkpoint

Measured on Apple M2 Max, macOS arm64, 2026-11-01. Compiler/harness revision `3abe20f2`; independent library source `dc90b58`. The original [stencil baseline](STOGIR_STENCIL.md) and its raw samples/input hashes are unchanged.

The same `native-stencil.coil` source runs 200,000 passes over 16,384 u32 cells with seed 12345. Five samples follow warmup, rotating LLVM/TPDE/stogir order. All full outputs and exit statuses agree. `-O3 --no-debug` is retained for every backend.

| Backend | IR-to-object ms, median [range] | Whole-command compile ms, median | Runtime ms, median [range] |
| --- | ---: | ---: | ---: |
| llvm | 28.231 [27.582–28.799] | 217.3 | 319.1 [315.8–371.4] |
| tpde | 0.123 [0.120–0.141] | 186.6 | 4089.1 [4079.1–4104.2] |
| stogir | 5.440 [5.376–5.472] | 184.7 | 6047.7 [6021.0–6377.2] |

Stogir IR-to-object generation is **5.19× faster than LLVM O3** here. Its runtime is **18.95× LLVM O3** and **1.48× TPDE**. Against the fixed original stogir baseline of 7452.425 ms, the new observed runtime is 6047.747 ms, about **18.8% lower**. This compares separate runs, not per-fix cycle attribution.

**The acceptance criteria remain unmet:** 10× faster IR-to-machine-code generation and runtime at most 1.10× LLVM O3. For this run that would require IR generation at most 2.823 ms and runtime at most 351.1 ms.

## Architecture and code changes

- Construction now uses the pinned upstream commutative operand ordering (lower reference, including constants, on operand 2).
- `TRUNC(ZEXT/SEXT)` follows the original four width cases and restart behavior in `ir_fold.h`.
- Constant shifts and power-of-two multiplication follow `IR_SHIFT_CONST` / `IR_MUL_PWR2` selection in `ir_aarch64.dasc`.
- Conservative copy/extension cleanup removes known redundant operations. The compiler adapter uses folding builders, typed narrow conversions and direct Boolean dependencies.

The scalar hot path drops from approximately 57 to 29 instructions, a static path count rather than a hardware-counter profile. It still materializes branch predicates and contains avoidable control transfers. Neither the instruction count nor these measurements proves upstream optimizer parity. SCCP, complete matching/fusion before liveness, coalescing, block scheduling and an allocator invariant audit remain open. See the [architecture audit](../reference/STOGIR_BACKEND.md#architecture-fidelity-audit). LLVM still auto-vectorizes this workload; a corresponding loop-vectorization stage is not established by the pinned upstream pipeline.

## Timing boundary

The new `ir-codegen` row measures constructed IR to relocatable object bytes, excluding frontend/IR construction, target-context setup and disk writes. Stogir starts with its constructed graph; TPDE with finished CIR; LLVM with lowered LLVM IR. The measured implementation includes its validation, optimization, selection/allocation, emission and object merging/serialization. The native backends run serially in this mode, and their non-overlapping per-function/module durations are summed. LLVM emits into memory while measuring, then writes the object outside the timer. These are equivalent API boundaries over different IR formats and optimizer coverage, not identical instruction inputs.

Raw monotonic durations use nanosecond units, with platform-dependent clock resolution. The whole-command compile row includes the frontend and measurement overhead/serial mode, and is not the metric for the 10× criterion. Runtime includes process startup/capture/reaping.

Measured and normal emission produce byte-identical objects when both use the same serial native configuration; all three measured fixtures return 42. Different parallel/serial stogir runs can assign different private symbol names, so byte equivalence was checked with execution configuration held fixed.

Validation: independent library 211 standalone and 65 linked AOT checks on frozen inputs, regenerated objects, and 389 Coil source/test files. Compiler FAST 49/49 passes in 240.4 s; cli/objects memory warning 1.62 GB against the 1.5 GB warning line. No claim of full stogir corpus readiness is made; the previously recorded 6/9 and open tail-call/pinned/numeric gaps still apply.

Evidence: [raw samples](stogir-scalar-selection.csv), [input hashes and toolchain stamp](stogir-scalar-selection-inputs.json), [serial object-equivalence checks](stogir-scalar-selection-object-checks.json). Recorded binary, harness, kernel, stamp hashes and complete compiler/stdlib source digest stayed unchanged across measurement. Reproduce using the [Coil harness](../../scripts/benchmarks/NATIVE_BACKENDS.md) with `--iterations 200000 --samples 5 --codegen-timings`.
