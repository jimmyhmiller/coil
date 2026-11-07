# Measurement tools for the Stogir performance goals

All commands run from a Coil worktree root (`ROOT`). They clear `COIL_*`
from the environment and set `COIL_LIBRARY_STATE=0 COIL_TPDE_SERIAL=1`, as the
bootstrap does.

- `mkhost.sh ROOT CANDIDATE OUT`: emits ROOT's compiler with CANDIDATE
  (Stogir O3, no debug), links `OUT/bin/coil`, and prints the IR-codegen
  (generation) seconds.
- `ab.py ROOT N name=host ...`: runs each host N times, alternating order,
  each emitting ROOT's compiler. Prints cycles, retired instructions and wall
  time, and checks that every host produced the same object.
- `genab.py ROOT N name=candidate ...`: the same for candidates; compares
  generation time and reports whether the emitted objects are identical.
- `libtests.sh LIBWORKTREE OUTDIR`: runs every library `tests/*.coil` (Stogir O3,
  `--debug-checks`, 6 in parallel) with the fixed test compiler
  (`STOGIR_TEST_COIL` overrides it). `aot-*-link` and `macho-link` need link
  flags and fail here; `jit-parameter-specialize` and `private-leaf` fail on
  every recent library.
- Profiles: `pcprof`/`memprof` from `docs/benchmarks/cir-copy-forwarding/tools`;
  `agg.py A B N` compares PC samples by module and function; `annot.py BINARY
  SAMPLES SYMBOL` prints a disassembly with per-instruction samples.
  `/usr/bin/sample PID 30 1 -file F` records call trees; `incl.py F names...`
  prints inclusive shares and `children.py F symbol` breaks one function down.
  Pass the PID of the process you launched (`cmd & P=$!`); `pgrep` can match
  library test binaries with the same name.

## Measuring a backend change correctly

A backend change also changes the work each generated host does, so
bootstrap `native-stogir` rows from two candidates are not comparable. Build
both hosts from the same source, one per candidate, then compare them:

    mkhost.sh $ROOT $OLD_CANDIDATE build/h-base
    mkhost.sh $ROOT $NEW_CANDIDATE build/h-new
    ab.py $ROOT 3 base=build/h-base/bin/coil new=build/h-new/bin/coil

Compare cycles, not instructions: Apple cores fuse compare-and-branch pairs
and decode 8 wide. Host load is often high on this machine; use minimum and
median over at least three alternating rounds.
