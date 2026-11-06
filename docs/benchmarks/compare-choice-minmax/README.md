# Initial exact comparison choices: no compiler speedup yet

Source/candidatef1b39ed6, librarycaa8275, baseline71856236. Includes correctness-only
active reservation protection and verified integer reader; no rejected retry policies.
Build, quick42.7s and live-emission/prebuilt retentionPASS.

| CPUmedian ms | Before Stogir | Choices | Before LLVM | After LLVM |
|---|---:|---:|---:|---:|
| Verifier4096 |419.791|424.018|192.582|187.783|
| Actual emitter513 |620.446|625.2255|321.256|321.6555|

Verifier+1.01%, emitter+0.77%. LLVM verifier-2.49% reflects source-reader changes;
LLVMemitter+0.12%. No net performance win. Verifier generation79.6825→80.4485ms
(+0.96%). Eight rotatingCPU/wall samples afterwarmup, common opaqueLLVMcaller,
frozen source/SDK/compiler identities, no taskbuild/test/profile overlap timing.
All workload answers acrossversions agree.

Exact comparison rule is semantically validated; compiler performance acceptance
is unproven. Next check cheaper guard order to avoid fuse/error work on non-COND
nodes and movability work on nonordered/nonmatching choices. No new wholebootstrap
run justified yet. Goal remains5×generation/≤1.10×runtime; latest qualifiedwhole
3.265528×/1.682497×stillunmet. FullFAST pending; not installed or pushed.
