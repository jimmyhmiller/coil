# Benchmarks

    python3 tests/scheme/bench/run.py

Each case is a `.scm` (run by Chez and Petite) plus a `.coil` writing the same
program in the dialect. Min-of-N wall clock, because the machine is noisy and the
floor is the honest estimate of how fast the code can go.

The driver refuses to compare timings when the implementations disagree on the
answer — a speed comparison between programs computing different things is
meaningless, and that is exactly the mistake a benchmark makes silently.

Petite is included because it is Chez's *interpreter*: beating it proves nothing.
Chez's optimizing native compiler is the line that matters.

## Current

| case | coil | chez | petite | vs chez |
|---|---|---|---|---|
| fib(30) | 3.9 ms | 42.7 ms | 58.6 ms | **0.09×** |

The `.coil` body is IDENTICAL to the `.scm` — `<`, `+`, `-`, `display`, `newline`,
bare integer literals. Actual R5RS names, not Coil spellings of them. Only the
module header and the `main` wrapper differ, which is the whole claim: the same
source compiles.

⚠ `main`'s value is the process exit code, and inside a dialect module the
whole-tree pass lowers a bare `0` to `(mk-fixnum 0)`, whose tagged word is 1. A
Scheme module's `main` therefore cannot end in a bare literal. The harness treats
a nonzero exit as a failed run, which is how this surfaced at all.

fib is tree recursion with no allocation, so it measures call overhead and
arithmetic — where compiling to native should win outright, and does. Expect
allocation-heavy cases to be much closer, or worse: those exercise the GC, and
Chez has a generational moving collector against our non-moving mark-sweep.
Adding those cases is how this stays honest rather than a victory lap.
