# Actual frontend provider-closure gap

Coil source/candidate572c6210, same current source for both O3 backends.
One identical clang O3 C caller, opaque typed tables in one Coil object behind
create/query/release. Construction/release are outside the process-CPU clock
around the query. Factory inputs are runtime arguments from the C caller.
256 modules,8 facades,20,000 alternating accepted/missing name queries.
Independent expected count100,000; kernel also checks every returned name.

| O3 backend | Query CPU median | Kernel generation (single) |
|---|---:|---:|
| Stogir |121.0925ms|0.993745s|
| LLVM |53.0880ms|2.522498s|

Eight alternating runtime samples after one excluded warmup. Stogir is
2.2810× slower on this actual resolver operation. Small diagnostic,
not whole-bootstrap acceptance. Raw kernel CPU samples are the C clock values;
outer process CPU/wall also include untimed construction and are separate.
Generation includes the factory and is diagnostic only. No tests/builds/profiles
overlap timed runs. `python3 measure.py` rebuilds and measures from this directory.

## Concrete machine-code path to audit

In Stogir's actualprimitive-providers-in body, the nonmatching target-length
branch atb11c reachesb484. That stub writes11 stack slots then returns tob0b4;
the loop continuation reloads11 slots and performs register shuffles. The
memcmp call is not on this path. This is the same class of untaken-call transfer
cost seen earlier, now reproduced in hot frontend code. Do not delete the pairs
based on appearance: assigned split locations and other incoming paths must be
proved correct. Complete disassembly and a lossless pre-native graph snapshot
are retained; opt-in graph tracing produces byte-identical objects.

Pinned upstream92171d0 ir_ra.c needs_spill_reload/assign_regs tracks per-interval
register availability through predecessors and attaches spill stores/loads at
actual definitions/uses. Our path reconciles split locations with explicit CFG
edge and contiguous-boundary transfers. Next audit: identify exact parents and
split ranges in this graph, then port the applicable availability/home rules
with a path-sensitive reference oracle. Calls, loops, Phi generations, register
clobbers, parallel copies and both sides of every branch must remain correct.
No transfer-elimination implementation is claimed yet. Existing rejected call
reservation retry policies remain excluded.

## External Coil linking bug

A separately compiled LLVM Coil caller collided with `_mh_*` C shim definitions
in the target object. Source repro and diagnostics: duplicate-c-shim. Recorded as
coil-bugs/multi-object-duplicate-meta-shim. The opaque C API above uses one Coil
object and no linker override; the general bug remains open.

LLVM O1/debug-checks/AddressSanitizer construction,20,000 queries and release
also pass with the same100,000 expected answers. Separate from all timings.
