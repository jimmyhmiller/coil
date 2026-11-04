# Private ABI capture lifetime checkpoint

Compiler executable source 85f6a274; standalone b5dcc4e, including immediate comparison selection cfb432c. Current changes are committed in worktrees; delivery gates and installation/push are pending. Current installed executable remains 67f02f1e. The 5× generation/within 10% generated-compiler runtime goal remains unmet.

## Reduced correctness defect

A million-iteration loop with two retained Pair-return calls per iteration passes on LLVM and TPDE, but old stogir exhausts its stack and exits -11. The independently discovered long-branch harness crashes during image mapping for the same reason: the byte iterator returns an Option aggregate, and the adapter reserves its 16-byte result object on every iteration. LLDB reaches the stack guard in SliceIter.next. Disassembly shows `SUB sp,sp,#16` immediately before its call in the loop.

The correction reserves a distinct private object for each static aggregate-result or wide arithmetic-helper site in the function entry allocation prefix. Buffers are reused across loop iterations; they are never shared between call sites. Calls and result loads retain their actual control order. Explicit CIR dynamic allocations remain at their declared execution points. No larger stack limit or allocator workaround is used.

The result inliner retains its exact extent, no escape/root observation, captured-after-call reads, and callee-write coverage proof. It accepts either an immediately preceding fresh capture or a verified original entry ALLOCA prefix. A decreasing-reference walk through numeric allocation sizes to START establishes entry availability. Control-source edges do not expose the address. Non-prefix nonadjacent objects retain the fallback. The semantic graph and genuine dynamic ALLOCA behavior remain the library contract; this is compiler-temporary construction policy in the CIR adapter.

The source regression is `tests/cli/stogir-capture-loop.coil`. It covers million-iteration Pair and four-double return loops plus signed/unsigned 128-bit division/remainder helper invariants. All three backends pass with the corrected candidate. The formerly crashing jit-branch suite passes through stogir O3. Native/ASAN module tests compare original/expanded execution for entry-prefix effects, another prefix allocation, and non-prefix fallback across integer/FP/vector result specifications. FAST now runs the capture loops for every native backend in its existing native ABI step.

## Same-source compiler diagnostic

All rows compile source 85f6a274. The previous backend is 67f02f1e. A before-native host is linked from the previous backend's object for this same current compiler program; it executes the same current backend algorithm as the new native host. Current native self-rebuilds reproduce both target objects byte-for-byte. The previous native host reproduces the current stogir object byte-for-byte. Exact hashes, sizes, source digest and complete nonoverlapping generation spans are in [compiler-results.json](capture-lifetime/compiler-results.json).

| Host | Target | IR-to-code s | Whole emit wall s | Process CPU s | Object bytes |
|---|---|---:|---:|---:|---:|
| llvm-host-before | stogir | 10.024119000000045 | 18.083274582982995 | 17.867406 | 12313000 |
| llvm-host | stogir | 10.514932000000003 | 18.39636941603385 | 18.023899999999998 | 12173000 |
| llvm-host | llvm | 32.097381999999996 | 39.41604570904747 | 39.335953 | 8392744 |
| stogir-host | stogir | 30.05477300000012 | 52.01308262499515 | 51.85870600000002 | 12173000 |
| stogir-host | llvm | 32.294835 | 53.599278041976504 | 53.47500900000001 | 8392744 |
| stogir-host-before | stogir | 30.41727200000026 | 51.55736395798158 | 51.448819 | 12173000 |

Stogir generation is 3.05× faster than LLVM O3, short of 5×. The stogir-generated compiler uses 2.88× LLVM-generated CPU time rebuilding through stogir and 1.36× through LLVM. Versus the same program compiled by the previous backend, runtime is essentially unchanged in these single serial diagnostics. Current backend generation is about 5% slower than the previous backend for this same source; object size falls about 1.1%. These diagnostics are not a performance acceptance result and do not establish a bootstrap speedup from the capture fix.

Immediate comparisons separately remove constant materializations but do not improve the checked AVec runtime; see [COMPARE_IMMEDIATE.md](COMPARE_IMMEDIATE.md), including repeated generation and CPU/wall samples. Correcting stack lifetime is required for valid native execution, independently of whether it improves these timings.

## Delivery

Full FAST, off-checkout installation checks, and delivery are pending. The bug remains open in coil-bugs/stogir-long-branch-harness-crash until the corrected toolchain is delivered.
