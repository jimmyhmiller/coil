# Finite countdown comparison — November 6

Source/candidate30467d56, standalone231c610, SDK13ba10804246ebc2a9e27376dfb5757e9e3317556c66d8e8c63ca7154969b0da.
Baseline source/candidatebb21d63f. Build, quick43.0s and live-emission/prebuilt-unit
gates pass. No fullFAST/install/push at this checkpoint.

| CPU median ms | Before Stogir | Countdown Stogir | Before LLVM | After LLVM |
|---|---:|---:|---:|---:|
| AVec20M |60.978|61.0635|46.009|46.003|
| Verifier4096 |645.0655|644.271|225.8105|226.202|
| Actual emitter513 |727.604|691.5605|332.959|333.3075|

Actual emitter improves4.95%; LLVM control changes+0.10%. Verifier/AVec neutral;
their object sizes stay81784/9896bytes. Verifier Stogir IR generation82.659→83.628ms
(+1.17%); new analysis has a cost. Actual emitter object2697868→2718356bytes because
it includes the optimizer implementation itself. This does not prove a whole
bootstrap gain; fresh whole checkpoint is warranted, not acceptance.

Four rotating verifier generation samples/eight CPU/wall samples after warmup;
emitter built once. Clean COIL environment, frozen compiler/SDK/source/caller
identities, common b27ffeb4 LLVM opaque caller. Semantic native execution and
within-version deterministic output pass. Machine bytes may differ across source
versions; LLVM controls expose algorithm changes separately. No builds/tests
or sampling overlap measured runs. Raw samples/manifests/results.json.gz and
per-fixture logs retained. Times should be compared within this run, not across
previous runs with different host conditions.
