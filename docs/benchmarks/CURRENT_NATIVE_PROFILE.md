# Current generated compiler profile

Source088de286, checkoutaf92274b (documentation-only difference). LLVM-built
seed088de286 emits stogir O3 compiler object; linked native host carries an
official toolchain stamp foraf92274b and the same SDK digest010a941d41d6bd8c….
Full source hashes and binary identities are in build-metadata.json. Version is
read from a sidecar, not baked into machine code. The initial harness incorrectly
expected raw-linked output to have a commit stamp; corrected to use the official
stamping helper and rerun. No compiler bug or source change was needed.

The generated compiler successfully emits the whole compiler to a14903044-byte
object byte-identical to the LLVM-built seed output, SHA256
2039071a4b4db8c179feb66c22388d00cb31563d5d079afe0853cc3ed4d66548.
Caches off, serial, O3/no-debug. Four-second sample windows begin at elapsed5s
and27s. This run is **sampling only**, excluded from timing acceptance.

Early window:2927 worker samples, frontend expansion/ownership activity. Leading
leaves include comptime.sexp-own-into110, closure-subprogram-scoped98,
sexp-eq-nodes75 and expansion-form-equal?61. Late window:3047 worker samples,
backend activity. Main-thread ulock waits are joins, excluded from CPU costs.

|Late worker leaf|Samples|
|---|---:|
|verify.structure|210|
|uses.build|174|
|allocation.assigned-indexed-pressure!|141|
|verify.integer-operations-target-structured|123|
|write (timing diagnostics)|90|
|opcode.operand-code|73|
|graph.operand|70|
|register-live.analyze-matched|66|
|locations.lookup-indexed|62|
|allocation.pressure-state-into!|56|
|call-inline.apply!|55|
|schedule.order-with-uses|46|

These are leaf samples from limited windows, not complete phase shares. Source
analysis reuse remains useful, but does not close the generated-code runtime gap.
Choose the next small reduction from actual missed optimization/inline decisions.

## Existing inline diagnostics

A non-timed verifier emission with COIL_TPDE_STATS=1 produces a byte-identical
object to the untraced run. Existing diagnostics show classifications starts at
473 graph cells, then finalizes to971 cells /617 base clone cells, with15 of its
512 growth cells remaining. The integer verifier's call to classifications has
common=false, capture=true, result=true. The617-cell finalized body alone exceeds
the caller's512 cap. This is a concrete bounded-inlining opportunity to
investigate, **not proof that a fallback view is legal or profitable**.

Do not raise/reset the growth budget, override Never/recursion/capture/ABI checks,
or assume a different graph version has the same semantics. A possible next
small reduction should compare original and finalized immutable callee views
under one total ledger, preserving all input validation and provider ownership.
No such implementation exists yet. Earlier metadata hoisting was rejected after
runtime regressions; source is restored.

[Profile artifacts](results/current-native-profile),
[inline trace and metadata](results/current-inline-audit).
Full5× generation /within10% runtime goal remains unmet.
