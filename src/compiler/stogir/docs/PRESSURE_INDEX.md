# Indexed fixed constraints during pressure queries

Diagnostic sampling of repeated public O3 compilation identified allocation
pressure scans and constraint-use iteration as prominent leaf costs. The solver
now maintains a conservative index of parts with fixed-register uses. This
changes discovery cost, not allocation policy or the pressure decision.

Existing part indices stay stable during allocation. Splitting truncates the
prefix uses and appends a child; reservations are appended. Before each ordinary
or post-eviction pressure query, the index scans only newly appended parts. A
prefix that loses its last fixed use may remain indexed. Queries read current
use lists, so moved constraints and live-range holes retain exact behavior.
No fixed-use position is cached. The index assumes existing parts cannot acquire
new fixed uses except through the solver's append/split protocol; arbitrary
external use-list mutation requires rebuilding the index. The legacy public
pressure query remains unchanged as an independent oracle.

The indexed query still computes interference against assigned parts. It avoids
asking for a next use when the ranges do not intersect. It preserves free-until,
owner next-use and fixed-at arrays, class masks and all decisions using them.
Index allocation and refresh remain inside IR-to-machine-code generation.

Focused validation passes with AddressSanitizer:

- 256 configurations cover register counts 1/4/16/64, no/sparse/dense fixed uses,
  holes, assigned owners, split prefixes/children and later reservations.
- 41,216 pressure queries compare 875,840 register entries / 2,627,520 fields with
  the original query. Repeated refresh does not duplicate indexed parts.
- Allocation, mixed-spill allocation, scalar/call/switch/floating pressure and
  captured stencil programs pass.
- The captured stencil's public O3 object is byte-identical to the address-fusion
  baseline: 2053 bytes, SHA-256
  dcf4143d6dd61bd7b93481dd99febbaf29a911b3aa2de95a8d355da20a1c911c.

Development used .worktrees/pressure-index; this source is now merged to main. Full compatibility validation passes all 234 standalone programs and all 71
linked AOT consumers with frozen source/toolchain and fresh-object checks. It is not yet vendored or installed in Coil, and
no production compile-time or runtime improvement is claimed yet.


## Sparse initial allocation records

The AArch64 allocator now omits initial parts with neither ranges nor uses.
Parts with constraints remain even if their ranges are empty. Spill geometry
continues to be indexed by graph reference; each retained part keeps that
explicit parent reference. Instruction positions, register masks, frame geometry,
physical reservations and relative ordering of retained parts remain unchanged.
Empty records were never queued or capable of covering a location. Removing them
reduces allocation, pressure and location-lookup work without changing decisions.

Focused ASAN pressure, mixed-spill, call/switch/floating and stencil checks pass.
The captured O3 object remains byte-identical (2053 bytes, same hash above).
The combined full compatibility run is required before this additional change
is delivered. The previous 234/71 broad result covers pressure indexing alone.


Combined validation with sparse records and vector doubling now passes all
235 standalone programs and 72 linked AOT consumers. Object identity checks
above isolate allocator changes; vector doubling intentionally changes code.
See validation/tuned-backend-suite.json. Production measurements follow.
