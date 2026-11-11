# Stogir on x86-64 Linux: runtime tuning record

Goals (docs/benchmarks/x86/tools/README.md): generation wall at least 5x
faster than parallel LLVM `-O3` (kept at 6.5x or better while tuning), and the
Stogir-built compiler within 1.10x of the LLVM-built compiler's cycles.

Workload for both: the compiler compiles itself, `src/compiler/main.coil`,
`--backend stogir -O3 --no-debug`. Runtime is a serial emit
(`COIL_TPDE_SERIAL=1`) by each host, `runtime-ab-linux.py`, 3 rounds, minimum;
generation is `genwall-linux.py`, 3 rounds, minimum. Host:
computer.jimmyhmiller.com, 32 CPUs. Each row is measured in one session with
its own LLVM side.

| Round | Library | Change | Cycles B (Stogir / LLVM host) | Ratio | Instructions B | Ratio | Generation wall s (Stogir / LLVM) | LLVM is |
|---|---|---|---|---|---|---|---|---|
| 0 | 9471372 | first self-hosting build; adapter workarounds for defects 001 and 002 | 106.50 / 91.89 | 1.159 | 278.3 / 185.7 | 1.50 | 1.095 / 9.50 | 8.7x |
| 1 | d278aba | defects 001-003 fixed in the library; 002 workaround removed; 001 workaround kept (defect 004) | 106.70 / 91.49 | 1.166 | 278.4 / 185.7 | 1.50 | 1.089 / 9.50 | 8.7x |
| 2 | ded7635 | defect 004 fixed; the adapter's MEMORY-parameter template exclusion removed, so calls passing an aggregate by value are inlined | 106.74 / 92.35 | 1.156 | 277.9 / 187.4 | 1.48 | 1.097 / 9.50 | 8.7x |

Round 2 is one percentage point: inlining through MEMORY-class parameters is
now on (the over-budget sites are declined), and it moves instructions from
1.50x to 1.48x and cycles from 1.166x to 1.156x. The standalone accessors
were therefore not the main cost; the allocator findings below are. The
per-site ARGVAL scan of the 001 fix is not visible in the generation spans
(ms, 1101 total: emit 468, finalize 255, prepare 130, plan 82, copies 42,
leaf cache 27; round 1: 475, 245, 143, 95, 40, 25), and generation wall is
unchanged.

Checks at round 2, all as at round 1: 2400 parallel `-O3` compiles identical
(`cbb29c4a…`), ThreadSanitizer self-emit without a report and with the
bootstrap's object (`d0932326…`), the bootstrap reproduces and the object is
the same under every thread setting, the sweep is unchanged (corpus 24 of 27,
demos 138 of 138, simd 6 of 6, backend 45 of 45, stdlib 24 of 24, examples 30
of 30, library tests 1053 of 1056), the 22 Stogir rows of `cli.sh objects`
pass, and on macOS the AArch64 objects are unchanged (compiler `9688c00a…`),
the Stogir-only bootstrap reproduces and quick FAST passes.

Round 1 changes nothing measurable: the 002 fix replaces an equivalent
workaround, the 003 fix is a correctness fix, and the 001 fix cannot be used
yet. With the adapter's exclusion removed the compiler's own build fails with
"inline cloning exceeded preflight budget" (library-defects/004), so
functions that take an aggregate larger than 16 bytes by value are still never
inlined. The per-site ARGVAL scan of the 001 fix therefore does not run in
this build and its generation cost is not measured.

Generation by span in round 1 (ms, default threads, 1124 total): emit 475,
finalize 245, prepare 143, plan 95, copies 40, leaf cache 25.

## Checks at round 1

- 2400 parallel `-O3` compiles (40 at a time) of the library test that failed
  3 in 1000 under defect 003: no failure, one object (`8e72aeea…`).
- A `--sanitize=thread` build of the compiler emitting itself with Stogir at
  `-O3`, default threads: no ThreadSanitizer report, and the object is the
  bootstrap's (`82c8f9b4…`). The same build on that library test: no report.
- `bootstrap-linux.py --native-backend stogir`: both hosts reproduce the seed
  object. The Stogir-built host emits the same object under default threads
  (three runs), `COIL_STOGIR_THREADS=1`, `=4` and `COIL_TPDE_SERIAL=1`.
- Sweep (`scripts/tests/stogir-x86-sweep.py`, -O1/-O2/-O3 against LLVM):
  corpus 24 of 27 (`machine_code` cannot be emitted to ELF by any native
  backend), demos 138 of 138, simd 6 of 6, backend 45 of 45, stdlib 24 of 24,
  examples 30 of 30, the library's tests 1053 of 1056 (the three are the
  16-aligned pair CIR cannot express).
- macOS: the old and the new candidate emit identical AArch64 objects
  (compiler `9688c00a…`, `sccp-analysis` `4f99f1e9…`, `jit-vector-lanes`
  `bd18ad42…`), the Stogir-only bootstrap reproduces, quick FAST passes.

## Where the extra instructions are (profile of round 0, unchanged in round 1)

`perf record -e instructions:u` on both hosts, samples classified by
instruction (`perf annotate`; build/x86/perf/mix.py on the host). Samples of 2M
instructions each, LLVM host 81.4K, Stogir host 125.3K:

| Class | LLVM | Stogir | Difference |
|---|---|---|---|
| loads and stores of the stack (`[rsp+d]`) | 4.9K | 17.3K | +12.4K |
| compare and test, register forms | 10.0K | 19.4K | +9.4K |
| register extensions (`movslq`, `movzbl` r,r) | 0.4K | 6.7K | +6.2K |
| register moves | 4.3K | 8.2K | +3.9K |
| other ALU | 14.6K | 18.2K | +3.6K |
| loads and stores of other memory | 7.9K | 11.1K | +3.3K |
| `movups` 16-byte copies | 7.2K | 1.8K | -5.4K |
| compare with a memory operand | 3.7K | 0.05K | -3.6K |
| push/pop | 2.3K | 0.05K | -2.2K |

What the hottest function shows
(`coil.compiler.resolve.primitive-providers-in`, 7.1% of the Stogir host's
instructions; inlined into its caller by LLVM): the loop's back edge stores
five registers to spill slots and its header reloads four of them, every
iteration, and one slot is stored and reloaded by adjacent instructions. The
x86-64 allocator bridge runs the plain tuning; the AArch64 bridge's loop
reloads, loop eviction, spill-home planning, recoloring and framed-span cuts
are not ported (`x64/allocate.coil` header). r10, r11 and rbp are never
allocated, so twelve general registers are available against LLVM's fifteen.

Next, in the order the profile suggests: (1) the allocation policies above
for x86-64 (a first, unverified step is on library branch `x86/tune-wip`),
and more allocatable registers; (2) done in round 2 (inlining through
MEMORY-class parameters); (3) redundant extensions of narrow values; (4) repeated
compares and compare-with-memory forms; (5) constants (`movabs` rebuilt in
loops, `mov $0`), 16-byte copies.
