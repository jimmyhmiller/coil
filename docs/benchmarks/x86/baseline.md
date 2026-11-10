# x86-64 Linux baseline, 2026-11-10

Before any Stogir x86-64 code exists: the two sides are `llvm` and `tpde`, so
these numbers size the measurements and their noise, and give the LLVM side of
both goals. Scripts and definitions: `tools/README.md`.

- Host: `computer.jimmyhmiller.com`, AMD Ryzen AI Max+ 395 (16 cores, 32
  threads, SMT on), Linux 7.0.0-38, LLVM 21. Governor `powersave`
  (`amd-pstate-epp`, `balance_performance`), boost on.
- Source: branch `stogir/x86` at `a382ed54`; compiler
  `~/stogir-x86/coil/build/x86/coil-llvm` (built by itself with LLVM `-O3`).
- Workload: `src/compiler/main.coil`, `-O3 --no-debug`, `COIL_LIBRARY_STATE=0`.
- Load: 1-minute load average 1.0 to 3.5 during the generation rounds, 1.0 to
  1.9 during the runtime rounds (other users' jobs; nothing was pinned).
- perf counters work unprivileged (`perf_event_paranoid` = 0); no multiplexing.
- Raw output: `~/stogir-x86/bench/out/baseline-2026-11-10/` on the host
  (`run.sh` is the exact command sequence, `run.log` everything printed).

## Generation (goal 1 side)

`genwall-linux.py coil 5 llvm=coil-llvm:llvm tpde=coil-llvm:tpde`, five
alternating rounds, minimum / median:

| | LLVM `-O3` | tpde | LLVM / tpde |
|---|---|---|---|
| Generation wall, default threads (s) | 9.467 / 9.598 | 0.355 / 0.374 | 26.7x / 25.7x |
| Generation serial CPU (s) | 66.20 / 66.85 | 0.156 / 0.157 | 424x / 425x |
| Whole `build` wall, with link (s) | 22.45 / 22.73 | 13.18 / 13.33 | 1.70x / 1.70x |
| Peak RSS of the build (MB) | 4941 / 4941 | 4734 / 4735 | 1.04x |

- LLVM generation wall is `backend.llvm-lower` + `backend.parallel.workers`
  (eight partitions) of a `build`; its five rounds were 9.47, 9.48, 9.60, 9.60
  and 11.08 s, the last at load 3.5. A fifth of that, the bar for Stogir, is
  **1.89 s** (minimum) or 1.92 s (median) of `backend.tpde-object`.
- Serial figures are different pipelines: LLVM's is the single-module
  `emit-obj` (verify, optimize, emit on one thread); tpde's `coil-codegen`
  records cover instruction selection and encoding only, not lowering to CIR.
- About 12.8 s of either build is not code generation (front end, link).
- Executables and serial objects were identical run to run for both backends.

## Runtime (goal 2 side)

Hosts built from the same source by `mkhost-linux.sh` (`llvm`: linked from the
single-module `emit-obj --backend llvm` object; `tpde`: from the tpde object),
plus `build`, the eight-partition `coil-llvm` itself. Each emits the compiler
with `--backend tpde -O3 --no-debug` under `COIL_TPDE_SERIAL=1`.
`runtime-ab-linux.py`, five alternating rounds; all 15 objects identical
(`3bd97262ffe45990...`).

| Host | cycles B, min / median | vs llvm | user cycles B | instructions B | CPU s | wall s | peak RSS MB |
|---|---|---|---|---|---|---|---|
| llvm (one module) | 55.32 / 55.57 | 1.000 | 49.63 | 105.61 | 10.84 | 10.91 | 4727 |
| tpde | 179.64 / 180.68 | 3.247 / 3.251 | 173.42 | 443.33 | 35.24 | 35.30 | 4734 |
| build (8 partitions) | 60.15 / 60.22 | 1.087 / 1.084 | 54.33 | 119.73 | 11.78 | 11.83 | 4726 |

- The tpde-built compiler takes 3.25x the cycles of the LLVM-built one. The
  goal for the Stogir-built one is 1.10x: 60.9B cycles against this reference
  on this work (the work becomes a Stogir emit once that exists).
- **The reference matters.** The compiler a normal `build` produces (eight
  partitions) is itself 1.087x the single-module LLVM compiler, nearly the whole
  1.10 allowance. The macOS tools use the single-module one (`emit-obj`), and so
  do these.
- Noise: cycles of one host spread 0.9% (llvm), 0.9% (tpde), 1.2% (build)
  across rounds; instructions 0.15% or less.
- Pinned to CPU 7 (`--cpu 7`, a second five rounds): llvm 55.54 / 56.02B, tpde
  179.96 / 180.68B (x3.240 / x3.225), build 60.49 / 60.85B (x1.089 / x1.086).
  The spread was no narrower (llvm 1.4%), so pinning is not the default.

## Whole loop

`bootstrap-linux.py --native-backend tpde --unstamped-compiler`, one serial run
per row (a diagnostic, not acceptance). Both generated hosts reproduced the seed
tpde object.

| Row | emits with | generation s | wall s | CPU s | cycles B | instructions B | RSS MB |
|---|---|---|---|---|---|---|---|
| seed-tpde (coil-llvm) | tpde | 0.156 | 12.12 | 12.06 | 61.45 | 121.53 | 4727 |
| seed-llvm (coil-llvm) | llvm | 66.466 | 79.12 | 79.01 | 404.00 | 676.10 | 4938 |
| native-tpde (tpde-built host) | tpde | 0.694 | 35.92 | 35.87 | 183.20 | 445.50 | 4735 |
| native-llvm (LLVM-built host) | tpde | 0.136 | 11.13 | 11.08 | 56.57 | 107.46 | 4728 |

These rows run with `COIL_CODEGEN_TIMINGS=1`, which prints 57,000 records, so
their cycles are a little above the A/B table's.

## Not measured

- Anything for Stogir: `--backend stogir` does not emit x86-64 yet.
- Summed CPU of LLVM's eight partition workers as a serial figure: the timing
  table gives their summed elapsed spans (`backend.parallel.worker.optimize` and
  `.emit` in `genwall/llvm.*.default.stderr`), which is not CPU time under load,
  so it is not reported here.
- A fixed clock speed: the governor cannot be changed without root.
