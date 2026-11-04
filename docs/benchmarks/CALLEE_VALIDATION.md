# Transaction-local callee validation reuse

Immutable call-expansion targets now share successful full validation within one
transaction when their complete validation read views match. The19scalar key
words cover instruction/arity/constant/span and string bytes/entries pointers,
lengths and capacities, plus function-prototype metadata. Width is fixed per call.
Exact comparison resolves hash collisions. Key extraction reads raw descriptors,
so it cannot raise a collection assertion before the original validator's first
error. One fixed key buffer and packed20word records avoid per-site aggregate
key allocations. Scratch proofs are freed before expansion; none crosses calls
or mutation. All caller/per-site roots, CALL uniqueness, capture, eligibility,
closed-control, result completeness and budget checks remain.

Standaloneba810eb/e80e230/5ee1fbd, Coil06606cdf. ASAN+debug tests compare fresh
single-site checks with repeated batches over29shapes at budgets0/512, including
aliased metadata, valid collision chains, missing roots, capacities, malformed
string spans, unused invalid metadata and mutations between calls. Scoped-result
loop checks pass. The audit also fixed two existing bounds bugs: positive graph
membership must bound arity storage; binary string lookup must reject negative,
overflowing and out-of-arena spans before constructing a slice. Existing graph
and string suites exercise the fixes underASAN+debug. The source attribution
remains centralized in PROVENANCE/NOTICE/LICENSE.

## Small comparison

Before2ac4ffbd versusb14e083d (before final string/error-order refinements), same
current fixture/library and opaque LLVM runner. Eight rotating generation and
eight CPU repetitions after warmup. Generation111.8815→112.3080ms is neutral;
target objects are identical. This small reduction did not predict a gain.
Exact [small samples](results/callee-validation/small.json).

## Current full compiler diagnostic

Source06606cdf, caches disabled, serial; one sample per host/target, not repeated
acceptance. Both LLVM hosts emit identical stogir objects. The exact current
object links into a native compiler which passes version/check/run smoke; both
target objects also match across LLVM/native hosts.

| Host | Target | Generation s | Whole emit CPU s |
|---|---|---:|---:|
| LLVM before2ac4ffbd | stogir |14.448278|21.408597|
| LLVM06606cdf | stogir |13.898961|20.939117|
| LLVM06606cdf | LLVM O3 |30.911527|37.508722|
| stogir06606cdf | stogir |40.333669|59.526787|
| stogir06606cdf | LLVM O3 |31.807925|50.706963|

Generation decreases3.8% in this single matched before/after comparison, including
the two bounds fixes. Current stogir generation is2.22×faster thanLLVM, below5×.
Generated compiler wholeCPU on stogir emission is2.84×LLVM host, outside10%.
This checkpoint does not meet the objective. Exact [full samples/hashes](results/callee-validation/compiler.json).
