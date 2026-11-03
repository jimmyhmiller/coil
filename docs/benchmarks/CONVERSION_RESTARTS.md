# Iterative conversion restart checkpoint

Standalone component accd7d7 ports pinned upstream nested integer conversion and
bitcast restart rules into iterative cleanup after module expansion/SSA rewrites.
Some pairs were already handled during construction; newly exposed pairs need
this later worklist stage. BOOL/non-bitcast floating boundaries remain guarded;
logical shifts use the effective masked count.

The existing JIT iterative-fold suite passes LLVM AddressSanitizer and stogir-built
execution. It verifies actual rule/guard activity, maintained exact use lists,
typed protected roots, two pointer widths, raw floating/NaN bits and signed/high
bits. Native execution uses the implemented64-bit target;32-bit cases verify
rewritten graph/type policy. All three compiler backend fixtures return42, and
the candidate's stogir backend compiles and runs the conversion suite itself.

## Same dependent arity kernel

Exact source: coil-stogir/benchmarks/opcode-arities.coil, SHA-256
09a96cfa15734ea418275b5d19bdbfcc230f1c84c23fd4c9c3ca80610812f5ee.
Ten million dependent iterations; checksum3491339289029632593 in all cases.
One excluded warmup and five alternating measured process runs:

| Backend | Median runtime seconds | Kernel instructions |
|---|---:|---:|
| Delivered cbc3dc27 stogir O3 |0.0758156250230968|89|
| Conversion restarts, stogir O3 |0.05512558401096612|73|
| LLVM O3 |0.03316475008614361|27|

This kernel uses27.3% less runtime and remains1.66× LLVM. It is not bootstrap
acceptance. Raw samples are adjacent. Compile samples are single diagnostics;
LLVM's build emitted no timing records, so its generation time is unmeasured,
not zero. Full compiler validation and global delivery follow this small check.
