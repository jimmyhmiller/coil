# Survey: coil adapter

Read-only survey of the AArch64 backend taken on 2026-11-10 at library commit da30f8a, for the x86-64 port. Line numbers refer to that commit.

I mapped the compiler side. The vendored library is AArch64-only: it has `stogir/a64/*` and Mach-O/Darwin pieces in `aot/` and `jit/`, and no x86-64 directory. Its image format only knows the relocation kinds `1=ABS64, 2=BRANCH26, 3=PAGE21, 4=PAGEOFF12` (`stogir/image.coil:15`, validated at :225-228), so x86 kinds have to be added there too. Below, "CT" is `src/compiler/backend/codegen_tpde.coil` and "CS" is `src/compiler/backend/codegen_stogir.coil`.

## 1. How the backend is selected, and every arch/Mach-O gate

**Backend codes** (`src/compiler/driver.coil`): 1=llvm, 2=arm64, 4=wasm, 5=x64, 7=tpde, 8=stogir. They are defined in `unit-backend-name` (:3184), `backend-named` (:3227) and the build-unit parser (:3837). `native-backend?` (:3203) counts 2, 5, 7 and 8 as native. Every native build goes through `build-native-program` (:6889) → `cgnative-build-object` (CT:6438), which passes `stogir = (= backend 8)` into `tl-write-object` → `tl-build-mobj`.

**Where the arch is decided:** `tl-build-mobj` (CT:5890) sets `x64 (= arch "x86_64")` from `tl-arch where`, which is `target-arch-str` for OnTarget and `host-arch-str` for OnHost (CT:5884). It then sets `(.x64 tl)` (CT:5948) and `(.elf tl) (tl-elf-target? …)` (CT:6288). ELF is chosen only for linux+x86_64.

| Gate | Location | Effect |
|---|---|---|
| `native-backend-target-ok?` | driver.coil:3208-3224 | `(or (= backend 2) (= backend 8)) "aarch64"`. This prints the error "--backend stogir compiles for aarch64, but the target is x86_64; pass a --target…". It is called from build-unit (:3870) and `build-native-program` (:6895). |
| Stogir target check | CT:5900-5902 | `tl-fail "stogir: this backend currently supports macOS AArch64"` unless arch=aarch64 and os=darwin |
| -O0 / level range / -g | CT:5903-5912 | -O0 refused, level must be 0..3, DWARF refused |
| `build-emits-dwarf?` | driver.coil:6882 | DWARF is on by default for native backends except 8 |
| Unit key | driver.coil:3283-3313 | Already records `target-arch-os`, plus `stogir-settings` when backend is 8 |
| Data section | CT:5696-5701 | Stogir data goes to Mach-O `"__DATA_CONST","__stogir"`. `elf-sect-name` (CT:6139) has no case for it and will `tl-fail`. |
| Text data | CT:5685-5692, `object/macho.coil:91` | `MTextData` (DICE). The ELF writer ignores it. |
| Machine-code target | CT:5581 | Uses `(if (.x64 tl) "x86_64" "aarch64")`, which already works on x86 |

Gates to change for x86: driver.coil:3210, CT:5900-5902, and the `__DATA_CONST,__stogir` → ELF mapping.

## 2. The CIR is already lowered to each arch's ABI

The CIR that reaches the adapter is arch-specific. `tl-abi-info-raw` (CT:928) picks `sysv-info` (CT:889) when `.x64`, else `g-abi-info` (native_module.coil:680). Class codes: 0/1 scalar, 2 one eightbyte, 3 two eightbytes, 4 sret/MEMORY, 5 HFA, 6 empty, else indirect.

| Aspect | a64 (Apple) | x64 (System V) | Where |
|---|---|---|---|
| 9-16 byte, 16-aligned aggregate | one `T-I128` (`pair-as-i128?`) | split into eightbytes | CT:3429, 3496 |
| Class-3 pair | two words, `group-flags 1` | eightbyte types per class (I64/F32/F64), `AF-MIXED` if the banks differ | `pair-flags` CT:972 |
| MEMORY aggregate arg | indirect copy, `AF-ADDRESS\|AF-INDIRECT` | `cir/af-byval size` (pointer, callee sees the stack copy) | lower-arg! CT:~3500-3540; params CT:~4018 |
| HFA (class 5) | n args with `group-flags` | n/a | CT:3511 |
| sret | `AF-SRET` first arg, `ret0!` | `AF-SRET` first arg, `ret1! sret` (rax) | tl-emit-call CT:3566; tl-return! CT:4064 |
| Variadic | promote f32→f64, `AF-VARIADIC`, no narrow size | same flags | CT:3432, 3446 |
| Narrow ints | `af-size` (bits 24..26, Apple stack packing) and `AF-SIGNED`/`AF-SEXT` | same flags; not gated by arch | `narrow-arg-flags` CT:3413 |
| `:shim` trampolines | `tl-shim-trampoline-a64!` | `tl-shim-trampoline-x64!` (push/pop into SysV regs, R-PLT32) | CT:3784-3825 |
| Machine-code `ret` | `0xD65F03C0` | `0xC3` | job-run! CT:4335 |

The trampolines and machine-code jobs run on the stogir path too (CT:4384, 5292), so they already work on x86.

**Flags that carry ABI information** (`tpde/cir.coil:272-322`):
- `AF-SEXT 0x80`, `AF-SRET 0x100`, `AF-VARIADIC 0x200`, `AF-ZEXT 0x400`, `AF-BYVAL 0x800` (size in bits 12+), `AF-MIXED 0x1000`, `AF-ADDRESS 0x2000`, `AF-INDIRECT 0x4000`, `AF-SIGNED 0x8000`.
- Bits 16..23 give the consecutive-group count; bits 24..26 give the C size.
- They are stored in `Func.arg-flags` / `arg-sret` (parameters, `arg-flagged!` :690) and in `argflags` per call operand.
- `OP-SHIMCALL` (104) reuses `argflags` as register numbers, with `imm2` = clobber mask and `aux` = result register. For x64 these are x86 GPR numbers (`shim-reg`, CT:3732; `x86-gpr-num`, native_module.coil:514).

**Where the adapter rejects the x64 shapes today:**
- `argument-type` fails on `flags & 0x1800` (MIXED|BYVAL) at CS:247-249.
- Call results of mixed types fail at CS:758.
- Mixed return registers fail in `translate!` (CS:~2063).
- A function with an sret parameter and `ret1!` fails "invalid function indirect result shape" (CS:2084).
- i128 values become two words with a `Group :alignment 16` descriptor (CS:788, 2257). That alignment is the AAPCS even-register rule; SysV needs consecutive GPRs and 16-byte alignment only on the stack.

## 3. AArch64 assumptions in codegen_stogir.coil

| Item | Location | What x86-64 needs |
|---|---|---|
| `(import "stogir.a64.compile" :as native)`, `(import "stogir.a64.private-leaf" :as private)` | CS:36-37 | Choose the module by arch, or add a target-generic façade (`stogir.x64.*`) |
| Entry points: `native/image-with-options[-proven]`, `image-with-private`, `image-for-private-module[-proven]` | `native-image` CS:4689-4715, `native-leaf-image` CS:4576 | x64 equivalents |
| `private/context-create` plus ~17 `with-*` options, `register-as!`, `confirm-publication!`, `seal-module!`, `verify-publication`, `binding`, `no-context` | `begin-native!` CS:4511, publish CS:4592-4637, seal/verify CS:4660-4672, merge CS:2368 | x64 private-leaf module, or disable the leaf cache (`.stogir-level > 1`, CT:5462) |
| `merge!` | CS:2311 | See the list below |
| Relocation kinds `merge!` understands | CS:2313-2422 | Image: 1=ABS64→`R-ABS64`, 2→`R-BRANCH26`, 3/4→`R-PAGE21`/`R-PAGEOFF12`. An 8-byte data slot read by kind 3+4 becomes `R-GOT-PAGE21`/`R-GOT-PAGEOFF12` against the symbol, and the LDR encoding is checked with `0xFFC00000`/`0xF9400000` (CS:2398-2402). Nonzero addends are rejected. x86 mapping: call/jmp rel32 → `R-PLT32`, RIP-relative lea/data → `R-PCREL32`, slot load `mov r,[rip+slot]` → `R-GOTPCREL32` (becomes REX_GOTPCRELX), data → `R-ABS64`. The field offset must be the disp32 start, which must also be the end of the instruction (see §4). |
| Symbol conventions | CS:195, 2352 | `"_coil_stogir_body"` and `_coil_stogir_import_N` are Mach-O-style names but only internal; they are arch-neutral |
| `pure-runtime-call?` / `runtime-compare-call?` | CS:504-525 | Match `_` + name and `"_memcmp"`/`"_bcmp"`. These are MObj names, which keep the `_` prefix on ELF too (`elf-sym-name` strips it later, CT:~6170), so they stay valid. |
| Runtime symbols | `runtime-symbol!` CS:213 | `memset`, `memmove`, `__divti3`, `__udivti3`, `__modti3`, `__umodti3` (CS:1355-1358, 1473, 1503). `tl-merge!` adds `_` (CT:~5750). This is fine on Linux x86 (libgcc/compiler-rt). |
| SHIMCALL thunk | `shim-code` CS:566-650 | Hard-coded A64 encodings (`stp`/`ldp` `0xA9BF7BFD`, `blr` `0xD63F0000`, `ret` `0xD65F03C0`), registers x0..x28 with x18/x29/x30 excluded, inline bytes must be a multiple of 4. Needs an x86 thunk: SysV regs rdi..r9 in, push/pop of the callee-saved regs the convention clobbers (rbx, rbp, r12-r15), `call *r11`, result to rax. `shim-key` and `shim-thunk!` (CS:539, 652) are generic. |
| Type ids | `type-id` CS:166, `integer-type` CS:238, `argument-type` CS:246 | Library type ids (0 void, 5 word, 6 address, 12 f64, 13 f32, 37 v128, 2-4/8-11 narrow ints) are library-level, not ISA-level. The x64 ABI in the library must treat narrow typed args as 8-byte SysV slots, not Apple-packed. |
| Variadic | `lower-call!` CS:779, flags `25` vs `9` | The library's a64 call ABI puts variadics on the stack (Apple). x64 must pass them in registers and set `%al`. |
| Tail self-loop rule | `self-loop-site?` CS:1934 | Mask `0x1b00`; generic |
| Floating ops | CS:1670 | FSQRT/FMIN…/FRINT/FMA extension opcodes 131..141 assume AArch64 instruction semantics; the x86 lowering must match LLVM's semantics |
| Text data | CS:2338-2344 → `MTextData` | Probably empty on x86, or harmless (the ELF writer drops it) |
| Debug info | CT:5911 | None, so nothing to port |
| Settings and unit key | `Settings`, `settings-read`, `settings-key` CS:2853-2923 | Arch-neutral; the unit key already includes the target. Some settings (`shrink-wrap`, `frame-split`, `call-holes`) map to a64 passes. |
| Parallel pools and threads | CS:4792-5450 | Generic |

## 4. How the x64 path writes ELF, and what the adapter must produce

There are two layers.

**First, `tasm/Asm`** (`tpde/asm.coil`):
- Fixed sections: `SEC-TEXT`, `CONST`, `CSTRING`, `DATA`, `DATA-CONST`, `BSS`.
- `Reloc{sect,off,sym,kind,addend}`.
- Kinds: `R-BRANCH26 0`, `PAGE21 1`, `PAGEOFF12 2`, `GOT-PAGE21 3`, `GOT-PAGEOFF12 4`, `ABS64 5`, `PCREL32 6`, `PLT32 7`, `GOTPCREL32 8`, `ABS32 9`.
- tpde x64 conventions: undefined or global symbols are loaded from the GOT with `R-GOTPCREL32`; local symbols use `lea` + `R-PCREL32` (`load-sym-addr!`, `tpde/x64.coil:230-253`). The offset is the start of the disp32, which is the last 4 bytes of the instruction, with addend 0. Calls use `R-PLT32` at `call` + 1.

**Second, `tl-merge!` (CT:5663) builds the MObj** (`object/macho.coil`):
- Types: `MSect` (segname/sectname), `MSym{name,sect,off,ext,weak}`, `MReloc{sect,off,sym,rtype,pcrel,len}`.
- For x64, nonzero addends are patched into the field as implicit addends (CT:5679-5683). The patch always goes into the text buffer, even for a relocation in DATA-CONST, which is a latent bug.
- Kinds map to Mach-O X86_64 types: `(case k 7 2 6 1 8 3 0)` with `pcrel (!= k 5)` (CT:5766-5776). So `R-ABS32` (kind 9) would become a pc-relative UNSIGNED and `elf-reloc` would fail.
- Symbol names: `l_tpde.N`, `l_stogir.N`, `_name`.

**`tl-elf-object` (CT:6213) converts the MObj to an EObj:**
- `elf-sect-name` (CT:6139): `__text`→`.text`, `__const`→`.rodata` or `.data.rel.ro`, `__data`, `__coil_big*`, `__DWARF`.
- `elf-reloc` (CT:6196): UNSIGNED ln3 → `R_X86_64_64`, ln2 → `_32`, SIGNED → `PC32` (addend implicit−4), BRANCH → `PLT32`, GOT_LOAD → `REX_GOTPCRELX`, type 4 → `GOTPCREL`.
- It also marks a non-executable stack. `elf-write` is in `object/elf.coil:252`.
- `tpde/elf.coil` and `tpde/macho.coil` (direct Asm writers) are not used by the compiler.

**TLS:** there are no TLS relocations anywhere in the native/object layer.

So for x86, the adapter must:
- emit into `ta`, with `SEC-TEXT` code and `R-PLT32`/`R-PCREL32`/`R-GOTPCREL32`/`R-ABS64` at disp32 offsets, with addend 0 or an implicit addend;
- put its data either in `SEC-DATA-CONST` (and add an ELF mapping, e.g. `__DATA_CONST,__stogir` → `.data.rel.ro`) or in an existing mapped section.

A RIP-relative operand followed by an immediate needs a compensating addend of −N. That works through the ELF path; Mach-O x86 would need SIGNED_N, which is not modelled.

## 5. JIT and compile-time execution

Stogir does not take part. Every in-process builder hard-codes `stogir=false, optimization=1`:
- `cgtpde-build-mobj` (CT:6299)
- `cgtpde-build-eobj` (CT:6310)
- `cgtpde-build-host-object` (CT:6353)

They are used by `main_x64.coil:90/108`, `main.coil:1076/1094`, `jit_api.coil:168-205` and the REPL (`driver.coil:25339-25378`, `repl-native-load`).

On a Linux x86-64 host, comptime, metaprograms and the REPL go through tpde x64 → EObj → `jit/jit_elf.coil`. That loader handles `R_X86_64_64`, `_32`, `PC32`, `PLT32` (with a stub when out of range), `GOTPCREL`, `REX_GOTPCRELX` (`jit-elf-patch!` :224, `ejit-got-reloc?` :210) and provides `__divti3` and friends (:127-136). `tpde/jit.coil` maps an Asm directly. Nothing JIT-side needs porting.

The only effect on the JIT side is units. A `--backend stogir` consumer needs a stogir-built `coil.jit` unit (`units/<backend>/jit-<impl>`, driver.coil:4085-4131), which is built on demand because `unit-backend-buildable?` is true for backend 8.

## 6. Build and test scripts

**`scripts/dev.py build`** variants (:53-81): `full`→`linux` and `nollvm`→`nollvm-linux` on an x86_64 Linux host, plus `x64`.

| Script | Source | Backend |
|---|---|---|
| `rebootstrap-linux.sh` | `main.coil` | LLVM-only fixpoint; no native backend runs (:5-7, 106-113) |
| `rebootstrap-nollvm-linux.sh` | `main_x64.coil` | `--backend x64` fixpoint and corpus gate (:84-91) |
| `bootstrap-x64.sh` | `main.coil` | stage2/3 `--backend x64`, oracle corpus, `oracle/x64/gate-cabi.sh`, `gate-encode.sh` |
| `scripts/tests/x64-host.py` | — | Runs all of the above over ssh, plus `gate-elf.sh`; no stogir step |

**`main_x64.coil`** does not import `codegen_stogir` directly. It imports `codegen_tpde` (:38-40) and `driver`, both of which import it (CT:69, driver.coil:158). So the adapter and the vendored a64 library are already compiled into the x64 compiler, and `--backend stogir` parses there; it is just refused at driver.coil:3210. `main.coil` is the same, via `codegen_tpde` (:44).

**Tests** (all under `scripts/tests/fast/cli.sh:1283-1356`, inside `if [ "$HOST_OS" = Darwin ] && [ "$HOST_ARCH" = arm64 ]`):
- `native-backends.coil`, `stogir-register-results.coil` and `stogir-capture-loop.coil` for llvm/tpde/stogir.
- Python checks: `stogir-live-emission.py` (greps `ARM64_RELOC_BRANCH26`), `stogir-runtime-bulk.py` (same), `stogir-unit-settings.py`, `native-link-versions.py` (Mach-O versions), `stogir-volatile.py` (`bl`, `ldp`/`stp`), `stogir-levels.py`, `stogir-readonly-library-calls.py` (`bl`), `stogir-wide-powers.py`.
- `.coil` runs: `stogir-{readonly-library-calls,return-piece-placement,frame-split,tail-calls}.coil`.
- Not wired into any tier: `stogir-call-effects.py` (`bl`), `stogir-parallel-emission.py`, `stogir-shim-calls.py` (`_coil.stogir.shim.N`), `stogir-symbol-addresses.py` (`adrp`+`ld`).
- `scripts/oracle.py` has a `stogir` lane (:52, :106).
- `tests/backend/stogir-shim-calls.coil` and `stogir-frame-split.coil` contain arm64-specific content.

**`docs/benchmarks/private-call-module/bootstrap.py`** is a single-run diagnostic, not an acceptance measurement. It runs `emit-obj src/compiler/main.coil --backend stogir|llvm -O3 --no-debug` with `COIL_TPDE_SERIAL=1` and `COIL_CODEGEN_TIMINGS=1`, and sums `coil-codegen` generation time, wall, CPU and RSS. It then links a "host" compiler from each object, re-emits with `--backend stogir` using each host, and asserts the bytes match the seed object.

macOS-specific parts:
- `/usr/bin/time -l` and the `maximum resident set size` regex (GNU time uses `-v`, in kbytes).
- `build/bin/native/curl/arm64-macos`.
- `-framework CoreFoundation -framework SystemConfiguration`.
- `-Wl,-dead_strip`.
- Linking libLLVM via `llvm-config --libdir`.

On Linux this would need `x86_64-linux` archives, `--gc-sections`, and the link flags from `rebootstrap-linux.sh`.
