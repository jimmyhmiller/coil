# Initial register-offset memory comparison: neutral

Source/candidate0e2b1ad4, library5d4fd02. SDK
e3e3eed7013ba5685995b3f57d763f802eadd7ba59beda26bcba4341f10b36c4.
Before55d4a5ff inline-benefit-density. Build/quick49.8s/live emission PASS.
Initial live-emission failure fixed by retiring selected shifted-tile edges;
1560native library cases plus volatile pressure pass. No fullFAST/install/push.

Same source fixtures/common LLVM opaque caller. Four rotating generation samples
for AVec/verifier, eight rotating runtime samples after warmup for all fixtures;
actual emitter built once per backend, no timing claim for that object build.
Clean COIL environment, source/git/SDK identities checked unchanged, no task
build/test overlap. Raw identities/results compressed in results.json.gz.

| CPU ms | Before | Indexed | LLVM |
|---|---:|---:|---:|
| AVec20m calls |68.9775|70.0345|50.577|
| Verifier4096calls |698.859|698.185|245.0495|
| Actual CIR emitter |757.4105|757.112|337.453|

Neutral overall; AVec object grows9896→9912bytes. Disassembly exposes a poor
choice: commuted scaled index becomes base; LSL remains next to register load,
so no arithmetic instruction is saved. A shared address with a non-natural
memory scale also gets an extra explicit shift. Next refine target cost legality
using existing arithmetic tiles, select natural-scale MUL/SHL indices and retain
shifted-ADD addressing where register-offset fusion would add an operation.
No full compiler speedup or goal attainment claimed.
