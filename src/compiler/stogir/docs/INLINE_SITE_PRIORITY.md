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
