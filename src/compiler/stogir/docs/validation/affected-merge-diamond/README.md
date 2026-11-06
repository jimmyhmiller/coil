# Reconsider literal diamonds at affected merges

Pinned ir_sccp.c ir_iter_optimize_merge revisits eligible one-Phi merges through
ir_optimize_phi. This implements that orchestration for the port's existing
literal-arm subset. No arbitrary-value availability rule, MIN/MAX/ABS or new
comparison/guard scope is enabled. The original candidate predicate is unchanged.

The bulk and iterative entry points share collapse-plan/apply-collapse! exactly.
A recipe is consumed immediately before any other mutation; fields are copied
references, not pointers into growable storage. The old IF becomes END, Phi
becomes typedCOND, MERGE becomesBEGIN and dead arm/END nodes becomeNOP. Exact
operand-position use lists and affected worklist are updated by existing
replace-node!/replace-value! helpers. No repeated full pass or CFG analysis.

Iteration invokes at-merge! for queued MERGE nodes at the existing control-fold
stage. Removing an identity Phi detaches/requeues its region; the merge is
reconsidered naturally. Local observation remaps use existing split-roots!,
updating protection immediately. Bulk caller retains its existing delayed
removed-reference map. Control changes trigger the ordinary once-per-transaction
prune/repair boundary. No rootless compatibility behavior change.

Tests extend jit-iter-fold:16fixtures (two predecessor orders × eight observation
sets), seeding ONLY the extra identical Phi. Native original/rewritten results
match independently for288cases, including zero/nonzero/MAX_U64 conditions.
Roots include ordinary return, removed Phi, retained Phi, merge, IF, removed
END/IF_TRUE and bothENDs. Root/protection validity, rebuilt exact use lists and
public validation pass. Final Stogir O3/debug and LLVM O1/debug/ASAN pass.
Existing native SCCP control/rewrite/conditional,12288register-countdown and
20480memory-countdown answers pass.

Actual integer verifier snapshot from value-diamond-audit: after ordinary
optimize-memory and checked native preparation,145→134scheduledPhis and all11
previously accepted literal diamonds converted. Eight remaining live shapes
have nonliteral arms (one newly exposed). See replay text; counting topology is
not a native performance claim. Reproduce with the generator/template/snapshot
in value-diamond-after-phi using this library. No compiler instrumentation or
whole build needed for the replay. Fixed emitter93222a58.

Not yet integrated into a new Coil candidate; no performance/install/push claim.
