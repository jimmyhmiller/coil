# Optional bounded inline site priority

`prioritize-registered-sites` returns an owned permutation of registered sites,
ordered by cached base clone cells, with stable original-order ties. It is an
explicit independent module policy; existing ordered optimization APIs retain
their input order. No function-name, benchmark or budget exception is introduced.

Each immutable registry snapshot owns a ranking estimate computed once on
registration. It counts actual instruction extents other than mapped START,
PARAM, RETURN and NOP cells. Caller-dependent casts, scopes and observation
anchors are excluded from the estimate; the existing exact eligibility/apply
budget remains authoritative. The cache cannot stale when the provider mutates
or destroys its original graph. Old handles retain their old version's cost.

Sorting uses a max heap with original ordinals as tie breakers, O(S log S) time
and O(S) scratch/output storage. It validates one-based local handles and released
registries, but does not claim to validate caller references; the normal optimizer
still performs that validation, including duplicate sites and Never cases. No
entry is filtered, and the input slice is unchanged. The caller owns/frees output.

ASAN/debug module-execution passes: empty/singleton/six mixed costs,1025-site
independent bucket oracle, stable ties despite reversed CALL references, Never
retention, freed provider storage, invalid/released handles, and normal registry
transactions. Native dependent arithmetic and noncommuting stores execute with
both site-processing orders at exact0/1/2-cell growth budgets. Existing module,
ABI/capture, scoped-stack, switch/default/trap and malformed-input cases pass.
Linked Mach-O module/switch AOT consumer also passes.

No compiler integration or speedup is established yet. Next opt in from the Coil
adapter and measure reduced workloads with the same512-cell limit. Cost-first is
a heuristic, not an assertion of optimal profitability or upstream inliner parity.

The first Coil cost-only experiment improved verifier runtime but regressed the
shared-use reduction around20%: it left graph.operand called inside the loop.
It is not an accepted compiler policy. A split-use probe also accidentally used
the SDK namespace because the driver ran from Coil's project; those identical
objects do not establish any split-walk comparison.

`optimize-registered-prioritized-if-changed` now offers a caller-aware policy.
It validates source/sites through the normal transaction before consulting CFG
facts. If non-Never base clone estimates fit the budget, or the budget is zero,
it retains input order and builds no loop analysis. Under estimated pressure it
uses the existing CFG/adjacency/dominator/natural-loop implementations, ranking
higher loop depth first, then smaller base cost, then original ordinal. Unknown
irreducible-loop frequency is not fabricated. Exact eligibility and charged
casts/scope/anchors/total growth remain unchanged. Existing APIs remain ordered.

A native loop test proves the policy spends a one-cell budget on the loop call,
while the ordered API spends it on the earlier cold call. Both compiled images
produce the same answers across opaque inputs, with exact one-cell growth.
Zero budget, invalid entry and released handles are checked. All existing
registered transactions also run the new single-site API and compare against
ordinary checked expansion. Full ASAN/debug module and linked AOT suites pass.
No accepted compiler performance claim for the revised policy yet.
