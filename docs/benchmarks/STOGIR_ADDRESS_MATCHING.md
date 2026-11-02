# Installed AArch64 memory address matching

Executable source 529d4d1c, standalone library cd70444. The same compact graph
feeds matching, liveness, allocation and the shared JIT/AOT image. Memory operands
now select scaled or unscaled base/offset forms before allocation. Observable,
escaping and partially fused address definitions remain; HARD COPY is preserved.
All work stays in the unchanged IR-ready-to-relocatable-object interval.

Five measured post-warmup samples, rotated backend order, unchanged native-stencil
workload (200000 passes, seed 12345), O3/no debug:

| Backend | IR to object median ms | Whole compile median ms | Runtime median ms |
| --- | ---: | ---: | ---: |
| LLVM O3 | 26.290 | 216.639 | 359.131 |
| TPDE | 0.131 | 179.091 | 4048.751 |
| stogir O3 | 7.802 | 194.838 | 453.505 |

These are provisional. All 17 load samples observed external CPU activity,
including Turbopack and macOS services. LLVM runtime ranged 350.115–396.274 ms,
stogir 438.353–571.825 ms. No accepted baseline is replaced. The measured 3.37x
codegen speed and 1.263x runtime both miss the active ≥5x /≤1.10x target.
The preceding pre-manifest-repair candidate 4d3ff582 measured 7.671 ms codegen and
445.463 ms runtime, also provisional. Both raw sample/hash/load sets accompany
this report; neither run establishes performance acceptance.

The clean candidate passes FAST 49/49 in 276.1 seconds (cli/objects 1.64 GB warning),
and is installed globally. Off-checkout LLVM/TPDE/stogir object-link-run checks
pass. Installed code sections equal candidate; 133 SDK modules byte-match the
standalone source. All six newly vendored modules import off-checkout. The first
probe exposed missing generated SDK manifest entries; regeneration and canonical
reexports are committed, and generator --check now passes.

Standalone compatibility evidence: 233 programs and 71 linked AOT consumers;
95 independent assembler words; 700 focused native cases; focused ASAN validation
including the wrapper error-path checks. See the vendored ADDRESS_MATCHING.md
and ../validation/stogir-address-pipeline-installed.json for scope.

Diagnostic captured-graph codegen profiling found allocation pressure scans,
constraint-use iteration and location lookup as prominent leaf costs. A separate
pressure-index library worktree is under validation; it is not in this compiler.
Further runtime work includes target vector arithmetic selection and the hot-loop
spill/layout. The workload and LLVM optimization settings remain frozen.
