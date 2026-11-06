# Contained fields + pinned bitwise identities: actual emitter improvement

Library563478d/ca519fe; Coil68ced91e. Candidate build, quick50.5s and live/prebuilt
retention pass. Contained fields have168 policies/15,120 native byte checks plus
8 fallback executions; existing partial suite270/22,680 passes.180 literal decisions
match exact pinned C rules;4320 native O1/O3 bitwise results and ASAN pass.
Existing memory/field ASAN and iterative/control/SCCP suites pass. No install/push.

| Eight alternating CPU medians after warmup | Before | After |
|---|---:|---:|
| Actual provider closure |101.700ms|101.892ms|
| LLVM provider control |52.144ms|52.4115ms|
| Actual emitter |645.4785ms|628.493ms|
| LLVM emitter control |357.2495ms|358.537ms|

Emitter improves2.63%; provider is neutral. LLVM control objects in both pairs
are identical; all closure expected results and emitter answers/hashes pass.
Single generation samples provider0.995279→0.984838s; emitter2.741772→2.761794s:
no established code-generation gain. No own builds/tests/profiles overlap timing.
External js-frontend job visible; host inventories retained. These are qualified
component diagnostics, not whole-bootstrap acceptance.

Actual node.make body112→64bytes exactly matches normal replay before/after
(SHA5e5fb822dcee262ddf77e9b02637c50bf737ba30b74e89d1f3f25c5f33cc75ff
and684eb05d9f0669c9311ffe8e53fcf33f0751e49ea03df977794a8c2b71bfac42).
The new body is frameless;3375 native returned Nodes match independent fields.
Memory promotion and bitwise literal bypasses are general passes, not constructor
patterns. Full-compiler same-source diagnostic is in progress separately; the
latest completed whole-bootstrap goal remains unmet.

## Same-source whole-bootstrap diagnostic

Frozen source/SDK `082b4665b498d2e924ffe6d9d634aebb7e78e2c7d953f5bfefa48fe43b27daff`; source candidate68ced91e. All six emits
finish successfully; all generated hosts reproduce the exact seed Stogir object
`edd483a66237c3773db46cd9231f42773f39066b2ce7acb21e6546d71f8cc956`. Raw logs, commands, process activity and
binary/object hashes are retained in bootstrap/results.json and companion files.

| Measurement | LLVM O3 | Current Stogir O3 | Previous Stogir O3 |
|---|---:|---:|---:|
| Seed IR→machine generation |37.110109s|10.925092s|10.810316s|
| Generated compiler wall |17.157830s|28.315133s|28.263985s|
| Generated compiler CPU |16.932383s|28.012318s|27.959022s|
| Generated own Stogir IR phase |9.257574s|15.324882s|15.609875s|

Generation ratio3.396778×; runtime1.650275×. Targets require generation
≤7.422022s and runtime≤18.873613s. Both remain unmet. Whole runtime versus
the same-source previous backend is neutral (+0.181% wall).
The local2.63% emitter gain has not demonstrated compiler-wide runtime progress.
Single whole runs are diagnostics, not acceptance-quality repeated medians.
Do not compare the prior source's LLVM runtime to this source as a backend win.

Provider body bytes are identical before/after (1464bytes,
SHA97dcf1a1c7350db51fb2fd7a688a85a0f380f2487565dcd42180d9a4fa9c505d).
Remaining concrete hot-loop evidence includes repeated live-value stores/reloads
around calls and inner-loop transfers. Next work should target that gap and the
remaining pinned free/restart split categories, rather than extrapolate local
constructor gains. General range/loop and broader fold parity remain incomplete.
No global installation or push.
