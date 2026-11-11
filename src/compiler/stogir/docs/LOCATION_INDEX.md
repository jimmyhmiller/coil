# Finalized per-value location index

Pinned dstogov/ir 92171d0a4a36b0acf707f2dea7998de615dd4acd stores intervals
by virtual value and links split children (`ir_ra.c:ir_split_interval_at`,
`ctx->live_intervals`, `child->next`). This implementation builds an owned CSR
index of finalized parts by semantic parent after allocation and validation.
It preserves original part/child order and excludes negative reservations from
the value buckets. Negative reservation queries retain generic linear semantics.

Lifetime range queries still detect overlaps and holes, and retain identical
missing-location errors. Indexed contiguous transfer construction preserves the
complete ordered transfer sequence. CFG ordinary/Phi reconciliation uses the
index; other emission queries remain linear. The compatibility APIs delegate to
the same worker with linear queries. Parts, assignments and graph semantics are
unchanged. The index is released with Assigned; mutation requires rebuilding it.

Focused ASAN oracle passes 31752 queries across registers, spills, missing
assignments, holes, overlaps, sparse parents, empty/reservation-only state and
invalid parent bounds. Contiguous transfers match the original oracle in order.
Native ASAN stencil, switch pressure, Phi, edge moves and allocation integration
pass. Rotated diagnostic medians over five processes, each compiling 2000 images:
2324.674ms before and 2121.446ms after (8.74% lower). This captured graph
is diagnostic only, not the actual Coil acceptance boundary. Full validation passes
236 standalone programs and 72 linked AOT consumers. All 5406 generated AOT
objects are byte-identical to library 0fc663a. Actual compiler integration and
measurements remain required.

## Compiler performance checkpoint

Coil executable f9f0b602, delivered in report a9b15305, confirms the agreed
fixed-workload target. On native-stencil (200000 passes, seed 12345), LLVM O3
IR-to-object/runtime medians are 26.120/359.693ms; stogir 4.859/380.500ms;
TPDE 0.132/3994.737ms. The confirming ratios are 5.3756x faster codegen and
1.05785x runtime. An independent first run meets both median thresholds.
The confirming full sample ranges also satisfy both thresholds: >=5.2407x
codegen and <=1.09442x runtime. Normal OS background activity is recorded;
a repeat under severe external Node saturation is retained and rejected.

FAST 49/49, official global install, off-checkout AOT/SDK checks and all 133
module byte comparisons pass. Benchmark objects for all three backends are
unchanged. Whole CLI speed and other workloads are not covered by the 5x claim.
Exact raw data and qualification are in Coil docs/benchmarks/STOGIR_LOCATION_INDEX.md.
The historical baseline is unchanged. Upstream parity gaps remain documented.
