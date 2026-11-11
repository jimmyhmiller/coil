# Bulk memory construction

`stogir.bulk` expands copy, move and zero operations into the existing scalar and
control IR. The resulting graphs compile through the same JIT and AOT paths as
other library graphs. No native bulk-memory runtime routine is required.

| Builder | Inputs after the mutable graph | Result |
| --- | --- | --- |
| `copy!` | control, destination, source, count | final control reference |
| `move!` | control, destination, source, count | final control reference |
| `zero!` | control, destination, count | final control reference |
| `copy-bytes!` | control, destination, source, fixed size | final control reference |
| `move-bytes!` | control, destination, source, fixed size | final control reference |
| `zero-bytes!` | control, destination, fixed size | final control reference |

All builders return `Result i32 (slice u8)`. Thread the returned control reference
into the next effect or terminal. Addresses are ADDR value references, rather
than VAR storage identities. Use VADDR when addressing a scalar or vector local. Control
must be an existing open control chain.

Runtime counts are U64 value references. Fixed sizes are nonnegative i64 byte
counts. Source and destination must denote accessible normal-memory ranges of
that size. Copy requires disjoint ranges or identical pointers; move allows
overlap. Zero bytes does not access either address. The builders validate input
shape and types before appending instructions. As with the append-oriented graph
builder, a resource-exhaustion error during expansion requires discarding the
unfinished graph.

Small fixed operations through 64 bytes use exact eight-, four-, two- and
one-byte accesses. Small moves read the entire source before the first store.
Larger and dynamic operations use bounded loop graphs: eight-byte transfers and
an exact byte tail. Moves traverse forward when the destination address is lower
and backward otherwise. Counts and address ordering use explicitly unsigned IR
predicates. Unaligned normal-memory addresses are supported; no access extends
outside the requested range. These builders do not provide atomic or volatile
bulk-memory semantics.

The 64-byte inline boundary controls graph size. Its performance has not yet
been benchmarked against LLVM or TPDE.

`tests/bulk.coil` checks construction, rejection, no-ops and bounded graph size.
`tests/jit-bulk.coil` compares complete buffers and protected-page boundaries for
fixed and dynamic counts, overlap and alignment variations, and emits AOT
fixtures. `tests/aot-bulk-link.coil` executes linked fixed/dynamic fixtures.
`tests/jit-bulk-pressure.coil` exercises forty live integer values, clobbering
calls, dynamic stack buffers, overlapping moves and over-aligned frames.
