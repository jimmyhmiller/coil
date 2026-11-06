# Correct diamond consumer notification: neutral against preferred baseline

Source/candidate3c89447b, libraryd2ab904; preferred baseline93222a58.
Includes local merge reconsideration19d6a1a, excludes directIFprojectionf83436a.
SDK94fe0f4ebf08898a15f98030c21f8c2765bce3364c4bc9998ed2bc7076a8d61c.
Build/quick43.0s/live-emission/prebuilt-unit PASS, native/ASAN regression proof
in centralized library validation. New driver fails the expected optimization
assertion on19d6a1a and passes with consumer notifications.

| CPU median ms | Before Stogir | Notified diamonds | Before LLVM | After LLVM |
|---|---:|---:|---:|---:|
| AVec20M |60.915|61.0165|45.4705|45.2275|
| Verifier4096 |447.7265|447.087|201.983|201.4705|
| Actual emitter513 |636.5655|640.2755|324.966|325.040|

No meaningful net performance win: verifier-0.14%, emitter+0.58%, verifierIRgen
79.505→79.9525ms(+0.56%). LLVMcontrols-0.25%/+0.02%; AVecnear-neutral. The prior
+4%verifier regression is removed, but preferred measured baseline remains932.
Correctness/worklist repair is not performance acceptance. No fresh whole run
justified for these local results; latest whole3.265528×/1.682497×still unmet.

Samefixture/publicABI/commonb27ffeb4LLVMcaller, cleanCOILenv, frozen source/SDK/
compiler fingerprints checked before/after. Eight rotatingCPU/wall afterwarmup,
four small generation samples; emitter builtonce. Independent native answers
and deterministic outputs pass. No task builds/tests/profiles overlap timing;
background system activity remains a qualification.

Actual integer-verifier body959→952instructions, CSET8→6, CMP111→109, calls17,
UBFX25and768-byteframe unchanged. Raw disassembly/counts retained. This removes
the repeated materialization regression but leaves almost all baseline code
cost. Same earlier d8snapshot audit12→4COND-bearing IF chains is separate from
this integrated code count; no conflating different snapshot stages.

Next investigate branch-heavy semantic-family verification dispatch and larger
generated-code costs, keeping every check, error priority and the whole target.
FullFAST pending before push. Not installed or pushed.
