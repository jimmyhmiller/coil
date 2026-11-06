# Active physical reservations stay non-evictable

Basec89a0d5, correctness-only extraction from b3ab774. Eight production lines
mark an active negative-parent physical interval's register fixed-at=current
in reference, reusable and indexed pressure paths. No reservation-release retry,
new split policy or allocation heuristic included. Future fixed-use queries do
not represent an immutable interval after its startuse has passed.

Valid virtual[6,20) withrequiredregisteruse19 and physicalx0[5,9) used to attempt
to evict physicalstate, then reject with Err invalid spill slot shape. Now the
virtual interval spills until its required use, physicalreservation unchanged.
Regression asserts successful allocation and original physicalrange/register.
Native O3/debug and LLVM O1/debug/ASAN allocation/pressure-index suites PASS.

The separately committed incoming/evicted retry experiments remain quarantined:
incoming-only gave21%smallloop improvement but neutralactualemitter; eviction
extension regressed actualemitter/verifier~5.7%. This fix does not claim a speedup
or bootstrap acceptance. Public preassigned physical reservations are immutable
through their complete ranges, matching pinned ir_ra.c's physical interval role.
Not installed or pushed; no integrated candidate for this extraction yet.
