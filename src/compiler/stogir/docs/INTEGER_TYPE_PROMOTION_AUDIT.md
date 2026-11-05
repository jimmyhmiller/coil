# Backward integer-width propagation audit

Pinned dstogov/ir92171d0a4a36b0acf707f2dea7998de615dd4acd implements
`ir_may_promote_trunc`, `ir_promote_i2i`, and the IR_TRUNC iterative dispatch in
ir_sccp.c. Our iterative fold kernel documents this broader type promotion as
pending. It can push a truncation back through eligible arithmetic, reducing
widened word-container calculations to native narrower arithmetic. It is a
separate stage from removing redundant machine word moves.

## Native upstream corner cases

The standalone C program under validation/integer-promotion-audit uses documented
builder APIs and ir_jit_compile on this Mac. With a=0x80000001,b=1:

| Expression, returned as low32 bits | Expected | O1 | O2 |
|---|---|---|---|
| TRUNC_I32(MIN_U64(ZEXT_U64(a),ZEXT_U64(b))) |00000001|00000001|80000001|
| TRUNC_I32(MAX_U64(ZEXT_U64(a),ZEXT_U64(b))) |80000001|80000001|00000001|
| TRUNC_I32(ABS_I64(ZEXT_I64(a))) |80000001|80000001|7fffffff|

The program exits1 for the observed mismatches. Source, exact pinned commit,
build/link commands and output are retained in results.json. This confirms
corner cases in that pinned revision; it makes no claim about latest upstream.
No upstream source files were modified and no upstream issue/message was sent.
No ir-bugs Pad exists, so this report is in the coil-stogir project Pad.

## Port contract

Implement backward width propagation in the existing iterative optimizer, before
CFG/matching/allocation facts are built. First cover sound modular arithmetic,
constant narrowing, conversion retargeting, bounded constant left shifts and
value selection/Phi shapes with exact use-occurrence and protected-root proofs.
Preserve reference identities and update exact def-use edges/worklist entries.
Avoid recursive unbounded-stack traversal and quadratic per-root graph clearing.

MIN/MAX and ABS do not generally commute with truncation. Import their cases
only with sufficient representable-range and ordering proofs; otherwise retain
the original operation. BOOL canonicalization and pointer types are separate
boundaries. Do not inherit the reproduced wrong-code behavior in pursuit of
parity or performance. Shared expressions and observed wide values must retain
their original types and values.

The initial modular integer-width port is implemented in `iter-fold.coil`.
It uses preflight plans, explicit traversal storage, touched-reference reset,
exact-use updates and existing protected-root replacement. MIN/MAX/ABS, BOOL
and pointer conversion boundaries remain excluded. Validation is in progress;
this does not establish a whole-bootstrap speedup or meet the 5×/within 10% goal.
