# GP result-selection hypothesis rejected for three hot functions

Captured functions from actual backend emission workload, with frozen compiler
01f47440/SDK072feff5632c860851266fc77c9765b805ace149e49cf1f38dba45fd27e3f3af:
`COIL_STOGIR_GRAPH=FUNCTION COIL_TPDE_STATS=1 COIL_TPDE_SERIAL=1 COIL_LIBRARY_STATE=0`
`coil-candidate emit-obj docs/benchmarks/emission-workload/kernel.coil --backend stogir -O3 --no-debug`.
All three kernel objects have identical SHA256, so capture does not affect code.
Raw graph/trace and replay generator retained. Anonymous import names suffice
for native validation/matching; these replays do not execute unresolved calls.

Snapshot preserves every raw cell/arity, constants/spans, binary strings,
function prototype and roots. Standalone librarye1ee083 replay performs checked
memory/SCCP optimization, native scheduling/validation and ordinary target
matching. LLVM O1/debug/ASAN hostb27ffeb4. This inspects common scalar matching,
not the optional O3 vector extension or a full-module identity equivalence
claim: template specialization order can differ in a whole compiler invocation.

| Function | Remaining calls | Eligible GP-return calls | Selected GP-return calls |
|---|---:|---:|---:|
| verify.structure |7|1|1|
| uses.build |8|0|0|
| verify.integer-operations-target-structured |19|2|2|

No GP-return selection misses here; do not broaden control/dominance rules on
this evidence. Integer verifier additionally retains indirect x8 returns;
those require a separate ABI/representation question, not weakening GP privacy.

Whole-bootstrap binary01f47440 independent disassembly for verify.structure:
Stogir643instructions,143loads,68stores,7calls,120branches; LLVM328instructions,
36loads,11stores,0calls,78branches. Counts exclude relocation records. This is
static code, not dynamic cost. Trace on the diagnostic kernel says25inline
sites,18changes,510/512reservedcells. Remaining calls include types.valid?,
Graph.operand/borrow-node, opcode.input-count and slice equality. This motivates
an isolated same-budget inline ranking experiment, not raising the cap or
claiming these seven calls explain the entire bootstrap gap.
