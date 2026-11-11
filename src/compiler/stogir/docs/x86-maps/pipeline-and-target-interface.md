# Survey: pipeline and target interface

Read-only survey of the AArch64 backend taken on 2026-11-10 at library commit da30f8a, for the x86-64 port. Line numbers refer to that commit.

The AArch64 backend uses a narrow, mostly target-neutral allocation core. The allocator can express fixed registers (RAX/RDX/CL) and clobbers today. It has no way to express "result reuses operand 1" or "result conflicts with inputs", and nothing for per-instruction temporaries. Paths below are relative to `/Users/jimmyhmiller/Documents/Code/projects/coil-stogir/.worktrees/x86/src/stogir/`.

## 1. Stage order, graph to image (a64/compile.coil)

**Optimization front end:**
- `image-with-private` (:844) calls `image-with-private-impl` (:769), which runs `options/validate`. Level 0 returns an error. Level 1 goes straight to `image-split`; levels 2/3 run `optimize-for-image` (:723, SCCP plus compaction) first, and only level 3 takes the vector chain.
- `image-split` (:740) runs `tail-split/run`, then calls `image-private` or the vector chain.
- Vector chain, in order: `vector-image-private` (:503, compacts when at least 1/8 of cells are NOPs), `-dense` (global-load forwarding + SCCP), `-facts` (fact-fold or branch-facts), `-selects` (if-convert or select-diamond), `-loads` (loop-load-hoist), `-rotation` (loop-rotate), `-unrotated` (`a64.strength-cost/run` + SCCP), `-strength-core` (`vectorize/optimize-prepared-seeded`). It ends at `image-private-reusing`.

**Backend proper:**
1. `generate-private-reusing` (:119) calls `return-values/prepare`, which may lower direct returns into an owned graph.
2. `generate-core-reusing` (:174):
   - `pipeline/prepare-native[-anchored]` produces `pipeline/Prepared {blocks cfg/Blocks, order, schedule schedule/Schedule{ranges [Range{offset,count}], nodes [i32]}, idom, depths, users}` (pipeline.coil:24). It covers CFG, dominators, loop depths, early/late placement (GCM) and the local schedule.
   - `constant-hoist/run`.
   - `match/build-with-selects` (match.coil:218) produces `match/Plan {operands machine/Plan, tiles [select/Tile], comparisons, addresses, offsets, indices, index-shifts, doubles, extractions, tails, static-sizes, exact-decrements}`. Each table is indexed by graph reference.
   - `install-return-uses!`, then `bind-reciprocals!`.
3. `generate-matched-hoisted` (:270) retries allocation up to 3 times, withdrawing hoisted constants that got spilled.
4. `generate-matched-checked` (:357):
   - `register-live/analyze-matched` produces the liveness `Analysis`.
   - `live-ranges/build-matched` produces `[Value{ranges [interval/Range{start,end}]}]`. The position model is fixed at live-ranges.coil:19: position 2i is the use point and 2i+1 the definition. A use's range ends at 2i+1 and a def's range starts there.
   - `a64.constraints/build-matched` produces `[Value{uses [c/Use{position,kind,register}], parameter, rematerialized}]`.
   - `split-position/build`, `frame-spans/estimate`.
   - `allocate-shrink-wrapped`, which calls `a64.allocate/build-prepared-with-machine-private-policy` and returns `allocate/Assigned{parts [allocation/Part], locations locations/Index, frame, link-slot, base, outgoing-size, alignment, callee, ...}` (allocate.coil:57).
   - `function/body-prepared` produces `a64.code/Buffer{alignment, text, references [Reference{offset,kind,target}], text-data, fixed}`.
5. Back in `image-private-reusing`: `private/validate-references`, then `a64.image/finish!` (a64/image.coil:171) produces `stogir.image/Image`, then optionally `bind-image!`. `object` additionally calls `aot.macho/image-object`.

**Inside allocation (allocate.coil:267 `build-core-results-with-policy`):**
- Builds one `Part` per value. `allowed` comes from `registers/class-mask`; `ranges` and `uses` are copied in.
- `coalesce/run-prepared!` (phi-coalesce first), then `preferences/prepare-collecting!`, `apply-results!`, `inherit!`.
- `allocation/reserve!` for incoming parameter registers, then `call-abi/outgoing`, then frame-record and result slots.
- `call-abi/reserve-with-context!` adds the call clobbers.
- `allocation/run-shaped-with-tuning!`, then `finish-with-policy!` (check, regions, index, optional recolor/regional, callee-save layout).

**Emission:** `function/body-ordered-with-users` (function.coil:631) walks the scheduled nodes. At each position it emits `typed-group!` parallel moves for phase 0 (even) and phase 1 (odd). It then dispatches on opcode through a long `if` chain (:836–1249). The final fallback is `emit/allocated-selected-with-locations!` for ALU tiles. Afterwards come `finish-stubs!`, `apply-flag-fusions!`, `fixups/merge-conditions!`, `pair-adjacent!`, `compact-removed!`, `relax-aligned!`, `apply!` and `apply-relative!`.

## 2. What the allocator needs from the target

**Register domain.** `run-impl!` takes `register-count` (≤64) and an `allowed` u64 mask (allocation.coil:1446 `validate-input`). Each `Part.allowed` is that value's class mask. fixed-uses.coil:58/144 panics outside [0,64). a64 numbers GPRs 0–31 and SIMD 32–63 (registers.coil). It uses `register-count` 29 for GPR-only functions and 64 when SIMD is present (allocate.coil:305, :322). Masks: `gpr-mask 0x1FF8FFFF` excludes x16/x17/x18/x29/x30/sp; `simd-mask 0x3FFF00FF00000000` excludes v8–v15 and v30/v31.

**Constraint vocabulary** (constraints.coil:5, `Use{position, kind, register}`):
- kind 0: any location is fine.
- kind 1: must be in a register.
- kind 2: fixed register.
- `add!` merges coincident uses and returns false when two fixed registers conflict at the same position.

**Clobbers.** A clobber is a physical reservation: `allocation/reserve!(reg, start, end)` (allocation.coil:1808) creates a non-evictable `Part` with parent -1. Calls reserve every caller-saved register over [2i+1, 2i+2) (call-abi.coil:75–82, loop `reg < 16` / `< 64`).

**Hints.** Hints are advisory: `Part.preferred` (one physical register) and `Part.hint` (another part's index; preferences.coil).

**Scratch registers.** There is no per-instruction temporary. Scratches are excluded from `allowed` for the whole function: x16/x17 for operands and addresses, v30/v31 for SIMD, x17/v31 as the cycle holder. Emitters hard-code them (emit.coil:436/450 pass 16/17; typed-transfers.coil:110–113, :174; transfers.coil:497–500).

**Mapping upstream ir_x86.dasc `ir_get_target_constraints` (:1819):**

| Upstream | Coil equivalent |
|---|---|
| `IR_OPn_MUST_BE_IN_REG` / `IR_USE_MUST_BE_IN_REG` | kind 1 at 2i (operand) or 2i+1 (def) |
| `*_SHOULD_BE_IN_REG` | kind 0 |
| `def_reg = RAX/RDX` (MUL/DIV/MOD) | kind 2 on the def at 2i+1. Upstream treats this as a soft hint; Coil makes it a hard constraint |
| `hints[2] = RCX` (SHIFT) | kind 2 on op2 at 2i, or `Part.preferred` |
| `IR_SCRATCH_REG(RCX/RDX/RAX, from, to)` | `allocation/reserve!` over [2i, 2i+1) or [2i+1, 2i+2). Feasible: the call code already does this |
| `IR_TMP_REG` (any-register temporary) | **None.** Only globally reserved scratches. On x86 this costs 2 of 16 GPRs (e.g. r10/r11) plus 1–2 XMM |
| `IR_DEF_REUSES_OP1_REG` | **None.** The closest things are `Part.hint` (preferences.coil:37 `reference-hint?`) and `schedule/carried-update?` |
| `IR_DEF_CONFLICTS_WITH_INPUT_REGS` | **None.** Inputs end at 2i+1 and defs start at 2i+1, so the allocator legally sets rd = rm |
| `IR_OPn_HINT_NEEDS_HOLE` | **None** |
| LOAD/USE/DEF/SAVE sub-refs | Coil has only 2 sub-positions per instruction, upstream has 4. Upstream's "RAX clobbered LOAD..SAVE while also being def_reg" cannot be expressed precisely; approximate with a reservation at [2i, 2i+1) plus a fixed def at 2i+1 |

**What the two-address gap means for an x86 port:**
- The emitter must do `mov rd, rn; op rd, rm`. When rd == rm and rd != rn, it must commute (for commutative ops) or go through a scratch.
- To get upstream's quality you need a new kind (e.g. 3 = "same register as part X") or a target hook in neutral live-ranges.coil:65 that extends inputs to 2i+2.
- Moves at odd positions are rejected except at CALL/TAILCALL (function.coil:723–734). Fixed defs that force splits at 2i+1 need the same instruction-specific lowering calls already get.

## 3. Per-file classification

| File | Lines | Purpose | Called by others | AArch64 assumptions | Verdict |
|---|---|---|---|---|---|
| a64/compile.coil | 899 | entry points, pass chain, retry loops | public API | `a64.strength-cost`, `macho`, "AArch64 O0" message, pointer size 8 | ~90% neutral; parameterize the target modules |
| a64/function.coil | 2595 | emission driver, prologue/epilogue, branches, switch, tail calls, flag fusion | `body-prepared`, `region-exists?` | NOP `0xD503201F` (:756), BRK, `encode/*`, NZCV fusion (`flag-neutral-word?` :1842), x29/x30 frame record, 4-byte branch fixups | rewrite. Node-walk and phase skeleton (:631–:790) reusable |
| a64/match.coil | 1284 | tile plan, fusion, address modes, load forms | `build-with-selects`, `condition-tile`, `switch-selector`, `selected` | x16/x17 scratch budget (:56, :90), MADD/MSUB, UBFX, word views, TST bit tests | structure reusable, rules a64 |
| a64/select.coil | 1010 | `Tile` rules 1..64 | `select`, `Tile`, `multiplier`, `load-form` | 12-bit add immediates, 13-bit logical immediates (`logical` :309), reciprocal magic, cond 20..33 = A64 cc | mostly a64; constant-folding helpers (`product`, `division-*`) neutral-ish |
| a64/constraints.coil | 549 | per-value `c/Use` lists | `build-matched`, `Value` | SIMD fixed register `+32` (:302, :530); Darwin calling-convention flags (:504) | opcode walk neutral; must add x86 fixed regs (shift/div/mul) |
| a64/allocate.coil | 709 | bridge to the allocator, frame, `Assigned` | `build-prepared-with-machine-private-policy`, `Assigned`, `release!` | `register-count` 29/64, late/evict mask `0x1FF80000` = x19..x28 (:55, :472), 16-byte frame record, `Base reg 29/31` (:419–422) | ~70% neutral |
| a64/coalesce.coil | 416 | COPY/BITCAST/TRUNC view coalescing | `run!`, `run-prepared!`, `index!`, `canonical` | only `registers/class-mask`, `convert/widening-view?`, assumption that a TRUNC is a free low-word view | near-verbatim (x86 32-bit ops zero-extend too) |
| a64/phi-coalesce.coil | 213 | Phi vreg joining | `run!`, `join!`, `compatible?`, `union-*` | none | fully neutral; move to src/stogir |
| a64/preferences.coil | 225 | hints | `prepare-collecting!`, `apply-results!`, `inherit!`, `ResultHint` | 8 argument registers per bank, x15 for indirect targets (:111), result register 0/32 | logic neutral, ABI tables a64 |
| a64/registers.coil | 44 | register numbering and masks | everyone | all of it | replace |
| a64/value.coil | 148 | operand into register (constants, frame addresses) | `register-with-locations!`, `constant!` | `>30` checks, `scalar-transfer` FMOV, ADRP | rewrite (small) |
| a64/emit.coil | 800 | ALU tile encoding | `allocated-selected-with-locations!`, `word!`, `single!` | 3-address, XZR = 31, 4-byte words, x16/x17 | rewrite |
| a64/transfers.coil | 515 | location moves, parallel copies | `emit-at!`, `parallel-*`, `identity-id!`, `width-location?`, `data-scratch-unused?` | register 31 invalid, LDR/STR/FMOV/ORR, scratch 16/17/62/63 | `parallel-impl!` structure neutral (wraps neutral `moves/resolve`); encodings a64 |
| a64/typed-transfers.coil | 189 | sized parallel copies | `parallel-frame!`, `Copy` | reserved 16/17/62/63, holder 17/63 | ~80% neutral; parameterize scratches |

**Neutral modules:**

| File | Lines | Notes |
|---|---|---|
| allocation.coil | 1820 | target-free given count, mask, shapes |
| constraints.coil | 140 | |
| fixed-uses.coil | 265 | |
| interval.coil | 107 | |
| matched-uses.coil | 227 | `Plan{ranges, inputs, definitions, omitted, rematerialized, output-ranges, outputs, definers}` |
| pipeline.coil | 284 | |
| schedule.coil | 309 | |
| image.coil | 243 | |
| locations.coil | 333 | |

## 4. Matching, selection and emission dispatch

**Representation.** A tile is `select/Tile{rule i32, wide bool, left i32, right i32, immediate u64}`, stored per graph reference in `Plan.tiles`. Rule numbers are listed at select.coil:13–35. `immediate` packs encoding fields, e.g. shift kind/amount, N:immr:imms, access width and sign (rule 57), or the multiplier reference (rules 54/55).

**Fusion** is expressed in side tables, never by rewriting the graph:
- `operands.omitted` marks retired producers (fused compares, shifts, MULs, extensions).
- `comparisons[ref]` is the absorbed compare for an IF/COND.
- `addresses/offsets/indices/index-shifts` give the folded base + displacement + scaled index for LOAD/STORE (opcodes 91–94).
- `doubles` covers vector doubling; `extractions` maps a view to its source.
- `matched-uses/build-with-unary-inputs` rewrites machine input ranges so that liveness sees only the operands that survive fusion.
- `rematerialize!` withdraws definitions (frame addresses, word constants) and `locations` index recipes for them (kind 2/3/4).

**Dispatch.** `function.coil` branches on the IR opcode first. Special emitters handle return, end, switch/IF, call, memory, atomics, vector, floating, checked, cond, unary and convert. Only plain integer ALU nodes reach `emit/single!`, a `match` on `tile.rule` (emit.coil:102–163). Condition codes come out as `rule - 20` straight into `encode/conditional-set`.

**What x86 needs:**
- A new rule set: LEA (base + index·scale + disp32 covers rules 50/52 and add-immediate), `imul r, r/m, imm32`, immediate ranges imm8/imm32 instead of 12-bit/logical-immediate.
- Memory operands for ALU and compare. `matched-uses` can carry these (redirect inputs to base/index as LOAD already does), but `constraints/build-matched` and the dispatch chain only consult `addresses`/`indices` for opcodes 91–94.
- Two-address handling (section 2).
- Flags: on AArch64 only the S-forms touch NZCV. code.coil:112 states that materialization preserves NZCV, and match.coil:160 repeats immediate compares at each IF/COND user. On x86, every move, constant or address materialized between CMP and Jcc/CMOVcc/SETcc must avoid flag-clobbering forms (`xor` zeroing, `add`/`sub`; `lea`/`mov` are safe). `apply-flag-fusions!`/`note-decrement-flags!` (function.coil:1854–2000) assume the A64 rule that ALU words don't set flags; on x86 most do.
- A condition-code mapping table, since a64 cc = rule − 20.
- Variable-length encoding: `Buffer.alignment` 4, `append32!` everywhere, and fixups/relax for imm19/imm26 all need replacing.

## 5. Neutral code that assumes AArch64

- **relocate.coil:7** imports `stogir.a64.relocation`. This is the only neutral → a64 import.
- **image.coil:15 / :219–234**: relocation kinds limited to 1..4 (ABS64, BRANCH26, PAGE21, PAGEOFF12), widths 8/4. x86 needs PC32/PLT32/GOTPCREL-style kinds. image-order.coil:29–33 has the same check.
- **link.coil:197** pads text with the AArch64 NOP `0xD503201F`. `image/create` sets `text-alignment` 4 and `valid-alignments?` requires ≥4.
- **locations.coil:10–11, :22**: `address-base` returns 29 (x29) for kind 2 and 31 (SP) for kind 3.
- **aot/macho.coil:1** is "Darwin arm64 MH_OBJECT".
- **verify.coil:551** comments that native entry targets AArch64 with 8-byte addresses (fine for x86-64).
- **Register domain**: fixed-uses.coil and allocation.coil cap at 64 registers with u64 masks; this fits x86 (16 + 16).

No neutral module hard-codes 32 registers or a 4-byte word beyond the image/link items above. Two remaining assumptions live outside src/stogir/*.coil proper:
- The 2-sub-position model (live-ranges.coil:19) shapes every constraint.
- allocation-snapshot.coil:21 is only a comment.
