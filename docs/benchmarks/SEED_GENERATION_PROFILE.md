# Exact seed-generation profile

Profile the LLVM-built source979be2f9 candidate used for the 11.4777-second
IR-to-machine baseline, not the slower Stogir-generated compiler. Its executable
SHA matches the recorded baseline driver. Source SDK fingerprint and final
Stogir object SHA match the frozen full compiler checkpoint exactly.
Two 2-second samples at elapsed10/14 seconds are excluded from acceptance timings.
Windows interleave timed generation, CIR lowering and trace reporting; leaf
counts are not whole-phase percentages. Trace writes are largely outside the
measured IR-codegen spans and are not a valid shortcut toward the 5x target.

Top relevant early leaves: uses.build102, optimize-memory74, structure74,
integer verification69, optimize37. Late: pressure-state126, structure114,
uses.build87, integer verification86, generate-matched73, allocate43,
call-inline43. Waiting companion-thread samples are excluded from this summary.
Memory-copy leaves are27/18; these samples do not justify making a large graph
ownership refactor the next speed claim.

Next audit repeated validation/analysis work within one owned optimization
transaction, preserving public invalid-input rejection and pass invariants.
Upstream uses shared context lifetime; changes need explicit proof/lifetime
contracts and differential correctness evidence, not blanket removal of checks.

The first attempt used the globally installed executable. Its warmed JIT unit
was automatically selected, changing the target closure: new jit_api externs
replaced LLVM ORC externs. It completed successfully, but its object did not
match the source-only baseline. That profile comparison was discarded; the
accepted rerun uses the exact candidate executable/bundle. COIL_LIBRARY_STATE=0
does not itself disable shipped JIT-unit selection. This is expected bundle
behavior, not a newly claimed Coil bug.

Accepted metadata, excerpts, leaf summary and reproducible script are archived
in results/seed-generation-profile. Full performance goal remains unmet at the
latest checkpoint: 3.0428x faster generation, 2.3037x slower generated runtime.
