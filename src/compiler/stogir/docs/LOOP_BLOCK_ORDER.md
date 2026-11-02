# Canonical loop-aware allocation block order

The scheduling stage follows pinned dstogov/ir
92171d0a4a36b0acf707f2dea7998de615dd4acd,
`ir_gcm.c:ir_is_good_bb_order` and `ir_fix_bb_order`. It runs after global placement
and before packed scheduling, matching, liveness and allocation. Physical image
layout remains a separate post-allocation stage, as upstream.

The initial reverse postorder computes dominators. If reachable source blocks
already respect predecessor/backedge order, canonical source block order is
retained for allocation. Otherwise reducible CFGs use upstream postorder priority:
visit shallower successors first, ties in reverse successor order, then reverse
the result. A successor heap preserves that priority without quadratic rescanning
at large switches. Node/block references and the semantic graph are unchanged.

Irreducible retreating edges retain the existing valid RPO. Upstream's full
irreducible-side-entry classification is not represented here and is not claimed
as ported. Unreachable blocks are excluded. Reachability counts are checked
before publishing an order; no backend fallback is involved.

The diagnostic identifies outer Phi 59: its spill part covers the vector body,
but the next register use is outside that inner loop. Plain RPO placed the vector
latch after the outside use, creating a reload/store pair on each backedge. After
canonical ordering, vector-loop blocks precede the outside use and both ends of
the backedge use the spill location. The pair disappears through allocation and
edge reconciliation, without an emission peephole or workload recognizer. The
captured graph reproduces the actual compiler's stack-slot 64 pair; it is a
diagnostic fixture, not a production compile-time benchmark.

Focused ASAN validation passes 325 CFG cases: rotated labels, simple/nested loops,
multiple latches, irreducible fallback, unreachable components and switches up to
2048 successors. Repaired orders match a literal scanning reference of the pinned
algorithm. Canonical order, reachability and change results are checked. Native
stencil 60 checks and Phi/switch-pressure/branch programs pass. Disassembly confirms
a direct vector backedge without the Phi 59 hot-loop transfer pair.

Full compatibility validation passes 236 programs and 72 linked AOT consumers
from executable source 7801b60, with frozen inputs and fresh objects. Compiler
integration and unchanged-workload measurements remain required before acceptance.
