# Native tail calls and late CALL/RETURN selection

Standalone `c1b1e3f` and `40bc9d5`, integrated in Coil `a162bbc0`, follow pinned
upstream `ir.c:_ir_TAILCALL_N`, `ir_emit.c:ir_try_tailcall` and the AArch64 tail
emitter. Ordinary graphs remain CALL/RETURN through module inlining; persistent
machine selection absorbs a sole matching RETURN before liveness. Declared ABI,
observed roots, copied/stack arguments and frame-address lifetimes govern
eligibility. Direct jumps use BRANCH26 relocation; indirect targets survive
argument installation and frame restoration.

The reduced million-call countdown now prints `1000000`. The previously failing
`control_collections` O3 corpus completes with `0 failures`, including million-call
accumulation and swapped arguments. ASAN/debug standalone checks cover explicit
and automatic direct/indirect recursion at O1/O2/O3, prefix calls, GP/FP arguments,
stack fallback, GP-pair/HFA/x8 result forwarding, observed roots and private frame
escapes. A linked AOT self-recursion test completes a million steps.

Eight rotating generation and process CPU samples, excluded warmups, caches off,
identical opaque LLVM runner. Baseline binary `043f7801`; current `a162bbc0`.
Both compile exactly the same workload and library source. LLVM uses O3.

| Workload / metric | Before stogir | Current stogir | LLVM O3 | TPDE |
|---|---:|---:|---:|---:|
| Iterator generation ms | 1.1785 | 1.1810 | 15.8660 | 0.0665 |
| Iterator CPU ms | 19.9225 | 20.0255 | 9.8300 | 54.9255 |
| Verifier generation ms | 111.7170 | 111.3680 | 369.8510 | 1.4250 |
| Verifier CPU ms | 42.2365 | 42.2835 | 10.0465 | 78.4165 |

No runtime or generation improvement is established. Before/current objects are
identical in both kernels: 1436 and 102276 bytes respectively. These kernels do
not exercise an eligible tail-call change. Background system tasks were present;
raw data includes host load and process-name snapshots outside timing intervals.
No full bootstrap measurement was run for this correctness change. The compiler
5x generation / within 10% runtime target remains unmet.

Raw [iterator](results/native-tailcalls/iterator.json) and
[verifier](results/native-tailcalls/verifier.json) samples.
