# Empty boolean-diamond checkpoint

Standalone implementation `83f4e00`, main merge `595cb62`; Coil integration `f904ad20`. The pass ports pinned upstream `ir_sccp.c:ir_optimize_phi` constant 0/1 diamonds, preserving explicit control-root remapping and exact use lists. Typed folds follow `ir_fold.h`; inverted wider integer results retain COND. Central LICENSE, NOTICE and PROVENANCE attribution apply.

ASAN passed 80 combinations of boolean/integer result types, predecessor orders, inverted results and side effects, with maintained use lists compared to a rebuild. Full SCCP orchestration, iterative fold/CSE, native rewrite, 1254 scalar-view promotion cases and stencil vectorization passed.

On the unchanged 200-million-call branch fixture, five warm alternating samples produced medians LLVM O3 0.170258292s and stogir O3 0.383819666s. The main-loop assembly is identical to the prior scalar Always checkpoint: this measurement establishes no performance gain from the new pass. The 5× compile / within-10%-runtime full compiler target remains unmet; no full compiler timing rerun was warranted for this small result.

The importer emits END/single-predecessor MERGE boundaries between conditional projections and arm bodies. SCCP changes these MERGEs to BEGIN. Pinned upstream subsequently normalizes eligible END/BEGIN pairs using `ir_merge_blocks`; that additional control normalization remains under development in the isolated standalone worktree and is not part of this checkpoint.

FAST passed 49/49 in 213.6s, warning on cli/objects at 1.60GB versus 1.5GB. Official global install of f904ad20 passed. Off-checkout verification confirmed exact source correspondence for all 137 SDK modules, code-section equality with the candidate, correct timing backend tags, native LLVM/TPDE/stogir execution and the installed 80-case control/pipeline suite.
