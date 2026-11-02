# Installed canonical allocation block scheduling

Executable source 4784ba2a; standalone executable source 7801b60 (merged in adc392c).
Reusable pressure arrays avoid repeated allocation. Canonical loop-aware block
ordering follows pinned dstogov/ir scheduling before matching and liveness. It
removes the observed hot-loop transfer pair through allocation; physical block
layout remains a separate pass. See standalone docs/LOOP_BLOCK_ORDER.md for the
upstream algorithm, irreducible fallback limitation and reference tests.

Unchanged native-stencil, 200000 passes, seed 12345, O3/no debug, rotated backends,
five measured samples after warmup. IR to object includes optimization:

| Backend | IR to object median ms | Whole compile median ms | Runtime median ms |
| --- | ---: | ---: | ---: |
| LLVM O3 | 25.823 | 211.294 | 379.558 |
| TPDE | 0.134 | 179.846 | 4035.064 |
| stogir O3 | 5.917 | 187.061 | 403.313 |

Codegen is 4.364x faster, below the required 5x. Runtime is 1.0626x LLVM in this
run, within 10%, but remains provisional: external activity occurred in all 17
monitor samples. LLVM runtime ranged 373.811–444.752 ms and stogir 397.103–663.910.
This does not replace the accepted baseline or establish the full goal. Raw
samples, hashes and load observations accompany this report.

Full standalone validation: 236 programs and 72 freshly linked AOT consumers.
Focused ASAN covers 325 block-order reference cases, pressure-buffer oracles,
Phi/branch/switch pressure and native stencil checks. Coil FAST passed in 261.1s
with cli/objects memory warning (1.62GB versus 1.5GB). Official global install
completed. Installed code sections match the candidate, all 133 SDK modules match
standalone main, off-checkout LLVM/TPDE/stogir object/link/run checks and all new
namespace imports pass. See ../validation/stogir-loop-order-pipeline-installed.json.
