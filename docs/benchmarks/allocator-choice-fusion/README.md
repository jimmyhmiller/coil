# Integrated allocator-choice fusion

Source/candidate71856236, library75ed841/docs532a9cd. Direct baseline d5430910
verifier-gate candidate, so only allocator-choice source differs. Build,
quick43.2s and live-emission/prebuilt-unit retention pass.

| CPU median ms | Before Stogir | Fused | Before LLVM | Fused LLVM |
|---|---:|---:|---:|---:|
| AVec20M |62.304|62.1055|47.041|47.0675|
| Verifier4096 |436.352|436.028|196.1385|196.6795|
| Actual emitter513 |644.509|637.6605|329.5675|330.391|

Emitter -1.06%, LLVM+0.25%; verifier control-0.07%. Exact answers across all four
versions agree, including emitted text sizes/hashes and25nativeexecutionanswers
per32/128/512-op size. Same rounded register limits and choices retain generated
workload code; this is a modest generation-cost improvement, not generated-code
quality acceptance. No whole-bootstrap run justified for this isolated1%result.
Last qualified whole3.265528×generation/1.682497×runtime remains unmet.

Common opaque LLVM caller, eight rotating CPU/wall samples afterwarmup, frozen
source/SDK/compiler identities. Emitter objects built once; verifier generation
82.262→82.4455ms(+0.22%). No build/test/profile overlaps timings. Background
system activity qualifies results. FullFAST pending; not installed or pushed.

Next investigate measured machine-code overhead/inlining. Standalone choice
Stogir keeps free-decision helper with256-byteframe/individualsaves; LLVMinlines
it into opaque caller (192-byteframe). This synthetic single-caller difference
is a lead, not proof of bootstrap effect. Adapter inline-budget is512 cells;
module admission/growth budgeting must be audited before altering policy.
