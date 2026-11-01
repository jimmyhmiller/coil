# AArch64 block-layout checkpoint

Measured on Apple M2 Max, macOS arm64, 2026-11-01. Compiler `60174544`;
independent library source `8c0cab3`. The original stencil, scalar selection,
matching and fallthrough reports remain unchanged.

The unchanged `native-stencil.coil` uses 16,384 periodic u32 cells, 200,000
passes and seed 12345. Five measured samples follow warmup in rotated backend
order, with `-O3 --no-debug` for every backend. No build or test ran alongside
measurement. Compiler, SDK/source digest, stamp, harness and workload hashes
remain fixed. Complete output and exit status agree across all backends.

| Backend | IR-to-object ms, median [range] | Whole-command compile ms, median | Runtime ms, median [range] |
| --- | ---: | ---: | ---: |
| LLVM O3 | 26.379 [25.959–27.903] | 234.321 | 305.910 [303.237–306.935] |
| TPDE | 0.148 [0.141–0.173] | 176.116 | 3982.968 [3956.141–4016.474] |
| stogir | 5.443 [5.377–5.751] | 185.615 | 2960.654 [2940.227–2964.252] |

Stogir code generation is **4.85× faster** than LLVM O3, below the active
5× threshold. Runtime is **9.68× LLVM O3**, far above the within-10% target
(336.501 ms here), and 25.7% faster than TPDE. The prior fallthrough run was
2959.625 ms: this checkpoint shows no meaningful runtime improvement. These
are separate runs; within-run ratios and ranges are the primary comparison.
Both acceptance criteria remain unmet.

The [timing boundary](STOGIR_SCALAR_SELECTION.md#timing-boundary) remains
constructed IR to relocatable object bytes, excluding frontend/IR construction,
target-context setup and disk writes. Whole-command time is provided separately.
Accepting `-O3` does not establish upstream optimization-stage parity: stogir
still lacks SCCP, mem2ssa and explicit upstream optimization-level policy.

## Architecture and code inspection

The independent library ports pinned `ir_cfg.c:ir_schedule_blocks`: bottom-up
Pettis-Hansen for reducible functions at most 256 blocks, top-down otherwise.
Physical order changes after allocation while original instruction subpositions
remain fixed. Empty-block aliases, loop rotation and eight-byte alignment flow
through shared buffer/image/module/JIT/AOT machinery. Conditional relaxation
preserves labels, instruction relocations, inline data and relative tables.

The 59-case differential against the unmodified pinned C scheduler matches
block order and alignment on identical post-allocation facts. It includes
weighted branches, switch values/ranges, nested loops, empty cycles, cold arms,
irreducibility and the 256/257 boundary. This establishes the tested scheduler
core, not surrounding CFG/loop-analysis/allocator equivalence. Optional
empty-entry merging is disabled. No C implementation ships with the library.

The steady interior path now has **22 instructions and one backward conditional
branch**, versus 23 instructions and two branches in the previous checkpoint.
Its loop head is at object offset 0x3c0, aligned to eight bytes. LLVM still
processes eight cells per vectorized iteration; stogir remains scalar with
address arithmetic and width-normalization instructions. Static disassembly
is not a hardware-counter profile. Layout alone has not closed that gap.

SCCP, mem2ssa, full matching/reuse, coalescing and allocator parity remain open.
Automatic loop vectorization is not established in pinned upstream. See the
[architecture audit](../reference/STOGIR_BACKEND.md#architecture-fidelity-audit).

## Validation

- Final-source standalone validation: 212 checks and 65 linked AOT consumers,
  freshly generated object fixtures and frozen compiler/SDK/project hashes.
- Native JIT and linked AOT cover named relocations beside expanded long
  branches, forward/backward reach, cascading relaxation, rollback, empty
  cycles and loop alignment through image/module composition.
- Coil FAST passes 49/49 in 194.1 seconds. Its object-test peak is 1.70 GB,
  above the 1.5 GB warning threshold.
- Full stogir corpus remains 6/9 with the same pinned-instruction adaptation,
  narrow numeric adaptation and deep-tail-call failures.
- Compiler `60174544` is installed globally with matching toolchain stamp.
  Off-checkout installed AOT emission, system linking and execution pass for
  LLVM, TPDE and stogir (exit 42, empty output, codegen timing records present).
- Supplemental runs at 1, 2, 17 and 257 passes agree across all three measured
  binaries with nonzero checksums. The long benchmark source is unchanged.

[Raw samples](stogir-block-layout.csv), [input hashes](stogir-block-layout-inputs.json),
[summary](stogir-block-layout-summary.json), [static path](stogir-block-layout-code.json),
[short-run checks](stogir-block-layout-short-checks.json),
[installed checks](stogir-block-layout-installed-checks.json).
Reproduce with the [Coil harness](../../scripts/benchmarks/NATIVE_BACKENDS.md):
`--iterations 200000 --samples 5 --codegen-timings`.
