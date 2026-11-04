# Share exact uses through immutable preparation

`pipeline.prepare` now builds one exact `uses.Uses` after graph validation and CFG
construction. It lends that index to early placement, late placement and local
scheduling, then releases it before either success or error return. Those stages
only mutate their placement/work/schedule facts; the graph does not change.

Existing `placement.early!`, `placement.late!` and `schedule.order` keep their
owning behavior. Their new `early-with-uses!`, `late-with-uses!` and
`order-with-uses` counterparts borrow an exact index for the same verified graph
version. All original CFG/dominator/placement/live-mask prerequisites still apply.
Callers retain ownership and must rebuild after any graph mutation. Returned
arrays and schedules do not retain the borrowed storage. No validation, ordering,
Phi-edge treatment or allocation policy was removed or changed.

This follows pinned upstream92171d0's compilation-context use-list lifetime:
`ir_ctx.use_lists` is retained across the scheduling consumers, rather than
rebuilding the same facts at each call. It does not reuse facts across SCCP,
vectorization or other graph-editing boundaries.

The existing branch-placement suite compares fresh and shared indexes through
all three stages, checks exact mappings/order, rebuilds after a graph edit,
compares dependency-cycle errors, and exercises pipeline error cleanup. Original
expected placement/liveness/range checks remain. ASAN/debug placement,
branch-placement and SCCP pipeline checks pass. Native loop, switch/FP-loop and module-execution checks also pass under
ASAN/debug checks, as does the linked SCCP pipeline AOT consumer.

## Opaque preparation reduction

The existing opaque caller constructs a2307-node linear SSA graph and checks the
complete scheduled-reference sum and malformed input behavior.32 prepares per
process;32 alternating process-CPU samples after warmup. Fixed LLVM-built
Coil55649d17, O3/no-debug, serial, library state off, same source fixture and
checked caller for each backend. Before is0db3867; after changes only placement,
schedule and pipeline modules. All six objects were rebuilt for the repeat and
match first-run hashes. Repeat data records the three changed source hashes.

|Backend|Before ms|After ms|Repeat before ms|Repeat after ms|
|---|---:|---:|---:|---:|
|stogir|33.9960|29.8145|33.7960|29.6120|
|LLVM O3|12.6795|10.8410|12.3980|10.7235|
|TPDE|113.5895|94.0455|113.4230|93.4420|

Stogir improves12.30%/12.38%, LLVM14.50%/13.51%, TPDE17.21%/17.62%.
This removes duplicate work; the stogir/LLVM runtime gap on this reduction is
still about2.76×. No full compiler speedup is inferred. The5× generation and
within10% runtime acceptance goal remains unmet.

[Raw samples, hashes, host evidence and driver](validation/immutable-use-index).
