# coil-tpde plan

A port of [TPDE](https://github.com/tpde2/tpde) (`~/Documents/Code/open-source/tpde`)
to Coil: a fast, single-pass, -O0-quality compiler back-end that is generic over
the IR it compiles, and then the backend for the Coil compiler itself
(`coil build --backend tpde`).

## Decisions (2026-10-24)

| Question | Decision |
|---|---|
| Who owns encoders and object writers? | **Do what TPDE does.** The package owns its assembler/object writers (TPDE's `AssemblerElf`; we add Mach-O) and its instruction encoders live in their own namespaces, the way TPDE uses fadec/disarm as separate libraries. The package never depends on Coil compiler internals. No encodegen: instruction selection is hand-written, as TPDE's own TIR compilers do. |
| What is the performance bar? | **LLVM -O0**, on both compile time and the speed of the generated code (`coil build -O0`, which runs LLVM's `default<O0>`). |
| How does Coil's tree become SSA? | **Braun et al.**, "Simple and Efficient Construction of SSA Form" (CC 2013), done on the fly while lowering the expression tree. Locals whose address is never taken become SSA values; address-taken ones become static allocas. |

## Decisions (2026-10-25)

| Question | Decision | Why |
|---|---|---|
| What IR does Coil lower to? | **CIR** (`tpde.cir`), a small SSA IR in this package: types I64, I128, F32, F64, V128; constants, symbol addresses, arguments and allocas are values without instructions (TPDE's "values that are not instructions"); PHIs per block; Braun SSA (`def-var!`/`use-var!`/`seal!`, trivial PHIs removed by forwarding plus a fixpoint in `finish!`). | TPDE compiles *an* SSA IR through an adaptor; Coil's tree is not one. A purpose-built IR with dense `u32` handles is the cheapest adaptor. |
| How are integers represented? | **Canonical 64-bit**: every integer narrower than 64 bits lives in an I64 extended (sign or zero) from its width, as `codegen_a64` keeps them. Extensions are explicit CIR ops; constant extensions fold. | One integer type keeps CIR and the isel small; matches the existing native backend, so values crossing to C or `codegen_a64` code agree. |
| Who builds the module around the functions? | **`codegen_a64`'s module setup** (signatures, layouts, statics, strings, exports, its MObj and Coil's Mach-O writer). tpde emits each function's text into its own `tpde.asm` assembler; `tl-merge!` moves text, constants, symbols and relocations into the MObj. | Data, statics, string pools and exports are already right there; duplicating them would be a second source of truth. The tpde Mach-O writer stays for TIR and the package's own tools. |
| Which locals become SSA values? | An `alloc stack` of a scalar bound by a `let`, whose name is only ever the address of a load or store. Decided by an escape scan that runs **lazily from the let** that binds the first candidate, over that let's scope. Others stay stack slots (TPDE: static allocas). | A name is only visible in its scope, so the scope is all the scan needs; 4 in 5 functions have no candidate and are not scanned. |
| Tail calls | Coil's guaranteed tail calls are OP-TAILCALL. A tail call becomes an ordinary call plus return when its arguments need the stack, or when the frame's address escapes (a pointer into the frame reached a call, a store, a return or a variable: `Value.flags` bit 2), since the callee would see a popped frame. | TPDE has no tail calls; Coil programs recurse 200M deep through them. The escape rule came from a self-host miscompile. |
| `:shim` conventions | OP-SHIMCALL: arguments in named registers, an exact clobber set, inline machine code bodies. | Mirrors `codegen_a64`'s shim lowering. |
| Debug info | **DWARF by default** (lines, functions, parameters, locals, types; `-g0` turns it off), through Coil's shared model (`../coil/src/compiler/debuginfo.coil`, `dwarf.coil`). Parameters and mutable variables live in shadow slots of a per-function debug frame (stored at binding and at each assignment); immutable `let`s get location lists from the allocator's placement, sampled at every line row (`Compiler.dbg-track`, `debug-sample!`), so they cost no code; constants are their value. A leaf whose only stack slot would be the debug frame drops it and tracks its parameters instead. Each function's DWARF is encoded on a third pipeline thread (`DwInc`). | Asked for (2026-10-25): line breakpoints, variables and types on by default, like the arm64 backend. Shadowing every `let` cost prop_bench 47% (1.27× LLVM -O0) and giving small leaves a frame 75%; with the hybrid the cost is ~15% on call-heavy code and 0 elsewhere, and compile time stays ≥10× LLVM -O0. TPDE itself emits no debug info. |
| Threads | **Two-stage pipeline**: the backend thread lowers function *i+1* while a second thread compiles function *i* (`codegen_tpde.coil`, "jobs"). A ring of 8 jobs with an atomic state per slot; both sides spin then yield. The compiling side touches only tpde state (the job's CIR, the Compiler, the assembler, whose symbol table is chunked and locked for adding). Jobs complete in order, so the object is identical to compiling serially (`COIL_TPDE_SERIAL=1`). | Serial tpde is ~10.3× LLVM -O0: at the bar but with no margin, and most of what is left is cache misses on the front end's AST. A condition-variable handoff cost more than it saved (a wakeup per function). |
| Where does the tpde package live? | Its own repository (`coil-tpde`), a path dependency of the Coil workspace (`Coil.toml` `[dependencies] tpde`); `stage0.py` adds `../coil-tpde/src` as a namespace root for the bootstrap. | The package is generic and has its own tests; the compiler consumes it like any dependency. |
| x86-64 | **System V, Mach-O x86-64 first** (`--target x86_64-apple-macosx…`, run under Rosetta on this host), with the same lowering: `codegen_tpde` classifies aggregates as `codegen_x64` does (eightbytes INTEGER/SSE, MEMORY above 16 bytes) and keeps the classes in `AbiInfo`'s spare fields. MEMORY arguments are `AF-BYVAL` (tpde copies them onto the stack, TPDE's byval); an sret function returns the pointer in rax; a pair split across a GP and an XMM register is `AF-MIXED`, so it goes to the stack whole when either bank runs out. The package's ELF writer serves TIR (checked against C++ TPDE's objects). **Not done: Coil for Linux.** `--backend tpde` writes Mach-O only; a Linux target needs the MObj (Mach-O-shaped: `_`-prefixed names, implicit addends) written through `elf.coil` as RELA, and a Linux link to test it, which this host lacks. | The host is arm64 macOS, and Rosetta runs x86-64 Mach-O, so every Coil gate can run for x86-64 here. |
| Tooling language | Coil (`src/tools/tpde_check.coil`, `src/tools/tpde_bench.coil`, shared helpers in `src/tools/proc.coil`). The only non-Coil scripts left build the C++ reference (`ref/build.sh`). | As asked. The Python `parity.py`/`gen_tir.py` and shell `check_enc.sh`/`norm_objdump.sh` were ported and removed. |

### Where we differ from TPDE

All are heuristics; none changes what a program computes. `tpde-check codegen`
reports where TIR output still matches the C++ reference (19/20 runs; the
other differs in veneer placement).

- **A displaced argument register moves, not spills.** When a call's argument
  needs a register that holds a live value, the value moves to a free register
  no argument uses (`evict-reg-for-arg!`); TPDE spills it. At a tail call that
  was a store and a reload per iteration.
- **A PHI's fixed register is judged by the PHI's own loop.** TPDE initializes
  a PHI in a predecessor and asks whether the *predecessor's* loop has room for
  another fixed register, so a loop header's PHI competed with every definition
  inside the loop and lived in its stack slot. The liveness test is unchanged.
  On Apple cores the stack round trip was not just slow: reusing a value loaded
  before a store to the same slot cost 3× (measured with hand-written loops).
- **Tail calls do not make a function non-leaf.** Nothing is live across one,
  so a self-recursive function keeps caller-saved registers. In such a leaf a
  fixed register is a caller-saved one no argument uses, then an argument
  register, then a callee-saved one, and an argument may be fixed in the
  register it arrives in. A return or tail call may then need a fixed
  register for an operand: it moves the fixed value aside, and
  `term-begin!`/`term-end!` put the compiler's register state back after the
  terminator, since the blocks compiled next are reached from elsewhere with
  the fixed values in place. (The first version spilled the displaced value,
  and a later block read a slot only the tail call's block had written: the
  self-host miscompile. The interim fix kept fixed values out of argument
  registers, which cost two moves per iteration of a self-recursive loop.)
- **A self tail call is a loop.** With its arguments in registers and no
  dynamic alloca, a function's tail call to itself jumps back past its
  prologue (`body-label`), reusing the frame, instead of an epilogue and a
  jump to the entry.
- **x86-64: a tail call needs no frame.** Only a real call (or a dynamic
  alloca) makes a function set up rsp; a tail jump restores what the
  prologue saved and jumps.
- **Debug info hooks** (TPDE has none): the adaptor's `inst-loc` and
  `inst-marked?`, and the core's line rows, marked-instruction offsets, static
  allocas' frame offsets and tracked values' sampled locations (all shifted
  with the prologue cut). Line rows are per source line, not per expression.
- **x86-64: a single-use PTRADD is fused into its load or store**
  (`[base + idx*scale + off]`), as TPDE's LLVM compiler fuses a GEP into its
  memory user. The TIR has no address arithmetic, so the differential is
  unaffected.
- **CIR folds ADDI into load/store offsets and drops unused pure
  instructions** (`finish!`), and shares small integer constants per function.
- **Narrow integer arguments carry their C size** (`AF-SIZE`, argument flags
  bits 24..26): Apple packs stack arguments at natural size, and CIR has only
  64-bit integers.

## Architecture

TPDE's layering, with C++ templates/CRTP replaced by Coil traits plus
monomorphization (same zero-cost specialization):

```
IR adaptor (trait)          ← TIR (test IR), Coil SSA, any other IR
  │
Analyzer                    RPO, loop tree, block layout, liveness
  │
CompilerBase                value assignments, register file, spilling,
  │                         PHI moves, calling-convention plumbing
Arch compiler (trait)       arm64 (AAPCS64 / Apple), x86-64 (SysV)
  │
Assembler                   sections, symbols, relocations, labels/fixups
  └─ object writers         Mach-O (first), ELF; in-memory JIT mapping
```

- `IRAdaptor.hpp` → a Coil `deftrait` with dense per-function value indices,
  block successors/instructions/phis, and two per-block scratch slots.
- The compiler core is generic over the adaptor; arch-specific hooks are a second
  trait (the C++ `derived()->…` calls).
- **TIR**, TPDE's toy text IR (`tpde/src/test/`), is ported first. It is the
  first adaptor, lets the core be tested and benchmarked without Coil's
  frontend, and lets us diff our output against the C++ reference on identical
  inputs.

## Using it in Coil

1. A lowering from Coil's monomorphized expression tree (`ast.coil` `Expr`) to a
   small SSA IR using Braun's algorithm, plus the adaptor for that IR.
2. `--backend tpde` in the driver's backend dispatch (`driver.coil`).
3. Apple arm64 ABI first (host): stack-only varargs, naturally packed stack args,
   caller-extended small ints, x18 reserved, `char*` `va_list`. Then x86-64 ELF.
4. `llvm-ir` bodies: reuse the subset the arm64 backend already lowers.
5. **Guaranteed tail calls.** Coil emits calls in tail position with scalar or
   pointer signatures as `musttail` even at -O0, and programs rely on it (the
   `memory` and `structcall` benchmarks recurse ~200M deep). TPDE has no tail
   calls, so this is new work in the call lowering (`codegen.coil`
   `tail-call-ok` defines which calls qualify).

### Package layout

```
src/tpde/adaptor.coil     IRAdaptor trait (TPDE's IRAdaptor)
src/tpde/analyzer.coil    RPO, loops (Wei et al.), layout, liveness
src/tpde/codegen.coil     IRCompiler trait: value parts, constants, isel hook
src/tpde/core.coil        CompilerBase: assignments, registers, spills, PHIs, calls
src/tpde/a64.coil         arm64 layer: CC (AAPCS64/Apple), frames, branches, veneers
src/tpde/a64/enc.coil     arm64 encoder
src/tpde/x64.coil         x86-64 layer: CC (System V), frames, branches
src/tpde/x64/enc.coil     x86-64 encoder
src/tpde/asm.coil         sections, symbols, relocations
src/tpde/macho.coil       Mach-O writer (arm64, x86-64)
src/tpde/elf.coil         ELF64 writer (x86-64)
src/tpde/jit.coil         in-process loader: an Asm into executable memory
src/tpde/buf.coil         byte buffer
src/tpde/tir/             TIR: parser/printer, adaptor, isel (the test IR)
src/tpde/cir.coil         CIR builder (Braun SSA)
src/tpde/cir/             CIR adaptor, arm64 and x86-64 isel
src/tools/                tpde-test (C++ tpde_test's CLI), tpde-check, tpde-bench
```

### JIT

`tpde.jit` loads a compiled `Asm` into this process without an object file:
`(jit-load asm x64? resolver)` gives a `JitImage`, `(jit-find img asm "f")` a
function's address, `(jit-free! img)` unmaps it. Text and branch stubs are one
mapping, made read-execute (W^X) after relocation with the instruction cache
flushed; data sections and the GOT follow on their own page, read-write. Every
relocation the arm64 and x86-64 layers emit is applied: arm64 `BRANCH26`
(through a stub when the target is outside the image),
`PAGE21`/`PAGEOFF12` and their GOT forms, `ABS64`; x86-64 `PC32`/`PLT32`
(stubbed), `GOTPCREL` and `ABS64`/`ABS32`. An undefined symbol is asked of the
client's resolver (`(resolver f ctx)`, `f : (ctx name len) -> address or null`),
then `dlsym`; one neither knows fails the load. `tests/jit_test.coil` (run by
`tpde-check exec`) compiles and runs TIR in-process on both architectures, with
calls out to libc and to a resolver-supplied function.

Coil's own JIT (`coil repl --backend tpde`, `coil.jit`'s `Tpde` backend) uses
tpde for code generation but loads through Coil's Mach-O loader, which keeps the
REPL's generations, symbol tables and reclamation.

The Coil side is `../coil/src/compiler/codegen_tpde.coil` (lowering, module,
pipeline) and `codegen_tpde_ir.coil` (the `llvm-ir` escape-hatch subset).

## Port notes

- Adaptor handles are `u32` (TPDE allows any 8-byte handle). Ranges are a count
  plus an indexed accessor.
- A `println` written directly in a loop body grows the stack each iteration
  (Coil bug, filed in the `coil-bugs` pad), so printing code calls a function
  per line.

## How we know we're done

### Correctness gates

| Gate | Passes when |
|---|---|
| Analyzer parity | TPDE's `tpde/test/filetest/analyzer/*.tir` produce identical RPO / layout / loop / liveness dumps |
| Codegen differential | Same TIR through C++ TPDE and through ours gives the same instruction sequence (modulo relocations and object format) |
| TIR execution | TIR programs run in-process (JIT) with expected results |
| Coil corpus | a `tpde` lane in `scripts/oracle.py` matches the LLVM reference on all of `tests/corpus` |
| C ABI | `scripts/tests/c-abi.py` passes with `--backend tpde` |
| Self-host | the Coil compiler built with `--backend tpde` builds itself to a fixed point and passes `dev.py test fast` |

### Performance gates (vs LLVM -O0)

| Metric | Measured with | Target |
|---|---|---|
| Backend compile time | `tpde-bench compile-time`: `--timings` spans, LLVM's `llvm-lower`+`llvm-optimize`+`object-emit` vs ours | ≥10× faster (TPDE's claim is 10–20×) |
| Generated code speed | `tpde-bench runtime` over `src/benchmarks`, built `-O0` vs `--backend tpde` | ≤1.0× LLVM -O0 runtime (Braun SSA should beat -O0) |
| Code size | text section size | ≤1.3× LLVM -O0 |
| Scaling | TPDE's `tpde-llvm/test/benchmark` generators (many-values, switch, irreducible loops, many-funcs, call-chain) rewritten for TIR / Coil | linear |
| Port quality | our TIR compile vs C++ `tpde_test` on the same large inputs | within 2× of C++ throughput |

Numbers live in [BENCH.md](BENCH.md): baseline, target and current value for
each row.

## Milestones

- **M0** Baselines: C++ TPDE reference built (`ref/`), LLVM -O0 numbers recorded, bench harness.
- **M1** Generic core: adaptor trait, TIR parser, Analyzer; analyzer parity gate green.
- **M2** arm64 codegen over TIR: register file, value assignments, CompilerBase,
  CompilerA64, Mach-O writer, Apple ABI; JIT execution tests and the C++ differential.
- **M3** Coil: tree → SSA (Braun) lowering, adaptor, `--backend tpde`; corpus lane green.
- **M4** Performance gates and self-host.
- **M5** x86-64: encoder, System V layer, ELF and Mach-O writers, TIR and CIR
  isel; Coil's `--backend tpde` for x86-64 Mach-O.

Status (2026-10-25): M0–M5 done; every gate above is green on arm64 and, run
under Rosetta, on x86-64 (BENCH.md).
