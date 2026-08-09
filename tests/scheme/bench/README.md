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
| fib | 2.8 ms | 34.3 ms | 50.0 ms | 0.08× |
| listsum | 4.1 ms | 32.6 ms | 34.6 ms | 0.12× |
| listrev | 3.3 ms | 32.4 ms | 31.4 ms | 0.10× |
| bintree | 7.2 ms | 43.3 ms | 57.2 ms | 0.17× |
| gcchurn | **—** | 39.9 ms | 107.3 ms | **—** |

`gcchurn` is the one case sized to cross the collection threshold on purpose, and
its dash is a result rather than a gap in the table. There is deliberately no
`gcchurn.coil`: we cannot run 2.4M allocations at all, for the reason in "Why: the
shadow stack is never populated" below. Chez runs it in 35.4 ms. Keeping the row
visible is the point — the three cases that do produce numbers are the ones tuned
to never collect, so without this row the suite would silently look like it
covers GC when it covers only allocation.

The `.coil` body is IDENTICAL to the `.scm` — `<`, `+`, `-`, `display`, `newline`,
bare integer literals. Actual R5RS names, not Coil spellings of them. Only the
module header and the `main` wrapper differ, which is the whole claim: the same
source compiles.

⚠ `main`'s value is the process exit code, and inside a dialect module the
whole-tree pass lowers a bare `0` to `(mk-fixnum 0)`, whose tagged word is 1. A
Scheme module's `main` therefore cannot end in a bare literal. The harness treats
a nonzero exit as a failed run, which is how this surfaced at all.

(A `null?` naming conflict briefly made all three of these uncompilable — the only
Val-returning spelling was `scm-null?`, which the new lint forbids. It is fixed:
`stdproc.coil:789` now exports `null?` returning a Val, so the bodies below are
plain R5RS with no implementation spellings in them at all.)

## ⚠ THAT TABLE IS MEASURING PROCESS STARTUP, NOT COMPUTE

**Do not quote the `vs chez` column.** Chez's `--script` floor on this machine is
**38.8 ms** — measured by timing a script whose entire body is `(display 1)`. Every
`chez` number above is smaller than that floor or within noise of it, which means
the column is reporting how long Chez takes to boot. Our own process floor is
**0.26 ms**, so the ratio is a comparison of two startup costs with a rounding
error of actual work on top.

Timing the same workloads *in process* — Chez's `real-time` around 50 repetitions
divided by 50, so its 1 ms clock resolution stops mattering, min-of-5; ours is
min-of-9 wall clock minus the 0.26 ms process floor:

| case | coil (compute) | chez (compute) | real ratio |
|---|---|---|---|
| listsum | 4.70 ms | 0.88 ms | **5.3× slower** |
| listrev | 4.50 ms | 0.68 ms | **6.6× slower** |
| bintree | 6.55 ms | 2.84 ms | **2.3× slower** |
| fib | 3.92 ms | 2.94 ms | 1.3× slower |

**We lose every one of these, and the allocation-heavy cases are where we lose
worst** — 5–7× on the two list benchmarks. The 0.08–0.17× column above is Chez's
startup, not our speed. This is exactly the failure mode the harness's own
docstring warns about — "a one-shot run of a small program measures process setup
and nothing else" — and the cases could not be made big enough to escape it, for
the reason below.

Note that fib, the no-allocation case, is the *closest* result (1.3×), and the two
pure-cons cases are the worst. That ordering is the expected signature of the
allocator being the weak point: the more the program conses, the further behind we
fall. It also contradicts the previous revision's headline claim that fib is a
9-fold win — corrected here.

## The workloads are pinned below the size where compute dominates

Each case is sized so total allocation stays under **500,000 objects** and the
collector never runs — `listsum` 480k, `listrev` 480k, `bintree` 491,490. That is
not tuning for a flattering number. It is the largest size at which **our answers
are correct**.

`gc-threshold` is 500,000 (heap.coil). Past it a collection happens, and:

    k=40  allocs=480,000   ->  2880240000  (correct, 0 collections)
    k=45  allocs=540,000   ->  <no output, hangs forever>
    k=50  allocs=600,000   ->  <no output, hangs forever>

Not slower. **Non-terminating**, with no output and no diagnostic. Scaling these
benchmarks 10× — the size at which Chez needs 13/10/39 ms and startup stops
mattering — is therefore impossible today.

## Why: the shadow stack is never populated

`heap.coil` says the GC transform emits `gc-root`/`gc-sp`/`gc-sp-set!` around
managed values, and the collector's precision depends on it. **No such transform
is registered for this dialect.** `dialect.coil` registers exactly one transform
and it is the syntax rewrite; the only `gc-root` call anywhere in `coil.scheme` is
one inside `symbol.coil`'s interner. The emitters live under
`src/experiments/transparent-gc/` and `src/apps/mini-scheme/`, neither of which
this dialect uses.

So the root set is empty and every live value is invisible to the tracer:

    (scm-let ((live (build 1000 '())))
      (gc-sp)     => 0        ; shadow stack depth, with a 1000-pair list live
      (gc-live)   => 1000
      (collect)
      (gc-live)   => 0)       ; the entire live list was swept

A freed pair's `a` slot is reused as the free-list link, so a subsequent `cdr`
walk follows the free list instead of the spine — which is why the symptom is an
infinite loop rather than a crash.

The same thing reproduces in ordinary Coil against `heap.coil` directly, with no
dialect involved, which rules out the syntax layer as the cause. Build 1000 pairs,
hold them in a live local, collect, re-sum:

    before collect: 1000
    after  collect: 16058419951059495
    gc-live=0 gc-collections=1

`gc-live=0` is the entire finding: after marking, the collector believed nothing
was live while a local variable still referenced all 1000 pairs.

`heap_test.coil`'s `a-rooted-list-survives-collection` passes and does not catch
this, because it calls `gc-root` **by hand** (line 45). It tests that the tracer
follows roots it is given; nothing tests that anything gives it roots.

This is a correctness bug, not a performance one, and it bounds every benchmark
here. Until values are rooted automatically, these cases cannot be scaled to a
size where the comparison against Chez means anything — and the honest reading of
the numbers above is that on allocation-heavy code we are several times slower
than Chez, in the one regime where we get the right answer at all.
