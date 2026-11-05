# Nonwriting scalar-call effects — tested integration experiment

Source/candidate1914b373, native coverage54f8082a, standalone93349ce.
No global install and no whole-bootstrap performance claim for this branch.
Library sources exactly match the standalone source snapshot. Central licenses,
NOTICE and provenance are retained.

Pinned upstream ir.c permits memory forwarding across declared CONST/PURE calls.
Coil additionally rejects aggregate result roles, because return capture can
write a caller result place. Unknown/malformed declarations remain barriers,
and the CALL itself stays in the control chain. Conservative body inference is
a Coil extension, not an upstream interprocedural optimizer: safe scalar ops,
ordinary loads and qualified calls pass; stores, allocation scopes, volatile,
atomic, unknown effects and aggregate results reject.

Definitions are processed callee-first. Metadata changes clone the registered
graph and obtain a fresh registry proof; old snapshots stay immutable. Every
new owned version resets its effect status. Raw callers annotate only known
finalized definitions. Ordinary native validation, optimization and vector
stages still run. No optimizer bypass or inline-budget increase.

## Corrected actual verifier comparison

Same current library/verifier source and opaque LLVM O3 caller. Four rotating
generation and16 rotating child-CPU samples after excluded warmups.

| Emitter | Generation median ms | CPU median ms | Object B |
|---|---:|---:|---:|
| Previous e450d4a9 |92.055|26.1040|84615|
| Current1914b373 |92.890|26.1645|84615|
| LLVM O3 |401.676|9.8715|39880|

Neutral: CPU+0.23%, generation+0.91%, same object size. Both Stogir objects
have55 functions and13635 static instructions; structure774 instructions/5
calls and integer-operations-target-structured1206 instructions/20calls in
both. Objects are not byte-identical. Static counts are not dynamic execution
counts or spill counts. Declared effect facts appear in trace.txt but this
workload shows no useful code-quality/runtime gain. No new whole-bootstrap
run is warranted on this evidence. Latest bootstrap evidence remains1c15dcf6,
3.358202× generation advantage /2.062328× runtime slowdown: goal UNMET.

## Rejected initial interaction

Initial2c780db3 candidate: paired previous/current CPU24.4785/28.202ms,
generation88.542/90.491ms, object84615/88554B;55→77 functions. Do not compare
percentages across measurement windows. The inliner compared all prototype
flags exactly, so inferred PURE_FUNC64 rejected formerly eligible calls.
Trace and assembly retained in exact-flags-regression.

Standalone93349ce fixes ABI compatibility: ignore only CONST/PURE bits32/64.
Convention, variadic/noreturn, result and ABI group trailer remain exact.
16 effect-flag pairs inline and execute64 native answers;3 convention/variadic
rejections, scoped-stack/aggregate loops and specialization pass under debug/ASAN.
Other library gates: forwarding, iterative folds, calls, atomics, aggregate results.

## Compiler validation

Extended existing native emission test uses256 distinct read-only calls,
requires a real residual call relocation after the clone budget is exhausted,
checks inferred read-only versus writing bodies, equal traced/untraced object
bytes, native results, symbol retention, recursion and prebuilt-unit retention.
Pass. Quick PASS36.5s. Full FAST PASS242.8s, existing cli/objects4.00GB
memory warning. Compiler integration/evidence committed for publication.
Not globally installed and not a demonstrated bootstrap performance improvement.

Measurement scripts are archived from build/pure-verifier and are intended to
be restored to the build directory with the recorded source/compiler paths.
No competing task build/test ran during these performance comparisons.
