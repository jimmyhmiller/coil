# Real verifier diamond and Phi audit

Coil d8dbc1b7, frozen SDK22ce79a82c9f79719b9e4e513d096458f0aa103db451856cbdb52bc4124f292c,
COIL_STOGIR_GRAPH=stogir.verify.integer-operations-target-structured with
COIL_TPDE_STATS=1, serial/cache-off, emits the small verify-control kernel.
No compiler-source instrumentation or whole compiler build needed.
Snapshot2686instruction cells; generator rebuilds constant index then ordinary
optimize-memory and native preparation/scheduling with library756b206.

Actual final schedule:187Phis,34two-input Phis with identical incoming refs.
These are live scheduled nodes, not an unfiltered dead graph count. Many merges
also have multiple Phis, blocking the current one-Phi diamond matcher as well
as upstream's corresponding narrow matcher. No performance or semantic
transformation claim from this audit.

The port's boolean-diamond.candidate accepts only two integer literals;
pinned ir_sccp.c2940–3020supports available value arms too. Porting availability
requires control/dependency proof because Coil preallocates headers. Do not
copy upstream's numeric reference-order check blindly. All guard, effect,
RLOAD/OVERFLOW and root observations must be preserved.

Cheaper concrete prerequisite: remove Phis made identical by cleanup after the
SCCP lattice analysis. Existing iterative fold explicitly skips PHI. Upstream's
ir_iter_opt also explicitly skips PHI (ir_sccp.c4034), so adding identity cleanup
there would be an INDEPENDENT extension, not an upstream iterative-Phi port.
Use existing exact user rewrite/worklist/root preservation; no new CFG scan.
All-self cycles decline; ignoring only exact self edges with one shared
nonself incoming value requires native loop and protected-root tests. Removing
such Phis may expose simpler merges, but no resulting branch/speedup claim yet.

Reproduce by copying generator/template under build/frame-origin-audit,
decompressing snapshot, running generator with snapshot path, building replay
with d8dbc1b7 and this library, then running it. Native preparation checks the
optimized graph before counting scheduled Phis. All evidence untimed.
