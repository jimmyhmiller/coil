# `coil.prop` throughput — measured

Source: `src/benchmarks/prop_bench.coil`. Self-timing, one process, `coil.time`'s
monotonic clock (`monotonic-now`, nanosecond resolution) — not hyperfine, because
the per-unit costs here span 1 ns to 3 ms and process startup would drown the
small end.

## How to reproduce

From the worktree root:

```sh
COIL_STDLIB_DIR=. coil build src/benchmarks/prop_bench.coil -o /tmp/prop_bench
/tmp/prop_bench
```

`coil build` is `-O3` (the default; the only other tier is `-g`). No flags beyond
`-o`. `COIL_STDLIB_DIR=.` is required or the installed compiler serves its
embedded stdlib and the numbers describe a different `coil.prop`.

Host: `Darwin 25.5.0 arm64`, Apple M2 Max, `coil 0.1.0`.
Tree: `a99924b` plus the working-tree edit to `src/stdlib/prop_shrink.coil` (that
file was being rewritten by another agent while these ran; §6's numbers move with
it, §1–§5 do not — §6 below has already been re-measured once against a newer
`prop_shrink.coil` and every column changed).

Three consecutive runs; the spread on §1–§4 is under 2%, so single numbers are
quoted. Every timed loop is preceded by an untimed warm-up.

§6 is the exception and is quoted as the median of four runs on an otherwise-idle
host: its loops are hundreds of microseconds, short enough that a concurrent
compile on the same machine moves them by 5×. A run taken while other builds were
in flight reported 1514 µs for the deep case against ~230 µs idle — and
`tape-clone` moved with it, 3078 → 5819 ns, which is itself evidence that the
shrink loop's cost tracks the tape cloning.

**Section order is load-bearing, and the benchmark now enforces it.** `bench-shrink`
calls `(malloc-allocator)`, which — for the reason in the defect section below —
overwrites the same `Allocator` struct that serves as the `prop-source` arena.
Run §6 before §5 and the steady-state table reads `arena peak 0 B` at every case
count: a flawless-looking result that measures nothing. `bench-memory` checks
`arena-live?` first and aborts (SIGABRT) rather than print that table.

## 1. The raw RNG

| what | ns/draw | draws/s |
|---|---:|---:|
| `rng-next!` (xoshiro256++) | **1.16** | 862 M |
| `rng-below!` (Lemire, bound 1000) | **1.33** | 748 M |

~3.4 cycles per draw at 3 GHz — five shifts/xors plus a rotate, fully pipelined.
The extra 0.17 ns for `rng-below!` is the 64×64 multiply-high, which Coil has to
build from four 32-bit limb multiplies (`umulhi`) because there is no `u128`;
LLVM folds it back to `umulh` + `mul`. Uniformity is essentially free.

## 2. One draw through a Source (tape recording included)

| what | ns/draw | draws/s |
|---|---:|---:|
| `draw-int! s 0 1000000` | **6.18** | 162 M |

**5.0 ns is what recording costs**, and it decomposes cleanly: `draw-int!` spends
*two* RNG draws, not one (the edge-bias coin flip `rng-below! 8` and then
`rng-range!`), which is ~2.6 ns, leaving ~3.5 ns for `record!` — appending a
56-byte `Choice` to the tape (bounds check, capacity check, seven stores).

Nothing here is obviously wasteful, but two things are worth knowing: the
edge-case coin flip is a whole extra RNG draw on the hot path even when it loses
(87.5% of the time), and `Choice` is 7×`i64`. Packing `kind`/`flags`/`span` into
one word would take the tape to 40 bytes and cut the store traffic by a quarter.

## 3. A full trivial property (two i64 arguments, one comparison)

| what | ns/case | cases/s |
|---|---:|---:|
| `[(a i64) (b i64)] → a comparison` | **13.96** | **71.6 M cases/s** |

This is the floor of the engine: `source-begin-generate!` + the swarm mask + an
indirect call through the `fnptr` `defprop` builds + two `arbitrary` calls. It
adds up: two `draw-int-any!` at ~5.8 ns each (one edge coin flip + one
`rng-next!` + one `record!`) is 11.6 ns, leaving ~2.4 ns for the reset, the
`case-swarm-mask` RNG draw and the call.

The default 200-case property therefore costs ~3 µs of engine time. A property
that runs a million cases costs 14 ms.

The loop is the runner's own (`prop-run`'s inner loop with the environment
parsing and the failure report removed) and the property is called through a
function pointer, exactly as `defprop` wires it, so the body cannot be inlined
away.

## 4. A list property

| what | ns/case | cases/s |
|---|---:|---:|
| `(ArrayList i64)`, exactly 32 elements | **339** | **2.95 M cases/s** |
| `(ArrayList i64)`, stock generator (mean 5.23 elements) | **70.3** | **14.2 M cases/s** |

**~10.3 ns per element**: one `span-open!`, one `draw-int-any!`, one `al-push!`,
one `span-close!`. That is the same ~5.8 ns draw as above plus ~4.5 ns for the
two span records and the push — the span table is a real cost of list generation,
roughly 45% of it, and it is the price of being able to delete an element during
shrinking.

The second row is what a user's `(defprop … [(xs (ArrayList i64))] …)` actually
pays: `draw-len!`'s taper is deliberately biased small, so at the default max
size of 60 the mean list is 5.23 elements, not 30. The fixed-32 row is measured
with `arb-list-n` precisely because "~32 elements" is not what the stock
generator produces.

## 5. Steady state over 1,000,000 cases

Stock `(ArrayList i64)` property, size ramping to 60, sampling the arena's bump
offset at the end of every case:

| after | arena peak | arena cap | tape cap | spans cap | replay cap |
|---:|---:|---:|---:|---:|---:|
| 1 000 | 16 B | 8 MB | 1024 | 64 | 0 |
| 10 000 | 16 B | 8 MB | 1024 | 64 | 0 |
| 100 000 | 64 B | 8 MB | 1024 | 64 | 0 |
| 1 000 000 | 512 B | 8 MB | 1024 | 64 | 0 |

**Steady state confirmed: nothing grows with case count.** The three capacities
are identical at 1 000 and at 1 000 000 cases — the tape, the span table and the
replay buffer are allocated once and reused, so a million cases perform zero
allocations for them. Between cases the arena is at 0; `source-reset!`'s pointer
rewind is the whole reclamation story.

The arena "peak" column rises 16 → 512 B not because anything leaks but because
it is the maximum of a distribution and more samples find a longer list. It is
bounded by the size budget, not by the case count; 512 B is 0.006% of the 8 MB
arena.

### …but the tape is inside the arena

The benchmark also asks where the tape's backing store actually lives, and the
answer is the one thing in this document that is not a performance number:

```
tape buffer inside the per-case arena? 1   spans buffer? 1   (1 = yes)
```

`Source.mem` is documented as "long-lived: tape + spans" and `Source.arena` as
"per-case". They are the same allocator. See the defect section below.

## 6. Shrinking a known-failing case

| case | tape | rounds | property calls | accepted | time |
|---|---:|---:|---:|---:|---:|
| flat: `(ArrayList i64)`, `len < 32`, size 200 | 51 → 33 choices | 2 | 27 | 8 | **~880 µs** |
| deep: `(ArrayList (ArrayList i64))`, no sublist ≥ 8, size 120 | 459 → 10 choices | 3 | 74 | 22 | **~230 µs** |

Both reach the true minimum, and the tape lengths prove it rather than assert it.
Flat: 32 zeros is one length draw plus 32 element draws = 33 choices. Deep: one
outer length draw, one inner length draw and 8 element draws = 10 choices, i.e. a
single sublist of exactly 8 zeros with no empty siblings left over. The printed
counterexamples agree:

```
xs  = (0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0)
xss = ((0 0 0 0 0 0 0 0))
```

`tape-clone` of the failing tape is measured in the same run, so the comparison
below is against a number from the same process and the same host state:

| tape | `tape-clone` |
|---|---:|
| 51 choices | 567 ns |
| 459 choices | 3078 ns |

Every candidate a pass proposes is a whole new tape (`tape-clone`,
`tape-without`, `tape-with` and `splice` all build one with `al-new` plus one
`al-push!` per choice — a malloc plus ~log₂n reallocs), and `sc-calls` counts
only the candidates that survived the budget gate, the already-seen set and the
shortlex gate, so it undercounts proposals.

**For the flat case the property is emphatically not where the time goes**: 880 µs
is ~1550 clone-equivalents against 27 property calls, so at least 98% of the cost
is spent on candidates that were built and then thrown away before the property
ever saw them.

The deep case does not support that conclusion nearly as strongly, and saying so
matters: 230 µs is ~75 clone-equivalents against 74 property calls, near parity.
The clone figure there is an upper bound — it is priced on the *original*
459-choice tape, and candidates get cheaper as the tape shrinks toward 10 — so
cloning is likely still the larger share, but this measurement does not separate
it from the replay-plus-property cost. A per-pass proposal counter in
`prop_shrink.coil` would settle it; `sc-calls` cannot.

For the flat case at least, that is also where the fix is, and it is cheap: the
passes propose into a fresh `ArrayList` every time, so a single scratch tape
reused across proposals (`len = 0` + refill, the same trick `source-reset!`
already uses for the tape) would remove most of it. I have not made that change —
`prop_shrink.coil` is not mine.

---

# The defect this benchmark found

**FIXED.** `source-new` now allocates the arena its own `Allocator` cell, so the
Source's long-lived buffers and its per-case arena are genuinely separate; the
regression test is `tape-and-spans-live-outside-the-case-arena` in
`tests/prop/core_test.coil`, which asserts that the tape and span buffers lie
outside the arena block and that the arena is actually used.
The analysis below is kept because it is the case for why that one line matters
and the numbers above were taken before it landed — the steady-state table in §5
in particular was measuring malloc, not the arena.

Two agents reached this diagnosis independently, from different symptoms. What
follows is the benchmark's side of it.

### What happens

```coil
(let [... a (arena-over-buffer ar mem buf arena-cap)]
  ...
  (store! (field s mem) mem)      ; "long-lived: tape + spans"
  (store! (field s arena) a))     ; "per-case"
```

`arena-over-buffer` (alloc.coil:278) does not *build* an allocator, it **rewrites
the one it is handed, in place**, and returns the same pointer. So `a == mem`, and
`s.mem == s.arena == mem`. Verified by printing the vtable before and after the
call: `mem.alloc` changes from `ma-alloc` to `ar-alloc`, and all three pointers
are equal.

Compounding it: `malloc-allocator`'s `alloc/static` cell lives *inside*
`malloc-allocator`, so there is exactly **one** `Allocator` struct for the whole
program, shared by every caller — and every call re-stores the malloc vtable
into it.

### Three consequences, all reproduced

1. **The tape, the span table and the replay buffer are allocated from the
   per-case arena** and `source-reset!` rewinds it out from under them every
   case. Today they survive only because the tape's buffer ends up at a high
   arena offset while a case's generated values start at 0 — a case that
   allocates past that offset silently overwrites the tape. §5 shows the
   overlap directly.

2. **Any caller that keeps using the allocator it passed to `source-new` is
   allocating from the arena.** My first version of `bench-shrink` did exactly
   what `report-failure` does, and its `RunCtx` was handed back out as a
   candidate-tape buffer and overwritten ~2000 candidates later — a segfault in
   `source-reset!` with `s = 0x4`, a very long way from the cause. Found with a
   watchpoint on the `RunCtx` address; the writer was `al-push!` inside `splice`.

3. **A `defprop` failure can abort the process in libmalloc.** `report-failure`
   calls `(malloc-allocator)`, which flips the shared struct back to malloc.
   From that moment the *arena-allocated* tape and span buffers are grown with
   `realloc()`, and libmalloc kills the process ("pointer being realloc'd was not
   allocated", SIGABRT). Reproduced: a nested-list property whose shrink phase
   needs more than the 64 spans reached during generation aborts immediately.
   The threshold is "the failing case needs a bigger tape or span table than
   generation happened to reach", which is exactly what a *large* counterexample
   means.

4. Conversely, **give a Source a genuinely private arena and shrinking stops
   working entirely** — `source-begin-replay!` refills the replay buffer from
   the arena at offset 0 right after the reset, the case's own generated values
   are then allocated on top of it, every candidate replays as minima, the
   property holds, and the shrinker reports thousands of calls with **zero**
   accepted. It looks like a slow shrinker rather than a broken one. Shrinking is
   correct today *because* `report-failure` accidentally repairs the allocator
   first.

### Suggested fix (prop_source.coil / alloc.coil — not mine to make)

`source-new` should allocate a **second** `Allocator` for the arena instead of
converting the caller's:

```coil
(let [s   (unwrap-ptr [Source] (create [Source] mem))
      ar  (unwrap-ptr [Arena] (create [Arena] mem))
      aa  (unwrap-ptr [Allocator] (create [Allocator] mem))   ; NEW
      buf (unwrap-ptr [i8] (alloc-slice [i8] mem arena-cap))
      a   (arena-over-buffer ar aa buf arena-cap)]
  …)
```

Then `s.mem` really is malloc (tape/spans/replay survive a reset, which is what
the shrinker needs) and `s.arena` really is the arena (generated values are
reclaimed by the rewind, which is what the steady state needs). Both properties
this benchmark measures become true by construction rather than by luck.

Two smaller things worth doing at the same time: `arena-over-buffer`'s in-place
rewrite of a caller-supplied `Allocator` deserves a warning in its doc comment
(it is a footgun anywhere, not just here), and `malloc-allocator` returning one
shared mutable struct to the entire program is worth a note next to it.

### Working around it in the benchmark

`prop_bench.coil` gives the shrink benchmarks their own Source built on a private
`alloc/static Allocator` cell, then calls that accessor a second time to restore
the malloc vtable — leaving the Source malloc-backed end to end, which is the
state the shipping runner reaches by accident and the only state in which
shrinking is correct. The throughput and steady-state sections keep the ordinary
arena-backed `prop-source`, so §1–§5 measure the engine as it ships. The
workaround is documented at `private-allocator` in the benchmark and should be
deleted when `source-new` is fixed.

That workaround protects the shrink section from the arena, but it does not
protect the arena from the shrink section: `bench-shrink` still calls
`(malloc-allocator)` for its scratch, and that call disables the `prop-source`
arena for anything running afterwards. `bench-memory` therefore refuses to
measure a Source whose `arena` no longer points at its `Arena` (`arena-live?`)
and aborts instead. This was verified by building a variant with §6 moved ahead
of §5: unguarded it printed `arena peak 0 B` at 1 000 / 10 000 / 100 000 /
1 000 000 cases — a perfect-looking steady state produced by an arena nobody was
allocating from — and guarded it exits 134 with the reason. Both this guard and
`private-allocator` go away with the `source-new` fix.
