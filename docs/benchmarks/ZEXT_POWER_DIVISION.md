# Power division construction and incremental folds

Unsigned power division/remainder and signed division/remainder of genuinely
zero-extended inputs restart as SHR/AND through the existing graph machinery.
This follows pinned ir_fold.h. One same-width integer BITCAST around ZEXT is
also transparent for Coil's word-container adaptation; the original operand
reference remains unchanged. Signed ordinary/SEXT inputs, top-bit divisors,
zero/non-power divisors and named constants retain the original operation.
At construction the existing builder validates operands/guards, folds constants
and interns expressions. Incremental restarts maintain exact use edges and roots.

Standalone2dddff9 has ASAN/debug coverage for896 width/conversion/divisor cases,
construction and incremental forms, rebuilt use edges, native before/after
boundary answers and optimizer dispatch. Coil's existing native-backends fixture
adds opaque u32-to-i64 boundary checks for the adapter.

The incremental-only checkpoint did not affect initial unqueued nodes; its
[neutral evidence](results/zext-power/incremental-only.json) is retained.
Construction shares one legality proof with incremental rewriting, and the
adapter now routes DIV/MOD through its validated builder. No global rescan was
added to the affected-node queue.

Same frozen fixture source, old57404e6b versus current8bbe8647. Eight rotating
IR-generation samples and sixteen rotating process CPU samples exclude warmup;
caches are off and every execution checks answers. Each workload uses one
exact opaque runner. [Raw results](results/zext-power/integrated.json) include
compiler, fixture, runner/object hashes, all samples and host snapshots.

| Workload/backend | Generation ms | Runtime CPU ms | Object bytes |
| --- | ---: | ---: | ---: |
| Power before stogir |0.1480|12.7915|616|
| Power current stogir |0.1520|12.6570|584|
| Power LLVM O3 |13.6670|12.9335|704|
| Power TPDE |0.0360|12.1025|600|
| Verifier before stogir |105.1090|36.4815|102483|
| Verifier current stogir |105.5115|36.4725|102483|
| Verifier LLVM O3 |356.3920|9.9275|39328|
| Verifier TPDE |1.4375|76.6935|75646|

The opaque power functions remove signed correction: quotient6→3 instructions,
remainder7→3. CPU differences are small; no meaningful runtime improvement is
established. The verifier object is byte-identical and generation/runtime are
neutral. Its generation is3.38× faster than LLVM O3 and CPU3.67× slower. This
is not the full compiler, and does not establish the5×/within10% goal.

A separate, non-timed3-second1ms verifier profile uses the same current kernel
with16384 runner iterations. Both sampler and target exit0; checksum/invalid
input assertions pass. Of2306 samples, structured integer validation has750
leaf samples, structure559, checked node reads318, vector classification286,
floating classification135 and operand access114. The next audit is redundant
classification input/header reads within one immutable validation iteration.
It must preserve classification, validation order and exact malformed-graph
errors. [Profile excerpt](results/zext-power/verifier-profile.txt) and
[hashes](results/zext-power/profile.json) retain the evidence. Profiling was
outside timing intervals and is not a new performance comparison.
