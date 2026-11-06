# Natural-scale register-offset memory comparison

Source/candidate bb21d63f, library0dcb88f. SDK
dbcf709023c976bf520a8220a13d9065ab16c6096446e5e5e7c47143dbef4c3c.
Before55d4a5ff inline-benefit-density. Build/quick45.4s/live-emission PASS.
1560native address cases, volatile pressure and128LLVM MC encodings pass.
Initial shifted-tile retirement bug fixed with failing-reference regression.
No fullFAST/install/push or whole-bootstrap run.

Same fixtures/opaque LLVM caller/protocol as indexed-memory-initial. Original
AVec20millioncalls, verifier4096calls and CIR arithmetic emitter513repeats.
Four rotating generation samples for AVec/verifier, eight rotating CPU samples
after warmup for all, emitter objects built once. All inherited COIL env cleared;
recorded source/git/SDK identities checked unchanged. No task build/test overlap.
Raw manifests/results compressed in results.json.gz; fixtures/logs retained.

| Median CPU ms | Before | Indexed | LLVM |
|---|---:|---:|---:|
| AVec |68.0595|68.2185|50.4165|
| Verifier |712.720|707.0865|248.665|
| Actual emitter |762.5935|746.449|340.4485|

Actual emitter2.12% faster; verifier0.79%, AVec neutral. Emission object shrinks
2706144→2697868bytes; verifier82536→81784bytes. AVec disassembly now correctly
replaces ADD+LDR with one natural-scale register-offset LDR in its child loop.
No extra non-natural-scale LSL. AVec object unchanged9896bytes (symbol/alignment
padding hides one instruction). Generation medians6.8455→6.8265ms AVec,
91.1495→90.2605ms verifier. These do not establish whole-compiler progress or
acceptance. Goal remains5x IR-to-code speed and bootstrap runtime within10% LLVM.

Current bb21d63f candidate also compiles/runs the complete address native suite
under Stogir O3/debug checks successfully (current-native.txt).

## Next gap: stack representation and spills

Read-only static audit of the frozen whole-bootstrap01f47440 objects is included
with object hashes and script. Syntactic SP/x29 memory instructions205915 Stogir
versus132488LLVM; these include prologue/epilogue and paired transfers, not solely
spills. In the profiled structure verifier specifically:153 stack instructions
transferring153registers versus14LLVM stack instructions transferring26registers.
Stack-derived pointer estimates are separately labeled heuristic; this is not a
dynamic profile, exact spill classification or speed prediction. Native function
instruction counts and load/store pairs are handled separately. The larger next
question is which excess stack transfers are call-result captures, retained
private objects, or allocator spill/reload traffic. Indexed addressing alone does
not remove these. Do not infer whole-bootstrap gains from these static counts.
