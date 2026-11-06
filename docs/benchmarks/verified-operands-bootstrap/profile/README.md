# Combined generated compiler profile, untimed

Both generated hosts reproduce the frozen seed object. Separate untimed sampling
runs; no sampling overlaps diagnostic timings. Profiles retain SDK/host/output
hashes. Inclusive shares overlap; LLVM inlining changes attribution. Mainthread
join waits are excluded. COIL_CODEGEN_TIMINGS produces write overhead; do not
target instrumented writes as a product compiler optimization.

Stogir worker21159samples: nativeemission6715(31.7%), verification2702(12.8%),
allocator1044(4.9%), allocation/scratchAPI1616(7.6%), modulefinalize2039(9.6%),
moduleprepare1804(8.5%), usesbuild896(4.2%). Structure783samples, integer
verification626, memmove620, primitive-provider resolution561, usesbuild479,
classifications396, usesscan363, reserved-ranges.first347.
LLVM worker12088samples: emission3857, verification1048, allocator526,
allocationAPI979, moduleprepare964; symbol attribution not direct speedups.

Next reduction: integer-operations-target-structured already receives a graph
whose structure is validated, yet rereads operand1/2 via checked Graph.operand
before borrowing referenced cells. The current node already contains op1/op2;
prove exact diagnostic equivalence for structurally valid graphs and retain all
referenced-node/type/width/guard checks before substituting those fields. Its
classification loop is another repeated reader, but preserve both independent
vector/floating decisions and diagnose separately. No implementation or speedup
claim for this next audit.
