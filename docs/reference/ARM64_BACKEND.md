# arm64 code generation

All arm64 code the compiler emits comes from the **tpde backend**: `--backend
arm64` (and its alias `--backend tpde`), the native default and `-g`, compile-time
units, metaprograms built in memory, the JIT and `coil repl`, and the LLVM-free
compiler (`src/compiler/main_a64.coil`). It lowers the monomorphized `Program` to
CIR, an SSA IR, and compiles each function with tpde's single-pass register
allocator into AArch64 code in a Mach-O object — no LLVM anywhere in the path. It
replaced a slot-per-value emitter (`codegen_a64.coil`'s expression lowering,
deleted), which tpde outran by an order of magnitude at -O0 while producing
register-allocated code.

## Files
- `src/compiler/backend/codegen_tpde.coil` — the lowering: mono `Program` → CIR,
  one function at a time, then tpde → machine code. It mirrors the LLVM backend's
  lowering decisions (sum layout `{i32 tag, payload at 8}`, slices `{ptr, i64}`,
  divergence, AAPCS64 at every call); `codegen.coil` stays the behavioral spec.
  For an x86-64 Mach-O target it writes System V code instead.
- `src/compiler/backend/codegen_tpde_ir.coil` — the `llvm-ir` escape hatch (below).
- `src/compiler/backend/native_module.coil` — the module layer the lowering runs
  on: signatures, layouts and their natural C offsets (which compile-time readback
  walks), statics and their initializers, `export-c` thunks, AAPCS64 argument
  classification, string interning, DWARF types, and the Mach-O object.
- `src/compiler/tpde/` — the tpde package, vendored from
  [coil-tpde](https://github.com/jimmyhmiller/coil-tpde) (`NOTICE` names the commit):
  CIR, the analyzer, the compiler core, the arm64 and x86-64 layers, the assembler
  and the object writers.
- `src/compiler/object/macho.coil`, `src/compiler/object/dwarf.coil` — the Mach-O
  writer and the DWARF emitters.

## The `llvm-ir` escape hatch
The corpus' inline-IR surface is finite and straight-line (no control flow, no
phi). `codegen_tpde_ir.coil` lowers a small IR subset, with the line tokenizer
and operand helpers of `native_module.coil`: after `$N/$tN/$ret`
substitution it parses each line and lowers structurally:
- `insertvalue`/`extractvalue` on `{ptr,i64}`-shaped aggregates (slices) and
  cmpxchg results; `undef`/`poison`; `ret`.
- atomics (`atomicrmw add/sub/xchg`, `cmpxchg`, `load/store atomic seq_cst`) →
  LSE (`ldaddal/swpal/casal/ldar/stlr`); plain (non-atomic) `load`/`store` of
  any size, chunked in ≤8-byte transfers for aggregates >8 bytes.
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
  `@llvm.masked.gather.v4i8.v4p0`) → NEON, all scalarized lane-by-lane (this
  keeps results bit-identical to the LLVM backend's, which is what the
  runtime corpus gate compares).
- scalar float math intrinsics (`@llvm.<op>.f32` / `.f64`, the operations
  `coil.math` is written over; the table is `src/compiler/backend/float_math.coil`) →
  `fsqrt`, `fabs`, `frintm`/`frintp`/`frintz`/`frinta`/`frintn`, `fmadd`, and
  `fmin`/`fmax` for `minimum`/`maximum`; `copysign` and the transcendentals call
  the libm function (`sinf`, `atan2`, …). `roundeven` calls C99 `nearbyint`,
  since macOS libm has no `roundeven`.
- Inline vector-constant literals (`<i32 1, i32 2, ...>`) and float literals
  (`float 1.0`) are supported anywhere a value operand is expected — these
  appear pervasively in real inline-IR (icmp/select comparands, shift
  amounts, shuffle index masks), not just in exotic call sites.
Anything outside the subset is a **hard error** naming the unsupported line.
(`call void asm sideeffect` is freestanding/ELF-only → hard error on this
Mach-O backend.)

This subset was expanded from a narrower one (originally sized to Coil's own
`slice`/`atomic`/`simd` stdlib helpers) to also cover `lib/paper`'s SIMD
raytracer (a real external project) — verified end to end by snapshot-diffing
its rendered output against the LLVM backend byte-for-byte, not just by
compiling. A per-op test file (`llvm-ir-ops.coil`) covered every op above until
the test restructure of 2026-10-12 removed it; the ops are now exercised only
where the corpus and SIMD tests reach them.

## Debug info
On by default for native builds (`-g0` / `--no-debug` turn it off): line rows per
expression, a subprogram per function, parameters and locals. A value's location
follows tpde's register placement as a location list, or a debug shadow slot in
the function's frame. A leaf that needs no other stack slot drops that frame —
setting one up in every small leaf cost `prop_bench` 75% — so its parameters are
visible only while live. Under `-g` every function keeps its frame, and a
parameter stays visible after its last use. Mach-O convention: the debug sections
carry no relocations; the linker's debug map, or the `.dSYM` that `build -g`
gathers, lets lldb find them.

## Gates (behavioral — runtime equality, not IR equality)
arm64 code is held to the LLVM backend's behaviour by the runtime corpus
(`tests/corpus`, see `docs/reference/COMPILER_TESTS.md`): self-checking programs
whose references were blessed only where the arm64 and LLVM builds agree.
- `python3 scripts/oracle.py corpus arm64 --compiler <bin>` builds each program
  with `--backend arm64`, runs it, and compares stdout and the exit status with
  the reference. FAST runs it as `corpus/arm64`; the LLVM-free bootstrap gates on it.
- `scripts/tests/c-abi.py` (FAST `c-abi`) links arm64 and LLVM objects together
  and against C.
- FAST's `cli/debuginfo` step sets a breakpoint by line in a `-g` build and reads a
  parameter and a local; `cli/run` checks that a never-returning self tail call is
  a jump, a million deep.
