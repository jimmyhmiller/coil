# Closed returning loops in graph-call expansion

Standalone component aa66d7a permits LOOP_BEGIN/LOOP_END and cyclic PHIs in the independent bounded graph inliner. The existing two-phase clone reserves all references before patching edges. Every control operation must be live from the unique RETURN; separate non-returning regions, nested calls, frame operations and terminal side exits remain ineligible. Never and growth budgets are unchanged. Matching, placement and liveness still run after graph optimization.

The standalone module-execution suite passes with AddressSanitizer, comparing linked native execution before and after expansion with two loop-carried PHIs, zero/multiple trips, negative/positive inputs, Never/zero-budget fallback and rejection of a separate infinite control region. Restoring the previous implementation fails the new expansion-count assertion.

This addresses the loop eligibility prerequisite exposed by the AVec workload, not the whole runtime gap. The accessor also contains calls and its bounds checker has cold panic paths; those remain separate work. No source inline annotations or checks change.


## Matched AVec diagnostic

Same LLVM-built opaque runner object, 20 million calls, exact checksum 859763163008; one warmup excluded and five alternating process samples:

| Kernel | Median runtime |
|---|---:|
| Previous stogir 675c94ae | 0.13375887495931238 s |
| Closed-loop stogir 256d0dd7 | 0.11551758297719061 s |
| LLVM O3 | 0.04340908396989107 s |

The isolated loop component reduces runtime by **13.64%**, leaving a **2.66x** gap to LLVM. The accessor now absorbs the trie helper, while the outer kernel still calls the accessor because it retains a bounds-check CALL. New object size is 13,648 bytes versus 13,512 before. The single new kernel generation diagnostic is 0.008730 s; this is not full compiler acceptance. Raw samples and runner identity are in `closed-loop-inlining/avec-results.json`.

FAST passes **49/49 in 217.2 s**. The existing cli/objects memory warning is 1.67 GB. No frontend semantics were changed; this checkpoint does not rerun the full compiler acceptance workload.

The complete extended module-execution suite also passes when compiled by stogir O3. Official global installation completed for source 256d0dd7. Off-checkout module execution passes using installed imports; all 144 installed SDK modules match the tested standalone component.
