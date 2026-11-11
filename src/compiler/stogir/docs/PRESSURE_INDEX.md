# Allocation pressure query indexes

## Current fixed-event index development

The solver now builds a sorted per-register table of immutable fixed-use events
once after its initial reservations. Binary searches inspect only event
positions inside the current interval's ranges. A persistent split forest maps
each event to its exact current child; every free-allocation split, spill-prefix
split and eviction split updates that forest. Event-owner queries cache their
last leaf, and follow descendants when it splits again. No constraint is inferred
from range coverage: the generic API permits fixed uses outside live ranges.

This changes pressure discovery only. Free-until, next-use, fixed-at, class masks,
spill geometry, decisions and all allocator checks remain in force. The event-only compatibility query retains the previous assigned-range scan.
The current solver composes the assigned-value and reservation indexes below;
this is not a complete active/inactive allocator port and does not claim linear
whole-solver complexity. Construction,
sorting, ownership updates and queries stay inside IR-to-machine-code generation.

The old full scan and previous fixed-part index remain available as compatibility
entry points and differential oracles. The solver requires all initial fixed uses
to be present at construction; subsequent mutations only partition those uses.
Adding new constraints during allocation would require updating this event index.

Focused ASAN validation covers 64 seeded event/split configurations across1/4/16/64
registers, holes, negative-parent physical reservations, repeated prefix/child
splits and constraints outside their owners' ranges. All three pressure vectors
are compared with the full scan. A targeted sequence invokes each actual tracked
solver mutation, including eviction's nested spill split. Existing256 previous-index
configurations remain. Split allocation, scalar/call/floating/checked/switch pressure,
dynamic stack scopes and captured stencil checks pass. Both indexes are merged and integrated in Coil32c67fbd. See
`benchmarks/ASSIGNED_PRESSURE_COMPILER_CHECKPOINT.md` for full-source diagnostic
results; acceptance and installation are separate checks.

## Assigned values and immutable physical reservations

Canonical initially assigned negative-parent reservations have one range and one
fixed use at its start, matching their register. Successful spill paths cannot
mutate a negative-parent part. Other shapes stay in the general live collection.
A register/start index with a maximum-end segment tree finds overlaps without
scanning every future call or scanning behind a long incoming reservation.

Free-until and next-use are separate queries: a reservation can overlap the
current point while its only use is already past; later reservations can still
supply next-use. Exact self exclusion remains part-based. Assigned values expire
only at their final range end or after losing their register. Future holes and
preassigned values remain represented; split/evicted ranges are read afresh.
New assignments are deduplicated in that collection. Queries must advance
monotonically, with equal-position post-eviction queries supported. Fixed events
remain independent and are never expired using their owner's live ranges.

64 additional seeded monotonic query configurations cover1/4/16/64 registers,
long and nested reservations, holes, preassigned owners, noncanonical negative
parts and fixed uses outside ranges. All three vectors match the full scan,
including queries on reservations themselves and repeated same-position queries.
A mutation trace checks eviction, same-position re-query, reassignment, expiration
and surviving out-of-range fixed uses. Existing event/split and pressure oracles
remain. ASAN native pressure, realignment and stencil checks pass. Compiler
integration and full-source performance validation follow separately.

## Historical fixed-part index and validation

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
