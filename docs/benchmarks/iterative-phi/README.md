# Iterative identity-only Phi cleanup: paired small diagnostic

Source/candidate93222a58, standalone309d37e; baselined8dbc1b7.
SDK1231fa53cea1eca02abf33656374054852ed20dcfcff7be619552e348bb13817.
Build/quick43.1s/live-emission/prebuilt-unit PASS.

| CPU median ms | Before Stogir | Phi cleanup | Before LLVM | After LLVM |
|---|---:|---:|---:|---:|
| AVec20M |62.9315|63.0075|47.615|47.5865|
| Verifier4096 |520.742|460.8485|203.7395|204.014|
| Actual emitter513 |661.6555|646.301|330.147|330.213|

Verifier11.50% faster, actual emitter2.32% faster. LLVMcontrols+0.13%/+0.02%,
AVecneutral. LLVM verifier object size39552unchanged, Stogir77568→76896bytes.
Stogir verifier generation83.030→82.037ms(-1.20%); LLVM339.5205→337.7535ms(-0.52%).
These phase results are small diagnostics, not whole compile acceptance.

Same fixturetext/publicABI/commonb27ffeb4LLVMcaller, cleanCOILenvironment,
frozen source/SDK/compiler fingerprints checked before/after. Eight rotating
CPU/wall afterwarmup; four rotating small generation samples; emitter builtonce.
Independent native answers/deterministic outputs pass. No overlapping task
builds/tests/profiles. Background system load remains a qualification. New
whole diagnostic is separate and pending at this source checkpoint.

The optimizer extension has additional initial Phi visits in the existing bulk
walk; measurements include that cost. No new graph scan/CFG proof added. Native
and ASAN tests plus actual verifier schedule187→145Phis are recorded in vendored
central validation docs. No upstream iterative-Phi parity claim.
Full FAST pending before any compiler push. Not installed or pushed.
