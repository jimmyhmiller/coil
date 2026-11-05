# Checked inline growth study: larger budget is not adopted

Source/candidate 0a48d584 separates the unchanged 512-cell template eligibility
limit from clone growth, testing 2048 instead of 512 cells per caller. Existing
library immutable validation, recursion exclusion and exact nonreplenishing
ledger remain. This is a compiler policy experiment, not upstream policy.

Actual-verifier medians before/current/LLVM: generation 102.466/143.2115/370.3165
ms; runtime CPU 27.5805/23.8105/9.624 ms; object 97858/131027/41440 bytes.
Four rotating generation/16 CPU samples after excluded warmups, identical frozen
source, same LLVM-built opaque caller, serial/O3/no-debug/caches and library state
off; no competing builds/tests. Not a bootstrap result.

Runtime improves13.67%, generation regresses39.76%, object grows33.90%; current
runtime remains2.47xLLVM. Structure expands all25sites,942reserved/1106remaining;
semantic validator34changes,1657reserved/391remaining. Static calls100->39
(LLVM40), but instructions15789->23483 (LLVM5543). This demonstrates that helper
calls cost runtime, while raising the budget alone is an inadequate policy.

A text-relocation-only closure finds33of138emitted functions and17382of23483
instructions reachable from the exported kernel. This is only a lower bound:
function addresses/data roots must also be preserved. It motivates a proper
post-inline module reachability audit, not pruning from this approximate count.

Candidate build and quick9-step gate PASS51.3s. Source committed, not pushed,
not installed globally; full FAST not run. No adoption or goal completion.
