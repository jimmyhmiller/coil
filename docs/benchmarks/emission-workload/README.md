# Actual backend emission reduction

This diagnostic calls `coil.compiler.codegen_stogir.compile!` on opaque,
caller-owned CIR. Both implementations run the Stogir O3 pipeline. The comparison
is how LLVM O3 versus Stogir O3 compiles that implementation, not LLVM versus
Stogir as the target of the inner compilation.

Three linear CIR functions contain 32/128/512 dependent mixed add/xor/multiply/
subtract operations on two runtime parameters. The caller constructs CIR once,
then emits each function 65 times into fresh assemblers. The first emission is
JIT executed for 25 edge input pairs per size against an independent unsigned
arithmetic oracle. Every later emission must have the same nonzero size. Both
hosts produce text sizes132/516/2052 bytes. Equal bytes have not been asserted.

Kernel objects: same source/SDK and compiler6cff505d, O3/no-debug, serial,
library-state off. Common opaque caller: LLVM O3 compilerb27ffeb4. Source SDK
a8780a1322927a71143152a4f52becb9197455e06c58935f8424e401fa699b26.
Results include common caller construction, assembler allocation, JIT mapping
and oracle overhead. Eight alternating child CPU/wall samples after excluded
warmups, no task builds overlap. Raw samples and SHA256 identities:results.json.

| Host compilation | Median CPU | Median wall | Kernel object |
|---|---:|---:|---:|
| LLVM O3 |45.1885 ms|46.7562 ms|1,576,120 bytes|
| Stogir O3 |102.3185 ms|104.0374 ms|2,755,192 bytes|

Stogir host CPU is2.2643× LLVM. This reproduces a broad backend runtime gap;
it is not a bootstrap acceptance measurement or an optimization benefit.

Sampling is separate from timing: runner loop enlarged from65 to8193 emissions,
compiled with the same LLVM caller compiler; `/usr/bin/sample PID 3 1 -file PATH`
for each host, then wait for that same process to finish successfully. Raw
profiles are gzip archives here. Loader/startup samples must be excluded from
interpretation. Stogir visible leaves include allocation.free-decision-at-
boundaries134 samples, verify.structure100, integer verification89, Graph
borrow-node54 and operand53. LLVM absorbs helper names into callers, including
allocation.grant-free-at-boundaries!, so leaf counts are not comparable costs.
Next investigation should compare the inclusive allocation path and its machine
code, rather than conclude a helper is slow because LLVM inlined its name.

Reproduce from this Coil worktree with frozen SDK:

```
COIL_LIBRARY_STATE=0 COIL_TPDE_SERIAL=1 CANDIDATE emit-obj docs/benchmarks/emission-workload/kernel.coil --backend llvm -O3 --no-debug -o /tmp/emission-kernel-llvm.o
COIL_LIBRARY_STATE=0 COIL_TPDE_SERIAL=1 CANDIDATE emit-obj docs/benchmarks/emission-workload/kernel.coil --backend stogir -O3 --no-debug -o /tmp/emission-kernel-stogir.o
COIL_LIBRARY_STATE=0 CALLER_COMPILER emit-obj docs/benchmarks/emission-workload/runner.coil --backend llvm -O3 --no-debug -o /tmp/emission-runner.o
cc /tmp/emission-runner.o /tmp/emission-kernel-llvm.o -lm -o /tmp/emission-llvm
cc /tmp/emission-runner.o /tmp/emission-kernel-stogir.o -lm -o /tmp/emission-stogir
```

This worktree still has the earlier return-hints library, not c804e37. No claim
about the latest canonical-return change is made by these measurements.
