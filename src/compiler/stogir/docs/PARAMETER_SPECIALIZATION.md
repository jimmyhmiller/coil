# Context-bound numeric parameter specialization

The actual verifier trace records23 initially eligible sites and15 expansions,
with generic string-equality calls remaining in its loop. Budget pressure is a
hypothesis; this module does not establish that it explains the runtime gap.

`parameter-specialize.specialize` takes an immutable source graph, roots and
explicit numeric bindings to positive entry PARAM references. Original graph
validation happens before edits, so replacing a PARAM cannot hide malformed
source storage. A private duplicate receives same-type zero-flag COPYs at those
references; the existing checked SCCP pipeline owns the next analysis epoch and
preserves/remaps supplied roots. No new folding semantics are introduced.

The owned `Specialized` artifact carries its rewritten graph, numeric argument
conditions (ordinal, type, exact bits) and target pointer width. Its body is
equivalent only under all attached conditions, not for arbitrary arguments.
It must never be registered as an unconditional alternate definition. The
`bindings-match?` predicate checks literal arguments and target width only;
ordinary callee identity, complete prototype, Never, recursion, closed-control,
private result/capture and exact inline-growth proofs remain required. Source
and artifact storage are distinct and all failure paths release partial work.
Only valid same-type numeric scalar literals are supported. Dynamic values,
positive expressions and named relocation payload IDs do not satisfy conditions.

The native reduction has nested equality branches and an observable STORE on
the equal/nonzero path. Binding one U64 parameter to zero removes that path.
The source still performs the STORE for other equal arguments; native canaries
and returned values check both behaviors. The source PARAM remains unchanged.

Existing exact inliner preflight reports17 minimum clone cells for the original
and8 for the specialized callee. With a budget of8 the ordinary callee is rejected,
while the checked specialized callee expands and the native caller returns correct
answers for32 inputs. The caller's budget is not raised or replenished.
Debug/ASAN tests cover changed/dynamic actual arguments, wrong target width,
empty/duplicate/non-PARAM/missing bindings, malformed original arity, invalid
roots, unsupported pointer width and a32-bit pointer payload overflow.

This is an independent context-specialization extension over the pinned compact
IR and existing SCCP. It is not upstream feature parity. Attribution remains
in LICENSE/NOTICE/PROVENANCE. It is not yet wired into ordinary inlining or Coil;
no compile-time or bootstrap runtime improvement is claimed. Integration still
needs a bounded cache tied to immutable callee identity and exact binding
conditions, preserving original validation and one nonreplenishing clone ledger.
Avoid one whole-callee optimization per call site; measure preparation overhead.


## Verified actual budget pressure

Diagnostic compilereda0391c adds reserved/remaining cells to existing verbose
inline tracing, without changing inline policy. Its actual verifier expansion
reserves509 of512cells over15 of23sites, leaving3cells. The string-equality
callee has32 base clone cells. The verifier object is byte-identical to the
88e09ce2 baseline. This verifies budget pressure rather than merely inferring
it from surviving calls; it does not show specialization's eventual runtime
or preparation cost. Trace and hash receipt are retained with validation.

The native budget reduction also passes with extra branch/control observations
retained alongside RETURN, as compiler templates do. Ordinary inliner identity,
closed-control and exact-budget checks still pass, with minimum17→8cells.


## Opt-in registered context cache

optimize-registered-specialized-if-changed validates the entire original batch
first. Only its private same-invocation path reuses the caller validation proof;
the caller is unchanged until the ordinary owned-copy transaction begins.
Every original target must pass ordinary common and private-result eligibility
before specialization. Derived contexts remain private to their original owned
registry handle, with exact numeric conditions and target width checked on use.
No unconditional specialized handle is exposed. Context costs enter the existing
loop/cost ranking before cloning; all clones share the unchanged exact ledger.

Preparation workspace uses the invocation allocator. Only immutable semantic
storage and conditions are copied into the registry allocator, excluding mutable
construction indexes and pending optimizer work. Unprofitable results are cached
as well. Each registry permits at most128 preparations and32768 retained semantic
cells (including string bytes/entries); hitting either limit falls back to
ordinary inlining, while existing contexts remain usable. These are experimental
resource limits requiring compiler measurements, not performance acceptance.

Frozen snapshots omit construction constant indexes. Before SCCP, specialization
rebuilds the owned constant index with scalar/named/LONG_CONST hash and chain
conventions; it preserves every value ID and payload. Complete geometry is
checked before index mutation. Mixed scalar/vector hash collisions and malformed
payload markers have transactional tests. This restores optional construction
metadata, not an unchecked semantic-validation shortcut.

Debug/ASAN: repeated reuse, changed arguments, two immutable handles with the
same name/prototype but different bodies, Never and zero budget, invalid batch
inputs before preparation,128-context exhaustion with correct ordinary fallback,
and reuse after exhaustion pass. A9-site batch grows the cache while borrowed
callee descriptors are live; only one expansion reserves8cells under one shared
8-cell ledger. Native canaries/returns check changed-argument and resource-fallback
paths. Existing graph/constants/vector constants/JIT vector constants/module
execution and29700 validation-transaction checks pass. Evidence: validation/
specialization-cache. No compiler integration or performance adoption yet.
