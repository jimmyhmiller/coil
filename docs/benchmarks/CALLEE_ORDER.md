# Callee-first template finalization

Compiler `e54e5c3e`, ABI fixture `506e5847`, compared with delivered `a162bbc0`.
The module provider retains actual CALL-edge Kahn order and finalizes callees
before callers. Bounded local revisits preserve private-result promotion and
nested calls. Reverse-import notifications are removed. Recursive call closures
remain Never templates; the 512-cell growth budget and exact standalone legality
proofs are unchanged. This is the existing module-level extension, not an
upstream optimizer rule. The compact graph and shared JIT/AOT pipeline remain.

Typecheck passes. The extended existing fixture checks a shared effectful leaf
declared after its callers, weighted results and ordered memory effects, through
LLVM/stogir/TPDE. Trace confirms leaf -> wrappers -> caller despite source indices
88 -> 57/58 -> 15. The separate broader provider eligibility patch was rejected
and is absent here.

Eight rotating generation and twelve process CPU samples, excluded warmups,
caches off, identical source/opaque LLVM runner:

| Workload / metric | Before stogir | Current stogir | LLVM O3 | TPDE |
|---|---:|---:|---:|---:|
| Verifier generation ms |110.4555|106.4430|363.9705|1.4180|
| Verifier CPU ms |41.8560|42.2465|9.9130|78.2395|
| Iterator generation ms |1.1970|1.1800|16.0055|0.0690|
| Iterator CPU ms |19.8190|20.0030|9.8775|54.9975|
| Shared DAG generation ms |18.7300|12.0930|48.9890|0.2695|

Verifier generation improves about 3.6%; object 102276 -> 102196 bytes. Runtime
is neutral. Iterator object is byte-identical at 1436 bytes. Caller-first DAG
complete emit-obj generation improves 35.4%, including module preparation and
finalization. All four linked binaries match independent Python checksum
35052530098921960. Short-process DAG CPU is 2.1240 -> 1.8945 ms (LLVM 1.4600,
TPDE 2.6720); this is diagnostic and not a compiler runtime acceptance result.
DAG binary size is 51496 -> 51208 bytes (LLVM 50712, TPDE 53624).

Same frozen compiler source, single serial full compiler emission samples:

| LLVM-built driver / target | Generation s | Whole CPU s | Peak RSS GB |
|---|---:|---:|---:|
| Before / stogir O3 |13.462425|20.760102|5.0106|
| Current / stogir O3 |12.492853|19.954148|4.8776|
| Current / LLVM O3 |32.291108|39.254572|4.4010|

Stogir generation improves 7.2% in this diagnostic and is 2.58x faster than LLVM
O3, below the 5x target. Objects are 14444996 -> 14350328 bytes; LLVM 8441032.
These are single diagnostics, not repeated acceptance.

Compilers linked from those exact three objects then emit the same compiler
source through stogir O3, serially, with caches off:

| Generated compiler | Generation s | Whole CPU s |
|---|---:|---:|
| Before stogir code |29.778988|47.953731|
| Current stogir code |29.524591|48.102813|
| LLVM O3 code |10.623889|17.350365|

All three outputs are byte-identical to the LLVM-host current stogir object.
Before/current native runtime is neutral. Current stogir-generated compiler is
2.77x LLVM CPU, far outside the within-10% runtime target. The generated LLVM O3
compiler differs from the development candidate; compare the rows in each table
with each other, not host times across the tables. No goal acceptance is claimed.

Raw [verifier](results/callee-order/verifier.json),
[iterator](results/callee-order/iterator.json),
[DAG](results/callee-order/dag.json),
[full compiler generation](results/callee-order/compiler.json), and
[generated compiler runtime](results/callee-order/compiler-runtime.json).
Host records contain bounded process-name snapshots outside measurements.
Full local scripts, objects and logs: build/callee-order-{verifier,iterator,dag,compiler}.
