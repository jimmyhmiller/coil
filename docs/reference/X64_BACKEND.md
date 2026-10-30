# x86-64 code generation

All x86-64 code the compiler emits without LLVM comes from the **tpde backend**,
the same one that writes arm64 code (`docs/reference/ARM64_BACKEND.md`): `--backend
x64` (tpde for an x86-64 target; `--backend tpde` follows whatever the target is),
the native default and `-g` on an x86-64 Linux host, metaprograms built in
memory, and the LLVM-free Linux compiler
(`src/compiler/main_x64.coil`). For Linux it writes an ELF object; for an x86-64
Darwin target, a Mach-O one. It replaced a slot-per-value x86-64 emitter
(`codegen_x64.coil`, deleted).

`--backend x64` with a target that is not x86-64, like `--backend arm64` with one
that is not arm64, is an error rather than code for another machine.

## Files
- `src/compiler/backend/codegen_tpde.coil` — the lowering (see the arm64 page).
  For x86-64 it classifies by System V: an aggregate of up to 16 bytes travels
  per eightbyte (INTEGER dominating SSE within one), a larger one in memory, and a
  result over 16 bytes through a hidden pointer. `tl-elf-object` turns the
  Mach-O-shaped module it builds into ELF: no `_` symbol prefix, `.L` names for
  temporaries, explicit RELA addends, relocated constants in `.data.rel.ro`, and
  DWARF relocations against a symbol at the start of `.text`. `cgtpde-build-eobj`
  hands that object back in memory.
- `src/compiler/tpde/x64.coil`, `src/compiler/tpde/cir/x64.coil` — tpde's x86-64
  layer. The address of a symbol that is not local to the object is loaded from
  its GOT entry (`R_X86_64_REX_GOTPCRELX`), so a shared object can be linked from
  it; the linker relaxes the load when the symbol turns out local.
- `src/compiler/object/elf.coil` — ELF64 `ET_REL` writer: sections, `.rela.*`
  relocations, weak symbols, the local-before-global symbol order ELF requires.
- `src/compiler/jit/jit_elf.coil` — maps an in-memory ELF object into this
  process for metaprograms and comptime: far-call stubs for symbols out of
  `rel32` reach, and a GOT for the relocations that name one.
- `src/compiler/object/x64.coil` — the x86-64 instruction encoder the loader's
  stubs, `native_call.coil` and the ELF self-test use.

## What differs from arm64
- **The ABI is System V AMD64.** No HFA rule; eightbyte classification as above.
  Variadic calls set `al` to the number of vector registers used.
- **Object format is ELF.** Symbols carry no leading underscore, every local
  symbol precedes every global one, and debug sections carry real relocations,
  which the linker resolves (no debug map, no `dsymutil`).
- **`frem` is a libm call** (`fmod`/`fmodf`); the driver links `-lm` on Linux.

## Gates
They run on an x86-64 Linux host: COMPREHENSIVE's `x64/host` step
(`scripts/tests/x64-host.py`) runs all of them.
- `python3 scripts/dev.py build x64` (`scripts/compiler/bootstrap-x64.sh`):
  stage 2 and stage 3 through `--backend x64`, **stage2.o == stage3.o
  byte-identical**, the corpus on the tpde-built compiler, `gate-cabi.sh` and
  `gate-encode.sh`.
- `python3 scripts/dev.py build nollvm-linux` builds `main_x64.coil`, proves with
  `ldd` that it links no libLLVM, reaches the same fixpoint, and runs the corpus.
- `python3 scripts/oracle.py corpus x64` builds the runtime corpus with
  `--backend x64` and compares each program's output and exit status with the
  references the LLVM build blessed.
- `scripts/tests/c-abi.py` links tpde and LLVM objects together and against C.
- `scripts/compiler/oracle/x64/gate-cabi.sh` — the System V eightbyte rules,
  differentially against **gcc**: the callee is compiled by gcc and every field
  carries a distinct prime weight, so swapping two arguments changes the answer.
  Calls between Coil functions pass aggregates by pointer, so only the C
  boundary reaches these rules.
- `scripts/compiler/oracle/x64/gate-encode.sh` — every instruction the encoder
  emits, diffed against **llvm-mc**.
- `scripts/compiler/oracle/x64/gate-elf.sh` — a hand-assembled program written
  through `elf.coil`, linked with `cc` and run, plus readelf's view of it.

## An LLVM-backend bug the x86-64 work surfaced
`codegen.coil` classified a by-value aggregate purely from its type, so a
`{double,double}` always became two separate `double` parameters. System V passes
an aggregate in registers only if enough are still free at its position, and
otherwise the whole thing goes in memory; it never half-spills. `c-signature`
now tracks integer and SSE register consumption across the parameter list and
demotes an aggregate to `byval` when either file would overflow, as clang does.
`gate-cabi.sh` covers both sides of that boundary (`c_p2_fits`/`c_f2_fits` stay
in the last free registers, `c_p2_over`/`c_mix_over` must demote).
