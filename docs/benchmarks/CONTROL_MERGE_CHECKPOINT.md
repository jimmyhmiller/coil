# END/BEGIN normalization checkpoint

Engine `2d5ad16` /main `77e3ea2`; Coil `e735673c`. This ports the eligibility and rewiring of pinned upstream `ir_sccp.c:ir_merge_blocks` before boolean-diamond conversion. A local worklist revisits exposed boundaries. Removed observable roots are explicitly remapped; computed labels and shared/pinned boundaries remain intact.

ASAN passes 160 typed, inverted, reversed and side-effect cases, including three nested END/BEGIN pairs per arm, with root and exact use-list checks and full SCCP orchestration. SCCP pipeline/rewrite, promotion (1254 scalar views) and stencil vectorization compatibility checks pass.

Same-run warm five-sample medians on the unchanged branch fixture: LLVM O3 **0.170212708s**, current stogir **0.390315125s**, prior stogir **0.389940542s**. No speedup is established. The remaining branch needs further investigation of incremental fold/control ordering; the backend also currently excludes preserved GPRs, causing repeated spills around calls. Neither gap should be addressed with benchmark-specific importer changes.

FAST passed49/49 in211.2s (cli/objects memory warning1.64GB vs1.5GB). Official install of e735673c passed. The full compiler goal remains5× faster IR-to-machine-code generation with generated runtime within10% of LLVM O3; latest full diagnostic remains1.89× codegen speed and8.43× slower self-emission runtime. No new full-compiler acceptance result is claimed.

Off-checkout verification confirms exact source bytes for all138 installed SDK modules, candidate/global code-section equality, LLVM/TPDE/stogir native execution and timing tags, new module imports and the installed160-case control suite.
