# Immutable classification input reads

One fixed8bbe8647 emitter compiles old library2dddff9 and the changed verifier.
The exact opaque LLVM runner checks valid graphs and malformed layout/reference/
type cases. Each run has16 rotating process CPU samples after excluded warmup;
the before object is reemitted and verified against its retained SHA.
These are library source-algorithm comparisons, not generation timings.

| Case | First CPU ms | Repeat CPU ms | Object bytes |
| --- | ---: | ---: | ---: |
| Original stogir |35.2485|35.3550|102483|
| Cursor/input reuse stogir |32.2775|32.3205|101874|
| LLVM O3 (changed source) |8.7895|9.3420|41008|
| TPDE (changed source) |65.6490|65.3290|75589|

Stogir improves8.4%/8.6% against its matched original source. The earlier
cursor/first-input-only checkpoint was3.6% in one run (results/classification-reads/shared-first.json).
The repeat remains3.46× LLVM CPU on this kernel; the full compiler target is
unmet and unmeasured here. No integrated emitter speedup is established.

The structural verifier cursor already owns exact Node/count. Classification
uses its first three operand fields directly; continuation cells still use the
checked accessor. All referenced inputs retain checked membership/borrows.
First-input type is shared with floating classification where appropriate.
Both flags stay independent and validators keep their original order/errors.
The existing ASAN/debug verifier suite compares both original classifiers over
1,451,220 raw opcode/type/count/input cases and checks exact diagnostics/counts.


## Full compiler diagnostic

Single serial samples, caches off, source tree SHA
`f1ed1104d440db545c8d3d12ead1861efb39dfde7b74a19c1cbd6f7d35966160`.
The LLVM-built before8bbe8647/current9af0f6f2 drivers compile that same source.
[Raw full results](results/classification-reads/compiler.json) retain source,
compiler/object hashes, per-process CPU/RSS and bounded host snapshots.

| LLVM-built driver / target | IR generation s | Whole CPU s | Object bytes |
| --- | ---: | ---: | ---: |
| Before / stogir O3 |12.308192|19.946420|14368236|
| Current / stogir O3 |12.295872|19.999673|14368236|
| Current / LLVM O3 |33.828874|41.064906|8469304|

The driver generation result is neutral and before/current stogir objects are
byte-identical. Current stogir generation is2.75× faster than LLVM O3, below5×.
This is distinct from the preceding fixed-emitter library source comparison.

Compilers linked from the exact current stogir and LLVM objects then emit the
same frozen compiler source to stogir O3:

| Generated compiler | IR generation s | Whole CPU s |
| --- | ---: | ---: |
| Stogir O3 native |29.337565|49.368042|
| LLVM O3 native |10.511548|17.306748|

Both native outputs are byte-identical to the host driver's stogir object.
The generated stogir compiler is2.85× slower in whole CPU than LLVM O3, outside
within10%. These are single diagnostics, not repeated acceptance. No full
source-algorithm speedup is claimed against a compiler built from older source.
The5× generation/within10% generated-compiler runtime goal remains unmet.

A separate non-timed native-compiler run samples4 seconds at elapsed5 seconds
and4 seconds at27 seconds, at1ms intervals. Target/samplers exit0; output hash
matches the benchmark. The early window observes resolve/expansion/comptime
work; the late window observes stogir verification, use-list construction,
allocation and emission. Main-thread ulock waits are worker joins, not productive
CPU. [Metadata](results/classification-reads/native-profile.json),
[early leaves](results/classification-reads/native-early-leaves.txt) and
[late leaves](results/classification-reads/native-late-leaves.txt) retain evidence;
full stacks stay in build/classification-native-profile.

The early worker includes153 primitive-providers-in,106 code-node-parts and103
sx-tag leaf samples. The late worker includes235 uses.build,213 structure,121
integer validation and119 reserved-ranges.first. The next reduction should test
hot selector/aggregate call costs and actual inlining eligibility; those stack
names alone do not prove an inlining or ABI defect. Preserve the call/alias,
root and aggregate lifetime contracts when identifying the code-quality gap.
