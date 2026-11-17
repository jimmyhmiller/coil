# The native backend

`--backend native` is Coil's own code generator. It is written in small
languages: it is `src/declarative/` (the languages in `lang/`, and the files
written in them), a package the compiler depends on, whose readers make each of
its files Coil as the compiler compiles (see [Files](#files)). It replaced
both the tpde backend (a port of TPDE, which `--backend tpde`, `arm64` and `x64`
named) and the earlier Stogir library, a port of IR; it was developed in the
coil-stogir-declarative project before it moved here. That history, and the
credits, are in `src/declarative/NOTICE`, git and `docs/benchmarks/`.
The old names are errors that say to use `native`.

It is the default of a debug build (`coil build` without `--release`: `-O0`
with DWARF, into `build/debug/`) wherever it compiles for the target, the
default of the LLVM-free compilers, and what compiles metaprograms, compile-time
code, `coil repl` and `coil.jit` sessions. No LLVM is anywhere in its path.

## What it compiles for

AArch64 macOS (AAPCS64, Mach-O) and x86-64 Linux (System V, ELF). Every
compiler carries both, so either is a `--target` away from the other machine.
Any other target is refused with a message naming both; a debug build for one
uses LLVM instead.

- `-O0` and `-O1`: straight from CIR, one function at a time, in one walk: each
  instruction by the first rule that matches it, registers chosen as the code is
  written, values read in more than one region given registers of their own.
- `-O2` and `-O3` (the same): the whole module at once, as a graph, with
  inlining, copy forwarding across functions, and the optimizer.
- With DWARF (the debug profile, or `-g`): functions are compiled one at a time
  and frame objects stay in memory. Below `-O2` every local a debugger follows
  has a location (a register or a frame slot, as it changes); from `-O2`, a
  value that lives only in registers has none. A call in tail position is
  still a tail call at every level, so a debugger does not show its caller's
  frame.

## Files

- `src/compiler/backend/codegen_native.coil` — the lowering: the monomorphized
  `Program` to CIR, one function at a time, then the declarative backend. It
  mirrors the LLVM backend's lowering decisions (sum layout `{i32 tag, payload at
  8}`, slices `{ptr, i64}`, divergence, the C convention at every call);
  `codegen.coil` stays the behavioral spec. For x86-64 it classifies by System V:
  an aggregate of up to 16 bytes travels per eightbyte (INTEGER dominating SSE
  within one), a larger one in memory, a result over 16 bytes through a hidden
  pointer. `tl-elf-object` turns the Mach-O-shaped module into ELF: no `_`
  prefix, `.L` names for temporaries, explicit RELA addends, relocated constants
  in `.data.rel.ro`, DWARF relocations against a symbol at the start of `.text`.
- `src/compiler/backend/codegen_native_ir.coil` — the `llvm-ir` escape hatch (below).
- `src/compiler/backend/native_module.coil` — the module layer the lowering runs
  on: signatures, layouts and their natural C offsets (which compile-time readback
  walks), statics and their initializers, `export-c` thunks, argument
  classification, string interning, DWARF types, and the Mach-O object.
- `src/declarative/` — the backend, CIR and the assembler: a package the
  workspace's `Coil.toml` depends on, whose own `Coil.toml` gives each file type
  its language (`[readers]`) and each file its module (`[modules]`). Nothing is
  generated ahead of time: a compile that imports one of its modules runs the
  reader its extension names, as it would for any project's guest files, so an
  edit to a file here is in the next build. An installed toolchain ships it as
  `<lib>/coil/declarative`, beside the compiler's sources, and a program that
  reads the SDK from source (one importing `coil.jit` with no unit for it) reads
  these files with the same readers (`sdk-reader-for-suffix`, generated with the
  SDK's tables by `scripts/compiler/gen-stdlib-manifest.py`):
  - `lang/` — the languages, each a reader from a file of its own to a Coil
    module: `.ir` (a node set), `.isa` (a machine's instructions and encodings),
    `.abi` (a calling convention), `.lower` (from nodes to instructions),
    `.rewrite` (rules, each checked against the nodes' meanings), `.flow`
    (facts), `.pass` (graph algorithms, or libraries with explicit arguments
    and storage schemas), `.unit` (which of them make a compiler), `.pipeline` (the order passes run in at each level), `.layout`
    (an object file format), `.ops` (CIR's operations, read from CIR itself),
    `.select` (instructions for each CIR operation, for the compile straight
    from CIR), `.numbers` (CIR's numbers, from its `.ops` file) and
    `.instance` (one Coil file as a module for each machine). A
    file whose text is `same OTHER` stands for OTHER.
  - `backend/` — the node set and the passes both machines share; `a64/` and
    `x64/` — each machine's instructions, convention, lowering, rules and passes,
    for the graph route (`-O2`/`-O3`); `direct/`, `a64-direct/`, `x64-direct/` —
    the compile straight from CIR (`-O0`/`-O1`); `cir/` — CIR's operations;
    `native/` — its storage, SSA builder, copy analysis and assembler library
    passes. Library records declare their field types and initial values;
    `construct` and `release` generate allocation and cleanup of list fields.
    A `byte-buffer` schema declares capacity and integer encodings, including
    LEB128. The Coil its language makes of it handles memory and byte order.
    `native/NOTICE` retains the
    [coil-tpde](https://github.com/jimmyhmiller/coil-tpde) provenance.
  - `rt/` — the runtime the languages' output stands on, written by hand.
  - `adapter/` — from the compiler's CIR to the backend: CIR's view and the
    targets, written by hand, and `machine.coil`, from CIR to the graph, written
    once: `machine-a64.instance` and `machine-x64.instance` make it a module for
    each machine.
  - `tests/` — the backend's own tests, a project of its own, with `toy/`, the
    languages' second client, a calculator (see [Gates](#gates)).
- `src/compiler/object/` — the Mach-O and ELF writers, DWARF, and the encoders the
  JIT's stubs, `:shim` trampolines and the self-tests use.
- `src/compiler/jit/jit_elf.coil` — maps an in-memory ELF object into this process
  for metaprograms: far-call stubs for symbols out of `rel32` reach, and a GOT.

## What differs between the machines

- **x86-64 is System V AMD64.** No HFA rule; eightbyte classification as above.
  Variadic calls set `al` to the number of vector registers used.
- **x86-64 objects are ELF.** Symbols carry no leading underscore, every local
  symbol precedes every global one, and debug sections carry real relocations
  (no debug map, no `dsymutil`). The address of a symbol not local to the object
  is loaded from its GOT entry (`R_X86_64_REX_GOTPCRELX`).
- **`frem` is a libm call** (`fmod`/`fmodf`) on x86-64; the driver links `-lm`.

## Settings

Read from the environment when compiling. Those that change the code are part
of a unit's key (`cli/units.coil`).

| variable | effect |
|---|---|
| `DECLARATIVE_SMALL`, `DECLARATIVE_GROWTH`, `DECLARATIVE_ONCE` | inlining limits |
| `DECLARATIVE_OFF=BITS`, `DECLARATIVE_OFF_AT=N` | turn single transformations off (numbers in the backend's `cfg.pass`) |
| `DECLARATIVE_TRIAL`, `DECLARATIVE_ONLY` | optimize or try something in only the first N functions (the rest are compiled straight from CIR) |
| `DECLARATIVE_SHOW=NAME` | print a function's CIR, graph and code; `?` names each function |
| `DECLARATIVE_TIMES` | below `-O2`, how long each step of the walk took |
| `DECLARATIVE_THREADS=N` | how many threads compile a module's functions (the object is the same for every count) |
| `COIL_NATIVE_SERIAL=1` | one thread for everything |

## What the optimizer assumes

Each of these is what LLVM assumes as well, or follows from what Coil
guarantees; a program that breaks one is undefined.

- A switch whose default only traps names every value it can be given: the
  trap is where control cannot go, as LLVM's `unreachable` is. A value no case
  names then goes to some case.
- A counter used only to make addresses is stepped as an address and the loop
  ends when the address reaches the bound's: it assumes the loop's addresses
  do not wrap around 64 bits (element sizes are at most 4096 bytes).
- A symbol named `memcpy`, `memmove`, `memset`, `memcmp`, `bcmp`, `strlen`,
  `strcmp`, `strncmp` or `memchr` (as C names it on the machine) is the C
  library's routine. Coil's own functions are named by their modules and never
  match; an `extern` with one of those names must be the C routine.
- A function whose frame does not escape (CIR's `frame-escapes`) can end in a
  tail call; and once a function has a tail call, no callee whose frame
  escapes is put in its place.
- Two frame objects never overlap, and a store to a frame object nothing else
  can reach changes no memory reached another way.

## The `llvm-ir` escape hatch
The corpus' inline-IR surface is finite and straight-line (no control flow, no
phi). `codegen_native_ir.coil` lowers a small IR subset, with the line tokenizer
and operand helpers of `native_module.coil`: after `$N/$tN/$ret`
substitution it parses each line and lowers structurally:
- `insertvalue`/`extractvalue` on `{ptr,i64}`-shaped aggregates (slices) and
  cmpxchg results; `undef`/`poison`; `ret`.
- atomics (`atomicrmw add/sub/xchg`, `cmpxchg`, `load/store atomic seq_cst`);
  plain (non-atomic) `load`/`store` of any size, chunked in ≤8-byte transfers
  for aggregates >8 bytes.
- `bitcast` (same-size reinterpretation only), `inttoptr`, `sext`/`zext`/
  `trunc` (the `sext i1`→0/-1 mask idiom is handled directly as a two's-
  complement negation, since a byte-level sign-extend of a 0/1 `TBool` byte
  gives the wrong answer), `fptosi`/`fptoui`/`sitofp`/`uitofp`/`fptrunc`/
  `fpext`, `icmp` (all 10 predicates on ≤8-byte operands; `i128` — an opaque
  16-byte blob, since no native Coil integer exceeds 64 bits — supports only
  `eq`/`ne` via a 16-byte memory compare), `fcmp` (ordered predicates
  `oeq`/`one`/`olt`/`ole`/`ogt`/`oge` only), `select` (scalar and
  vector-mask, a branch-free bitwise blend), `and`/`or`/`xor`/`add`/`sub`/
  `mul`/`shl`/`fdiv`/`sdiv`/`udiv`/`srem`/`urem` (div/rem scalar only),
  `getelementptr` (scalar, and vector-of-i32-index for a byte element type).
- vector ops (`insertelement`, `shufflevector` — general index-mask gather
  across both operands, not just the `zeroinitializer` splat case,
  `fadd`/`fsub`/`fmul`/`fdiv <4 x float>`, `@llvm.fma.v4f32`,
  `@llvm.vector.reduce.fadd.v4f32`, `@llvm.sqrt.v4f32`,
  `@llvm.masked.gather.v4i8.v4p0`), all scalarized lane-by-lane (this keeps
  results bit-identical to the LLVM backend's, which is what the runtime corpus
  gate compares).
- scalar float math intrinsics (`@llvm.<op>.f32` / `.f64`, the operations
  `coil.math` is written over; the table is `src/compiler/backend/float_math.coil`):
  square root, absolute value, the roundings, fused multiply-add, and
  minimum/maximum are instructions; `copysign` and the transcendentals call
  the libm function (`sinf`, `atan2`, …). `roundeven` calls C99 `nearbyint`,
  since macOS libm has no `roundeven`.
- Inline vector-constant literals (`<i32 1, i32 2, ...>`) and float literals
  (`float 1.0`) are supported anywhere a value operand is expected — these
  appear pervasively in real inline-IR (icmp/select comparands, shift
  amounts, shuffle index masks), not just in exotic call sites.
Anything outside the subset is a **hard error** naming the unsupported line.
(`call void asm sideeffect` is freestanding-only: a hard error here.)

This subset was expanded from a narrower one (originally sized to Coil's own
`slice`/`atomic`/`simd` stdlib helpers) to also cover `lib/paper`'s SIMD
raytracer (a real external project) — verified end to end by snapshot-diffing
its rendered output against the LLVM backend byte-for-byte, not just by
compiling. A per-op test file (`llvm-ir-ops.coil`) covered every op above until
the test restructure of 2026-10-12 removed it; the ops are now exercised only
where the corpus and SIMD tests reach them.

## Gates

Behavioral: runtime equality with the LLVM backend, not equality of code.

- `python3 scripts/oracle.py corpus native|native-debug|native-quick|native-quick-debug`
  builds the runtime corpus at `-O3`, `-O3` with DWARF, `-O0`, and `-O0` with DWARF,
  and compares each program's output and exit status with the references the LLVM
  build blessed. FAST runs `corpus/native`; the LLVM-free bootstraps gate on
  `native-quick`.
- `scripts/tests/c-abi.py` links native and LLVM objects together and against C;
  `scripts/compiler/oracle/x64/gate-cabi.sh` checks the System V eightbyte rules
  against **gcc**, `gate-elf.sh` the ELF writer.
- `python3 scripts/dev.py build nollvm` / `nollvm-linux` build the LLVM-free
  compiler through the native backend, prove it links no libLLVM, reach a
  stage2 == stage3 fixpoint, and run the corpus; `build x64` does the same for the
  full compiler on x86-64 Linux.
- FAST's `cli/debuginfo` step sets a breakpoint by line in a debug build and reads
  parameters and locals; `cli/objects` runs the tail-call, wide-arithmetic and
  frame tests at `-O1` and `-O3`; `scripts/tests/declarative-unit-settings.py`,
  `declarative-threads.py` and `stogir-x86-sweep.py` cover settings, threads and a
  sweep against LLVM.
- `scripts/tests/declarative.py COIL` (COMPREHENSIVE, and on the x86-64 host in
  `x64/host`): from `src/declarative/tests`, every rewrite rule and fact against
  the nodes' meanings, the toy calculator, an object linked in memory and by the
  system linker, calls with several results and every way of passing an
  argument, CIR's interpreter (made from `cir.ops`), and 2000 random programs
  each through the compile from CIR (against that interpreter) and through the
  whole graph pipeline (every transformation must fire).

## An LLVM-backend bug the x86-64 work surfaced
`codegen.coil` classified a by-value aggregate purely from its type, so a
`{double,double}` always became two separate `double` parameters. System V passes
an aggregate in registers only if enough are still free at its position, and
otherwise the whole thing goes in memory; it never half-spills. `c-signature`
now tracks integer and SSE register consumption across the parameter list and
demotes an aggregate to `byval` when either file would overflow, as clang does.
`gate-cabi.sh` covers both sides of that boundary (`c_p2_fits`/`c_f2_fits` stay
in the last free registers, `c_p2_over`/`c_mix_over` must demote).
