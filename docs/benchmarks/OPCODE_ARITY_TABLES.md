# Opcode arity table kernel

Componentba7f6d5. Unchanged10million-query feedback workload, checksum
3491339289029632593. Three rotating samples after one excluded warm run:

|Build|Old matches s|Arity tables s|
|---|---:|---:|
|LLVM O3|0.040508042|0.033441166|
|stogir O3|0.771061625|0.105593292|

The native kernel improves7.30×; it remains3.16× slower than LLVM's table build.
This is a metadata query kernel, not whole compiler acceptance. State feeds the
queried facts back into the next index to prevent invariant query hoisting.
Both backends and both source versions produce the same checked answer. Fixture
hash and raw samples are retained; focused assembly shows the old branch chain
and new table load. Native table lookup still calls valid? and scalar slice get,
where LLVM inlines these helpers.

The public arity functions retain all values, variadic sentinels and invalid
results. Tests derive both facts independently from the131 frozen pinned shape
strings, including metadata-only extra operands, and check integer boundaries.
ASAN opcode/builder/verifier/incremental JIT checks pass. No compiler integration
or global installation is claimed by this component report.
