# Phi homes are established at block entry

## Defect

`a64/spill-homes.coil` (4e068bc) certified a Phi's definition by looking up the
Phi's location at its own schedule position. Phi transfers and literals
(`edge-moves.phis-impl`) instead write the Phi's location at its **block entry**.
The scheduler can place ordinary nodes between MERGE and a Phi. When the Phi
was in a register at entry and split to its home before its own position, the
certificate saw "already in home" and removed the boundary register-to-home
store. Incoming edges then wrote only the register, and later reloads read a
stale home.

Found by the whole-compiler bootstrap: the Stogir-built Coil compiler from
source a831fb94 failed with `coil.compiler.metahost.mh-arg-b: missing integer
operand`. A temporary certificate-count bisect isolated certificate 494,
`stogir.verify.integer-operations-target-structured`: Phi 958 = PHI(ZEXT, 0)
entered in x0 and was stored at position 333 only by the removed boundary store.
The literal edge (`movz x0, #0`) skipped the remaining ZEXT writeback.

## Fix

A Phi definition keeps its parent certified only when its block-entry location
is the home itself. Otherwise the parent keeps the original protocol.

## Validation

- `benchmarks/phi-home-entry/generate.py` replays the captured real verifier graph
  (`snapshot.txt.gz`) and checks that every original home store of a Phi parent
  whose entry location is a register survives planning. Three such stores are
  checked; the unfixed library fails the assertion (SIGABRT, exit 134).
- `tests/spill-home-phi-entry.coil`: computed/literal Phi live across a
  GPR-destroying call under pressure, O1/O2/O3, 1,920 native answers. The
  toy shape does not reproduce the scheduling quirk above, so it is coverage, not
  the regression proof.
- Native: spill-home-phi-entry, spill-home-loop, jit-pressure, jit-call-pressure,
  jit-phi-call-redefinition, jit-floating-pressure, jit-phi, jit-loop,
  jit-switch-pressure, jit-bulk-pressure, private-call-allocation, jit-loop-guard,
  frame-memory. ASAN: spill-home-phi-entry, spill-home-loop,
  jit-phi-call-redefinition, jit-floating-pressure. All pass.
- Coil whole bootstrap with this fix: Stogir-built and LLVM-built hosts both
  reproduce the exact seed Stogir object.
