# Current actual emitter samples

Candidate65ea51a8, identical opaque LLVM O3 caller with8193 emissions at each
32/128/512-op size. Both executions and sampler processes exited0. Every native
answer and deterministic body hash passes. Sampling only, not benchmark timings.

Stogir leaves: assigned-indexed-pressure535, constraints.add459, structure453,
free-decision-for-class450, classifications395, interval-queue.take345,
integer verification269, graph.borrow-node224. LLVM inlines several of these;
raw leaf counts are not directly comparable and inclusive counts overlap.

The actual free-decision machine code contains repeated16-byte Choice temporary
initialization, i32 register-field overwrite and i64 reload. Its hot loop also
contains dynamic boundary-step division and conservative signed binary-search
midpoint correction. A snapshot of its real graph is retained. These are
specific candidates, not proven explanations for the entire compiler gap.

Memory promotion source explicitly rejects a store narrower than its canonical
cell, even when preceded by full-width zero initialization. This matches the
pinned upstream split-layout restriction: ir_mem2ssa_add_split_var rejects
same-start unequal widths. Supporting partial-field insertion would therefore
be an explicit extension, not a missing upstream port, and requires preserved
untouched bytes, initialized-state proofs, loops/joins, byte-order policy,
observed roots and alias/escape fallback. Do not silently drop padding writes.
