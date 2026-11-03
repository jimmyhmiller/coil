# Shared emitter location index: full compiler diagnostic

Component0765f40 / Coil0b04f881. One serial O3 diagnostic sample per host/target,
library-state cache disabled, code-generation timing enabled, no debug information.

|Compiler host|Target|IR-to-code s|Whole emit s|
|---|---|---:|---:|
|LLVM O3|LLVM O3|29.844837|36.758691|
|LLVM O3|stogir O3|7.376386|15.249482|
|stogir O3|LLVM O3|31.045493|59.923479|
|stogir O3|stogir O3|61.888346|93.437874|

Backend generation is4.05× faster; generated native self-rebuild remains6.13×
slower. Goal5×/within10% remains unmet. The prior checkpoint's native-host wall
was108.42s; current93.44s is progress, not an isolated/repeated acceptance result
because these single diagnostics use different source checkpoints. Both target
objects match byte-for-byte across hosts. Three fixed native/getter/branch
objects also exactly match the prior8714fe10 compiler. All3 native backends
execute the regression with exit42.

A bounded5-second CPU sample exposed full-scan lookups in memory/value and other
emitters. The main thread's3602 wait samples are excluded; active worker samples
include165 leaf samples in locations.lookup and419 in two Part slice helpers.
The profile run was deliberately stopped after sampling and is excluded from
correctness and timing results. The retained summary separates these observations.

The normal emitter now borrows the existing finalized per-parent split-child
index through an explicit immutable view. The main body creates one view, and
all helper paths retain it. Legacy public APIs remain full-scan wrappers and
the oracle; no hidden cache or allocation decisions change.

Checked synthetic query kernel:4096 parents /8192 queries, whole-process median
52.652542ms linear versus3.552791ms indexed (three rotating samples after warmup).
This14.8× kernel gain is not whole-compiler speed. Native small linear/indexed
and large indexed correctness smokes pass. The95256-query oracle includes split
children, holes, overlap errors, missing/unassigned locations and negative parents.

ASAN passes allocation, scalar/call/FP/checked/switch pressure, locals, stack
scopes,278 over-aligned caller SP residues and vector lane/comparison matrices.
FAST49/49 passes in212.0s (object-check memory warning1.61GB). Official global
installation succeeds; off-checkout all3 backend AOT executions return42,
pressured-call JIT/ABI, high-field/use-list and location-resolver oracles pass.
Installed candidate code sections and all142 module source bytes match.
