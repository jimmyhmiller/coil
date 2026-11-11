# Survey: code bytes fixups jit aot

Read-only survey of the AArch64 backend taken on 2026-11-10 at library commit da30f8a, for the x86-64 port. Line numbers refer to that commit.

I read every file you listed, plus the a64/function.coil finalization pipeline, a64/compile.coil, a64/value.coil and a64/emit.coil, and 7 tests (jit-memory, jit-image, jit-external, jit-branch, jit-call, aot-call-link, aot-switch-tables-link). Paths below are relative to `/Users/jimmyhmiller/Documents/Code/projects/coil-stogir/.worktrees/x86/src/stogir/` unless they start with `tests/`. The neutral layers (`image`, `link`, `relocate`, `jit`, `aot`) are not fully target-neutral: AArch64 assumptions have leaked into them, listed in §1–§4.

## 1. Code buffer model (`a64/code.coil`, `a64/fixups.coil`)

| Record | Definition | Meaning |
|---|---|---|
| `Buffer` | code.coil:24 | `alignment` (default 4), `text: ArrayList u8`, `references: ArrayList Reference`, `text-data: ArrayList Range`, `fixed: ArrayList i64` (offsets of volatile accesses) |
| `Reference` | code.coil:17 | `offset`, `kind` (2=BRANCH26, 3=PAGE21, 4=PAGEOFF12), `target` (a negative graph constant id) |
| `Branch` | fixups.coil:11 | `offset`, `label`, `condition` (-1 = B/BL, 0..15 = B.cond, 64..191 = CBZ/CBNZ, 256..4351 = TBZ/TBNZ), `link` |
| `Relative` | fixups.coil:61 | a signed 32-bit table word at `offset` holding `label - base` |
| labels | `ArrayList i64` | byte offsets; -1 means unbound |
| `text-data/Range` | text-data.coil:6 | `offset`, `length`, `kind`, using Mach-O DICE kind ids (`width`: kinds 1/2 → 1 byte, 3 → 2, 4/5 → 4) |

**Emission pipeline** (a64/function.coil:1256–1293): `finish-stubs!` → `apply-flag-fusions!` → `fixups/merge-conditions!` (CCMP) → `pair-adjacent!` (LDP/STP) → `compact-removed!` → `relax-aligned!` → `apply!` → `apply-relative!`. Branch sites start as a zero placeholder word (switch.coil:14–24 `branch!`).

**Where the 4-byte word is assumed:**
- **code.coil**:
  - `fix-last-word!` (`len-4`, :47).
  - `append!` requires base and reference offsets to be multiples of 4 and the kind to be in 2..4 (:62–86).
  - `materialize!`, `reference-address!` and `direct-branch!` require `len % 4 == 0`.
- **fixups.coil, `apply!` / `apply-relative!`**: offsets and targets must be multiples of 4; patching is `patch32!` only.
- **fixups.coil, `relax-copy-aligned!`**:
  - The whole layout is indexed per word: `branch-at`, `prefix` and `boundary-alignment` are sized `size/4+1` (:247–249), and every metadata offset is remapped through `prefix[offset/4]` (:333–356).
  - A far branch grows by exactly 4 bytes and becomes "inverted B.cond +8 ; B" (:316–324).
  - Padding is the A64 NOP `0xD503201F` (:314, :328).
- **fixups.coil, peepholes**:
  - `pair-word` / `pair-adjacent!` (:384–468) and `read-word` merge LDR/STR pairs.
  - `merge-conditions!` (:594) and `LabelIndex` (head is sized `size/4+2`) build CCMP.
  - `compact-removed!` (:741) deletes whole NOP words, keeps the 4 words before a switch table (because ADR is fixed at +16, :763), and rebases through `shift[offset/4]`.
  - All of these are AArch64-only.
- **Block alignment** pads with `0xD503201F` (function.coil:752–756).
- **Leaks into neutral code**:
  - `link.coil:76` rejects text whose length is not a multiple of 4; `link.coil:197` pads between parts with the A64 NOP.
  - `relocate.coil:85` requires `offset % 4`.
  - `jit/layout.coil:23` requires `text % 4`, and `:32,34` assumes 16-byte veneers.
  - `image.coil:45` requires text alignment of at least 4.

**Veneers/stubs:** the only veneer is the JIT external-branch one (§3). There are no in-text long-branch veneers: BRANCH26 reaches ±128 MB, and only predicates are relaxed. "Stubs" in function.coil are edge-copy blocks appended after the body, each ending in a `B`.

## 2. Image format (`image.coil`, `a64/image.coil`)

`image/Image` (image.coil:19) has `text-alignment` (4), `data-alignment` (8), `text`, `text-data`, `data`, `names` (byte arena), `symbols`, `heads` (hash chains), `relocations` and `local-sequence`.

- **Symbol**: `name`/`length` into the arena, `section` (0 = undefined, 1 = text, 2 = data), `offset`, `next`, `global?`. Private names are `L_stogir_<16 hex digits>` (`fresh-local!`).
- **Relocation**: `section`, `offset`, `kind`, `symbol`, `addend`. The kind range check `1..4` is hard-coded in `relocate!` (image.coil:227), image-order.coil:32 and code.coil:84. Width is `kind==1 ? 8 : 4` everywhere.

| Kind | Value | Target |
|---|---|---|
| ABS64 | 1 | neutral; reuse as R_X86_64_64 |
| BRANCH26 (B/BL) | 2 | AArch64 |
| PAGE21 (ADRP) | 3 | AArch64 |
| PAGEOFF12 (ADD / scaled LDR/STR) | 4 | AArch64 |

**`a64/image.coil` `finish!` (:171)**:
- Moves the text into the image and copies the text-data ranges.
- Defines the entry symbol as global text at offset 0 and interns named symbols as undefined globals (`register-target!`).
- Turns each `code/Reference` into an image relocation with addend 0.

How each kind of target is resolved (`relocation-target!` :125):

| Target | Data placed | Code sequence |
|---|---|---|
| kind-2 call | none | relocation points directly at the named FUNC symbol |
| named function or data | 8-byte local slot in `.data` with an ABS64 relocation to the real symbol (`address-slot!` :72; one slot per symbol, shared through a HashMap). This is a private GOT. | ADRP + LDR |
| string | NUL-terminated bytes in `.data` (`string-target!`) | ADRP + ADD |
| long/vector constant (opcode 78) | data at alignment ≥8 (`long-target!`) | ADRP + ADD (+ LDR q) |

**x86-64 kinds needed:**

| Kind | Formula | Width | Use |
|---|---|---|---|
| ABS64 (keep 1) | S+A | 8 | address slots, data pointers |
| PC32 | S+A−P | 4 | `lea`/`mov` `[rip+X]` to local data/slots; switch-table LEA if done as a relocation |
| PLT32 | L+A−P | 4 | `call`/`jmp rel32` to named functions |
| GOTPCREL(X) | G+A−P | 4 | optional; the private-slot design makes it unnecessary |

Addends must become explicit: usually −4, or more when an immediate follows the disp32. `finish!` currently forces 0. Widths stay 4/8, so the image-order overlap logic still works.

## 3. JIT (`jit/darwin.coil`, `jit/layout.coil`, `relocate.coil`)

Externs (darwin.coil:14–34): `mmap`, `mprotect`, `munmap`, `getpagesize`, `sys_icache_invalidate`.

- **`map-text`** (:45): mmap with `prot=3`, `flags=0x1002` (MAP_ANON 0x1000 | MAP_PRIVATE 2), copy, `mprotect 5` (RX), icache invalidate.
- **`map-image-resolved`** (:102):
  1. Validate text-data and plan the layout (`layout/plan`: text + 16×veneers rounded to a page, data at `max(page, data-align)`, over-reserved for alignment).
  2. mmap PROT_NONE, align the base, make the text/data pages RW.
  3. Build `addresses[symbol]`; undefined symbols come from `resolved`/`present`.
  4. For each kind-2 relocation to an undefined symbol, append a veneer `0x58000050` (LDR x16,#8), `0xD61F0200` (BR x16), then the 8-byte target, add a local symbol for it and retarget the relocation (:198–243).
  5. `relocate/apply!`, copy into place, mprotect text to RX, invalidate.
- **`Loaded`** = `{memory: Image{base,size,text-size,allocation,allocation-size}, addresses, data-offset}`. Also `map-image`, `release!` and `release-image!`.

**Darwin-specific parts:** there is no MAP_JIT and no `pthread_jit_write_protect_np` (it uses an RW→RX flip). The Darwin-only pieces are the flag value 0x1002, `sys_icache_invalidate`, and the 16-byte A64 veneer.

**What Linux x86-64 needs:**
- flags 0x22 (MAP_PRIVATE | MAP_ANONYMOUS); PROT values are the same.
- No icache flush.
- `getpagesize` exists in glibc.
- A veneer of `FF 25 00000000` (jmp [rip+0]) followed by the 8-byte target: 14 bytes, pad to 16.
- Drop the `%4` checks in layout.

**`relocate.coil`** is neutral but imports `stogir.a64.relocation`:
- `apply-ordered!` handles ABS64 itself; any other kind does a read32 of the instruction word, requires `offset%4`, and calls `a64/instruction` (`page21`, `pageoff12`, `branch26`, relocation.coil:34–72).
- It plans every patch before writing any.
- For x86, PC32/PLT32 write `int32(S+A−P)` straight into the field, with a ±2 GB range check, and no instruction decode.

## 4. AOT (`aot/macho.coil`, `aot/macho-symbols.coil`)

**API:** `image-object [(source image/Image) (allocator)] → (Result (ArrayList u8) (slice u8))`, plus `text-object [text symbol allocator]`. `compile/object` (a64/compile.coil:478) is `image` + `macho/image-object`.

**Mach-O / AArch64-specific parts:**
- cputype `0x0100000C`.
- Relocation mapping (:212–244): ABS64 → UNSIGNED, with the addend stored in the section bytes. The other kinds are cleared with `a64/clear`, preceded by an `ARM64_RELOC_ADDEND` record when the addend is nonzero (24-bit limit), and use pcrel for kinds 2/3.
- LC_BUILD_VERSION for macOS 11, LC_DATA_IN_CODE generated from text-data, a 16 KB alignment cap, and `%4` checks.
- `macho-symbols` orders symbols locals → defined → undefined.

**What an ELF writer must provide (`aot/elf.coil`, same signature):**
- ELF64 header with ET_REL and EM_X86_64 (62).
- Sections: null, `.text` (AX, text-alignment), `.data` (WA), `.rela.text`, `.rela.data`, `.symtab` (sh_info = first global), `.strtab`, `.shstrtab`, `.note.GNU-stack`.
- All locals before all globals, with ids remapped.
- RELA entries with `r_info=(sym<<32)|type` and the addend taken from the record; the field bytes are left zero.
- text-data is dropped (ELF has no equivalent).

**Compiler ELF writers, for reference only (the library must not import them):**
- **`coil/.worktrees/stogir-x86/src/compiler/object/elf.coil`** (module `coil.compiler.elf`, imports `coil.compiler.x64`):
  - Builder API: `eobj-new`, `eobj-add-sect!(name align stype flags)→ordinal`, `eobj-add-sym!(name sect off ext)`, `eobj-add-func-sym!`, `eobj-add-weak-sym!`, `eobj-add-reloc!(sect off sym rtype addend)`, `eobj-mark-nonexec-stack!`, `elf-write → (ptr (ArrayList u8))`.
  - Constants: R_X86_64_64=1, PC32=2, PLT32=4, GOTPCREL=9, 32=10, 32S=11, REX_GOTPCRELX=42.
- **`tpde/elf.coil`**: `write-object!(Asm, Buf)`. It covers six sections (.text/.rodata/.rodata.str1.1/.data/.data.rel.ro/.bss) and uses "PC-relative addend = symbol addend − 4".

## 5. Switch tables, constants and address formation

| Thing | AArch64 now | x86-64 change |
|---|---|---|
| Jump table (switch.coil:130 `table!`) | `ADR x17,#16; LDRSW x16,[x17,idx,LSL#2]; ADD x16,x17,x16; BR x16`, then 32-bit `Relative` entries (`target − table base`) and a text-data kind-4 range. Base = `len+16` (:146). | `lea r11,[rip+T]; movsxd r10,[r11+idx*4]; add r10,r11; jmp r10`. The `Relative` model works unchanged, but the LEA displacement is not a fixed 16; it needs a new internal label-rel32 fixup. |
| Dispatch | tree / linear / bit-test using x16/x17 scratch, `compare-in!` (imm12 or MOVZ+CMP), CBZ/TBZ | `cmp r, imm32`; `bt` for bit tests; choose scratch registers |
| Integer constants (constants.coil `emit!`) | MOVZ/MOVN + MOVK (≤4 words) | `mov r32,imm32` / `mov r64,simm32` / `movabs`; most ALU ops take simm32, so constant-hoist's register-operand heuristics shift |
| Float scalars (value.coil `scalar-constant!`) | GPR MOVZ/MOVK, then FMOV | RIP-relative pool load (`movsd xmm,[rip+c]`, PC32), or `movabs` + `movq` |
| Vector/long constants | data blob + ADRP/ADD + LDR q | `movdqa/movups xmm,[rip+c]` (PC32) |
| Named symbol address (code.coil:141 `reference-address!`) | ADRP + LDR from slot (kinds 3/4) | `mov r,[rip+slot]` (PC32 to the local slot); strings: `lea r,[rip+s]` |
| Direct call/jump (code.coil:183 `direct-branch!`) | BL/B with BRANCH26 | `E8`/`E9` rel32 with PLT32 |
| Frame addresses (frame-address.coil, frame-memory.coil, memory.coil, address.coil) | imm12 ADD/SUB with an x16/x17 fallback; scaled or 9-bit offsets (`encodable?` address.coil:12); index scales 0..4 | disp32 + SIB makes most fallbacks disappear; scale ≤ 3 (no ×16) |

`constant-hoist.coil` is a graph-level pass (it inserts COPYs into loop preheaders) and is portable apart from its tile/`select` coupling. `word-constant.coil` is graph-only.

## 6. Test harness

**Facade-level JIT pattern** (`tests/jit-memory.coil`):
1. Imports: `stogir.graph`, `stogir.builder`, `stogir.a64.compile`, `stogir.jit.darwin`.
2. Build the graph: `g/create`, then `b/emit! (mut graph) opcode type [ops]` with numeric opcodes, e.g. 104 START, 71 PARAM, 26 ADD, 93 STORE, 91 LOAD, 120 RETURN; plus `b/scalar-constant!`.
3. `compile/text graph start [ret] a` returns `ArrayList u8`, and errors if there are symbolic references.
4. `jit/map-text (slice bytes)`, cast `.base` with `primitive/cast (fnptr (cc/C) [...] i64)`, call with `call-ptr`, then `jit/release!`, `free!` the bytes, `g/release!`.

**Image JIT pattern** (`tests/jit-call.coil`): `compile/image` or `compile/image-with-options` with a symbol such as `"_tail_recursive"` → `jit/map-image` → `(get (.addresses mapped) 0)` → `jit/release-image!` → `image/release!`. External symbols go through `map-image-resolved` with `resolved`/`present` slices (`tests/jit-image.coil`, `tests/jit-external.coil`, both of which hand-encode A64 words).

**AOT:** a generator test calls `compile/object` and `fs/write-file` to write e.g. `/tmp/coil-stogir-call.o` (symbol `"_stogir_call_test"`). Then an `aot-*-link.coil` test, which has no a64/jit/aot imports, declares `(extern … :as "stogir_call_test")` and runs with `coil run … --link-flag /tmp/….o` (README.md:187). On Linux the leading `_` on symbol names must be removed: 182 test files contain `"_name"` strings.

**Counts** (438 tests):

| Metric | Count |
|---|---|
| files containing `stogir.a64` / occurrences | 275 / 492 (`a64.compile` 229, `encode` 53, `private-leaf` 26, `select` 17, `code` 16, `constants` 15, …) |
| files importing `stogir.jit.darwin` | 226 |
| files importing `aot.macho` | 38 |
| no a64/jit/aot import (includes all 72 `aot-*-link`) | 158 |
| only `a64.compile`/`private-leaf` (facade-portable) | 163 |
| import a64 internals | 112 |
| jit/aot but no a64 (image-alignment, image-order, jit-external, jit-image, macho-validation) | 5 |
| contain raw A64 hex (RET/NOP) | 29 |
| write `/tmp/*.o` | 89 |

**Families:**
- **Target-neutral:** all IR-level tests (sccp, phi, loop, allocation, verify, types, …) and the `aot-*-link` consumers (72).
- **Facade-level:** most of `jit-*` (141), which would work through a target-neutral compile/jit facade.
- **AArch64-specific:** `a64-*` (14), `macho-*` (3), `jit-branch`, `jit-transfers`, `jit-parallel`, `jit-darwin`, `jit-compare`, `jit-phi`, `jit-rematerialized-transfers`, `text-data`, and anything that imports `encode`, `fixups`, `code`, `constants` or `frame-*`.
