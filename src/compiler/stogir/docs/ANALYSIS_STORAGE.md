# Bulk zero initialization of known analysis extents

The existing ArrayList.extend-zeroed! initializes the final known extent for
bitset words, CFG membership, adjacency ranges/cursors/edges and seen arrays,
dominator idoms/Euler first/last/child/sibling indexes, loop depth/seen, liveness
marks and schedule ranges/cursors/nodes/end/body counts. This follows upstream's
bulk-sized analysis allocations. All initialized elements are integer/bool or
Range records containing only integers; zero bytes are their existing values.
Nonzero -1 sentinel loops and records with owning/nested storage are retained.
No graph/control, order, count, reachability or allocation algorithm changes.
Capacity may differ; logical lengths, sentinel values and ownership remain.

ASAN/debug bitset, CFG, dominators, liveness, loop-analysis, placement,
branch-placement, SCCP-to-native pipeline and module-execution suites pass.
Bitset tests check0/1/63/64/65/130/4097 sizes, all words initially zero, domain
bounds and reused allocations. Linked SCCP pipeline AOT consumer passes.

New opaque prepare-graph reduction runs the actual graph-to-schedule pipeline on
a caller-constructed2307-node live linear SSA graph. Every scheduled reference
is summed; caller independently computes1+…+2307 and checks malformed arity,
reference and root rejection.32 prepares per timed process; stogir/LLVM/TPDE
all pass. This is a preparation reduction, not native register allocation or
whole-compiler acceptance.

Fixed LLVM-built compilercd81b35b, O3/no-debug/cache off, before7f5c17c versus
zero-init source. Same opaque LLVM runner object for all binaries; correct project
cwd and source fingerprints checked per compile. Eight rotating generation and
16 process CPU samples after warmup. A second16-sample native repeat rotates the
same six binaries. Exact source fixtures live in benchmarks/compiler-gaps;
copy the two prepare-graph files into baseline build/analysis-init-fixtures
before replaying the saved driver.

|Backend|Before CPU ms|After CPU ms|Repeat before ms|Repeat after ms|
|---|---:|---:|---:|---:|
|stogir|35.9075|34.3525|36.7995|34.8455|
|LLVM|13.9715|13.0560|14.3970|13.6355|
|TPDE|118.2445|113.6475|120.2700|115.2545|

Stogir improves4.33%/5.31%; LLVM6.55%/5.29%, TPDE3.89%/4.17%.
The repeated stogir/LLVM runtime ratio is still2.56×. Source compilation of the
kernel is126.526→126.5555ms stogir,382.043→361.2055ms LLVM,
2.0045→1.947ms TPDE. Those generation numbers compile this reduction and do not
measure executing the improved compiler analyses. No full bootstrap gain or
Coil integration is established by these measurements.

[Raw comparison](validation/analysis-storage/results.json),
[native repeat](validation/analysis-storage/native-repeat.json),
[driver](validation/analysis-storage/measure.py), [repeat driver](validation/analysis-storage/measure-native.py).
The first comparison source fingerprint and exact fixed compiler/runner hashes
are preserved with host snapshots. No name-based optimization or new license
headers were introduced; upstream credit remains centralized in NOTICE/provenance.
