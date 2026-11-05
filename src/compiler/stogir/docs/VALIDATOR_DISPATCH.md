# Verifier dispatch and word bitcasts

`validation-kind` stores a compact mask for each opcode. The verifier queries
it once per instruction instead of repeatedly calling static family predicates.
All semantic validators and their diagnostic order remain unchanged. The table
is generated from the canonical family predicates by
`benchmarks/compiler-gaps/validator-kinds-generator.coil`; `tests/verify.coil`
checks all entries and nearby invalid codes against those independent predicates.
This dispatch representation is a Coil implementation, not a new upstream pass.

A separate correction follows pinned dstogov/ir92171d0a4a36b0acf707f2dea7998de615dd4acd,
`ir_aarch64.dasc:ir_emit_bitcast`: integer word bitcasts are register moves.
Same-register32-bit views emit nothing; different registers use a W move.
Byte/halfword and BOOL canonicalization remains. Subsequent SEXT/ZEXT still
normalizes source bits, including inputs with unspecified upper X bits.
Matching, operand liveness, allocation constraints and graph types do not change.

Validation at d6d0b0b:13 interacting debug/ASAN programs pass, covering verification,
165scalar conversion variants plus12explicit same/different-register word moves,
floating/numeric conversions, symbolic conversion images, checked arithmetic,
atomics, terminal chains, switches, stack/local storage, vector lanes and call ABI.
Logs and compiler identity are under validation/validator-dispatch/. The matrix
uses an independent cast oracle over raw register arguments with dirty high bits.

Dispatch-only actual-verifier measurements use one Coil7944bdfa executable,
unchanged graph caller,4rotating generation samples and16rotating process-CPU
samples after warmups. Stogir generation91.8575->90.6585ms; CPU27.5565->25.3515ms.
Objects85127->85707bytes. LLVM-current CPU9.1640ms. The later repeat produced
26.9810->25.0815ms Stogir CPU and8.9020ms LLVM-current CPU. Source manifests and
exact hashes are retained. External load was not sampled in these small runs.

These measurements exercise the changed verifier source. The compiler executable
still embeds the OLD AArch64 emitter, so importing the new emitter's source does
not measure its code-quality effect on that verifier. Its integrated benefit
requires rebuilding the Coil backend. No bootstrap improvement or target
acceptance is claimed. The full goal remains5x IR generation advantage and
generated bootstrap compiler runtime within10% of LLVM O3.

The subsequent word-TRUNC correction follows pinned `ir_emit_trunc` as well:
TRUNC-to32 is a register view, elided when source and destination registers match.
Such a view is no longer classified as already zero-extended for a later ZEXT;
actual extensions keep their required normalization. The165-variant raw-register
matrix passes with24direct BITCAST/TRUNC same/different-register encoding cases.
Broader ABI/arithmetic/pressure validation and integrated measurements are pending.

Word-TRUNC source0fc9528 passes16additional debug/ASAN programs: conversion,
binary/unary matrices, narrow call/return/extend/varargs, stack arguments, call
pressure, Phi joins/redefinitions, memory, conversion images and call ABI. Raw
logs are under validation/validator-dispatch/word-trunc/. The actual native
conversion matrix checks165semantic variants and24explicit view encodings.

A separate scalar-property Always-inline source experimentb062e5e was rejected.
Using one7944compiler and paired old/new library policies: Stogir generation
92.308->97.4955ms, CPU32.4735->32.1885ms, object85707->86613bytes. Four rotating
generation and16rotating CPU samples afterwarmup; this is a small contended
machine diagnostic, not bootstrap evidence. It did not justify a policy change.
Its patch and results are archived; the source annotations are NOT in this branch.
The compiler's existing inline budgets and default source policies stay intact.
