# Integer verifier header fields: integrated paired diagnostic

Coilcandidate/source d8dbc1b7; library756b206; baselineca35b006.
SDK22ce79a82c9f79719b9e4e513d096458f0aa103db451856cbdb52bc4124f292c.
Candidate build, quick43.4s and live-emission/prebuilt-unit PASS.

| CPU median ms | Before Stogir | Header fields | Before LLVM | After LLVM |
|---|---:|---:|---:|---:|
| AVec20M |62.766|62.9045|47.430|47.347|
| Verifier4096 |574.639|527.4865|220.158|207.472|
| Actual emitter513 |672.8185|665.813|333.746|331.637|

Additional verifier runtime gain8.21%, actualemitter1.04%; LLVMcontrols improve
5.76%/0.63%. AVec neutral. Verifier Stogir generation83.9555→84.0135ms(+0.07%),
LLVM346.9695→342.179ms(-1.38%); no broad compile-speed claim.
Same fixturetext/publicABI/commonb27ffeb4LLVMcaller, frozen source/SDK/compiler
fingerprints, cleanCOILenvironment. Eight rotatingCPU/wall afterwarmup, four
rotating small generation samples; emitter built once. Independent native
answers and deterministic outputs pass. No tests/builds/sampling overlap timing.
Backgroundsystemload remains a qualification. Local diagnostic, not acceptance.
No new whole bootstrap for this modest gain; latest wholeca35b006 remains
3.235368×generation and1.727285×runtime, goal unmet.

Next broader audit: boolean-diamond.candidate accepts only two integer literals;
pinned ir_sccp.c:2940–3020also permits available values for COND. This is a
source-level coverage gap; actual workload occurrence/benefit unproven. Coil's
preallocated headers invalidate upstream's simple reference-order dominance
shortcut. Any port needs real availability/control proof, retaining effects,
RLOAD/OVERFLOW exclusions, roots, use lists and scheduling invariants. No new
if-conversion implementation or speedup claim yet.
Full FAST pending before compiler push. Not installed or pushed.
