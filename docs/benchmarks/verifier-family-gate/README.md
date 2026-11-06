# Integrated verifier semantic-family gate

Source/candidate d5430910, library d108f15/validation86a7f4e.
Baseline93222a58. Corrected diamonds retained; direct IF projection excluded.
Build, quick43.6s and live-emission/prebuilt-unit checks pass.

| CPU median ms | Baseline Stogir | Candidate | Baseline LLVM | Candidate LLVM |
|---|---:|---:|---:|---:|
| AVec20M |62.873|63.147|47.6005|47.8355|
| Verifier4096 |464.9875|440.983|207.335|198.455|
| Actual emitter513 |647.087|643.764|328.4765|328.069|

Verifier -5.16%, emitter -0.51%; verifier IR generation82.5115→83.0095ms
(+0.60%). This integrated comparison includes prior corrected diamond work,
while standalone two-run isolation showed1.7–2.0% Stogir verifier improvement.
Do not attribute all integrated movement solely to this gate. Common opaque
LLVM caller, frozen SDK/compiler/source, rotating samples afterwarmup. No
build/test/profile overlaps timing. Exact workload native answers pass.

71,050 differential raw-graph cases, native debug and LLVM ASAN, agree in
all counts/diagnostics; eight family suites pass. This modest source improvement
does not close the generated-code quality gap. No fresh bootstrap acceptance;
last whole measurement3.265528×generation/1.682497×runtime remains unmet.
Full FAST pending before push; not installed or pushed.
