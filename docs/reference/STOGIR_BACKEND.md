# The Stogir backend

`--backend stogir` and `--backend declarative` both select the declarative
backend: a code generator written as a set of small languages in the
coil-stogir-declarative project and written out as Coil into `src/compiler/declarative/` by that project's
`tools/expand.sh` (see its `NOTICE`). Edit it there, never here.
It replaced the earlier Stogir library, which this tree vendored under
`src/compiler/stogir/` until it was removed; that history is in git and in
`docs/benchmarks/`.

## What it compiles for

It generates code for the machine the compiler itself was built for: AArch64
macOS (Mach-O) or x86-64 Linux (System V, ELF). Any other target is refused
with a message naming both. It shares the AST-to-CIR lowering with TPDE
(`backend/codegen_tpde.coil`); the TPDE selector and allocator are not used.

- `-O0` and `-O1`: selection and register allocation, one function at a time.
- `-O2` and `-O3` (the same): the whole module at once, with inlining, copy
  forwarding across functions, and the optimizer.
- `-g`: debug information. Functions are compiled one at a time, frame objects
  stay in memory, and a value that lives only in registers has no location.
  A call in tail position is still a tail call, at every level, so a debugger
  does not show its caller's frame.

## Settings

Read from the environment when compiling. Those that change the code are part
of a unit's key (`cli/units.coil`).

| variable | effect |
|---|---|
| `DECLARATIVE_SMALL`, `DECLARATIVE_GROWTH`, `DECLARATIVE_ONCE` | inlining limits |
| `DECLARATIVE_OFF=BITS`, `DECLARATIVE_OFF_AT=N` | turn single transformations off (numbers in the backend's `cfg.pass`) |
| `DECLARATIVE_TRIAL`, `DECLARATIVE_ONLY` | optimize or try something in only the first N functions |
| `DECLARATIVE_SHOW=NAME` | print a function's graph before and after, and its code |
| `DECLARATIVE_THREADS=N` | how many threads compile a module's functions (the object is the same for every count) |
| `COIL_TPDE_SERIAL=1` | one thread for everything |

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

## Tests

In this tree: the `stogir`, `declarative` and `declarative-debug` lanes of
`scripts/oracle.py`, the Stogir rows of `scripts/tests/fast/cli.sh objects`,
`scripts/tests/declarative-unit-settings.py`, `scripts/tests/declarative-threads.py`
and the sweep against LLVM, `scripts/tests/stogir-x86-sweep.py`. In
coil-stogir-declarative: `tools/check.sh` (every rewrite rule against the
nodes' meanings, random programs interpreted against compiled with a count of
what each transformation did, linking), `tools/coil-cycle.sh` (the corpus,
the compiler rebuilding itself to the same object), `tools/coil-stress.sh`
(the same under large inlining limits), `tools/coil-debugger.sh` (what lldb
shows, against LLVM's -g build) and `tools/coil-sweep.sh`.
