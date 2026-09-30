# The Coil Bytecode Interpreter

`src/compiler/interp.coil` is a bytecode interpreter for the self-hosted Coil
compiler. It consumes the **same monomorphized `Program`** the native backends
consume — the output of `parse -> resolve -> check -> mono` — compiles each
mono'd function to a compact stack-bytecode ISA, and executes it on a small VM
with a **real memory model**. It is reached only through the additive
`coil interp <file>` driver subcommand; the compile pipeline and the native
backends are byte-unchanged.

    coil interp src/examples/fib.coil ; echo $?     # => 55
    coil interp src/examples/extern.coil            # => prints 12345 (via libc putchar)

`main`'s `i64` return **is** the process exit code. Program stdout goes to real
stdout (the VM calls real libc).

This document is the contract later agents extend against: the ISA, the value and
memory model, the frame layout, and FFI dispatch. Keep it in sync with the code.

## Design in one sentence

Compile each `Func` to stack bytecode where **every value is one 8-byte cell**
(`i64`, or a float's bit pattern, or a real host pointer), execute it against
**genuine process memory** (real `malloc` heap, a malloc-backed per-frame buffer
for `alloc-stack`, real loads/stores), and dispatch `extern` calls to **real
native libc functions** — so pointer arithmetic, casts, and FFI behave exactly as
in compiled code, because they *are* the same operations on the same memory.

## Value model

A VM value is a single `i64` cell, mirroring codegen_a64's `AVal`:

| Coil value        | cell contents                                             |
|-------------------|-----------------------------------------------------------|
| `i8..i64`, `bool` | the integer, sign/zero-extended to the type's width       |
| `f32` / `f64`     | the IEEE-754 **bit pattern** (round-tripped via memory)   |
| `(ptr T)`, `(ref T)`, `(fnptr …)` | a **real host address**                   |
| aggregate by value (struct/sum/slice) | the **address** of its bytes (a frame slot) |

Floats are bit-cast to/from `i64` through a one-word memory round-trip
(`bits->f64`/`f64->bits`, etc.), the idiom the language guide prescribes for
bitcasts. Integer results are canonicalized to their exact width after each
arithmetic op (the "container invariant": a value in a cell is always
sign/zero-extended from bit N-1), matching `emit-canon-int!`.

## Memory model

Pointers are **real addresses in this process**. There is no sandboxed linear
memory — the interpreter runs in-process, so a pointer handed to `printf` or read
by pointer arithmetic is a genuine address.

- **Heap** (`(alloc … :heap)`, storage 2): real `malloc(size)`; `(primitive/free p)` is
  real `free`.
- **Static** (`alloc-static`, storage 1): a `malloc`'d, zeroed region (leaked for
  the process lifetime — statics live forever).
- **Stack** (`alloc-stack`, storage 0): bump-allocated from the call's **frame
  memory** (see below). Returns a real address, valid for the frame's lifetime.
  `alloc-stack-bytes` (`ALLOCDYN`) takes its run-time byte count from the same
  memory, 16-aligned.
- **Loads/stores** (`ELoad`/`EStore`, and mut-cell access): real
  `load`/`store` at the address, at the value's byte width (1/2/4/8), with
  sign/zero extension chosen by the pointee type (`mem-load`/`mem-store`).

Byte sizes and alignments (`isize-of`/`ialign-of`) agree with the native
backends' `ty-size`/`ty-align` for scalars, pointers (8), slices (16 = `{ptr,
len}`), arrays, and vecs — so layouts seen across the FFI boundary and by pointer
arithmetic are identical to compiled code.

## Frame layout

Each function activation (`vm-exec`) mallocs three regions and frees them on
return:

- **locals**: an `i64[nlocals]` array. Parameters occupy locals `0..nparams`;
  every `let`/temporary binding gets the next slot. A local holds a value cell
  directly. A `(mut x)` binding instead holds a **pointer** to a frame-buffer cell
  (see `MUTCELL`), so `(primitive/load x)`/`(primitive/store! x v)` lower to real `ELoad`/`EStore` —
  exactly as the type-checker already rewrote them.
- **frame memory** (`FrameMem`): a chain of malloc'd chunks bump-allocated in
  order, backing `alloc-stack`, `alloc-stack-bytes`, `(mut …)` cells, spilled
  refs, and string-literal slices. A request that does not fit the current chunk
  starts a new one at least as large, so addresses never move and a frame has no
  size limit.
- **operand stack** (`VStack`): an `i64[]` that doubles when an expression nests
  deeper than it has room for. Bytecode is stack-machine code: operands are
  pushed and popped here. A call's arguments are popped at once (`vpop-n`) and
  the callee reads them in place.

Calls recurse through the **host call stack** — `OP_CALL` invokes `vm-exec`
re-entrantly — so Coil recursion (e.g. `fib`) maps onto native recursion. The
whole interpreter runs on the driver's 512 MiB pipeline pthread, so deep
recursion has room.

## The bytecode ISA

One instruction is `Instr {op, a, b, c}` (four `i64`s). A function is an
`ArrayList Instr` plus `nlocals`. Jump targets are resolved from label ids to
instruction indices after the body is emitted (`resolve-labels`).

Compilation is single-pass and type-directed: `compile-expr` emits an
expression's code (leaving exactly one value on the operand stack unless the path
diverged) and **returns its static `Type`** — the direct analogue of
codegen_a64's `emit-expr` returning an `AVal`. Types flow upward so arithmetic
opcodes know int-vs-float, width, and signedness.

| op | name         | operands                     | effect |
|----|--------------|------------------------------|--------|
| 1  | `IMM`        | a=value                      | push a |
| 2  | `GETLOCAL`   | a=slot                       | push locals[a] |
| 3  | `SETLOCAL`   | a=slot                       | locals[a] = pop |
| 4  | `POP`        |                              | discard top |
| 5  | `ALLOCA`     | a=size b=align               | push frame-alloc(size,align) (uninit) |
| 6  | `LOAD`       | a=size b=signed              | addr=pop; push mem-load(addr,size,signed) |
| 7  | `STORE`      | a=size                       | v=pop; addr=pop; mem-store; push 0 (unit) |
| 8  | `BIN`        | a=op b=mode c=signbits       | r=pop; l=pop; push binop(l,r) |
| 9  | `CMP`        | a=op b=mode c=signed         | r=pop; l=pop; push (0/1) |
| 10 | `NOT`        | a=isbool                     | v=pop; push logical/bitwise not |
| 11 | `JMP`        | a=target                     | pc = a |
| 12 | `JZ`         | a=target                     | v=pop; if v==0 pc=a |
| 13 | `CALL`       | a=funcidx b=nargs            | pop nargs; push vm-exec(a, args) |
| 14 | `CALLEXT`    | a=externidx b=nargs          | pop nargs; push extern-call(a, args) |
| 15 | `RET`        |                              | retval = pop; halt |
| 16 | `ICANON`     | a=bits b=signed              | v=pop; push canon-int(v,bits,signed) |
| 17 | `I2F`        | a=fbytes b=srcsigned         | int -> float bits |
| 18 | `F2I`        | a=destbits b=destsigned c=srcfbytes | float -> int (toward zero) |
| 19 | `F2F`        | a=destbytes b=srcbytes       | f32 <-> f64 |
| 21 | `MUTCELL`    | a=slot b=size c=is_agg       | pop v; cell=frame-alloc; is_agg? memcpy(cell,v,size) : store v; locals[a]=cell |
| 22 | `FREE`       |                              | addr=pop; real free(addr); push 0 |
| 23 | `ALLOC_HEAP` | a=size                       | push (i64) malloc(size) |
| 24 | `ALLOC_STATIC`| a=size                      | addr=malloc(size); zero; push addr (per-call; sites bake a persistent addr instead) |
| 30 | `STRSLICE`   | a=ptr b=len                  | frame slot {ptr,len}; push its addr |
| 31 | `ALLOCZ`     | a=size b=align               | frame-alloc + zero; push addr |
| 32 | `LOADAGG`    | a=size b=align               | addr=pop; slot=frame-alloc; memcpy(slot,addr,size); push slot (by-value copy) |
| 33 | `STOREAGG`   | a=size                       | src=pop; dst=pop; memcpy(dst,src,size); push 0 |
| 34 | `FIELDPTR`   | a=offset                     | addr=pop; push addr+offset |
| 35 | `INDEX`      | a=elemsize                   | idx=pop; base=pop; push base+idx*elemsize |
| 36 | `TRAP`       |                              | hard-error (non-exhaustive match reached) |
| 37 | `BITGET`     | a=low b=width c=signed\|(backbytes<<1) | addr=pop; load backing; shift/mask/sign-extend field; push |
| 38 | `BITSET`     | a=low b=width c=backbytes    | val=pop; addr=pop; clear field, OR (val&mask)<<low, store; push val |
| 40 | `LLVMIR`     | a=iridx b=nargs              | pop nargs; push ir-run(irs[a], args) (interprets an inline-IR body) |
| 42 | `CALLPTR`    | a=nargs b=native call site   | pop nargs; pop fnptr; an interpreted function's pointer runs vm-exec(fidx, args), any other address is the native call at site b (-1: none possible) |
| 44 | `SAVESP`     | a=local                      | locals[a] = operand-stack depth (loop entry) |
| 45 | `RESTORESP`  | a=local                      | operand-stack depth = locals[a] (break/continue out of an expression) |
| 43 | `BOXEXT`     | a=size b=align               | v=pop; slot=frame-alloc; store the packed <=8B C aggregate return; push slot (built-in table calls only) |
| 46 | `ALLOCDYN`   |                              | n=pop; push frame-alloc(n rounded up to 16, align 16) (`alloc-stack-bytes`) |
| 47 | `CALLNATIVE` | a=call site b=nargs          | pop nargs; push the result of the native C call at site a (see FFI) |

Aggregates (struct/sum/slice/array/vec) are carried **by address**: a cell holds
the address of the bytes. `LOADAGG`/`STOREAGG` copy; `FIELDPTR`/`INDEX` are
pointer arithmetic; `EConstruct`/`EMatch` build and destructure the sum's
`{i32 tag, payload}` at the same offsets the backends use. A function's aggregate
return is copied into a caller-provided `retbuf` before its frame is freed.
With native calls (below), an interpreted function's pointer is the address of
its native **thunk**, so C code can call it; `CALLPTR` maps a thunk back to its
function and calls any other address natively. Without them, function pointers
encode `2^51 + fidx`. `alloc-static` sites allocate one persistent zeroed region
at compile time and bake its address; `(alloc-static T :as "sym")` sites share
one cell per symbol, and a second definition is the same error a link reports.

### `BIN` / `CMP` operand encoding

- `mode`: 0 = integer, 1 = `f32`, 2 = `f64`.
- integer `BIN` `signbits` (`c`) packs `signed | (bits << 1)` so the result can be
  canonicalized to width `bits` afterward.
- `BIN` op codes match codegen_a64's `emit-bin`: `0 add 1 sub 2 mul 3 div 4 rem
  5 udiv 6 urem 7 and 8 or 9 xor 10 shl 11 shr`. Signed vs unsigned div/rem/shr
  chosen from the type's signedness.
- `CMP` op codes: `0 lt 1 le 2 gt 3 ge 4 eq 5 ne`. Unsigned integer comparisons
  use a sign-bit-flip trick; float comparisons use the ordered `fcmp-*` ops.

### Control flow and divergence

`compile-expr` tracks a `term` (terminated) flag on the builder, mirroring
codegen_a64's `terminated`. `break`/`continue` set it; `EIf` merges the flags of
its branches; sequence compilation stops emitting after a terminated statement
(dead code). Each non-diverging path pushes exactly one value, so the operand
stack stays balanced at control-flow joins. Loops allocate a hidden result local:
`break v` stores `v` there and jumps to the break label; the loop expression's
value is that local. `continue` jumps to the loop's top label — which is *before*
the body, so a `for`-macro's top-of-loop increment still runs (matching C `for`).

## FFI dispatch

### Native calls (AArch64 macOS, x86-64 Linux)

`src/compiler/native_call.coil` calls C functions whose signature is known only
at run time, the way libffi does:

- **Outgoing.** An `extern` call resolves its C symbol with `dlsym` in this
  process and compiles to `CALLNATIVE`. `nc-plan` classifies the call under the
  host C ABI (Apple AAPCS64 with its packed stack arguments and 8-byte variadic
  slots; SysV x86-64 eightbyte classes) into pieces: which bytes of which
  argument go to which integer register, vector register (full 128-bit) or stack
  offset, and where the result comes back. `nc-invoke!` fills a `NativeFrame`
  from the plan and runs a trampoline, emitted once with the backends' own
  assemblers into read+execute pages, that loads the registers and the stack
  image, calls the function, and stores the return registers. Variadic calls,
  structs of any size in either direction (by value, by reference, homogeneous
  float aggregates), and results through a caller-provided pointer are covered.
  A `call-ptr` to an address that is not an interpreted function is the same
  native call, planned from the function-pointer type.
- **Callbacks.** An interpreted function's pointer is a native thunk that loads
  the address of its `{context, function}` record and enters a shared stub; the
  stub saves the argument registers into a `NativeFrame` and calls
  `interp-callback-dispatch`, which reads the arguments with the same plan, runs
  the function, and leaves the result for the stub to return. The plan comes
  from the C-level signature (for `fnptr-of` a function taking a struct by
  value, the checker's by-value C entry), fixed when the pointer is taken. A
  function whose signature has compile-time-only types cannot be called from C,
  and says so if it is.
- **State.** Call-site plans, callback plans and the thunk table live in a
  malloc-backed `IFfiCtx` that a retained snapshot of the interpreter shares
  rather than copies (compiled bytecode names call sites by index and function
  pointers by thunk address). It is released with the compilation unit.
- **Threads.** `pthread_create` is the real one, reached through
  `interp-pthread-create`, which raises the new thread's stack to the size the
  compiler gives its own pipeline (interpreted frames are far larger than
  compiled ones). The IR's atomics are performed atomically (a compare-and-swap
  on the aligned 8-byte word containing the value), and inline-IR scratch
  memory is per run, so interpreted threads run concurrently.

`coil interp` resolves symbols among the images loaded in its own process: libc,
libm and the system libraries. A program's own C library must be loaded into the
process (for instance with `DYLD_INSERT_LIBRARIES`/`LD_PRELOAD`); an `export-c`
symbol of the interpreted program is not visible to C by name.

### The built-in table

Without native calls (a wasm build of the compiler), and for an extern this
process has no symbol for when a metaprogram host hook is installed, extern
calls (`CALLEXT`) go through a **builtin table** (`extern-call`): the extern's C
symbol selects a real libc call with the correct signature, and the `mh_*`
metaprogram host functions go to the hook. The libc symbols are declared as
module-qualified `coil.compiler.interp.*` externs (so the Coil scope name never
collides while the C symbol is the real one, e.g. `interp.write` -> `write`),
with signatures matching the compiler's existing declarations of those symbols.
An extern in neither is a **hard error**.

## What is implemented and what hard-errors

Implemented end-to-end (verified by `python3 scripts/dev.py test interpreter`):
integer + float arithmetic and comparisons (incl. unsigned logical right shift and
float remainder via `fmod`), `bool`, casts (int width, int↔float honouring source
signedness, float↔float, pointer/fnptr identity), `let`/`(mut …)` locals, `if`,
`do`, `loop`/`while`/`for`/`break`/`continue`, direct calls and recursion,
`alloc-stack` / heap / persistent static allocation, pointer `load`/`store`,
`sizeof`/`alignof`/`offsetof`, string and cstring literals, spilled refs;
**structs** and **sums** (layout, `EField`, `EIndex`, `EConstruct`, `EMatch`,
aggregate load/store/return by value), **bit-structs** (`EBitGet`/`EBitSet`),
**function pointers** (`EFnPtrOf`/`ECallPtr`), **trait objects**
(`EMakeDyn`/`EDynDispatch` over a compile-time vtable), **inline LLVM IR**
(`ELlvmIr`: slice extract/insert, vector `fadd/fsub/fmul`/`insertelement`/
`shufflevector`/fma/reduce, atomic load/store/`atomicrmw`/`cmpxchg` performed
atomically), `alloc-stack-bytes`, named `alloc-static`, native C calls and
callbacks (above), real threads, and program **argc/argv**.

What raises a clear `idie` hard error, never a silent stub: an extern with no
symbol in the process (and no host hook), a callback into a function whose
signature C cannot express, and a `declare`d (prebuilt) function, whose machine
code is in another unit's object.

## Gate

There are two gates, both over `tests/compiler/oracle/arm64/corpus.txt` (all 44
`src/examples/` programs plus the 12 `tests/` programs = 56 entries). Runtime equality
with the compiled program is the contract.

**`python3 scripts/dev.py test interpreter --compiler <coil-bin>` — the contract
gate (56/56).** For every corpus program it BUILDS the program (default backend,
or `--backend arm64` for the `R`-marked inline-asm `:shim` programs, exactly as the
corpus declares), runs the compiled binary, and diffs its stdout+exit against
`coil interp` on the same source. This checks the interpreter against LIVE compiler
output — the direct, strongest form of "interp == codegen". `argv[0]` is an
invocation artifact, not program behavior (a compiled binary reports its own
filesystem path; an interpreter reports the source path it was handed), so the
compiled side is invoked with `exec -a <srcpath>` and BOTH sides see the identical
`argv[0]` (= the source path). This normalization is applied **uniformly** to all
56 programs: for the 54 that never read `argv[0]` it changes nothing; for
`src/examples/args.coil` and `src/examples/everything.coil` (which `puts(argv[0])`) it
makes the diff a comparison of program *semantics* rather than of where the binary
happens to live. Nothing is faked, skipped, or special-cased.

**`python3 scripts/oracle.py interpreter snapshot --compiler <coil-bin>` — the snapshot gate (54/56).**
This diffs `coil interp` against the frozen LLVM reference snapshots in
`tests/compiler/oracle/arm64/reference` (the same snapshots the arm64 backend gate uses).
It reports **54/56**: the two "failures" are `src/examples/args.coil` and
`src/examples/everything.coil`, whose snapshots bake the *compiled binary's* path
(`/tmp/coil-arm64-fixed-…`) as `argv[0]` — a filesystem location an interpreter
structurally cannot and should not reproduce (fabricating it would be a hardcode,
not a real result). Both programs otherwise run identically. The contract gate
above resolves this honestly by normalizing `argv[0]` on both sides rather than
comparing against a path frozen into a snapshot.
