# Compiler checkpoint: cross-block promotion and scalar Always lowering

Measured on the local arm64 Mac using Coil source `35109703`, standalone engine `91420dd`, O3. These are diagnostic samples, not acceptance medians. The goal remains 5× faster IR-to-machine-code generation and generated compiler runtime within 10% of LLVM O3.

| Fixed LLVM-built driver, full compiler source | LLVM O3 | stogir O3 |
|---|---:|---:|
| IR-to-machine-code seconds | 32.854129 | 17.350903 |
| Total emit-object wall seconds | 38.907702 | 24.121575 |
| Object bytes | 8,268,320 | 12,786,608 |

The code-generation speedup is 1.89×, below the 5× target. Native timing now includes disjoint scalar Always eligibility and body-lowering spans, so older measurements with different accounting are not directly comparable. Host/comptime TPDE spans are excluded from target totals. An earlier run with mixed backend tags was rejected. Timing on/off produces identical objects for all three backends when both runs explicitly use serial emission; parallel symbol ordering can otherwise change object metadata.

| Full compiler emission runtime by generated compiler | LLVM-built host | stogir-built host |
|---|---:|---:|
| LLVM target, wall seconds | 38.907702 | 68.110577 |
| stogir target, wall seconds | 24.121575 | 203.459118 |

These single correctness runs produce byte-identical target objects across hosts. The stogir-built host is 8.43× slower on stogir emission, far outside the 10% runtime goal. This remains an open performance gap.

Cross-block field promotion reduces the small branch kernel from 33 instructions and 12 memory operations to 10 instructions without memory operations. It did not improve the whole loop because caller helpers dominated. Safe scalar Always expansion then removed an opaque conditional comparison call. General default/aggregate helper inlining remains open.

The new slice-helper fixture isolates that next gap with one shared LLVM-built caller, 20 million calls and checksum 310000000. Five warm samples give medians LLVM 0.078098917 s and stogir 0.226998375 s (2.91× slower). The stogir kernel has 53 instructions versus LLVM's 10 and retains slice construction, equality and length calls. Link maps confirm helpers come from the tested backend object. Fixtures are in standalone `benchmarks/compiler-gaps/slice-helpers*.coil`.

Validation: FAST 49/49; official global installation; off-checkout checks of all 136 SDK modules; LLVM/TPDE/stogir native regression execution; ASAN promotion tests including a 2048-block chain. Source commits: Coil `4b01753f`, `94d1b580`, `35109703`. Cross-block SSA uses an explicit frame stack and preserves predecessor operand positions. It is a documented demand-driven implementation, not a claim of upstream algorithm parity.

Next work: port upstream's empty boolean-diamond simplification in the standalone optimizer, validate typed folds and control/use-list invariants, then measure small cases before another full build. Work is isolated in `.worktrees/boolean-if-conversion`; it is not installed in this checkpoint.

Later measurement audit: standard-library state sidecar availability was not explicitly matched across hosts in this historical checkpoint. Do not use its wall-time host ratio as a controlled acceptance result. See AGGREGATE_ALWAYS_COMPILER_CHECKPOINT.md for an explicit cache-disabled comparison.
