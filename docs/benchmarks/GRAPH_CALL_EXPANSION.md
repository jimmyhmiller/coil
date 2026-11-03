# Bounded graph-call expansion checkpoint

Standalone component: `29f501b`, merged locally in coil-stogir main `0341f59`.
Compiler integration: `feature/stogir-module-inlining`, macOS AArch64.
This is an independent module-level extension beyond pinned dstogov/ir, not a
source annotation change or an upstream module-inliner port.

## Fixed small workload

`coil-stogir/benchmarks/opcode-arities.coil` runs ten million dependent metadata
queries. Each iteration feeds input-count and operand-slot facts into the next
LCG state; all binaries return checksum `3491339289029632593`. Its observer is
Never, while helpers retain their original policies. Source SHA-256: `09a96cfa15734ea418275b5d19bdbfcc230f1c84c23fd4c9c3ca80610812f5ee`.

One excluded warmup and five alternating measured process executions, on an
otherwise idle Mac (no build/test process running during measurements):

| Compiler/backend | Median runtime, seconds |
|---|---:|
| Delivered stogir O3 before module inlining | 0.10069904197007418 |
| Module graph inliner, stogir O3 | 0.07638037507422268 |
| LLVM O3 | 0.0337843750603497 |

The new kernel uses 24.1% less runtime than the delivered backend here and
still 2.26 times LLVM's runtime. The outer queries and their scalar helpers now
expand into the loop; the generated loop has no direct calls. Assembly retains
redundant bounds checks and integer-normalization instructions that LLVM removes.
This is a diagnostic kernel, not evidence that the bootstrap goal is met.
The earlier straight-line/acyclic/signedness intermediate samples are retained
alongside the final raw samples to explain the measured boundary.

## Pipeline and accounting

Only stogir O3 collects CIR. Lowering and reachability remain in their existing
source submission order. The module prepares bounded graph templates, uses a
deduplicating dependency worklist to expand known leaf definitions into wrappers,
then freezes the symbol-indexed registry before emitting jobs in submission order.
Cycles retain calls. Never definitions are excluded. Each definition/caller has
a 512-cell total growth budget. Graph expansion runs before SCCP, matching,
placement and allocation; JIT/AOT continue to share the native image pipeline.

The graph library checks prototypes, explicit control, SSA parameters, PHI order
and closed acyclic single-return graphs. Same-width integer signedness changes
get BITCASTs; flags, result and ABI grouping still match. Named address constants
re-intern names/prototypes, and the compiler supplies explicit frozen relocation
bindings. Private strings, aggregate results, loops, nested calls and unsupported
frame operations stay calls. Templates can become eligible when their own leaf
calls are expanded during module preparation.

Per-function scratch arenas release adapter/optimizer temporaries; only owned
bounded graph/metadata copies enter the module allocator. Module preparation,
adaptation, expansion and machine-code generation are all charged to codegen.
**Older stogir timing checkpoints omitted adapter work.** Compare new full timing
samples under this scope explicitly; do not silently reuse the older generation
ratio as an equivalent new measurement.

## Validation and delivery

Standalone linked execution passed under LLVM AddressSanitizer and stogir O3:
integer/FP arithmetic, signed zero, memory effects, grouped integer/FP arguments,
branches/PHIs, dependent calls, total budgets, duplicate-site rejection, high-bit
u32/i32 arguments, immutable inputs, named global loads, function pointer identity
and execution, prototype remapping, and byte-identical unsupported fallbacks.

The extended `tests/cli/native-backends.coil` passes LLVM, TPDE and stogir O3,
returning42. FAST passed49/49 in210.6 seconds; the existing objects step warned
at1.70GB. Global installation and full compiler measurements are tracked at
the next delivery checkpoint; no new full-bootstrap performance claim yet.
