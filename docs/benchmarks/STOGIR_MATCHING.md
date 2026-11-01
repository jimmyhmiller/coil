# Persistent matching checkpoint

Measured on Apple M2 Max, macOS arm64, 2026-11-01. Compiler revision `52f263be`;
independent library `d5e69b1`. The original [stencil baseline](STOGIR_STENCIL.md)
and [previous scalar checkpoint](STOGIR_SCALAR_SELECTION.md) remain unchanged.

Identical `native-stencil.coil`, 16,384 periodic u32 cells, 200,000 passes,
seed 12345, `-O3 --no-debug` for all three backends. Five samples follow one
warmup round, rotating backend order. All complete outputs and exit statuses
agree. No build or validation suite ran alongside measurement. Compiler, SDK
source digest, toolchain stamp, harness and workload hashes stayed fixed.

| Backend | IR-to-object ms, median [range] | Whole-command compile ms, median | Runtime ms, median [range] |
| --- | ---: | ---: | ---: |
| llvm | 28.194 [27.202–30.780] | 228.110 | 321.359 [316.902–345.205] |
| tpde | 0.160 [0.123–0.313] | 184.433 | 4100.394 [4042.428–6783.222] |
| stogir | 5.312 [5.280–5.545] | 205.551 | 6066.856 [6021.585–9581.900] |

Stogir code generation is **5.31× faster** than LLVM O3 on this workload;
runtime is **18.88× LLVM O3**. The active combined target is at least 5×
faster IR-to-machine-code generation and runtime at most 1.10× LLVM O3.
The codegen median meets its threshold; runtime fails substantially. The runtime
median is effectively unchanged from the previous 6047.747 ms checkpoint; this
run does not establish a runtime improvement. Large runtime outliers occurred
for TPDE and stogir and are retained in the ranges and raw samples.

The same [timing boundary](STOGIR_SCALAR_SELECTION.md#timing-boundary) applies:
constructed IR to relocatable object bytes, excluding frontend/IR construction,
target-context setup and disk writes. The native backends are serial in measured
mode. These are equivalent API boundaries over different IR formats and pass
coverage. Whole-command compile time is not the target metric.

## Architecture

Persistent matching now runs after graph scheduling and before register
liveness/allocation, following pinned `ir.h:ir_jit_compile`. Scalar selected rules
are retained for constraints and emission. Single-use, same-block 64-bit integer
comparisons can fuse with IF, following `IR_CMP_AND_BRANCH_INT`; fused results
receive no register interval and their operands remain live to the branch,
following `ir_ra.c` fusion-range handling. Explicit roots and shared values
retain materialized comparisons. The original Sea-of-Nodes graph remains intact.
JIT and AOT still share the compilation/image path.

Disassembly confirms CMP followed by conditional branches in the stencil.
Redundant branches, scalar address/width operations and the LLVM SIMD gap remain.
This checkpoint does not establish complete matcher/reuse, SCCP, mem2ssa,
coalescing, block scheduling or allocator parity. See the
[architecture inventory](../reference/STOGIR_BACKEND.md#architecture-fidelity-audit).

## Validation and evidence

- Library: 211 standalone checks; eight final focused checks including all ten
  signed/unsigned 64-bit predicates with extreme values across a call, roots,
  shared values and pressure. All 71 final-source object generators and 65 linked
  AOT consumers pass with frozen compiler/SDK and project input checks.
- Coil: FAST 49/49 passes in 205.1 seconds; object-test memory warning 1.60 GB
  against 1.5 GB. Full stogir corpus remains 6/9, with the previously recorded
  pinned-shim, numeric adaptation and deep-tail-call failures.
- Installed candidate `52f263be` globally with its matching SDK and warmed units.
  Off-checkout measured AOT emission, system linking and execution return 42
  with empty output under all three backends. The installed toolchain stamp
  matches the candidate; the new matching modules are present in the SDK.
- Additional untimed runs of the measured binaries at 1, 2, 17 and 257 passes
  agree across all backends with nonzero checksums. This supplements the fixed
  long-run output check without changing the benchmark.

[Raw samples](stogir-matching.csv), [input hashes](stogir-matching-inputs.json),
[full summary](stogir-matching-summary.json),
[short-run checks](stogir-matching-short-checks.json),
[installed AOT checks](stogir-matching-installed-checks.json).
Reproduce with the [Coil harness](../../scripts/benchmarks/NATIVE_BACKENDS.md):
`--iterations 200000 --samples 5 --codegen-timings`.
