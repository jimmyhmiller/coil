# Loop memory-dependence guards

This is part of the isolated vectorizer extension, not a pass ported from
upstream IR and not enabled in Coil. `loop-guard` emits ordinary scalar
instructions into the compact graph. Matching, liveness and allocation consume
those instructions through the existing pipeline.

The caller supplies a verified ascending, unit-stride counted loop, its invariant
initial/bound references, uniform element width and affine accesses. The guard
proves sufficient memory independence for a vector prefix; it does not establish
that the original program's pointers refer to allocated storage or that its data
operations are liftable.

Read-only accesses sharing a base form an envelope. If a base writes, every
access sharing that base must have the same static offset. Other cases can have
loop-carried dependencies and retain the scalar loop. Different base references
are never assumed disjoint: every distinct group pair with a write requires a
runtime envelope disjointness check. Read/read overlap is allowed.

For initial `i`, exclusive bound `n`, element bytes `b`, base address `p`, and
minimum/maximum static offsets `lo` and `hi`, the envelope is:

```
[p + i*b + lo, p + n*b + hi)
```

The predicate requires a full chunk, unsigned ordered indices and scaled
indices at most `2^48`. It requires bases and starts below `2^48`, and exclusive
ends at most `2^48`. Static offsets lie within `[-2^48,2^48]`. Therefore exact
address sums lie within `[-2^48,3*2^48]`: negative unsigned wraps cannot become an
accepted lower address, and positive sums cannot wrap through `2^64`. Signed
negative indices and tagged/high pointers conservatively retain scalar code.
No address is dereferenced by the guard.

The input validation precedes graph appends. Construction errors return through
an emitter error state; an owning transform must discard partially built output
on error. The current API supports element widths 1/2/4/8 and chunk sizes 2–64.
The owning vector-prefix transform now creates dispatch, vector bodies, pointer
Phis and scalar cleanup; see [LOOP_VECTORIZATION.md](LOOP_VECTORIZATION.md).
Structural analysis is rebuilt before matching/liveness.

Validation: 32 native guard configurations (unsigned/signed index types, four
element widths and four chunk sizes), 75,264 wide-integer-oracle comparisons and
64 explicit disjoint/alias checks. Linked AOT checks 13 boundary cases. Native
host execution passes AddressSanitizer. Metadata checks cover grouping,
pointwise shared bases, dependence rejection and invalid inputs before mutation.
See [validation/loop-guard.json](validation/loop-guard.json).
