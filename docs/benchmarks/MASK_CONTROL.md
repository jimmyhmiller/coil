# Stable mask proofs and late constant control

General integer mask/extension proofs and late constant IF cleanup are integrated into the shared stogir JIT/AOT optimizer. Late control changes repair predecessor/Phi positions, terminal chains and explicit observations before matching and allocation. They use the existing affected worklist and a dirty control-reachability rebuild, without another SCCP analysis or a second IR.

Integration exposed an incorrect mask proof: a temporary SCCP fact on a grandchild could remain captured after its direct consumer reached Bottom. In the real compiler runtime this made a loop-carried callee-saved mask stay zero, causing generated callers to clobber x19. Structural bounds now read only the immutable input graph, including the original comparison operand. Ordinary direct-input SCCP folding remains lattice-aware.

The transient-fact and cumulative register-layout regressions both fail with the previous proof and pass with the repair. The repaired candidate also passes module execution, the 360-case late-control matrix and the 10,401-graph mask/conversion matrix when compiled with stogir O3. The unchanged small opcode fixture remains a diagnostic, with the full compiler acceptance target still open.

Compiler source **45a58afb**, standalone **fcda1bd**. FAST **49/49 in 277.6 s**, with the existing object-step peak warning at 1.60 GB. Installed toolchain identity, AVec and all **145** stogir SDK modules match. Off-checkout LLVM/TPDE/stogir fixtures exit 42 with exact bounds diagnostics; installed stogir-built module, bitwise, control, iterative-fold, SCCP-fold and saved-register-layout suites pass. The two new regression areas also pass ASAN.

## Unchanged small workload

`coil-stogir/benchmarks/opcode-properties.coil`, SHA256 `0393b0c9df47004a76c6825c43382aee448966f4f200c04e5372d43b2197c8fb`, 10,000,000 rounds, checksum `9979482367440117777`. Caches disabled; serial code generation. These are small diagnostics with external CPU contention, not compiler bootstrap acceptance. No new full compiler timing or native self-rebuild claim.

The compile table uses `emit-obj`, four alternating measured samples after one excluded warmup, including all nonoverlapping code-generation timing records.

| Driver/backend | IR-to-machine code (ms) | Whole emission (ms) |
|---|---:|---:|
| previous-stogir | 8.309500 | 455.721854058 |
| current-stogir | 8.282500 | 459.574729030 |
| llvm | 34.801500 | 486.951770552 |
| tpde | 0.253500 | 439.653666515 |

The runtime table uses executables from ordinary `coil build`: one excluded warmup and nine alternating samples, all checksums verified. Child CPU time is user+system from `getrusage(RUSAGE_CHILDREN)` deltas for each serial process; wall time includes launch/scheduling. Both are retained because wall samples were bimodal under external load. CPU time does not replace the wall-time acceptance metric.

| Driver/backend | Process wall median (ms) | Process CPU median (ms) | Kernel instructions |
|---|---:|---:|---:|
| before-stogir | 125.252624974 | 100.828000 | 151 |
| after-stogir | 100.449833088 | 97.402000 | 109 |
| reference-llvm | 59.957791003 | 33.544000 | 24 |
| reference-tpde | 290.477208095 | 266.375000 | 83 |

The smaller stogir kernel improves CPU time about 3.4%, despite deleting 42 instructions. It remains about 2.90× LLVM CPU time. Its larger apparent wall-time gain is not a clean optimization result because scheduling overhead differs across samples. The 5× generation / within-10% runtime goal remains unmet.

### LLVM path distinction

The compiler explicitly enables plural LLVM objects for normal `build`; `emit-obj` retains its single-object API (`driver.coil`, `parallel-codegen-cell`). LLVM produces a 24-instruction kernel on the normal-build path and 36 on the single-object path. The single-object runtime samples are retained in `emit-object.json`, but the runtime table above uses the stronger 24-instruction normal-build reference. Compile and runtime columns describe their stated command paths, not one identical LLVM artifact.

### Remaining code-quality gaps

The stogir kernel still repeats the immutable properties-table address/load, materializes redundant Boolean comparisons and reconstructs loop-invariant multiplication/addition constants in the loop. LLVM uses one table load, combines the relevant flag bits and hoists constants. The next work should reduce those shapes with focused native tests before another full compiler comparison.

Attribution remains centralized in the vendored LICENSE, NOTICE and provenance documentation. No per-test license headers were added. Raw samples, checks and disassemblies are in [mask-control](mask-control/).
