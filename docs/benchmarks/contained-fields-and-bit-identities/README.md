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
