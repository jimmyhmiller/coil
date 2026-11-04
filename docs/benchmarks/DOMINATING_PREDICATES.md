# Exact dominating predicates

Standalone `cae46e7`, integrated as Coil `3556e760`, ports pinned
`ir.c:ir_check_dominating_predicates_i` and the late SCCP condition call site.
An exact repeated predicate can use a preceding IF projection or guard on the
straight control chain. START, MERGE and LOOP_BEGIN stop the proof. Reference
ordering and a finite control-walk bound are preserved. Existing IF cleanup
owns edges, observations and reachability; a path fact never becomes a global
predicate-value substitution.

ASAN/debug SCCP control suite passes, including 350 new before/after native
answers: both projections, counted effects, data/control observations, later
predicate references and a native join counterexample. Guards and loop/join
barriers have direct proof queries; no new native guard emission is claimed.

Eight rotating generation and twelve CPU samples, excluded warmups, caches off,
identical opaque LLVM runner and source. Baseline e54e5c3e, current3556e760.

| Workload / metric | Before stogir | Current stogir | LLVM O3 | TPDE |
|---|---:|---:|---:|---:|
| Verifier generation ms |104.6045|103.5515|356.6995|1.4215|
| Verifier CPU ms |41.1900|41.2515|9.6680|77.1915|
| Iterator generation ms |1.1390|1.1780|15.9350|0.0670|
| Iterator CPU ms |19.9460|19.8665|9.6625|54.7620|

No runtime gain is established. The verifier object shrinks102196→102164 bytes;
iterator stays byte-identical at1436 bytes. Generation changes go in opposite
directions on these two small workloads; no aggregate compile-speed gain is
claimed. No full compiler measurement was run for this change. The5x generation
and within10% runtime compiler target remains unmet.

Raw [verifier](results/dominating-predicates/verifier.json) and
[iterator](results/dominating-predicates/iterator.json), including host snapshots.
