# Shared comparison fusion paired diagnostic

Coil candidate736f815c, libraryf675d59; baseline30467d56.
SDK d83a64a43724ea81f095ffe7f9668d0f72aa597953b7c6cd0743c64095237c70.
Candidate build, quick43.8s and live-emission/prebuilt-unit validation PASS.

| CPU median ms | Before Stogir | Shared comparison | Before LLVM | After LLVM |
|---|---:|---:|---:|---:|
| AVec20M |62.623|62.968|47.6065|47.4475|
| Verifier4096 |650.766|621.377|226.111|227.2235|
| Actual emitter513 |687.5865|673.582|332.270|333.2225|

Verifier improves4.52%, actual emitter2.04%. AVec unchanged in scope and small
observed variation. LLVM controls change+0.49%/+0.29% for verifier/emitter.
Verifier Stogir generation84.807→84.433ms; actual emitter generation sampled
once, not used for a compile-speed claim. Target selection alone changes;
no verifier source algorithm change is included here. Compiler object sizes
for the actual emitter kernel2718356→2691516bytes.

Four rotating generation samples (excluding first) for small kernels and eight
rotating CPU/wall samples after warmup. Emitter objects built once. Common
b27ffeb4LLVM caller, identical fixture text/public ABI, clean COIL environment,
frozen source/SDK/compiler fingerprints checked before and after. Independent
native answers pass. No task build/test/profile overlaps timing. macOS has
background speech/WindowServer/system activity; these are paired diagnostics,
not acceptance results. Do not compare absolute times across prior runs.

The goal remains unmet; this does not update the whole-bootstrap result.
Next combine the separately validated proven verifier operand reads before a
fresh representative/whole checkpoint. Full FAST pending before any push.
Committed locally, not installed or pushed.
