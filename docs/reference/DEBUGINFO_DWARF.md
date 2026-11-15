# DWARF debug info

Every backend describes a program to `lldb`/`gdb` the same way: source lines,
functions, parameters and locals, and their types. A debug build (the default:
`coil build` without `--release`) emits it; `--release -g` adds it to an
optimized build, and `-g0` (or `--no-debug`) turns it off.

| Backend | How a variable is found |
|---|---|
| native (`--backend native`, a debug build's default) | parameters and mutable variables: a shadow slot; immutable `let`s: location lists, below `-O2` |
| LLVM (`--backend llvm`) | `llvm.dbg.declare` on its storage |

A debug build keeps every function's debug frame, so a parameter stays visible
after its last use.

    coil build src/examples/fib.coil -o /tmp/fib
    lldb /tmp/fib
    (lldb) breakpoint set --file fib.coil --line 7
    (lldb) run
    (lldb) frame variable

On macOS a build that emits DWARF gathers `<exe>.dSYM` next to the executable
(`coil run`, whose executable is temporary, does not unless asked with `-g`).

## One model, every backend

`src/compiler/backend/debuginfo.coil` holds what does not depend on the backend: the
translation of Coil types to debug types over the shared `LayoutDb`
(`dbg-ty-of!`), and which names a debugger is shown (`dbg-name?`: not the
checker's `$` temporaries, not the `x.slot` half of a mutable local).
`src/compiler/object/dwarf.coil` turns the records (functions, variables, line rows,
types) into `__debug_info` / `__debug_line` / `__debug_str` / `__debug_abbrev`
(and `__debug_loc`) for the native backends; the LLVM backend hands the same
records to LLVM's DIBuilder (`codegen.coil`, "debug info").

Types: integers, bools and floats are base types; pointers, references and
function pointers are pointers; slices are `{data, len}`; arrays are arrays;
structs are structs; a packed bit struct is an unsigned integer; a **sum** is a
struct of its `tag` (an enumeration of the variant names) and a `payload`
union of the variants:

    (lldb) p sh
    (app.Shape) {
      tag = app.Rect
      payload = { app.Circle = (r = …)  app.Rect = (w = 3, h = 4) }
    }

Read `tag`, then the payload member it names.

## The native backend: variables in registers

The native backend keeps values in registers that change, so a variable needs a
location the debugger can read without slowing the program:

- **Parameters and mutable variables** have a shadow slot in a per-function
  debug frame: binding stores the value there, and every assignment to a
  mutable variable stores again. They are visible with their current value for
  the whole scope.
- **Immutable `let`s** cost no code: below `-O2`, as each instruction is
  written, the compiler notes where the value is (a register, its spill slot,
  or nowhere) when that changes, and the variable gets a location list. A value
  a debugger follows is always computed (never folded into what reads it) and
  kept until the end of its region. From `-O2`, a value only in registers has no
  location.
- **Constants** are described as their value.
Compile time: debug info is encoded on its own thread.

## Relocations (the part that makes `dsymutil` work)

On Mach-O the linker records a debug map pointing at the temporary `.o`, so a
build that emits DWARF runs **`dsymutil`** to gather `<exe>.dSYM` before that
object is removed. Every DWARF address carries a relocation — the CU's and each
subprogram's `low_pc`, each lexical block's, and the line program's
`set_address` (one per function in the native backend's line program) — as an 8-byte
**unsigned section relocation** against `__text` with the offset as the addend,
clang's Mach-O scheme. Location list entries are relative to the CU's base and
need none. Without the relocations `dsymutil` rejects the object ("No valid
relocations found. Skipping.").

On ELF (the native backend for Linux x86-64) the same addresses are
`R_X86_64_64` relocations against a symbol at the start of `.text`, and the
linker resolves them; there is no separate gathering step.

## Gaps

- Function-name breakpoints need the module-qualified name (`app.add`).
- The native backend's line rows are per line (the column is that of the line's
  first expression).
- The native backend describes a variable whose value is an address into the
  frame as that address (a pointer); `p *q` shows the value.
- No lexical blocks in the LLVM backend: every local is visible in its whole
  function.

Gated in FAST's `cli/debuginfo` step (`scripts/tests/fast/cli.sh`): a line
breakpoint from the `.dSYM` alone, and on each macOS backend (native in a debug
build, LLVM with `-g`) parameters, locals, a sum and a struct at a line
breakpoint; `-g0` gathers nothing.
