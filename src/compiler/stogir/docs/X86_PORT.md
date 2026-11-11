# x86-64 port

Working design for the x86-64 backend. Everyone working on the port reads this
first. It records decisions; change it in the same commit as the code when a
decision changes.

## Scope and bar

- Target: x86-64 Linux, System V ABI, ELF objects, Linux JIT. macOS x86-64 later.
- Baseline CPU: plain x86-64 (SSE2). No BMI, LZCNT, POPCNT, SSE4.1, AVX or FMA
  unless a function is compiled with an explicit feature option (none exist yet).
  This matches what the LLVM backend it is measured against targets by default.
- Done means the two project goals hold on the Linux host for the compiler
  bootstrap: generation wall time at least 5x faster than parallel LLVM O3, and
  the Stogir-built compiler within 1.10x of the LLVM-built compiler's runtime.
- Correctness, JIT and AOT, and the pinned upstream architecture are preserved.
  The reference for instruction selection and constraints is upstream
  `ir_x86.dasc` (`/Users/jimmyhmiller/Documents/Code/open-source/ir`).
- AArch64/macOS must keep passing unchanged. Neutral code that changes is
  re-tested on the Mac.

## Layout

- `src/stogir/x64/*.coil`, module names `stogir.x64.NAME`, mirroring the `a64`
  file names wherever the same job exists (`compile`, `function`, `match`,
  `select`, `emit`, `constraints`, `allocate`, `call`, `call-abi`, ...).
- `src/stogir/native/compile.coil` (`stogir.native.compile`) and
  `src/stogir/native/private-leaf.coil`: the same public API as
  `stogir.a64.compile` / `stogir.a64.private-leaf`, forwarding to the backend of
  the target being compiled for (`stogir.target/arch-pick`). Embedders and
  target-neutral tests import these. The facade imports only the chosen backend
  (the import itself is inside `arch-pick`), so a backend's signature mismatch
  shows up when compiling for that machine. `object` is built in the facade from
  `image` and `stogir.aot.native`; a backend does not provide it.
- `src/stogir/native/private-types.coil`: the private `Context` / `Publication`
  types and option switches shared by both backends (today a re-export of the
  definitions in `stogir.a64.private-leaf`).
- `src/stogir/jit/native.coil`, `src/stogir/aot/native.coil`: JIT and object
  writing for the target (Mach-O on Darwin, ELF on Linux).
- Logic that is target-neutral but lives under `a64/` today (phi coalescing,
  the parallel-move skeleton, the node walk) is moved to `src/stogir/` and
  shared when an x64 file would otherwise be a copy. Moving is preferred over
  copying; a copy needs a reason written at the top of the file.
  Moved so far: `stogir.phi-coalesce` (was `stogir.a64.phi-coalesce`),
  `stogir.tail-eligibility` (the target-neutral proofs of
  `stogir.a64.tail-plan`). `x64/private-leaf` uses the context, registry and
  publication functions of `stogir.a64.private-leaf` as they are (its neutral
  state types are exported for that); only leaf creation, the clobber mask,
  reference validation and binding are x86-64's own.
  Also moved: `stogir.reciprocal` (the magic-number recipes of `stogir.a64.reciprocal`)
  and `stogir.view-coalesce` (the view joining of `stogir.a64.coalesce`;
  each backend's `coalesce` module says which nodes are views).
  The x64 driver, transfers and fixups are written again rather than shared,
  each with its reason at the top of the file (4-byte words, AArch64
  scratches, shrink-wrapping interleaved with the node walk).
- `src/stogir/x64/families.coil` classifies every node into the core or one
  operation family and is the only dispatch to the family modules;
  `docs/X86_FAMILIES.md` describes the extension points.
- `src/stogir/x64/testing.coil` is test support (graph shorthands, a
  reference evaluator, calling generated code); only tests import it.

## Registers

Library register numbers: general registers 0..15 are the hardware numbers
(rax 0, rcx 1, rdx 2, rbx 3, rsp 4, rbp 5, rsi 6, rdi 7, r8..r15); XMM
registers are 32..47.

| Role | Registers |
|---|---|
| Never allocated | rsp, rbp (frame anchor), r10 and r11 (scratch), xmm14 and xmm15 (scratch) |
| Caller-saved, allocatable | rax rcx rdx rsi rdi r8 r9; xmm0..xmm13 |
| Callee-saved, allocatable | rbx r12 r13 r14 r15 |
| Integer arguments | rdi rsi rdx rcx r8 r9 |
| Float arguments | xmm0..xmm7 |
| Results | rax, rdx; xmm0, xmm1 |
| Indirect call target, tail-call target | rax (r11 for a variadic call, where al is the vector count) |
| Parallel-move cycle holder | r11, xmm15 |

Two scratch registers per bank mirror a64's x16/x17 and v30/v31 so emitters
keep the same shape. Freeing rbp and one scratch for allocation is a later
tuning step, not part of the first correct version.

Scratch roles: r10 carries an emitter's first operand when it is a constant
or a reload, and is the data scratch of memory-to-memory transfers; r11
carries the second operand and is the cycle holder (xmm14 and xmm15
likewise). Nothing lives in a scratch between two nodes.

## Integer values in registers

A value of type T is defined in the low `8 * size(T)` bits of its register;
every higher bit is unspecified, also for 32-bit values, for parameters and
after a spill and reload. BOOL is a byte holding 0 or 1. Low-bit arithmetic
(ADD SUB MUL AND OR XOR NOT NEG SHL, moves, cmovcc) runs at 32 bits for every
type of at most four bytes and at 64 bits otherwise; operations that read the
high bits (compares, SHR, SAR, rotates, the truth test) use the 8- and 16-bit
instruction forms at the type's own width; DIV and MOD extend narrow operands
to 32 bits. A returned value is extended to 32 bits by its signedness. The
rule is written out at the top of `x64/value.coil`.

Views. Because the bits above a value's width are unspecified, the low part
of a wider value is already a valid narrower one: COPY, a same-size integer
BITCAST and every integer TRUNC are *views*. They are emitted as nothing when
source and result share a register and otherwise as a move of the whole
64-bit register, and `x64/coalesce.coil` joins each with its source into one
allocation group (`stogir.view-coalesce`). The whole-register move matters:
a narrow view can share its group with a 64-bit value that lives on, so a
move at the view's own width would cut that value. A conversion to BOOL is
not a view (it canonicalizes to 0 or 1), nor is SEXT or ZEXT.

Results the IR leaves undefined, chosen to match the AArch64 backend:
CTLZ(0) is the type's width; CTTZ(0) is 64 for 64-bit types and 32 for
every narrower type; ABS of the minimum is the minimum.

## What x86 needs that a64 did not

1. **Two-address instructions.** `op rd, rm` overwrites rd. The emitter
   produces `mov rd, rn; op rd, rm`; when rd = rm it commutes the operation if
   it can, and otherwise goes through r11. The definition gets a `Part.hint`
   to its first operand so the move usually disappears.
2. **Fixed registers.** Expressed with `allocation/reserve!` clobbers and
   advisory preferences, not with fixed uses. A kind-2 fixed *use* (at the
   even operand position) cannot always be allocated: when the operand lives
   on past the instruction and its fixed register is already promised from
   the definition position (the result's coalesced PHI group holds it across
   a lifetime hole), the operand would have to change register at an odd
   position, which only calls lower, and the allocator reports "eviction did
   not make a register available". The differential stress test hit this
   about once in 30 000 functions with a fixed rcx count. Kind-2 fixed
   *definitions* remain fine (register parameters, later call results).
   - Variable shifts and rotates: rcx is clobbered over the operand position
     `[2i, 2i+1)`, so no operand and no live value is in it; the emitter copies
     the count into ecx (masking it for 8- and 16-bit values, whose hardware
     count is taken modulo 32). The result may be rcx; the emitter then
     shifts in a scratch register.
   - `div`/`idiv`: rax and rdx are clobbered over `[2i, 2i+1)`; the register
     that does not hold the result stays clobbered over `[2i+1, 2i+2)`; the
     result prefers rax (DIV) or rdx (MOD) and is moved when it landed
     elsewhere. The dividend is copied into rax, a constant divisor into r11.
     Division by zero and the overflowing signed quotient trap (#DE); the IR
     leaves both undefined and nothing is checked. AArch64 hardware returns
     0 / the dividend / the minimum for those inputs, and
     `tests/jit-division.coil` checks exactly those results on AArch64 and,
     on x86-64, that the same inputs die with SIGFPE. Trapping matches what
     an LLVM-built program does on x86-64. Division by a constant other
     than 0, 1 and -1 uses no `div` (`x64/reciprocal.coil`: shifts for
     powers of two of either sign, multiply-high otherwise); 0, 1 and -1
     keep the hardware division and with it the trap.
   - One-operand `mul`/`imul` follow the same pattern (clobber, copy in,
     prefer): unsigned 64-bit MUL_OV (`x64/checked.coil`) and the 64-bit
     multiply-high of division by a constant (`x64/reciprocal.coil`).
     `cmpxchg` (atomics, not written yet) will too.
3. **Flags.** Almost every ALU instruction writes flags. Rules:
   - Moves emitted between any two nodes (spills, reloads, phi moves, constant
     and address materialization) never write flags: `mov`, `lea`, `movaps`,
     `mov r, imm`. `xor r, r` zeroing is used only by emitters that know no
     flag value is live across it.
   - A compare is emitted directly before its consumer (`jcc`, `setcc`,
     `cmovcc`), as a64 already repeats compares per user. Every operand load
     and constant comes before the compare; after it only `mov` (COND arms,
     edge moves, `movzx` after `setcc`) is emitted.
   - No flag value is live between two nodes, so a node's own code may use
     any instruction once its last flag consumer is emitted (DIV zeroes edx
     with `xor`). The one exception: a checked producer (ADD_OV, SUB_OV,
     MUL_OV) leaves its overflow condition in the flags for the OVERFLOW
     projection, which the schedule keeps directly behind it
     (`stogir.checked-schedule`); only allocator transfers, which are moves,
     can sit between the two (`x64/checked.coil`, as NZCV on AArch64).
   - Floating compares use `ucomiss/ucomisd` and handle the parity flag for
     unordered operands exactly as upstream's `ir_emit_cmp_fp` does
     (`x64/fcompare.coil`): each predicate picks the operand order whose one
     condition code is right for unordered operands, and only EQ and NE need
     parity too. A condition handed to a flag consumer is therefore an
     *extended condition*: a condition code, or a code "and not parity" / "or
     parity". IF takes two branches for those (`edges/branch-edge-parity!`),
     a BOOL two `setcc`, an integer COND two `cmovcc`.
   - SSE instructions other than the compares never write EFLAGS, so `xorps`
     zeroing, `movaps`/`movss`/`movsd`, `andps`, `pcmpeqd` and the like may
     sit between a flag producer and its consumer, unlike `xor r, r`.
4. **Variable-length code.** Offsets are bytes. A branch is emitted as rel32
   with a fixup record (`x64/fixups.coil`: the instruction's first byte, its
   displacement field, its label, its condition, and whether it is short);
   labels are a table of byte offsets. There are no veneers in text. Once a
   function's code, edge stubs and jump tables are emitted, `fixups/relax!`
   shrinks every `jmp`/`jcc` whose displacement fits rel8, iterating to a
   fixed point (branches only shrink), inserts alignment padding, and moves
   every recorded offset: labels, branch records, jump-table words and
   bases, the buffer's references and text-data ranges. A branch that crosses
   an alignment point is charged that point's full padding limit, so no
   later padding can push a shrunk branch out of reach. Then the
   displacements are written and `fixups/verify` decodes every branch again
   and checks its target (in every compile; it is a few instructions per
   branch). The floating constant pool is appended after all of this.
   - Loop tops are aligned to 16 bytes with multi-byte NOPs when a jump
     really goes back to them and the padding is at most 10 bytes
     (`fixups/loop-alignment` is the policy; `function/loop-top-candidate?`
     names the labels that ask). Functions are aligned to 16 bytes.
   - Jump tables are 32-bit `target - table` words behind the function's
     code, 4-byte aligned, reached with `lea r11, [rip + table]` (an ADDRESS
     fixup record).
   - What the last instruction left in the flags is recorded with the buffer
     (`x64/code.coil`, `Flags`): a compare with zero directly behind the
     instruction that produced the value emits nothing, and its consumer
     reads a condition those flags answer (`emit/zero-flags!`). An emitter
     that ends in a flag-setting instruction for its result calls
     `code/note-flags!`; nothing else is needed to stay correct, since any
     byte emitted afterwards and every block start invalidate the record.
5. **Memory operands and LEA.** Done by the memory family
   (`x64/memory.coil`, `fuse!`), after the core's own tiles and comparison
   fusion:
   - The address of every LOAD and STORE is matched as
     base + index * 2^shift + disp32 and kept in the plan's address tables;
     `x64/address.coil` (`operand!`) turns an access into its `encode/Mem`
     for every family. As in upstream's `ir_match_fuse_addr`, an address
     expression is absorbed only when every use of it is an access address.
   - A LOAD with one use becomes the memory operand of an ADD SUB AND OR XOR
     MUL or integer comparison when the consumer is emitted once, in the
     load's block, and nothing that may write memory or release stack is
     scheduled in between (upstream's `ir_match_has_mem_deps`). The
     instruction runs at the load's own width. Volatile loads are never
     fused.
   - STORE(a, OP(LOAD(a), x)) with the store directly after the load becomes
     `op [a], x` (ADD SUB AND OR XOR with a register or immediate; NOT, NEG).
   - The scratch contract: a memory operand names allocated registers, rsp,
     rbp and at most r10, so r11 is free for the instruction's other operand.
   - Sums of values (not addresses) take the address form afterwards
     (`x64/lea.coil`, RULE-LEA): what is still a register ADD, or ADD/SUB of
     an immediate, once the memory family chose its operands becomes a base,
     a scaled index and a displacement, absorbing single-use producers of
     its block; multiplication by 2, 3, 5 and 9 is a `lea` and by other
     powers of two a shift.

## Floating point

Scalar f32/f64 live in the low bytes of XMM registers (`x64/floating.coil`;
operand helpers in `x64/value.coil`, "Floating values").

- **Constants.** +0.0 is `xorps x, x`, anywhere (it writes no flags). Every
  other constant is loaded from a per-function constant pool with
  `movss/movsd x, [rip + disp32]`, or read from it directly as the memory
  operand of an arithmetic or compare instruction, as compilers do. The pool
  is appended to the function's own text after its last instruction
  (`x64/pool.coil`: 8-byte entries, then 4-byte ones, identical bit patterns
  shared, padded to 8 bytes, recorded as a text data range), so the
  displacement is fixed when the function is finished and no image
  relocation or data symbol is involved. While the function is emitted a
  load carries a `code/Reference` (kind PC32, addend -4, target the
  constant's graph reference), which `pool/finish!` resolves and removes.
  Constants the emitters need themselves (sign masks, 2^52, 2^63, one half)
  are built without memory: `pcmpeqd` + shift, or `mov r10, imm` + `movq`.
  A floating PHI constant bound for a spill slot is stored through r10.
- **Two-address arithmetic.** `rd = left OP right` is `movaps rd, left;
  op rd, right`, the right operand read from its register, its spill slot or
  the pool. When rd is the right operand's register ADD and MUL commute and
  SUB and DIV go through xmm14.
- **NaNs.** Arithmetic follows the hardware: a NaN operand is returned
  quieted (the first operand of the instruction when both are NaNs, so the
  commuted forms make the choice between two different NaNs unspecified, as
  it is for constant folding), and an invalid operation gives the x86
  default NaN, whose sign bit is set (AArch64's is clear). The selecting
  MIN/MAX and FMIN/FMAX/FMINNM/FMAXNM give the AArch64 backend's results bit
  for bit, NaNs and signed zeros included; so do NEG, ABS and the roundings.
- **No conditional move for XMM.** Floating COND and the selecting MIN/MAX
  are a compare and a short forward branch over a `movaps`. Jumps inside one
  node are rel8 and patched locally (`x64/local.coil`); they never span a
  fixup record, so branch relaxation cannot move anything between them.
- **SSE2 only.** ROUND_EVEN/UP/DOWN/ZERO/AWAY are exact inline sequences
  (no `roundsd`): magnitudes of 2^52 (2^23) and above are returned as they
  are, smaller ones go through `cvttsd2si`/`cvtsi2sd` or the add-and-subtract
  2^52 identity and keep the operand's sign. They assume MXCSR's default
  round-to-nearest mode, like every other arithmetic instruction. FMA has no
  baseline instruction: it is a call to libm's `fma` / `fmaf` (operands in
  xmm0..xmm2 by one parallel group with the preservation transfers, every
  caller-saved register clobbered, result in xmm0; `call/runtime-constraints!`,
  `call/emit-runtime!`, a PLT32 reference to the runtime symbol). That needs
  an image; `compile/text` reports a clear error for a function with FMA.
- **Conversions.** INT2FP is exact for every integer type (u64 with the top
  bit set is halved with a sticky low bit and the result doubled). FP2INT is
  `cvttss2si/cvttsd2si`; u64 results add a second conversion of `x - 2^63`.
  The IR leaves NaN and out-of-range inputs undefined (constant folding
  folds none of them): AArch64 saturates there, x86-64 returns what the
  instruction gives. Every defined input agrees with constant folding.
- **Memory.** `families/of` routes LOAD/STORE and VAR/VLOAD/VSTORE of a
  floating type to the floating family (`x64/float-memory.coil`: one base
  register, no displacement folding) until the memory and locals families
  handle every type; those accesses should then go through the memory
  family's address-mode selection.
- **Parameters and results.** xmm0..xmm7, then 8-byte stack slots; a result
  in xmm0. The driver emits floating PARAM, RETURN and IF itself.

## Vectors

Short vectors (8 and 16 bytes, every lane type) live in XMM registers
(`x64/vector.coil` and the modules its header lists). The baseline is SSE2,
and the results are the AArch64 backend's, lane for lane.

- **Representation.** A 16-byte vector fills the register. An 8-byte vector
  is the low quadword and the upper quadword is unspecified: lane-wise
  instructions run on the whole register (nothing there can trap: SSE
  exceptions are masked, integer division never happens in an XMM register,
  and the one-lane DOUBLE vector uses the scalar instructions), and loads,
  stores and spills of an 8-byte vector move exactly eight bytes (`movq`).
  Copies are `movaps`; memory moves are `movups`/`movq`, no alignment assumed.
- **Constants** are LONG_CONST payloads: all zeros is `pxor`, all ones
  `pcmpeqd`, anything else `movups/movq x, [rip + payload]` from the
  constant's private image data (a PC32 reference the image layer resolves;
  such a function needs an image, as on AArch64). Masks an emitter needs
  itself are built without memory (`pcmpeqd` and shifts, or `mov r10, imm` +
  `movq`).
- **Operands and temporaries.** A vector operand may be in a register or in
  its spill slot; a constant or spilled first operand is read into xmm14 and
  a second into xmm15. A sequence longer than one two-address instruction
  computes in temporaries and moves the result to its register last, so no
  aliasing of result and operands needs a special case. The temporaries are
  xmm13, xmm12 and xmm11, clobbered through `uses/clobber!` over the node's
  two positions, as many as the emitter module's `temporaries` declares
  (`tests/x64-vector-emit.coil` checks that nothing else is written).
- **What SSE2 lacks is synthesized in registers:** byte and quadword
  multiplies and the 32-bit one (`pmullw` on even and odd bytes, `pmuludq`),
  unsigned and 64-bit compares (sign bias; the borrow of `b - a` corrected
  for overflow), every extremum but `pminub/pmaxub/pminsw/pmaxsw` (compare
  and `pand/pandn/por`), byte shifts and `psraq`, rotates, absolute values,
  byte swaps (`pshuflw/pshufhw`), set-bit and trailing-zero counts (the
  parallel reduction). Floating MIN/MAX keep the scalar selection contract
  (`a <= b ? a : b`), so they are `cmpleps` and a select, not `minps`.
- **What goes through memory.** Four kinds of node own a 32-byte scratch
  frame object (`vector-value/scratch!`, an ordinary `uses/Local`): integer
  DIV and MOD (one `div`/`idiv` per lane, with rax and rdx clobbered: the
  same extension and the same traps as scalar division, where AArch64
  returns 0, the dividend or MIN), shifts with one count per lane (`shl
  [lane], cl`, rcx clobbered), leading-zero counts (`bsr` per lane) and
  EXTRACT/REPLACE at a run-time index (an indexed load or store; an index
  out of range gives zero or changes nothing, as on AArch64). The a64
  backend does all four in registers; SSE2 has no per-lane shift, no
  lane-wise count, no variable shuffle. One slot per such node is simple and
  costs frame; a shared per-function slot is a tuning step.
- **COND** on a vector is a scalar truth test and a short branch over a
  `movaps`, like a floating COND (the matcher never fuses a comparison into
  it, as on AArch64).
- **Memory.** `families/of` routes LOAD/STORE and VLOAD/VSTORE of a vector to
  the vector family (`x64/vector-memory.coil`), which reads the memory
  family's selected address mode (`address/operand!`) and the locals
  family's slot (`locals/slot`). A VAR of a vector type stays a locals node.
- **Parameters and results: the minimum.** An 8- or 16-byte vector outside
  an argument group takes the next of xmm0..xmm7 (counted with the floating
  arguments) and is returned in xmm0, in functions and at calls
  (`x64/abi-arguments.coil`, `x64/call.coil`, each change delimited). A
  vector that finds no register, or sits in a group, is refused with a clear
  error: the System V stack and aggregate forms are not placed. For a
  16-byte vector and for 8-byte floating vectors this is what System V does;
  compilers pass some 8-byte integer vectors in general registers, which a
  full treatment has to decide.
- **Not selected:** the AArch64 rule that emits an integer multiplication by
  SPLAT(2) as an addition (`docs/VECTOR_DOUBLING.md`); the multiplication
  is emitted. SHUFFLE has no emitter on either target.

## Frame

The a64 frame model is kept: logical offsets measured upward from rsp after
the prologue (outgoing area, result slot, locals and static allocas, spills,
callee-saved area). Differences:

- The return address is on the stack at entry (`[rsp]`), so stack parameters
  start at entry rsp + 8 and there is no link register or link slot.
- Prologue: `sub rsp, N` and callee-saved registers stored with `mov` into the
  callee-saved area (so shrink-wrapping and the offset model carry over).
  `push rbp; mov rbp, rsp` first when the frame is anchored (dynamic stack,
  FRAME_ADDR, or an alignment above 16); rbp is then the base for locals,
  spills, the callee-saved area and stack parameters, and every RETURN
  restores rsp from the anchor. Logical offset L is at `[rbp - N + L]`.
- An over-aligned frame (alignment A > 16, from an ALLOCA, a frame object or
  a VAR) is anchored too: `and rsp, -A` after the `sub`, the anchor saved in
  an 8-byte entry slot of the frame, and rbp re-pointed at the aligned frame
  top (`lea rbp, [rsp + N]`, N a multiple of A). Stack parameters are then
  read through the saved anchor (`frame-address/parameter!`).
- Dynamic stack (ALLOCA, AFREE, BLOCK_BEGIN/END): rsp moves below the frame;
  the outgoing call area stays the bottom of the stack (`[rsp + k]`,
  `frame-address/outgoing`, never the frame base), and an ALLOCA's result is
  rsp plus the outgoing size. Sizes are rounded to the frame alignment; a
  negative or overflowing runtime size traps (`ud2`) before rsp changes.
- A static frame object is a frame slot whose address is rebuilt at each use
  (`lea`, or folded into a memory operand); it has no register.
- rsp is 16-byte aligned at every call: entry rsp + 8 + N is a multiple of 16.
  N is the frame contents rounded up to 8 modulo 16; a function without
  frame contents (no spill, no preserved register, no frame object) that
  executes no call instruction has N = 0 and no prologue. A function that
  calls always has a frame (N = 8 at least); one whose only calls are tail
  jumps does not need one.
- Two frame objects belong to the function's result role and are owned by its
  entry node: the 16-byte buffer of register result pieces (PARAM 0 is its
  address; RETURN loads the pieces from it) and the 8-byte slot in which the
  prologue saves the hidden pointer of an indirect result (RETURN reloads it
  into rax).
- Frameless leaves may use the 128-byte red zone for spills. Not done yet:
  a function with any spill gets a frame.
- Traps are `ud2`.
- Not in the first version: shrink-wrapping, spill-home planning. The
  allocator runs with the pinned plain tuning.

## Calls (System V)

- The Coil compiler's CIR arrives already classified into eightbytes, so the
  library's job is placement: integer and SSE eightbytes take the next free
  register of their bank; a group that does not fit goes to the stack whole
  and does **not** exhaust the bank; stack slots are 8 bytes (16-byte alignment
  for 16-byte-aligned values).
- Indirect result: hidden pointer in rdi, returned in rax.
- Register results: rax/rdx and xmm0/xmm1, including mixed pairs (one integer
  and one SSE eightbyte). `call-results/Spec` is extended for mixed pieces.
- Variadic calls pass unnamed arguments in registers like named ones and set
  `al` to the number of vector registers used.
- Narrow integer arguments are extended by the caller to 32 bits; a callee
  never trusts the upper bits of a narrow parameter.
- Calling-convention number in `Prototype.flags`: 0 (default) and 8 (System V)
  are accepted on x86-64.
- Named functions are called with `call rel32` (PLT32); named data and function
  addresses are loaded from a private 8-byte slot with `mov r, [rip+slot]`
  (PC32); strings and constants are addressed with `lea r, [rip+x]` (PC32).
  The emitters are in `x64/code.coil` (`reference-address!`, `long-address!`,
  `direct-call!`, `direct-jump!`, `rip-reference!`). A named constant is an
  ordinary operand of every core node: `value/constant!` rebuilds it, without
  writing flags.
- Builtin move and compare calls of constant size are replaced by the
  straight-line emitters `x64/block-move.coil` (1..256 bytes, `movdqu` and
  general-register chunks) and `x64/block-compare.coil` (0..16 bytes,
  `bswap` and `cmp`); their headers give the entry points and what they
  write.
- Private leaf calls: the written-register set of a leaf is recorded while it
  is emitted (no decoder). `code/Buffer.written` collects every register an
  allocated value occupies, every declared clobber, the scratches and the
  result registers; `code/Buffer.calls` is set by any call or tail jump. An
  emitter may therefore write only its destination, the scratches and
  registers it declared with `uses/clobber!`; anything else it must record
  with `code/wrote!`. A function without calls or relocations carries the
  record in `Image.leaf-effects`, and `x64/private-leaf` narrows the clobbers
  of a direct call to a registered leaf to (leaf writes + the call's own
  argument registers) within the caller-saved allocatable set.
- An indirect callee is moved into rax by the same parallel group that places
  the arguments (no argument uses rax and every value living there is being
  moved out anyway), so the reserved scratches stay free for that group's
  cycles. A variadic call moves it on to r11 before al is set.
- The call's own parallel group also carries the allocator's transfers at the
  call's definition position (values leaving caller-saved registers): the
  call family announces the position and the driver hands the transfers to
  `call/emit-call!` instead of emitting them itself.
- Tail calls (`x64/tail-plan.coil`): `jmp rel32` / `jmp rax` when no frame
  address can reach the target, no ARGVAL is passed, the call is not
  variadic, its stack arguments fit in the ones the function received and
  the result role matches. Stack arguments are built in the outgoing area
  and moved over the incoming ones, highest slot first, before the frame is
  released; an anchored (rbp) frame finds the incoming slots through its
  base and restores rsp from it, so functions with ALLOCA jump too. Otherwise a TAILCALL is a call
  followed by the epilogue, and an ordinary CALL + RETURN stays as it is.
- A builtin memmove of a literal size up to 256 bytes and a builtin memcmp
  of a known count up to 16 are expanded inline (`call/inline-builtin!`,
  `x64/block-move`, `x64/block-compare`); other builtin calls reach their
  runtime routine. A builtin call in tail position is a jump to the routine.
- Integer-pair results avoid memory in both directions. A function whose
  result buffer can be promoted away returns the piece values straight in
  rax/rdx and has no buffer (`x64/return-values.coil`, on the neutral
  lowering of `a64/return-values`); a CALL whose pieces are only loaded back
  from a private frame object defines those loads itself in rax/rdx
  (`a64/result-projections`, which is target-neutral, run by `x64/match`).
  Mixed and floating pairs use the frame buffer and the result place.
- VA_START/VA_ARG have no lowering.

## Image and relocations

`image.Image` carries a machine (1 AArch64, 2 x86-64). Relocation kinds:
1 ABS64 (both), 2..4 AArch64 only, 5 PC32 and 6 PLT32 (x86-64 only, explicit
addends; the field is the last 4 bytes of the instruction unless an immediate
follows, in which case the addend accounts for it).

`x64/image.coil` (`finish!`) resolves a function's pending references: PC32
to a FUNC or SYM goes to that symbol's address slot (one 8-byte slot per
symbol and image, ABS64 against the symbol), PC32 to a STR or LONG_CONST to
its private data, PLT32 to the function symbol itself. An ABS64 word is only
ever created for an address slot, which is the form the Coil adapter turns
into a GOT load (`docs/X86_ADAPTER_REQUESTS.md`, item 7).

## Testing

- `tools/x86/remote-test.sh tests/NAME.coil ...` runs tests on the Linux host.
- Target-neutral tests import `stogir.native.compile` and `stogir.jit.native`
  and must pass on both hosts. A test ported from `stogir.a64.compile` keeps
  its name; the port is a change of imports plus platform symbol names
  (`stogir.target` helper), never a weakening of what it checks.
- Tests of x64 internals are named `x64-*.coil`.
- `tests/X64_STATUS.md` lists every test with its category and, for facade
  tests, its operation family; `tools/x86/family-tests.sh FAMILY` prints a
  family's tests. A facade test may keep an AArch64 instruction-shape check as
  `(target/arch-pick CHECK (do))`; object symbols are written
  `(target/os-pick "_name" "name")`.
- Every new behavior has a test; every stub is a hard error with a clear
  message.

## Optimization levels

As on AArch64: level 0 is rejected, level 1 generates the graph as given,
levels 2 and 3 run SCCP first. Level 3 then runs the graph stages of the a64
path under the same context switches (global-load forwarding, the fact fold
or branch facts, select diamonds or if-conversion, loop-load hoisting,
rotation, loop strength reduction with `x64/strength-cost.coil`). Its last
stage, the loop vectorizer, creates vector operations, which the vector
family emits; `LEVEL-THREE-VECTORIZE` in `x64/compile.coil` is its switch and
is on. `a64.constant-hoist` and `a64.return-values` are not run.

## Phases

0. Encoder; neutral image/link/relocate/JIT/ELF layers; Linux measurement tools.
1. Core: a function of integer values, parameters, constants, compares,
   branches, loops and PHIs compiles and runs through the facade; the driver
   has one hook module per operation family. (Done on branch `x86/core`,
   tested directly against `stogir.x64.compile`; see `docs/X86_FAMILIES.md`.)
2. Families in parallel: integer completeness; memory and stack; calls and ABI;
   floating point; vectors; switches, branch relaxation and peepholes.
3. Coil adapter for x86-64, compiler builds itself with Stogir on Linux, FAST
   and bootstrap reproduce.
4. Tuning rounds against the two goals.
