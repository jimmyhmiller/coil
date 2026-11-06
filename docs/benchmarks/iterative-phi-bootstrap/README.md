# Iterative Phi cleanup whole-bootstrap diagnostic

Source/candidate93222a58, standalone309d37e, SDK1231fa53cea1eca02abf33656374054852ed20dcfcff7be619552e348bb13817.
Established serial/cache-off/O3/no-debug procedure and IR-codegen phase sum.
Single diagnostic per backend/generatedhost, not acceptance.

| Measurement | LLVM O3 | Stogir O3 | Required Stogir |
|---|---:|---:|---:|
| Seed IR→machine code |32.466859s|9.942300s|≤6.493372s|
| Generated compiler wall |15.460826s|26.012795s|≤17.006908s|
| Generated compiler CPU |15.446646s|26.002187s|—|
| Generated host own Stogir IR phase |8.600515s|14.824811s|—|
| Compiler object bytes |8602744|11800384|—|

Generation3.265528× faster; runtime1.682497×LLVM. Goal unmet; about34.7% less
generation and34.6% less runtime still required at observed LLVM times.
Priorca35b0063.235368×/1.727285× was different source/run; modest diagnostic
movement is not an isolated causal whole-speedup claim. Paired small results
are separately recorded: verifier-11.50%, actualemitter-2.32%, LLVMcontrols steady.

Both generated compilers exactly reproduce seed Stogir object:
345f062733d59658964cb220ae5fc5d49bb18d463bcc145b485cc7b1a9f80f50.
Raw CPU/wall/RSS/source/SDK/object hashes and host snapshots in results.json.
Background corespotlightd≈111%CPU/WindowServer≈40% and other activity remains,
with no overlapping
task builds/tests/sampling. Repeated controlled runs required for acceptance.
Build/quick43.1s/live-emission/prebuilt-unit gates pass; fullFAST pending.
Not installed or pushed. Source attribution remains centralized in vendored docs.
