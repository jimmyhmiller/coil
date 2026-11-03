# Nested ordinary calls in bounded graph expansion

Standalone component 5539039 permits direct named CALLs carrying ordinary typed prototypes inside inline bodies. The existing mapper re-interns function names and prototypes and preserves control/data edges. Indirect PROTO nodes, variadic calls and aggregate-result call adapters remain excluded. The standalone native before/after suite passes ASAN and when compiled by stogir O3, including calls inside two-PHI loops, policy/budget fallbacks and indirect/variadic retention. Restoring the preceding implementation fails the new assertion.

The compiler provider uses linear Kahn elimination of actual direct CALL edges among registered templates. Only definitions with acyclic registered-call closures may be cloned. Cycle members and their callers remain callable and may absorb acyclic helpers themselves; this intentionally conservative policy avoids recursive template unrolling. Function-address imports are not call edges. Never definitions remain excluded by the existing source policy.

After expansion, the module worklist records newly introduced import dependencies and revisits newly cloned calls. The existing 512-cell total growth budget remains in force: positive growth consumes budget, while zero-growth expansion cannot add a CALL and removes one. All structural analyses still run after graph optimization, and provider work stays in backend timing.

The existing stogir-register-results CLI fixture now covers wrapper chains retaining a Never call, calls inside a loop, self recursion, mutual recursion and a caller of a recursive function that remain callable. The candidate builds and the fixture passes under LLVM, TPDE and stogir, including preservation of its observable infinite arm. FAST passes 49/49 in 221.9 s (the existing objects memory warning is 1.60 GB). Official global installation completed for source f3a88fae. Off-checkout module execution passes and all 144 installed SDK modules match the standalone component.


## Matched AVec diagnostic

One excluded warmup and five alternating process samples use the identical opaque LLVM-built runner and checksum 859763163008:

| Kernel | Median runtime |
|---|---:|
| Loop-only stogir 256d0dd7 | 0.11802000005263835 s |
| Nested-call stogir f3a88fae | 0.10638170898891985 s |
| LLVM O3 | 0.04391591600142419 s |

Nested-call support reduces runtime by **9.86%**, leaving a **2.42x** LLVM gap. New object size is 14,372 bytes versus 13,648 for loop-only. The new single kernel generation diagnostic is 0.009556 s. These measurements do not establish the full compiler goal. Raw samples and runner identity are in `nested-call-inlining/avec-results.json`.

The backend fixture also confirms the conservative policy for self recursion, mutual recursion and callers of recursive definitions through explicit template-policy traces. All three backends return 42 and preserve the infinite arm.
