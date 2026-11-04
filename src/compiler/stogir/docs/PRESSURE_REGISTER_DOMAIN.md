# Empty register buckets in pressure queries

Physical reservations and fixed uses already have immutable per-register event
boundaries. `has-register?` answers whether that bucket is nonempty, with false
for empty/uninitialized indexes and out-of-domain registers. Allocation checks
this before iterating the current interval's ranges. Empty buckets have no hit
and no owner-path compression to perform. Nonempty buckets retain the existing
intersection, self exclusion, deactivation and split-ownership queries.

No index layout, allocation order, pressure result or mutation policy changes.
Pinned upstream 92171d0 ir_ra.c still supplies the active/inactive linear-scan
policy (notably the inactive intersection walks around lines3220 and3589).
This is a local traversal optimization in our indexes, not an upstream port.

The existing pressure oracle now also runs a single populated register against
banks of1/4/16/64 registers, with multiple ranges, repeated monotone queries,
noncanonical assigned parts and holes. It checks all output registers against
the independent pressure implementation. Empty indexes, sparse buckets and
negative/maximum-i32/out-of-bank queries have explicit assertions. Existing
split/deactivation mutation cases remain. ASAN/debug checks pass for
pressure-index, allocation, jit-pressure, jit-call-pressure, jit-switch-pressure,
jit-floating-pressure, jit-bulk-pressure and jit-checked-pressure.

The existing allocator benchmark now accepts `--sparse` (64 registers, one
populated) and `--fragmented` (16 disjoint ranges per interval). All variants
assert an independently calculated checksum. Measurements include construction,
queries and teardown, not just the query loop. Fixed LLVM-built Coil55649d17,
O3/no-debug, serial, library state off; identical benchmark source in before and
after project contexts, 16 rotating native process-CPU samples after warmup.

|Backend|Case|Before ms|After ms|Repeat before ms|Repeat after ms|
|---|---|---:|---:|---:|---:|
|stogir|dense|19.5505|19.4265|19.8090|20.1435|
|stogir|sparse/fragmented|33.0500|30.4085|33.4560|30.9710|
|LLVM O3|dense|13.5705|13.5795|13.6255|13.7495|
|LLVM O3|sparse/fragmented|20.8995|18.7930|21.0615|18.7280|
|TPDE|dense|58.2005|58.6080|58.3370|58.9300|
|TPDE|sparse/fragmented|115.4310|97.5605|115.8140|97.6420|

Stogir sparse-case gain repeats at7.99% and7.43%. Dense case ranges from0.63%
faster to1.69% slower; added per-register checks can cost something when every
bucket is populated. This is a small diagnostic, not full compiler acceptance.
The5× code generation / within10% runtime goal remains unmet.

Raw samples, driver and compiler/source hashes: [validation](validation/pressure-register-domain).
