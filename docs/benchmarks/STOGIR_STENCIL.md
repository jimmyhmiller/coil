# Optimization-sensitive periodic stencil

Measured 2026-11-01 on Apple M2 Max, macOS arm64. Benchmark source/harness: `8c05d44c`. Compiler: `a94a62a6314d7d6924e313bc5f5ae0d9b78c0369`, unchanged from the initial comparison.

This workload deliberately exposes an optimization opportunity absent from the first serialized recurrence kernels: a periodic three-point stencil over 16,384 u32 cells in two buffers. Each pass depends on the preceding pass, while cells within a pass can be computed independently. It uses wrapping integer arithmetic, no explicit SIMD, and a position-weighted output checksum. All four variants compile the same Coil source and run 200,000 passes with seed 12345 (3,276,800,000 cell updates).

Five measured rounds follow one warmup, rotating variant order. `llvm` uses LLVM `-O3`; the additional `llvm-o0` control uses LLVM `-O0`. TPDE and stogir receive `-O3`; all variants use `--no-debug`. Compile, platform link and process runtime are timed separately. Every full output and exit status matches the LLVM `-O3` baseline. Compiler, SDK/stdlib source digest, harness and kernel hashes are unchanged across the completed run.

| Variant | Compile ms, median | Runtime ms, median [range] | Runtime / LLVM O3 |
| --- | ---: | ---: | ---: |
| llvm | 220.9 | 306.1 [304.6–311.5] | 1.00× |
| llvm-o0 | 218.3 | 4481.3 [4450.7–4519.9] | 14.64× |
| tpde | 181.2 | 3927.7 [3915.9–3964.7] | 12.83× |
| stogir | 192.9 | 7180.4 [7094.2–7216.3] | 23.46× |

LLVM `-O3` is **14.64× faster than LLVM `-O0`**, **12.83× faster than TPDE**, and **23.46× faster than stogir** here. The end-to-end compile cost is 220.9 ms for LLVM `-O3`, versus 181.2 ms for TPDE and 192.9 ms for stogir.

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
