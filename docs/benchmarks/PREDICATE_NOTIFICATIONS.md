# Predicate ancestry and comparison notifications

Latest measured candidate 4921c53c, standalone 0f89b62; comparison candidate
b56a5ff6 contains the same field promotion and integer complement rules without
the notification correction. Both compile the same independent source fixture
using one identical LLVM-built caller. Eight alternating generation samples and
24 CPU samples after excluded warmups. LLVM objects match exactly across drivers;
Stogir objects remain stable; valid/invalid checks and checksums pass.

| Workload / backend | Generation ms | CPU ms | Object bytes |
|---|---:|---:|---:|
| Operand previous Stogir | 1.6315 | 91.2830 | 2274 |
| Operand corrected Stogir | 1.5260 | 85.7100 | 2034 |
| Operand previous LLVM O3 | 22.1125 | 31.6580 | 1616 |
| Operand corrected LLVM O3 | 22.0690 | 31.6885 | 1616 |
| Verifier previous Stogir | 92.1115 | 34.6250 | 100619 |
| Verifier corrected Stogir | 92.1255 | 34.2730 | 100219 |
| Verifier previous LLVM O3 | 349.2415 | 9.6305 | 41008 |
| Verifier corrected LLVM O3 | 345.8515 | 9.6290 | 41008 |

Operand CPU improves 6.1%; its wrapper falls 109→79 instructions. Verifier CPU
improves nominally 1.0%, with generation unchanged. The full-bootstrap target
remains unmet; no new bootstrap acceptance measurement has been run.

## Evidence that changed the implementation

The existing numeric-ancestry-order correction alone left the operand object
byte-identical (6b6352f5→9aaf6d65). Integer complement rules alone also left that
object byte-identical (9aaf6d65→b56a5ff6). Their measurements are retained.

A separate diagnostic compiler 39fbad7a adds opt-in COIL_STOGIR_DUMP with an exact
source function name or *. It dumps the adapter graph plus an explicitly named
checked SCCP replay. Disabled, exact-filter and wildcard modes produce the same
object as b56a5ff6; no diagnostic binary is used for timing.

The replay shows LE(SEXT(param),0) and GT(SEXT(param),0) become complements only
after cast cleanup. The IF had already been visited. Replacing a comparison
input queued the comparison but did not necessarily queue its IF, because the
comparison itself survived scalar folding. The ancestry query observes those
inputs, making this a genuine reverse-use dependency. The iterative drain now
notifies comparison IF users through the existing use index in its control phase.
There is no repeated full SCCP analysis or graph-wide rescan.

The delayed-cast regression runs original native answers successfully and then
fails redundant-IF elimination before the correction. With the correction, the
complete SCCP control suite passes debug checks and ASAN, including 640 new
integer complement boundary answers, floating rejection, changed operands,
preallocated headers, memory effects and control barriers. Central standalone
provenance documents the independently extended upstream-inspired query.

## Delivery

Standalone 0f89b62 is committed and pushed. Compiler integrations and diagnostic
tooling are committed, not installed globally, not pushed; FAST has not run.
The globally installed compiler was independently changed to 4776c39fffbf; this
experiment did not install a toolchain. Remaining tag dispatch, signed division
and remainder after positive-index guards, and control/load combination gaps
remain visible in the assembly. Their bootstrap contribution is unquantified.
