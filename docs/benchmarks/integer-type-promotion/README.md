# Guarded modular integer-width propagation

Compiler source/candidate e450d4a9, vendored standalone d6300b1. Central
licenses, notice and provenance retained. No global installation.

The pass follows pinned upstream iterative narrowing preflight/apply ordering.
Single-use modular arithmetic, conversion retargeting, constant left shifts,
COND/Phi/self-Phi are guarded by exact occurrence counts and protected roots.
Explicit traversal plans avoid recursive host-stack walks. BOOL/pointer
boundaries and unsafe MIN/MAX/ABS remain excluded. Standalone debug/ASAN
validation and JIT/AOT details are committed with d6300b1.

## Whole compiler diagnostic

| Metric | Stogir O3 | LLVM O3 |
|---|---:|---:|
| Seed IR generation s |11.282333|37.888353|
| Generated compiler wall s |35.433217|17.181171|
| Generated compiler CPU s |34.343709|16.683641|
| Compiler object bytes |12497132|8541960|

Goal UNMET: 3.358202× generation advantage and 2.062328× runtime slowdown.
One diagnostic sample per seed/backend/generated host; no warmup/repetition.
Serial O3, no debug, cache/library state off, frozen source/SDK and established
IR-to-machine-code timing boundary. Process/load snapshots qualify external
activity in results.json. Both generated hosts emit exact seed Stogir object
b3b0400f174bde8adb6fbf15bc6bc7c58f72b39755025594d6d388d3e5b97f6f. This is not acceptance or a controlled improvement
percentage relative to prior checkpoints with different source snapshots.

## Repeated actual verifier

Same current verifier source and opaque LLVM O3 caller for all rows. Four
rotating generation samples and sixteen rotating child CPU samples after
excluded warmups. See verifier-results.json and verifier-measure.py.

| Emitter | Generation median ms | CPU median ms | Object bytes |
|---|---:|---:|---:|
| Previous e3295675 |90.7565|26.6220|84635|
| Current e450d4a9 |93.3155|26.1205|84615|
| LLVM O3 |372.5715|9.8895|39880|

Runtime CPU improves about 1.9%, generation worsens about 2.8%. The pass has
not materially closed this runtime gap. In contrast the checked arithmetic
fixture reduces both word-container forms from 156 to 80 bytes, matching native
i32 SSA; 360 native calls and 120 linked AOT calls pass. The code-shape win is
real but not representative of the full compiler's dominant costs.

Quick gate PASS49.1s. Full FAST PASS254.8s, with the existing cli/objects
4.00GB memory warning. Compiler source and evidence committed for delivery;
not globally installed over the independently updated toolchain.
