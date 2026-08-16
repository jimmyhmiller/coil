# Allocation tracing

Coil's allocation tracer separates three questions that are easy to conflate:

1. Which typed operation requested memory, and where?
2. Which allocator served that request?
3. Which arena or backing allocator still physically owns memory at a snapshot?

The first is semantic attribution. The last is ownership. A bump arena may serve
millions of semantic requests from a few backing segments, so neither number is
a substitute for the other.

## Observer API

`coil.alloc` provides an optional process-wide `AllocationObserver`. It receives
successful `raw-alloc`, `raw-resize`, and `raw-free` events, including operations
served by custom allocators. It does not replace an allocator or change ownership.
When no observer is installed, allocation takes one disabled branch.

Observers must not allocate through the observed API from inside a callback.

`coil.alloc_trace` is the reusable fixed-metadata observer. It records cumulative
requested bytes and operation counts by type and source site. Its site table and
thread contexts are statically allocated so observation cannot recursively allocate.

```coil
(import "coil.alloc_trace" :as trace)

(trace/allocation-trace-init!)
;; run work
(trace/allocation-trace-snapshot! "after-load")
(trace/allocation-trace-close!)
```

Snapshots are TSV on stderr:

```text
bytes  allocations  resizes  freed  type  file  line  col
8      1            0        0      [i64] app.coil 12    17
```

`freed` is attributed to the site active at the free operation, which may differ
from the allocation site. The report is cumulative logical traffic, not a claim
that `bytes - freed` equals physical live memory for monotonic arenas.

## Metaprogram instrumentation

Load `coil.alloc_trace.instrument` as a whole-program transform:

```text
coil run app.coil --use coil.alloc_trace.instrument
```

It wraps `create`, `alloc-slice`, `raw-alloc`, and `raw-resize` with a nest-safe
site scope. Higher-level collection calls are deliberately not wrapped: they may
not allocate, and attributing their nested allocation is better done at the typed
constructor than by multiplying the checked program with wrapper expressions.
The scope records:

- the type argument or operation name;
- `code-file`;
- `code-line`;
- `code-col`.

Only source-backed forms are instrumented by default. Bundled support code and the
tracer itself are left alone. Site context is maintained separately for each of up
to 64 participating threads; 4096 unique sites can be recorded without allocating.
Overflow is counted under the unattributed site.

The transform uses destructive Code editing. It walks linked list spines with
`code-car`, `code-cdr`, and `code-set-car!`, edits vectors with `code-set-nth!`,
and explicitly transfers the consumed program with `code-consume!` after inserting
the required `do` with `code-prepend!`. Only actual replacement wrappers are constructed.

This distinction is material. The earlier indexed linked-list rewriter performed
10,396,226 host callbacks and allocated 981 MB of invocation scratch for a 209 KB
result. With the typed structural host ABI, the spine cursor performs 838 callbacks
and allocates about 3.4 MB for the same input. Compiler self-instrumentation
previously exceeded 40 GB RSS; the destructive linear implementation completes at
about 2.75 GB peak RSS on the measured host, with about 134 MB reserved by the
transform invocation rather than repeated whole-compiler rewrites.

## Arena ownership

Combine semantic reports with `ScratchArena` and `mtrace` snapshots. The allocation
trace answers which operations generated traffic. Arena telemetry answers which
owner retained backing segments and what closing that owner released. For a large
compiler run, both are needed to distinguish a genuinely large final `Code` graph
from temporary closure analysis, staging, or backend construction.
