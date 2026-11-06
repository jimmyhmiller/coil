# Live diamond opportunities after Phi cleanup

Real integer verifier snapshot from ../value-diamond-audit, library309d37e and
fixed Coil93222a58 emitter. Ordinary optimize-memory followed by root-driven
liveness and checked native preparation; final145Phis, zero identical pairs.
Audit-only shape-candidate copies current diamond topology/condition checks,
relaxing only the literal-arm predicate. It never mutates the graph.

18live simple one-Phi diamond shapes remain:11with two integer literals,7with
nonliteral values. The11literal pairs are accepted by the ORIGINAL current
candidate predicate after Phi cleanup. They survive because the bulk diamond
pass runs before iterative Phi cleanup; iteration only revisits MERGE for
countdown rules, not diamond selection. This is a concrete missed affected-
merge reconsideration, not a demand for another full SCCP/CFG scan.
Pinned ir_sccp.c ir_iter_optimize_merge does reconsider one-Phi merges through
ir_optimize_phi. Next: expose existing local collapse operation and invoke it
when affected MERGE nodes are queued, sharing root/use-list/effect invariants
with the bulk pass. Avoid duplicating the transformation or rerunning full
passes per merge. Requires native/root/use-list tests and generation-cost checks.

The7nonliteral cases include ZEXT and COND values, but availability is not yet
proved. Do not enable them merely from this topology or numeric reference order.
Generic available-value conversion remains separate future work. No speedup
claim from18shapes or Phi counts.

Reproduce using the same snapshot, generator/template under
build/frame-origin-audit, then build/run replay with this library. The liveness
mask filters shape reports; native scheduling validates the optimized graph.
The copied shape function is intentionally audit-only and must not be installed
as a rewriting rule. No compiler instrumentation or whole build needed.

Known Coil field-vector loop bug reproduced on93222a58 when iterating
[(.op2 phi)(.op3 phi)] directly. Binding the vector before for avoids the known
parser/macro issue; recurrence recorded in existing coil-bugs report.
