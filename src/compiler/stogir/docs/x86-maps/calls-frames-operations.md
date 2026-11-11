# Survey: calls frames operations

Read-only survey of the AArch64 backend taken on 2026-11-10 at library commit da30f8a, for the x86-64 port. Line numbers refer to that commit.

I read every file you listed except spill-homes.coil, which I only skimmed: apart from its frame-transfer rules it is target-neutral. Two findings change the plan. First, the argument "groups" model encodes AAPCS64 classification, not a neutral one. Second, several x86 operations need fixed registers (rax/rdx/cl) that the a64 allocator has never had to model. Paths below are relative to `src/stogir/` unless noted.

## 1. Call lowering

**Prototype representation**
- `calls.coil:19` `Prototype{flags,result,parameters,groups,aggregate-result,builtin,effects}`.
- `flags & 16` means variadic. `flags & 15` is the upstream calling-convention number. a64 accepts only 0 and 9 (`incoming.coil:61`, `constraints.coil:504`, `private-leaf.coil:88`). In upstream `ir.h:686-690`, 9 is AARCH64_DARWIN on arm64 but X86_64_MS on x86, so the x86 port should accept 0 and 8 (SYSV).
- `create-grouped` (`calls.coil:96`) attaches `call-groups/Group{first,count,alignment}` (`call-groups.coil:9`). `members?` (`:21`) allows two U64/I64 pieces (an integer pair; this is the only "i128"), or 1–4 identical f32/f64/short-vector pieces (an HFA/HVA).
- `create-result` (`calls.coil:118`) takes a `call-results/Spec` (`call-results.coil:5-8`): kind0 is an ordinary result, kind1 is register pieces (≤2 integer words or ≤4 floats/vectors), kind2 is an indirect result in x8. For kind1/kind2, PARAM0 is the ADDR result place and the IR result type is void.
- Builtins: `BUILTIN-MOVE`/`BUILTIN-COMPARE` (`call-groups.coil:80,89`). Effect records: v4 trailer (`:233`).
- The serialization format, validation, effects and the `calls/verify` path are all reusable as-is.

**Placement (shared by callers and callees):** `a64/abi-arguments.coil:53 plan-result`.
- Two independent banks of 8 registers. A group either fits whole or goes to the stack and **exhausts its bank** (`:129`, sets gp/fp to 8).
- Darwin specifics: unnamed varargs always go on the stack (`:97`) in 8-byte slots (`:101-103`), and unnamed f32 is promoted to f64 (`:119`, conversion at `a64/call.coil:160`). Fixed stack arguments are packed at their natural size and alignment (`a64/call-abi.coil:128-131`).
- The result pointer is part 0: register 8 for kind2, or -2 (consumes nothing) for kind1 (`abi-arguments.coil:71-78`).

**Caller layout and emission**
- `a64/call-abi.coil:160 layout` adds ARGVAL private copies after the stack arguments (`:227-262`) and a kind1 result-pointer save slot (`:263-275`). `outgoing` (`:282`) takes the maximum over all calls, rounded to 16.
- `a64/call.coil:312 emit-selected-call-at-with-locations!` runs in this order:
  1. ARGVAL copies (x16/x17/x30/v31, `a64/argument-copy.coil`).
  2. Save the result pointer.
  3. Stack arguments.
  4. Parallel register copies merged with preservation copies (`:411-491`).
  5. Indirect target captured into x30, or reused if it already sits in x9–x15 (`:462-484`).
  6. Constants.
  7. Narrow-argument extension (`call-abi.coil:312 normalize!`).
  8. `BL`/`BLR`, or an inline memmove/memcmp (`:519-534`).
  9. Capture kind1 results into the place (`a64/result-emission.coil:38`: reload the pointer into x16, store x0/x1 or v0–v3).
  10. Normalize the narrow result (`:543`).
- Clobbers: `call-abi.coil:39 reserve-with-context!` reserves x0–x15 (`registers.coil:15`), plus the SIMD mask when the function has any floating values.

**Callee side**
- `a64/incoming.coil:43 build` uses PARAM kinds 0=GPR, 1=stack, 2=FPR, 3=private result place. Stack parameter offsets are measured from entry SP (`:226`).
- Kind1 returns are written through PARAM0 to a frame buffer and installed by `result-emission.coil:71 return!`. Alternatively, `a64/return-values.coil:141` and `a64/result-projections.coil:62` promote integer-pair results directly to x0/x1 registers.

**Varargs:** caller side only. VA_START/VA_ARG (97–100) have no emitter (ABI.md:96 lists reading variadic arguments as still open).

| Piece | AAPCS/Darwin-specific | What System V x86-64 needs |
|---|---|---|
| Register lists | x0–x7 / v0–v7, `call-setup-gpr-mask` 0x1FF | rdi,rsi,rdx,rcx,r8,r9 / xmm0–7 |
| Group exhaustion | bank set to 8 | SysV does **not** exhaust: later scalars still use the remaining registers |
| HFA groups of 1–4 floats, one register each | AAPCS concept | SysV classifies by eightbyte: `{f32×4}` is two xmm (packed pairs); >16 bytes goes to MEMORY; mixed `{i64,f64}` (rax+xmm0) cannot be expressed. A classify step or a new group meaning is required |
| Indirect result (x8) | dedicated register | hidden pointer in **rdi** (shifts the integer bank by one); callee returns it in rax |
| Kind1 returns | x0/x1, v0–v3 | rax/rdx, xmm0/xmm1, with floats packed per eightbyte; count >2 eightbytes becomes sret |
| Stack arguments | natural size/alignment | 8-byte slots (16 for 16-byte-aligned), first at entry rsp+8 |
| Varargs | unnamed on stack | unnamed args use registers like named ones; set `AL` to an upper bound of xmm used (upstream `ir_x86.dasc:1474` `fp_varargs_reg`); promote f32 to f64 |
| Narrow ints | caller extends (Darwin) | caller extends to 32 (clang behaviour), but the callee must **not** trust it (GCC callers don't extend). PARAM is already untrusted (`convert.coil:113`). Keep the post-call re-extension |
| Alignment and red zone | SP 16 at call | rsp ≡ 0 (mod 16) at CALL; entry rsp ≡ 8. A 128-byte red zone is available for frameless leaves |
| Indirect target register | x30 or x9–x15 | r11 (r10 if AL/rax is busy), or `call [rsp+off]` straight from a spill slot |

**Reusable unchanged:** Prototype/Group/Spec bytes, `calls/validate-call`, the parallel-copy discipline, ARGVAL copy placement, result-pointer save and capture logic, the outgoing-area model, and the integer-pair result promotion in return-values/result-projections.

## 2. Private calls

This is not a new calling convention. It narrows the clobber set for direct calls to module-private leaf functions:
- `a64/private-leaf.coil:84 create` snapshots a leaf's bytes.
- `a64/leaf-effects.coil:99 text` decodes every a64 word into a GPR write set. It declines on any write to x30 (`:13`), SIMD, calls or relocations, and requires `RET` (`0xD65F03C0`).
- `call-mask` (`private-leaf.coil:136-145`) = (writes ∪ x0–x8) ∩ x0–x15. Writes to x16/x17 fall outside that mask because those registers are reserved scratch.
- `same-abi?` (`:47`) treats I32/U32 and I64/U64 as the same; that holds on x86 too.
- Binding: `context-mask` (`:383`), `bind-image!` / `install!` (`:415,462`). The publication and sealing machinery is target-neutral.

For x86, leaf-effects needs a variable-length decoder. A better option is to record the written set during emission. The setup mask becomes rdi,rsi,rdx,rcx,r8,r9,rax plus the call scratch. Note that `call` itself writes [rsp-8].

## 3. Frames

**Layout:** `a64/allocate.coil:267-457`, with `Assigned` at `:57-81`.
- Logical offsets are measured upward from SP after the prologue: outgoing area → frame record (x29/x30, 16 bytes, plus an entry-SP slot when over-aligned, `:409-417`) → result slot → locals and static ALLOCA → spills → callee-saved area (allocated last, `callee-saved.coil:15`).
- The record is placed *inside* the frame, not at its top. It is required when there are calls or an anchored frame (`:399`).
- An anchored frame (dynamic stack or over-alignment) uses x29 as its base with a bias (`frame-address.coil:15-27`).
- "beneath?" puts call storage above the record (`:405-424`).

**Prologue and epilogue:** `a64/function.coil`
- `prologue!` (`:2459`): `stp x29,x30,[sp,#-N]!` when `record-writeback?` (`:2453`); otherwise `prologue-adjusted!` (`:2475`): sub sp, align (x17), stp the record, `add x29`, save entry SP.
- Then `callee/emit!` stores x19–x28 in pairs (`callee-saved.coil:37`).
- `restore-frame!` / `epilogue!` (`:2524,2574`) end in `ret x30`. Frameless returns emit a bare `ret` (`:541`).
- `FRAME_ADDR` returns x29 (`:2418`).

**Other frame pieces**
- Callee-saved set: x19–x28, hard-coded in `callee-saved.coil:23`, `shrink-wrap.coil:134`, `allocate.coil:55,472` (`0x1FF80000`) and `registers.coil:24`.
- No callee-saved SIMD: v8–v15 are simply excluded (`registers.coil:27-31`).
- Scratch registers: x16/x17, x30, v30/v31, plus x15 for indirect tail calls. x18 is reserved.
- Dynamic stack (`a64/stack.coil`): ALLOCA/AFREE adjust SP. The result is SP + outgoing (`:102-168`). Negative or overflowing counts trap with `BRK` (`:69`). BLOCK_BEGIN/BLOCK_END are `mov reg, sp` / `mov sp, reg` and require the x29 anchor (`:175`).
- Static allocas (`static-stack.coil:19`) and locals (`a64/locals.coil:46`) are addressed through x16 from the base.
- Shrink-wrapping (`shrink-wrap.coil`, `frame-spans.coil:63`) is neutral apart from the preserved-register range and opcode predicates (`:67-82`).

**What changes for x86**
- Prologue: `push rbp; mov rbp,rsp` (always, or only when anchored), then `push` rbx/r12–r15, then `sub rsp,N`. Keep (8 + pushes + N) ≡ 0 (mod 16).
- Epilogue: `leave` or `add`/pops, then `ret`.
- The record moves to the top of the frame. "link-slot" logic becomes "return address at entry rsp".
- Callee-saved GPRs: rbx, rbp, r12–r15. All xmm registers are caller-saved, so the SIMD bank is fully volatile.
- Over-alignment: `and rsp,-A`, with stack parameters addressed off rbp+16.
- No large-offset fallback is needed: disp32 covers it.
- Flags: a64 helpers promise to preserve NZCV (`frame-address.coil:125`). On x86 use `lea` and `mov imm`, never `add`/`sub`/`xor` for rsp adjustments or zeroing between a flag producer and its consumer.
- Replace `BRK` with `ud2`.

## 4. Tail calls

- `a64/tail-plan.coil:176 select` gives mode 1 (native jump) or mode 2 (call+ret fallback).
- Conditions: no frame address escapes (`private-frame?` `:43`), no ARGVAL copies, not variadic (`:112`), passed stack bytes ≤ bytes received (`incoming.coil:153`) and ≤4088 (an a64 addressing limit, `:245`), and a compatible result (`:132`).
- Emission (`function.coil:1534 tailcall!`): install arguments with the target in x15 (reserved at `call-abi.coil:84-90`), copy outgoing stack arguments over the incoming ones (`tail-stack-arguments!` `:1489`, x16/x17), `restore-frame!` keeping x30, then `b` / `br x15`.
- x86: the target goes in r11. Stack arguments move to entry rsp+8+k, leaving the return address in place. The 4088 limit disappears. Finish with `jmp rel32` / `jmp r11`.

## 5. Operation emitters

| File | Opcodes and types | a64 instructions | x86-64 equivalent and baseline problems |
|---|---|---|---|
| unary.coil:92 | NEG, ABS, NOT (incl. BOOL), BSWAP, CTPOP, CTLZ, CTTZ; 8–64-bit | neg, cmp+cneg, mvn/cset, rev16/32/64, fmov→cnt→addv (v31), clz, rbit+clz, re-extend | neg, mov/neg/cmovl, not/sete, bswap (16-bit: `rol r16,8`). **POPCNT/LZCNT/TZCNT are not baseline**: use a SWAR popcount, bsr+cmov/xor and bsf with a zero guard |
| convert.coil:46,222 | SEXT, ZEXT, TRUNC, BITCAST, INT2FP, FP2INT, FP2FP | sxt*/uxt*, scvtf/ucvtf, fcvtzs/fcvtzu (saturating), fcvt, fmov, cset | movsx/movzx/movsxd/mov r32; cvtsi2sd/ss (signed only: u64 needs the halve/or trick, u32 a zero-extended r64); cvttsd2si (no unsigned form, out-of-range gives 0x80…, not saturation); cvtsd2ss/cvtss2sd; movq/movd. The `zero-extended-leaf?` rules (`:113`) must be redone: 8/16-bit ops and setcc do not zero upper bits |
| conditional.coil:79 | COND (scalar int/float, short vector) | csel, fcsel, cset (`boolean-choice` `:34`) | cmovcc (no immediates); floats need a cmpsd mask with and/andn/or or a branch; setcc+movzx |
| truth.coil:23 | IF/COND truth test | cmp #0 / tst / fcmp #0.0 (NE includes NaN) | test r,r; xorps+ucomisd needs **two flags** (jne/jp). The float condition table (`floating.coil:17`) becomes swap-operands plus PF handling, as upstream `ir_emit_cmp_fp` does |
| checked.coil:42,49 | ADD_OV/SUB_OV/MUL_OV + OVERFLOW | adds/subs (VS/HS/LO), narrow extend+compare, smull/umull, smulh/umulh+mul | add/sub at the native width give OF/CF directly at 8–64 bits (borrow is CF, not inverted). imul r,r sets OF. **Unsigned 64-bit MUL needs `mul` (rdx:rax fixed)** |
| floating.coil:33 | f32/f64 +−×÷, NEG/ABS, compares 14–25, MIN/MAX, SQRT, FMA, FMIN/FMAX/FMINNM/FMAXNM, ROUND_* | fadd…, fneg/fabs, fcmp+cset/fcsel, fsqrt, fmadd, fmin/fmax/fminnm/fmaxnm, frintn/p/m/z/a | addsd…; xorps/andps with a mask constant; minsd/maxsd fit selecting MIN/MAX; sqrtsd. **FMA**: FMA3 is not baseline, so call `fma()`. **IEEE fmin/fmaxnm** need NaN/±0 sequences. **ROUND_***: roundsd is SSE4.1, and ROUND_AWAY has no instruction even there |
| atomic.coil:47, atomic-encode.coil | ATOMIC_LOAD/STORE/RMW(0 add,1 sub,2 and,3 or,4 xor,5 xchg,6–9 s/u max/min)/CMPXCHG/FENCE, 1–8 bytes | ldar/stlr, LSE ldadd/ldclr/ldset/ldeor/swp/ld[su]max/min (all `al`), casal, `dmb ish` | mov load; xchg store; lock xadd (sub via neg); xchg; **lock cmpxchg (rax fixed)**; and/or/xor/min/max with the fetched value need a cmpxchg loop; mfence |
| reciprocal.coil:1-35 | DIV/MOD by a constant (rules 59–64) | umulh/smulh, smull+asr, msub | 32-bit: imul r64 + shr. **64-bit: mul/imul one-operand (rdx:rax)**; imul+sub. Plain DIV/MOD on x86 always pins rdx:rax, and variable shifts pin cl (BMI2 shlx is not baseline). Constraints must model fixed registers |
| block-move.coil | inline memmove 16–256 bytes | ldp/stp q, ldur/stur, v0–7/v16–23 | movdqu with xmm0–15 (exactly 16×16 bytes for load-all-then-store); `mov rax,rdi` for the result |
| block-compare.coil | inline memcmp 0–16 bytes | ldr/ldur, rev, cmp, csel, cset, cneg, x2–x5 | mov, bswap, cmp, seta/sbb; use dead caller-saved registers (rcx/rdx/r8–r11); result in eax |
| simd-lanes.coil:7,25 | lane get/put | umov/smov/ins | movd/movq + pshufd, pextrw/pinsrw (SSE2 has 16-bit only; pextrb/d/q and pinsr* are SSE4.1) |
| vector-arithmetic.coil:21 | ADD/SUB/MUL/DIV/MOD/AND/OR/XOR on D/Q vectors; i64 MUL and integer DIV/MOD lane-expanded | add/sub/mul/fdiv, per-lane sdiv | padd*/psub*, pand/por/pxor, addps/pd. pmullw only in SSE2 (pmulld is SSE4.1, i8 needs unpack). DIV/MOD per lane via GPR (and rax/rdx again) |
| vector-comparison.coil | lane compares, int and float | cmeq/cmgt/cmge/cmhi/cmhs/fcm* | pcmpeq/gt b/w/d (q: SSE4.1/4.2); unsigned via sign-bias xor; GE via not; cmpps/pd with predicates |
| vector-extrema.coil | lane MIN/MAX | smin/umin…, fcmp+bsl | SSE2 has only pminub/pmaxub/pminsw/pmaxsw; others need compare+blend |
| vector-select.coil | vector COND | csetm+dup, bsl | pand/pandn/por (pblendvb is SSE4.1) |
| vector-shift.coil | SHL/SHR/SAR/ROL/ROR with per-lane masked counts | ushl/sshl with negated count | SSE2 shifts take only a uniform count; no 8-bit lanes, no psraq, no rotates. Variable per-lane shifts need AVX2, so scalarize |
| vector-unary.coil | NEG/ABS/NOT/BSWAP/CTPOP/CTLZ/CTTZ, float neg/abs | neg/abs/mvn/rev/cnt/clz | psub from 0; pabs* is SSSE3; pxor with all-ones; pshufb is SSSE3; counts need SWAR or LUT |
| vector-lanes.coil | EXTRACT/REPLACE/SPLAT, dynamic index | umov/ins/dup, tbl | pshufd/punpck/pshuflw. For dynamic indices, store to the stack or red zone and index; the "never address stack memory" rule (`:1`) is hard to keep |

## 6. Coverage checklist (opcode numbers from `opcode.coil`)

- **Constants and symbols:** C_* (1–13), FUNC_ADDR/FUNC/SYM/STR (73–77), LONG_CONST (78), PROTO (40).
- **Integers** (BOOL, U8–U64, ADDR, I8–I64): compares 14–23; ADD SUB MUL DIV MOD 26–30, including reciprocal division; NEG ABS 31–32; NOT OR AND XOR 45–48; SHL SHR SAR ROL ROR 49–53; BSWAP CTPOP CTLZ CTTZ 54–57; MIN MAX 58–59; COND 60.
- **Conversions:** SEXT ZEXT TRUNC BITCAST INT2FP FP2INT FP2FP 33–39.
- **Checked arithmetic:** 41–44.
- **f32/f64:** ADD–DIV, NEG, ABS, compares including ORDERED/UNORDERED 24–25, MIN/MAX, SQRT/FMA/FMIN/FMAX/FMINNM/FMAXNM/ROUND_EVEN/UP/DOWN/ZERO/AWAY 131–141.
- **Short vectors:** 8 or 16 bytes, lane base types 1–13 (`types.coil:82`). Arithmetic, logic, shifts/rotates, unary, extrema, compares, COND, EXTRACT/REPLACE/SPLAT 61–63. I found no SHUFFLE (64) emitter.
- **Memory:** LOAD/STORE(_v) 91–94; VAR/VADDR/VLOAD/VSTORE(_v) 72, 65, 85–88; ATOMIC 126–130.
- **Stack:** ALLOCA (dynamic and static frame objects) / AFREE / BLOCK_BEGIN / BLOCK_END 81–84; FRAME_ADDR 66.
- **Calls:** CALL/TAILCALL 79–80 (direct and indirect, grouped integer pairs and HFAs, kind1/kind2 results, variadic calls, ARGVAL 70, builtin memmove and memcmp inlining); PARAM 71 (register, stack, result place).
- **Control:** START…LOOP_END, IF, SWITCH (jump table `a64/switch.coil:130` or tree), RETURN, UNREACHABLE, TRAP 96; PHI/COPY 67–68.
- **No emitter found:** VA_START/VA_END/VA_COPY/VA_ARG (97–100), TLS_ADDR (95), RLOAD/RSTORE (89–90), GUARD/SNAPSHOT (101–103), IGOTO/IJMP (118–119), ASM (122–124), EXITCALL (125), SHUFFLE (64). For future VA support, upstream's SysV va_start/va_arg is at `ir_x86.dasc:12454,12639` (prologue register-save area at `:6873-6897`) and the SysV descriptor at `:1460`.
