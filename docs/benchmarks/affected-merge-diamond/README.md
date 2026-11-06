# Affected MERGE diamond reconsideration: regression checkpoint

Source/candidate28e32ed5, library19d6a1a; baseline93222a58.
SDK0fb0053aa69f1c3a525b9e2161ed9cec0b4128dfe2e348484597340d8f610898.
Build/quick43.2s/live-emission/prebuilt-unit PASS, library native/ASAN/root tests
PASS. Correctness/architecture evidence does not establish a performance win.

| CPU median ms | Before Stogir | Local diamonds | Before LLVM | After LLVM |
|---|---:|---:|---:|---:|
| AVec20M |61.0295|61.139|46.254|46.3855|
| Verifier4096 |452.8785|472.2295|202.313|202.0675|
| Actual emitter513 |642.915|647.1225|326.5025|327.5475|

REGRESSION: verifier+4.27%, actualemitter+0.65%, verifierStogirIR generation
79.947→81.4635ms(+1.90%). LLVM controls-0.12%/+0.32%, verifierLLVMobject identical.
The new candidate remains isolated; preferred measured baseline remains93222a58.
No whole-bootstrap run justified by this regression. Goal still unmet.

Eight rotatingCPU/wall afterwarmup, four rotating small generation samples,
emitter builtonce. Samefixture/commonb27ffeb4LLVMcaller, frozen source/SDK/compiler
fingerprints, independent native answers/deterministic outputs. CleanCOILenv,
no overlapping task builds/tests/profiles. Backgroundsystemload qualification
applies; this is a paired diagnostic, not acceptance.

Actual integer-verifier function (not whole object) grows959→1029instructions,
frame768→784bytes, CSET8→32, CMP111→135; calls17unchanged. Disassembly/counts
retained. Concrete repeated sequence: CMP(original), CSET W,bool; UXTB;
CMP bool,0; CSET X,inverted; CMP X,0; conditional branch. The inverted wide
COND(Boolean,0,1) intentionally remains generic: current boolean-choice! only
rewrites inversion when result typeBOOL. A downstream IF then tests that wide
materialized boolean again. Pinned AArch64 ir_emit_cond also uses generic truth
CMP/select; do not claim a missing upstream COND-comparison fusion rule.

Next targeted repair: project IF(COND(c,0/1,1/0)) directly onto c, swapping
IF_TRUE/IF_FALSE projections for inverse choices while preserving their IDs,
operand metadata and rooted control meaning. Keep COND itself for independent
root/data users; ordinary DCE can remove it only when unused. No new nodes or
availability speculation needed. Exact use lists, side effects, floating truth,
root/projection metadata and native answers require validation. This should
expose existing predicate branch fusion, but no speedup claim before measurement.

Full FAST pending before push. Not installed or pushed. Attribution centralized.
