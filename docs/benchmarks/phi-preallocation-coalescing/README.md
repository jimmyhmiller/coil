# Phi coalescing: bootstrap works, goal remains unmet

Compiler source/candidate 6eb62d2e integrates standalone 26879ab/88ca6c9/e2a59c8.
The first candidate 5bc1bad6 failed on metahost.mh-quoted. Its partial bootstrap
timings are discarded. A standalone captured graph and a small executable test
reproduce the false call-preservation transfer. Corrected transfer construction
stops at a new SSA definition in the same group; COPY/BITCAST lowering and all
parallel-copy validation remain. Debug/ASAN regressions and candidate quick
9-step gate PASS (52.1 s).

## Same-source whole-bootstrap diagnostic

| Metric | Previous backend f50de3b8 | Stogir 6eb62d2e | LLVM O3 |
|---|---:|---:|---:|
| Seed IR-to-machine-code s |11.386598|12.071326|34.363617|
| Seed total wall s |19.389122|20.175896|41.945011|
| Generated compiler wall s |38.057127|36.946802|17.395787|
| Generated compiler CPU s |37.787344|36.914510|17.311991|
| Generated compiler IR-codegen s |24.308505|23.496634|10.122454|
| Compiler object bytes |14535304|14331928|8522952|

All three backends emit the SAME frozen 6eb62d2e compiler source. Generated hosts
all compile that compiler to current Stogir O3, using the same SDK/source and
emit the exact current seed Stogir object:
`afa36303587650f593d29284b5171f15f0f2e0d66fb4c5db089ea539b4625c92`.
The prior backend's compiler object is expected to differ; its generated host's
output matches the new backend's target exactly.

One serial O3/no-debug diagnostic sample per seed/backend and generated host,
no warmups or repetition, caches/library state off, established IR-codegen timing
boundary. Source/SDK digests and object hashes checked; no competing build/test.
Order: current Stogir, current LLVM, generated Stogir, generated LLVM, previous
Stogir, generated previous Stogir. This is a diagnostic, not acceptance or proof
of a repeatable improvement. Historical checkpoints use different sources and
must not be treated as a controlled before/after comparison.

Controlled diagnostic: runtime improves 2.92%, generation regresses 6.01%, object
shrinks 1.40%. Current generation is 2.8467x LLVM, runtime is 2.1239x LLVM.
The goal requires generation <=6.872723 s and runtime <=19.135365 s on this
workload: another 43.1% generation reduction and 48.2% runtime reduction.
Closing this allocator parity gap does not meet either target.

Compiler source committed, NOT pushed, NOT installed globally. Full FAST not run.
Standalone changes committed/pushed. Raw objects and staged hosts remain in
build/bootstrap-phi-preallocation-corrected; scripts, hashes and compressed logs
are archived beside this report. Profiling runs are separate and excluded above.

## Fresh runtime profile

Separate whole-process 1ms sampled runs of these exact generated hosts both
emit the seed object. Excluded from timings above. The stack parser validates
child weights and exclusive totals. Main-thread join waits are excluded. Active
worker totals: Stogir 26595 samples; LLVM 10220. Inclusive families overlap and
inlining changes symbol attribution; do not sum these shares or treat sample
counts as exact CPU milliseconds.

| Inclusive stack family | Stogir worker share | LLVM worker share |
|---|---:|---:|
| Verification |15.84%|13.12%|
| Use-list build |5.25%|7.63%|
| Allocation/scratch API |11.36%|7.33%|
| Function emission |52.79%|61.86%|

Largest Stogir exclusive leaf is verify.structure: 1242 samples (4.67%);
semantic validator 901 (3.39%); uses.build 783 (2.94%); assigned-indexed-pressure
506 (1.90%); graph.operand 426 (1.60%). LLVM absorbs some helpers into callers.
There is no demonstrated single leaf capable of the required 48.2% runtime
reduction. Broad generated-code quality and cross-call simplification remain
necessary; this profile does not prove inlining is the sole cause. Measured
verifier objects retain 100 static calls versus LLVM's 40 and roughly 2.85x as
many static instructions across all emitted functions. The next investigation
should use compiler-derived call/aggregate and loop cases to isolate those
broader gaps rather than continue isolated arithmetic tuning.
