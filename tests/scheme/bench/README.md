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
| fib(30) | 4.1 ms | 44.6 ms | 63.2 ms | **0.09×** |

fib is tree recursion with no allocation, so it measures call overhead and
arithmetic — where compiling to native should win outright, and does. Expect
allocation-heavy cases to be much closer, or worse: those exercise the GC, and
Chez has a generational moving collector against our non-moving mark-sweep.
Adding those cases is how this stays honest rather than a victory lap.
