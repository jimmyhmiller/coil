# Matching memory addresses

The AArch64 matcher follows pinned dstogov/ir
`92171d0a4a36b0acf707f2dea7998de615dd4acd`,
`ir_aarch64.dasc:ir_match_fuse_addr`. It selects a direct positive ADDR base plus
64-bit numeric constant as a load/store base and offset. The unchanged compact
graph remains the semantic IR. This is target matching, before virtual-register
liveness and allocation.

Allowed offsets are signed byte offsets -256 through 255, or nonnegative offsets
that are a multiple of the access size with an unsigned 12-bit scaled index.
Scaled encodings are preferred where both are legal. Integer accesses use sizes
1/2/4/8; floating/SIMD accesses use 4/8/16. Narrow signed loads preserve their
existing 32-bit sign-extension semantics. Atomics do not use this matching rule.

Each selected memory edge uses the original base in machine use metadata.
Constraints and emission consume the same selected base/offset. An address ADD
is omitted only after all its uses have been absorbed and only if it is not an
observable root. If an address escapes, is stored as a value, passes through
COPY/HARD COPY, or is also used by an access that cannot encode the offset, its
required definition remains. Shared addresses do not require all accesses to
have the same width. No alias assumptions or memory reordering are introduced.

The initial rule accepts constants on the right of ADD and a positive base on
the left. It does not absorb symbols, dynamic offsets, COPY nodes or address
expression chains. Unselected accesses retain ordinary address generation.

Focused validation passes on macOS AArch64:

- 95 unscaled encoding words match independent Apple clang 21.0.0 assembly, across
 signed/unsigned scalar and SIMD loads/stores and signed 9-bit offset boundaries.
 Invalid offsets, signed stores, and invalid type/width combinations reject.
- 700 native cases cover 14 scalar/signed/floating/vector types, 10 offsets and 5
 sharing/root/escape/COPY variants. Independent bytewise buffer comparisons
 include the entire destination red zone. Machine-plan assertions check selected
 bases, omitted definitions, offsets and redirected uses. ASAN passes.
- Captured stencil 60 checksum checks pass with ASAN.

The broad run passed all 233 standalone programs and all 71 linked AOT consumers,
with frozen source/toolchain inputs and fresh-object checks. Subsequent review
repaired the legacy wrapper's invalid-reference handling; the final source passes
three invalid-reference cases and the address matrix, stencil, scalar/floating
memory and encoder ASAN programs. See [validation/address-matching.json](validation/address-matching.json).

A diagnostic sample of 2000 repeated public O3 image compilations identified
allocation pressure scanning, constraint-use iteration and location lookup as
prominent leaf costs (270, 222 and 212 samples respectively). This captured-graph
profile has no original interner cache and is not a compile-time benchmark or
proof of phase percentages. It directs follow-up toward allocator/location
indexing; all mandatory work must remain inside the measured boundary.

These checks do not establish performance acceptance or compiler delivery. All
target matching work remains within the IR-to-machine-code timing boundary.
