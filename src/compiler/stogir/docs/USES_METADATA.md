# Per-node operand metadata in def-use walks

Pinned upstream ir.c:ir_build_def_use_lists reads instruction flags once per
node, outside its operand loop. Our use builder now reads one opcode metadata
word per node and decodes that retained word across its operands. The public
operand-code API still validates the opcode; operand-code-word decodes a cached
word with the same nonpositive-index and repeating fifth-field semantics.
Invalid opcodes still produce no reference kinds in the use builder.

All five fields are retained. We do not substitute upstream input-prefix counts,
which would drop our additional label/control reference edges. Count/fill order,
reference categories, range offsets, edge positions and mutation behavior remain.
Graph storage is only read in these walks; no graph pointer survives mutation.

The frozen independent textual metadata oracle checks131 opcodes, invalid opcode
and index bounds, and index65535/repeating-tail behavior. ASAN/debug opcode,
uses, mutable-use, native switch matrix and verifier checks pass. The opaque
materialized-edge checksum passes with stogir, LLVM and TPDE objects. The stogir
uses.build assembly shrinks573→554 listing lines in this reduction, with7 call
sites in both. This is a code-shape observation, not a runtime claim.

Fixed-emitter comparison now passes: LLVM-built Coil86648db1, same fixture,
independent byte-identical LLVM runner and source fingerprints checked on every
compile. Before objects reproduce prior f34be99 hashes exactly. Eight rotating
generation samples and16 native CPU samples after warmup across six rows;
a second native repeat uses the same six binaries.

|Backend|Before CPU ms|After CPU ms|Repeat before ms|Repeat after ms|
|---|---:|---:|---:|---:|
|stogir|10.5805|10.0345|10.5035|9.9785|
|LLVM|5.6815|5.7510|5.6470|5.7580|
|TPDE|47.0755|42.4140|46.1730|41.6995|

Stogir improves5.16%/5.00%. LLVM is1.2%/2.0% slower on this reduction; retain
that tradeoff rather than claim all-backend gain. TPDE improves9.9%/9.7%.
Stogir still takes1.73× LLVM runtime in the repeat. Kernel generation is
16.454→16.220ms, LLVM57.3975→55.6935ms, TPDE0.431→0.442ms; these small
single-comparison differences do not establish compiler bootstrap gain.

[Raw comparison](validation/uses-metadata/results.json), [native repeat](validation/uses-metadata/native-repeat.json),
[driver](validation/uses-metadata/measure.py), and [repeat driver](validation/uses-metadata/measure-native.py).
No Coil integration or full bootstrap measurement yet. Next inspect the dynamic
pass0/pass1 selection in our shared loop against upstream's two explicit walks;
any separation must retain the exact same edge ordering and extra references.
