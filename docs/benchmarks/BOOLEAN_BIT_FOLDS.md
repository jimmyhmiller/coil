# Boolean choices, current graph values and tested bits

Compiler source **fac9b96e**, fixture **a5deb890**, standalone **0fb729a**. The full compiler diagnostic below is **51433773**, before tested-bit reconstruction; it is not a measurement of the final compiler binary.

Pinned `ir_fold.h` supplies NOT(integer comparison) inversion and Boolean COND canonicalization. Exact EQ/NE projection of wider opposite 0/1 choices and tested-bit reconstruction are documented independent extensions. All use the affected worklist before matching/allocation, preserve shared/observed values and exact uses, and allocate no new graph cells. Float comparisons retain their NaN behavior.

Iterative scalar folding now uses an explicit current-graph view instead of allocating and initializing a synthetic all-Bottom SCCP domain. Real SCCP retains its actual lattice-aware public path. This removes graph-sized temporary state, not an analysis that the iterative folder needs.

## Validation and delivery

The native suite adds 2,430 Boolean restart/projection cases and 10,024 tested-bit cases alongside the existing 10,401 mask/conversion graphs. Raw/revised native answers cover byte inputs, wider boundaries, NaNs, wrong polarities, zero/multi-bit masks, both AND sides, width changes and shared/rooted values. Exact uses match independent rebuilds, graphs validate, affected reapplication is idempotent and disabled rules fail the new assertions. ASAN and candidate stogir-built module/control/fold/decision/saved-register tests pass. The existing three-backend CLI fixture now combines reconstructed bits with negative byte effects.

Current-view decisions match every result word against an independently created all-Bottom domain for every foldable node of the mask matrix at 4/8-byte target pointer widths. Small opcode/DAG objects and the entire compiler stogir object are byte-identical across before/after view drivers.

Installed globally and verified outside the checkout. FAST **49/49 in 254.3 seconds** (object-step peak warning: 1.64 GB). Installed toolchain digest, AVec and all **145 stogir modules** match; all **422 compiler/stdlib files** match the final stamped source. Off-checkout LLVM/TPDE/stogir fixtures exit 42 with exact bounds diagnostics, and installed stogir-built module, bitwise, control, iterative-fold, SCCP-fold, decision and saved-register suites pass.

## Same small workload

Unchanged opcode-properties source, 10,000,000 rounds, checksum 9979482367440117777. Source SHA256: `0393b0c9df47004a76c6825c43382aee448966f4f200c04e5372d43b2197c8fb`. Upstream-only rules left 109 kernel instructions; wide-choice projection reduced that to 85; tested-bit reconstruction reduces it to 58. Ordinary-build LLVM has 24 and TPDE has 83.

Four alternating measured emit-obj samples after a warmup; caches disabled and serial codegen:

| Driver/backend | IR-to-machine code (ms) | Whole emission (ms) |
|---|---:|---:|
| previous-stogir | 8.140000 | 547.175792046 |
| current-stogir | 8.251000 | 562.297395954 |
| llvm | 41.252500 | 573.131937534 |
| tpde | 0.270000 | 549.047208508 |

Nine alternating process-runtime samples after a warmup, using ordinary coil build executables:

| Driver/backend | Wall median (ms) | CPU median (ms) | Kernel instructions |
|---|---:|---:|---:|
| before-stogir | 113.129667006 | 88.596000 | 85 |
| after-stogir | 95.581208006 | 71.620000 | 58 |
| reference-llvm | 63.924833084 | 38.875000 | 24 |
| reference-tpde | 374.573207926 | 325.556000 | 83 |

CPU is child user+system from serial getrusage deltas; wall includes launch/scheduling. External CPU load was observed. The tested-bit component improves CPU time about 19%, but remains about 1.84× LLVM CPU time here. These are diagnostics, not full compiler runtime acceptance.

LLVM uses plural objects for ordinary build and one module for emit-obj. The single-module kernel has 36 instructions, while the runtime table uses the stronger ordinary-build 24-instruction reference. Compile and runtime rows describe their stated command paths, not one identical LLVM artifact. Both raw distributions are retained; CPU time does not replace wall-time acceptance.

## Full compiler diagnostic before tested-bit reconstruction

Same source 51433773, caches disabled, serial, O3 and complete nonoverlapping codegen spans. Candidate build defaults were verified to be O3. Each row is a single diagnostic sample, not repeated acceptance.

| Host | Target | IR-to-code (s) | Whole emission (s) | Process CPU (s) |
|---|---|---:|---:|---:|
| llvm-host-before | stogir | 13.524759 | 22.962267709 | 21.402640 |
| llvm-host | stogir | 10.202606 | 18.094455584 | 17.906079 |
| llvm-host | llvm | 50.461494 | 59.187024625 | 49.118304 |
| stogir-host | stogir | 33.630173 | 56.352535875 | 56.095641 |
| stogir-host | llvm | 34.321251 | 56.409785042 | 55.918724 |

Before/after-view compiler objects match: 13,123,220 bytes, SHA256 `8135824fcca3721364a2f75f5a1f7f50f5e8ff736cdc8fa5a3dea7469d191590`. Single-sample generation falls 13.524759→10.202606 seconds. The first LLVM-host LLVM emission is unusually slow relative to the later native-host sample, so the roughly 4.95× ratio is not verified 5× acceptance.

The stogir-built compiler self-rebuilds both targets correctly, with exact target-object equality across hosts. On the same stogir-target task it takes 56.352536 seconds versus 18.094456 seconds for the LLVM-built host: about 3.11× slower, far outside 10%. Its binary was linked from the measured object with the normal driver's bundled HTTP/framework/zlib inputs and passed version/check/run smokes.

The full bootstrap objective remains unmet. No post-tested-bit full compiler runtime claim is made. Full logs/objects remain in the current-view worktree build directory.

## Next gaps

The kernel still repeats table addresses/loads and rebuilds large invariant constants in the loop. Pinned ir_sccp.c performs aliasing-load forwarding from the iterative optimizer after control simplification; our forwarding runs before that simplification. Confirm actual address identities and root/control preservation before adding affected-worklist forwarding, rather than rerunning the whole pass.

Attribution stays centralized in LICENSE, NOTICE and provenance. [Raw samples and kernel disassemblies](boolean-bit-folds/) retain the command-path and timing distinctions.
