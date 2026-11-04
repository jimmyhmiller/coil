# Immediate integer comparisons: reduced checkpoint

Compiler implementation source 712b947c; standalone cfb432c and emission-fixture correction 728d96a. The feature is committed in worktrees; it is not yet installed globally or pushed. Global executable remains 67f02f1e. The 5× generation/within 10% bootstrap objective remains unmet.

Numeric CMP/CMN displacements and commuted conditions are recorded in the persistent matching Tile before allocation. Fused branches consume that same Tile for operands and condition; compatibility APIs select from unchanged graphs. Narrow signed/unsigned normalization stays in the established emitter. Named symbol IDs and unencodable constants retain register materialization. No semantic graph mutation or emission peephole is involved. Upstream attribution is centralized in the vendored PROVENANCE, LICENSE and NOTICE.

Native and ASAN matrix execution passes 10,920 graphs across integer widths, all ten conditions, both constant sides, value-producing comparisons, full-width fused branches and rooted/unfused branches. Invalid immediate tiles append no partial CMP/CSET output. Named FUNC/SYM/STR exclusions and fixed numeric address controls pass. The old selector fails the new zero-comparison assertion. The reduced zero/minus-one/4096 leaves shrink 5→4 instructions, retaining the return BOOL normalization and RET, with identical native results.

The existing a64-emit fixture asserted a hard return register after the prior soft-return change. It reproduces one failure on 79515a1; the corrected fixture checks kind 0/register -1 while retaining hard parameter-register checks. Selection/emission, integer comparisons, branch relaxation, allocation, modules, memory and call pressure pass with LLVM-built test hosts. The stogir-built new matrix and integer comparison suite pass, but integration exposed a pre-existing long-branch-harness crash, also reproducible with the previous installed compiler and previous standalone source. It is recorded in coil-bugs/stogir-long-branch-harness-crash. A small Pair-return loop now reproduces stack exhaustion on stogir while LLVM/TPDE pass; that correction is separate ongoing work.

## Identical checked AVec workload

The fixture and opaque LLVM-built caller are unchanged. 20,000,000 accesses, checksum 859763163008. Four rotating generation samples and six rotating runtime samples follow excluded warmups. Every generation sample must emit byte-identical objects. CPU is child user+system accounting; wall includes scheduling and launch. Exact samples, object/source/runner hashes and qualifications are in [avec-results.json](compare-immediate/avec-results.json). Kernel-only disassembly is adjacent.

| Backend | Generation median ms | Runtime CPU median ms | Runtime wall median ms | Kernel words | Object bytes |
|---|---:|---:|---:|---:|---:|
| before-stogir | 8.716500 | 67.378500 | 70.508687 | 62 | 13900 |
| current-stogir | 8.713000 | 67.444000 | 91.108542 | 58 | 13708 |
| llvm | 36.401500 | 49.019000 | 63.676333 | 36 | 7480 |
| tpde | 0.270500 | 197.273500 | 210.904084 | 14 | 10620 |

Three repeated MOV-to-scratch constant materializations disappear in the getter; padding changes as well. Generation is at parity with the previous backend. CPU runtime does not improve and remains about 1.38× LLVM. Fewer instructions are not treated as a runtime win. No whole-compiler improvement or acceptance result is claimed from this reduced test.

The reproduction driver now accepts `--compile-samples` (default 4), excludes initial compilations, rotates repeated generation and runtime phases separately, checks deterministic objects, and retains all measured samples. See `scripts/benchmarks/stogir-avec.py --help`.
