# Proven verifier reads after shared comparison fusion

Candidateca35b006, baseline736f815c (fusion-only), library verifier78394b7.
SDKd24ae0c8351fd3e54592b60210fcf9e50943ef9c473167d1bfc97809efa97bba.
Build, quick43.5s and live-emission/prebuilt-unit gates PASS.

| CPU median ms | Fusion-only Stogir | Combined Stogir | Before LLVM | After LLVM |
|---|---:|---:|---:|---:|
| AVec20M |63.7915|63.6665|47.936|48.1925|
| Verifier4096 |631.7315|575.8935|230.977|221.478|
| Actual emitter513 |682.4055|671.982|335.977|333.050|

Additional verifier runtime gain8.84%, actual emitter1.53%. LLVM controls
improve4.11%/0.87% respectively; AVec control neutral. This change improves the
verifier algorithm for both backends. Stogir verifier generation85.0965→83.9175ms
(-1.39%); LLVM342.0885→346.762ms(+1.37%). These modest phase differences do not
establish a whole compiler generation improvement. No multiplying across runs
to make an aggregate gain claim.

Four rotating generation samples after first and eight rotating CPU/wall samples
after warmup, emitter built once; common b27ffeb4LLVM opaque caller, same fixture
text and native independent answers, frozen source/SDK/compiler/caller hashes,
clean COIL environment. No task build/test/sampling overlaps measured runs.
Background system activity remains; paired small diagnostic, not acceptance.
Fresh whole diagnostic is separate. Full FAST still pending before push.
Committed source, not installed or pushed.
