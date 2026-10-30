# Scorecard

Host: Apple Silicon (arm64) macOS; x86-64 runs under Rosetta 2. Reference TPDE
9779acf built with LLVM 21.1.8, Release with assertions (`ref/README.md`). Coil
numbers are for the compiler built by `scripts/dev.py build candidate` in
`../coil` (branch `tpde-backend`), 2026-10-25.

All checks are Coil programs in `src/tools/`:

- `build/tpde-check all` — parser/analyzer parity, fuzzing, the codegen
  differential, the encoder checks, TIR and CIR execution (package level).
- `build/tpde-bench compile-time|examples|runtime COIL … [--target TRIPLE]` —
  the Coil-level gates, run against a Coil compiler binary.

x86-64 is `--target x86_64-apple-macosx11.0.0`: Mach-O x86-64, System V, run
under Rosetta.

## Correctness gates

| Gate | arm64 | x86-64 | How |
|---|---|---|---|
| TIR parser parity | ✅ 7/7 TPDE `tir/` tests | (target independent) | `tpde-check parity` |
| Analyzer parity | ✅ 4/4 TPDE `analyzer/` tests, 500/500 random CFGs | (target independent) | `tpde-check parity --fuzz 500` |
| Encoder | ✅ 160/160 encodings disassemble (llvm-mc) as expected | ✅ 135/135 | `tpde-check enc` |
| Codegen differential | ✅ 19/20 TIR runs (both targets) identical to C++ TPDE; `tbz.tir` differs only in veneer placement | | `tpde-check codegen` |
| TIR execution | ✅ `tests/tir/exec1` | ✅ | `tpde-check exec` |
| CIR builder (Braun SSA) | ✅ `tests/cir_test` | ✅ | `tpde-check exec` |
| Coil corpus lane | ✅ 9/9 `tests/corpus` on the `tpde` lane | | `scripts/oracle.py corpus tpde` |
| Coil examples | ✅ 45/45 `src/examples` print the same as LLVM -O0 (2 skipped: their LLVM build fails) | ✅ 44/44 (3 skipped: LLVM fails) | `tpde-bench examples` |
| Regression programs | ✅ 5/5 `tests/coil` | ✅ 5/5 | `tpde-bench examples COIL tests/coil` |
| Coil stdlib suites | ✅ 171/171 (parsers 13, serde 41, system 38, text 34, threads 7, traits 38) | ✅ 169/171: the 2 `system` directory-listing tests fail with LLVM -O0 for x86-64 too | `coil test tests/stdlib/…_test.coil --backend tpde` |
| C ABI | ✅ tpde, tpde program + LLVM lib, LLVM program + tpde lib | ✅ the same three | `scripts/tests/c-abi.py` |
| Self-host | ✅ the full compiler (`src/compiler/main.coil`, with its LLVM backend) built by tpde, with debug info, passes `dev.py test fast`; the compiler built by tpde builds itself with tpde to a fixed point (stage2 and stage3 text, const and data identical; they differ only in LC_UUID and the code signature) | | see below |
| Debug info | ✅ lldb: line breakpoints, parameters, locals, a struct, a sum, a slice (`cli/debuginfo`, also for LLVM `-g` and arm64); `llvm-dwarfdump --verify` clean | ✅ the same under Rosetta | `scripts/tests/fast/cli.sh debuginfo` |

Self-host:

```
coil-candidate build src/compiler/main.coil -o coil-selftpde-full --backend tpde \
    --link-flag -L$LLVM/lib --link-flag -lLLVM --link-flag -lm
scripts/dev.py test fast --compiler build/bin/coil-selftpde-full      # PASS

coil-candidate build src/compiler/main_a64.coil -o coil-selftpde --backend tpde
coil-selftpde  build src/compiler/main_a64.coil -o coil-stage2 --backend tpde
coil-stage2    build src/compiler/main_a64.coil -o coil-stage3 --backend tpde
```

`main_a64.coil` omits the LLVM backend, so the first full self-host found a
miscompile the fixed point had not: see PLAN.md (tail calls in leaves).

## Compile time: backend vs LLVM -O0 (gate: ≥10×)

The Coil compiler (`src/compiler/main_a64.coil`, 16.5k functions, 594k CIR
instructions). `tpde-bench compile-time` (objects via `emit-obj`), median of
7–9 runs, the `--timings` spans: tpde's `backend.tpde-object` (module setup,
lowering, compiling, merge, Mach-O writing) against LLVM's
`backend.llvm-lower` + `backend.llvm-optimize` + `backend.object-emit`.

| Backend | arm64 | vs LLVM -O0 | x86-64 | vs LLVM -O0 |
|---|---|---|---|---|
| LLVM -O0 | 1735–1808 ms | 1× | 2235–2338 ms | 1× |
| LLVM -O0 `-g` | ~2900 ms | | | |
| naive arm64 (`--backend arm64`) | ~290 ms | 5.9× | | |
| **tpde (default: pipelined, debug info on)** | **166–173 ms** | **10.4×** ✅ (≈17× LLVM -O0 -g) | **167 ms** | **14.0×** ✅ |
| tpde `-g0` (no debug info) | 130 ms | 13.3× | 130–136 ms | 16.7–17.1× |
| tpde, one thread, `-g0` (`COIL_TPDE_SERIAL=1`) | ~165 ms | 10.3× | | |

Debug info adds about 40 ms on arm64: lowering ~15 ms (recording variables,
shadow stores, line tracking) on the critical path, compiling a little more
(the stores, sampling tracked values at rows), and the DWARF encoding (~25 ms)
on a third pipeline thread; the types and patches at the end take ~4 ms.
Measured with other work on the machine (load average 4–6); in quieter runs
the debug build was 156 ms.

Breakdown (arm64, serial, `COIL_TPDE_STATS=1`): lowering AST→CIR ~80 ms (of
which the promotion scan ~8 ms), compiling CIR→arm64 ~60 ms (analyzer ~17 ms),
module setup (codegen_a64's signatures, layouts, statics) ~10 ms, merge
~2.5 ms, Mach-O writing ~5 ms. The pipeline overlaps lowering and compiling.

## Generated code speed vs LLVM -O0 (gate: ≤1.0×)

`tpde-bench runtime build/bin/coil-candidate src/benchmarks 5 [--target …]`,
median wall time. x86-64 times are under Rosetta, so they say how the two
compare there, not what x86-64 hardware would do.

tpde is measured as it builds by default, **with debug info**:

| Program | arm64 LLVM -O0 | arm64 tpde | ratio | x86-64 LLVM -O0 | x86-64 tpde | ratio |
|---|---|---|---|---|---|---|
| fib | 436 ms | 434 ms | 1.00 | 731 ms | 619 ms | 0.85 |
| float | 736 ms | 186 ms | 0.25 | 764 ms | 213 ms | 0.28 |
| genreduce | 282 ms | 125 ms | 0.44 | 364 ms | 153 ms | 0.42 |
| loop | 371 ms | 371 ms | 1.00 | 462 ms | 443 ms | 0.96 |
| memory | 63 ms | 39 ms | 0.62 | 131 ms | 87 ms | 0.66 |
| prop_bench | 8779 ms | 7235 ms | 0.82 | 12632 ms | 11852 ms | 0.94 |
| regex_literal | 26 ms | 20 ms | 0.77 | 56 ms | 55 ms | 0.98 |
| regex_nfa | 27 ms | 21 ms | 0.78 | 57 ms | 56 ms | 0.98 |
| structcall | 173 ms | 132 ms | 0.76 | 301 ms | 204 ms | 0.68 |
| tak | 4 ms | 4 ms | ≈1 | 32 ms | 31 ms | 0.97 |

Debug info's cost against `-g0` is 0–5% except on call-heavy code with many
parameters: prop_bench is 7.2 s with it and 6.4 s without. (Shadowing every
`let` had made it 9.4–11.3 s, 1.27× LLVM -O0; giving every small leaf a frame
for its shadows, 75% slower: see PLAN.md, "Debug info".)
| slicesum | crash (stack) | crash (stack) | same | crash | crash | same: a slice argument is not a guaranteed tail call |
| json_tape | needs an input file | | | | | |

fib is the one at parity on arm64 (424 vs 425 ms; earlier runs 0.99–1.01):
its code is a call per node either way.

The largest program (measured before the x86-64 work): the Coil compiler built
by tpde compiles itself in 18.3–18.4 s; built by LLVM -O0, in 18.5–18.6 s.

## Code size (gate: ≤1.3×)

Text of `main_a64.coil`'s object:

| Target | LLVM -O0 | tpde | ratio |
|---|---|---|---|
| arm64 | 5.45 MB | 5.44 MB (5.62 MB with debug info's stores) | 1.00× (1.03×) ✅ |
| x86-64 | 5.69 MB | 6.85 MB | 1.20× ✅ |

Inline copies of 16 bytes or more go through a SIMD register (`ldr q`/`movups`):
copying 8 bytes at a time through a GP register had been a third of the x86-64
text (1.38× before), and 1.11× on arm64. What is left on x86-64 is mostly
register-to-register moves (two-operand instructions) and forward jumps, which
are rel32 as in TPDE.

## Port quality: ours vs C++ `tpde_test` (2026-10-24)

Median of 15 runs. "analysis" is the time the analyzer adds over parsing alone
(`--run-until=analyzer` minus `--run-until=ir`). Inputs from
`tpde-check gen scale …` (then `gen_tir.py`).

| Input | C++ parse | ours parse | C++ analysis | ours analysis |
|---|---|---|---|---|
| many-values 200000 | 53.6 ms | 69.1 ms | 3.3 ms | 2.3 ms |
| many-blocks 50000 | 27.1 ms | 35.6 ms | 3.2 ms | 4.2 ms |
| many-funcs 50000 | 29.8 ms | 34.5 ms | 5.5 ms | 3.4 ms |
| loop-nest 2000 | 3.9 ms | 4.8 ms | 14.0 ms | 12.0 ms |
| switch 20000 | 10.7 ms | 14.9 ms | 2.1 ms | 1.6 ms |
| random (5000 funcs × ≤40 blocks) | 92.1 ms | 101.1 ms | 20.8 ms | 20.4 ms |

Analysis is at parity with C++ (0.7–1.3×); the gate is ≤2×. `loop-nest` is
super-linear in both implementations; that is TPDE's lowest-common-loop walk
(`Analyzer.hpp`, noted O(n²) worst case in a TODO there).

## History

- 2026-10-24 baseline: LLVM -O0 1747 ms; first working tpde backend 249 ms (7×).
- 2026-10-25: 165 ms serial (quadratic string interning, per-function table
  clears, lazy promotion scan, memoized lookups, shared small constants), then
  121 ms with the lowering/compiling pipeline. Run time brought under -O0 by
  four register-allocation changes (see PLAN.md, "Where we differ from TPDE").
- 2026-10-25, debug info by default: first 197 ms (9.2×) with DWARF built at
  the end; an incremental encoder on its own thread, line-granular rows and
  allocation-free lookups brought it to 166–173 ms (10.4×).
- 2026-10-25, x86-64: Coil's `--backend tpde` for x86-64 Mach-O. First runtime
  numbers under Rosetta had genreduce at 1.4× and loop/memory at 1.1×; self
  tail calls as loops, frameless tail jumps, PTRADD fusion and argument
  registers as fixed registers in leaves brought every row under 1.0 on both
  targets (arm64 loop: 383 → 338 ms). 16-byte inline copies: x86-64 text
  1.38× → 1.20×, arm64 1.11× → 1.00×.
