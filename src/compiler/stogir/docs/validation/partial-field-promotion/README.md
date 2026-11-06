# Same-start partial integer field stores

Independent extension beyond pinned upstream92171d0 ir_mem2ssa_add_split_var,
which rejects same-start unequal widths. Existing public byte-order-independent
policy stays exact-width. Explicit little-endian policy now permits narrow
integer stores at a canonical integer field start, preserving all high bits.
Displaced overlap, BOOL/pointer mixed widths, escaping/rooted addresses, volatile
accesses and missing initialized paths retain memory.

Flow construction first publishes typed outgoing bit-insertion expressions;
provisional COPYs receive their previous cell value during the ordered block
walk. Predecessor lookup uses existing demand-driven loop/Phi machinery. An
incomplete owner discards every provisional insertion and Phi together; no
partially initialized value escapes into a promoted graph. Narrow values are
zero extended as raw bits, independent of signedness. Small-width masks are
bounded by the canonical field. Existing root/control repair is reused.

270 promotion/fallback fixtures exercise 8/16/32-bit signed/unsigned fields in
16/32/64-bit signed/unsigned canonical cells, branches, loop-carried writes,
nonzero preserved high bytes, one uninitialized incoming branch, uninitialized
loops, unspecified byte order, address observations, volatile stores and
displaced overlaps. 22,680 native expected-byte answers compare original O1,
promoted O1 and promoted O3. New fixture passes Stogir O3 and LLVM O1 ASAN.
Old-source negative control fails promotion assertion (exit134). Existing
mem2ssa ASAN and native control/iterative/SCCP/aggregate-result suites pass.

Real captured free-decision-for-class: 1284→1036bytes, frame216→120bytes. Before
bytes match actual Coil65ea51a8 object exactly. All hashes and graph/allocator
records are retained. Generate with python3 benchmarks/partial-field-promotion/generate.py.
This is code-shape evidence, not a runtime claim. Whole-bootstrap goal remains
unmet; integration and paired performance measurement follow separately.
