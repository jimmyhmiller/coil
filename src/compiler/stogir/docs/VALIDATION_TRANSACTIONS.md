# Immutable input validation transactions

Scheduling previously ran structure, entry/root checks, then the public Phi
validator, which repeated structure on the same immutable graph. Native image
generation added another structure scan through operation validation.

The scheduling transaction runs structure once, preserves entry/root error
priority, then calls the private Phi continuation. Native input validation
preserves constants -> structure/operations -> switch -> terminal -> ARGVAL ->
calls -> entry/roots -> Phis, sharing its structural result within that call.
The public standalone Phi/operation validators still check their own inputs.
Native compile.validate retains its previous count and diagnostics.

Pipeline has checked public prepare and prepare-native wrappers. Its common
preparation implementation is private and cannot be imported. No validation
disable flag, caller-supplied proof, stale cache, or unchecked public route is
introduced. The graph is immutable throughout the transaction. All operation,
constant, call, control, entry/root and Phi checks remain; none are waived across
a graph mutation. Post-transform validators remain unchanged.

Tests compare frozen pre-change validators against all three public results:
1188 arity/header/operand mutations x25 entry/root combinations (29700), plus
valid counts, malformed constants, mismatched arrays, and full65535-operand
storage. Exact diagnostics and priority match. Private implementation import is
rejected. Existing verifier, Phi/SCCP, calls/stacks,144 numeric conversions,
memory-promotion, ARGVAL GP/FP pressure, aggregate x8 results and typed switch
cases pass under debug checks and AddressSanitizer.

Opaque graph preparation, same independently compiled LLVM caller checking all
scheduled references and malformed inputs.32 rotating CPU samples after warmup,
32 preparations per invocation:

| Backend | Before ms | After ms |
|---|---:|---:|
| Stogir O3 |31.0670|28.0180|
| LLVM O3 |11.4975|10.5375|

Preparation improves9.81% with Stogir and8.35% with LLVM. Distinct source roots
and object hashes checked. Final whitespace normalization was recompiled and
produced byte-identical measured objects on both backends. Raw samples/scripts,
source hashes and privacy diagnostic are in validation/validation-transactions.

This is not integrated generation or bootstrap acceptance. Full target remains
5x generation speed and runtime within10% of LLVM O3. Current installed full
checkpoint remains3.0428x generation and2.3037x slower runtime. Next measure the
complete native path in an isolated Coil candidate before adoption.
