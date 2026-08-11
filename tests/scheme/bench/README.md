# Scheme benchmarks

Run the continuously reproducible comparison with:

    python3 tests/scheme/bench/run.py --compiler <candidate>

The larger application benchmark runs the identical portable Scheme Lox
interpreter and identical Lox programs under Coil and Chez:

    python3 tests/scheme/bench/lox_run.py --compiler <candidate>

It mechanically removes only `lox.coil`'s module/import envelope for Chez,
builds the Coil CLI once, verifies identical output, and reports min-of-5 wall
time for recursive functions, a long loop, closures, classes/methods, and object
allocation.

Latest min-of-5 application checkpoint (2026-08-10, identical answers):

| Lox case | Coil | Chez | Coil/Chez |
|---|---:|---:|---:|
| `allocation` | 31.9 ms | 67.2 ms | 0.47× |
| `closure` | 38.8 ms | 67.4 ms | 0.57× |
| `fib` | 9.4 ms | 60.5 ms | 0.16× |
| `loop` | 98.8 ms | 80.3 ms | 1.23× |
| `object` | 19.6 ms | 60.3 ms | 0.33× |

Four cases now beat Chez on this machine; the mutation-heavy loop remains the
optimization target. The small `fib` row includes process startup and therefore
is not evidence of compute parity. The allocation case crosses the Scheme
collector threshold. Profiling the original loop found repeated linear symbol
interning responsible for about 80% of its cycles: quoted symbols and generated
global-variable names were being interned on every evaluation. Compiler-literal
pointer caching reduced that case from 1186.0 ms (12.99× Chez) to 98.8 ms
(1.23×), while preserving content interning for dynamic `string->symbol`.
Creating this suite also uncovered fixes for
raw symbol IDs traced as pointers, file ports not rooted across callbacks,
allocator payloads unrooted at collection, a moving Lox environment root, and a
stack-consuming interpreter loop.

The full Mal benchmark runs the same independently authored, staged Mal
evaluator and the same mixed workload under Coil and Chez:

    python3 tests/scheme/bench/mal_full.py --compiler <candidate> \
        --iterations 1000 --repeat 5

It exercises parsing, environments, closures, tail calls, recursive Fibonacci,
macros, quasiquote, and native-procedure dispatch. The harness generates Chez's
portable source mechanically from the Coil Scheme modules, requires byte-for-byte
identical output, and only then reports timings.

Latest checkpoint on 2026-08-10:

| Full Mal workload | Coil | Chez | Coil/Chez |
|---|---:|---:|---:|
| 100 mixed iterations, best of 5 | 64.8 ms | 87.1 ms | 0.74× |
| 1,000 mixed iterations, best of 5 | 465.3 ms | 305.9 ms | 1.52× |

The widening long-run gap is collector/allocation pressure: 100 iterations
perform roughly 10.8 million fixed-size Scheme-heap allocations. The earlier
catastrophic behavior was not intrinsic interpreter cost—Scheme global getters
were rebuilding Mal's entire core environment on every read. Global
initialization is now lazy, the sustained workload is stable through 10,000
iterations, and GC/allocation density is the next optimization target. Replacing
the private trampoline vector with one pair and the private environment vector
with one mutable pair, and restoring upstream's one-object Mal value record, cut
the 1,000-iteration Coil time from 950.5 ms to 465.3 ms.

Larger stress variants (`fib(24)` and 100,000 method calls) additionally expose
an unresolved precise-root lifetime defect after collection and are not included
as successful benchmark rows. This is recorded explicitly rather than allowing
a lucky timing run to masquerade as correctness.

Each case has an R5RS `.scm` program for Chez/Petite and a `.coil` driver whose
body is the same Scheme program inside the native dialect module wrapper. The
harness builds the Coil program, runs every implementation repeatedly, reports
the minimum wall time, and refuses to report a meaningful timing if answers
disagree. Workloads are deliberately long enough that Chez's process startup is
not the result being measured.

Petite is shown as an interpreter baseline. Chez's optimizing native compiler is
the performance target; lower `Coil/Chez` is faster.

## Current checkpoint

Min-of-5 on 2026-08-10, with identical answers:

| case | Coil | Chez | Petite | Coil/Chez |
|---|---:|---:|---:|---:|
| `bigfact` | 97.3 ms | 79.7 ms | 74.2 ms | 1.22× |
| `bintree` | 62.3 ms | 66.9 ms | 264.1 ms | 0.93× |
| `fib` | 7.4 ms | 34.4 ms | 54.0 ms | 0.21× |
| `gcchurn` | 18.2 ms | 38.6 ms | 105.3 ms | 0.47× |
| `listrev` | 22.4 ms | 40.4 ms | 148.6 ms | 0.55× |
| `listsum` | 29.1 ms | 49.4 ms | 200.3 ms | 0.59× |

These are workflow checkpoints on one machine, not portable performance claims.
Rerun before quoting them.

## What the cases cover

- `fib`: recursive calls and fixnum arithmetic without allocation.
- `bigfact`: repeated exact `1000!`, exercising growing bignum-by-fixnum
  multiplication, collection, and final decimal conversion. This is the current
  visible performance deficit rather than a green row: Coil is 1.22× Chez.
- `listsum`: short-lived pair allocation plus traversal.
- `listrev`: a retained input and newly allocated reversed list, increasing the
  live set during each round.
- `bintree`: allocation and tracing of a branching pointer graph.
- `gcchurn`: 2.4 million pairs with a small live set, forcing repeated
  collections and checking the deterministic sum afterward.

The allocation cases intentionally cross the collector threshold. Earlier
versions stopped below it because the dialect did not root live Scheme values;
that made the numbers both flattering and invalid. `coil.scheme.rooting` now
frames Scheme procedures and roots values across allocating operations, so all
six scaled programs complete, agree with Chez, and remain in the regular
`scheme-progress.py --bench` workflow.

The suite still needs a macro-expansion workload. Adding it is preferable to
generalizing from the runtime-only set.

## Driver invariant

`main` returns a native process exit code. A bare Scheme `0` is a tagged value,
not native zero, so each `.coil` driver ends with:

    (fixnum-value (mk-fixnum 0))

This wrapper is the only implementation-specific part of a benchmark body.
