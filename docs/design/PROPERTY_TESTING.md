# Property-based testing for Coil — design and implementation

Status: **implemented** in `src/stdlib/prop*.coil`. §12 maps every claim below to
the file that carries it and records what was built differently from this design
(and why), plus what is deliberately not built.
Scope: a first-class PBT system in the standard library (`coil.prop`), integrated
with `coil test`, with shrinking that users never have to write, overridable
through traits, and fast enough that the natural setting is 10⁵–10⁷ cases rather
than the 100 that Python tooling can afford.

---

## 1. Thesis

Every good property-based testing system of the last decade converges on one
idea, stated most sharply by Goldstein and Pierce: **a generator is a parser of
randomness** ([Parsing Randomness, OOPSLA 2022][pr]). If generation is parsing,
then:

- the *value* is a function of the *choice sequence* the generator consumed;
- shrinking a value is shrinking that choice sequence and re-parsing;
- every invariant the generator establishes is preserved by construction, for
  free, because the only way to produce a value is to run the generator;
- a corpus, a fuzzer mutation, a saved regression and a replay seed are all the
  same object — a choice sequence.

That is Hypothesis's "internal shrinking" ([compositional shrinking][cs]) and
falsify's "internal integrated shrinking" ([Haskell '23][falsify-pdf]). It is
also, not coincidentally, exactly the shape of Coil's existing
`coil.serde/Deserializer` trait: a pull-based, type-directed input driver. A
generator *is* a `Deserializer` whose input is entropy. We should exploit that.

The proposal, in one line:

> **A typed choice tape with a span tree, driven by monomorphized `Arbitrary`
> impls, shrunk by a greedy shortlex fixpoint over spans, with the property body
> run in-process at ~10⁶ cases/sec and moved to its own process only when a case
> crashes.**

---

## 2. What the state of the art actually is

A survey of the systems worth stealing from, and the specific thing each one
gets right.

### 2.1 QuickCheck (Haskell, 1999) — and why it is not the design

`Arbitrary` gives `arbitrary :: Gen a` and a **separate** `shrink :: a -> [a]`.
Two problems, both fatal at scale:

1. **Invariant loss.** `shrink` knows nothing about how the value was built, so
   shrinking a sorted list yields unsorted lists, shrinking a well-typed term
   yields ill-typed terms. Every custom generator needs a hand-written shrinker
   that re-establishes its own invariants, and most people never write one.
2. **Non-compositionality.** `fmap f g` cannot shrink, because shrinking the
   output would require inverting `f` ([Hypothesis, compositional shrinking][cs]).

QuickCheck's counterexamples are often *smaller* than integrated approaches
produce, precisely because hand-written shrinkers are domain-aware. We keep that
option (§6.6) but never require it.

### 2.2 test.check / Hedgehog — integrated shrinking via rose trees

Generators return a lazy rose tree: a value plus a tree of smaller values.
`map` maps the tree; invariants survive. This is a real advance and it is why
Hedgehog needs no `shrink` function.

The known defect is **monadic bind**. In `x <- gen; f x`, the right-hand side is
not a generator until `x` is known, so once shrinking descends into `f x` it can
never go back and shrink `x` again without discarding all progress — de Vries's
"[Integrated versus Manual Shrinking][ivm]" and falsify §2 both make this
precise. `filter` compounds it: the predicate is re-checked at every node of the
shrink tree, so the entire generator re-runs per rejected candidate, producing
[large trees and bad performance][hh281]. Reported real-world cost: shrinking
taking [most of a minute][ptw] where QuickCheck took milliseconds. Rose trees are
also memory-hungry — you materialize the shrink structure whether or not the test
fails.

**Verdict: do not use rose trees.** They pay memory on every passing case for a
benefit only failing cases use.

### 2.3 Hypothesis (Python) — internal shrinking, and the typed choice sequence

Hypothesis records every primitive draw into a linear sequence and shrinks *that*,
re-running the generator on the edited sequence. Consequences:

- One shrinker for the whole ecosystem. Users write generators, never shrinkers.
- Bind is a non-issue: the tape is flat, so "shrink the length" and "shrink the
  elements" are edits to different regions of the same tape and can be
  interleaved freely.
- Invariants hold because the only way to get a value is to re-run the generator.

Originally the tape was a **bytestring**. Hypothesis has since migrated to a
**typed choice sequence** ([#3921][h3921]): five choice types — `boolean(p)`,
`integer(min, max, weights, shrink_towards)`, `float(min, max, allow_nan,
smallest_nonzero_magnitude)`, `string(intervals, min_size, max_size)`,
`bytes(min_size, max_size)` — each carrying its constraints. The stated reasons
are exactly the ones that matter to us:

- bytes → value is **not injective**, so many byte strings denote the same test
  case and generation/shrinking waste work on redundant representations;
- shrinking a float by editing its bytes requires "hacky byte-to-float
  conversions" instead of a direct numeric move;
- byte-level is too low-level for an **SMT backend** — which is how
  `hypothesis-crosshair` ([CrossHair][ch]) plugs symbolic execution in behind the
  same generator API.

The shrinker is a **greedy fixpoint of many passes over a shortlex order** (short
sequences beat long ones; ties broken lexicographically), documented in
[Test-Case Reduction via Test-Case Generation (ECOOP 2020)][ecoop]. Passes
include span deletion (adaptive: try deleting runs of k spans, doubling k on
success), per-choice binary-search minimization toward `shrink_towards`,
replacing a span with one of its own descendants (the pass that makes recursive
data shrink well), redistributing value between pairs of numeric choices
(so `(a, b)` with `a+b` invariant can move mass), lowering duplicated choices
together, and reordering. That paper also reports the cost of "normalization"
passes: ~30× more test calls for counterexamples ~55% of the size — a knob, not a
default.

Around the core, Hypothesis has the best *product* in the field: an example
database that replays last run's failures first, explicit `@example` pins,
`assume()`, `target()` for [targeted PBT][tpbt], statistics, deadlines, and
phases (`reuse → generate → target → shrink → explain`).

Its one real weakness, named by falsify: **no user control over shrinking**. When
the built-in heuristics do the wrong thing for your domain there is no override.
And it is Python: a few thousand cases per second, on a good day.

### 2.4 falsify (Haskell, 2023) — predictable shrinking

De Vries's critique of the linear tape: deleting or shortening a region **shifts
every downstream draw**, so a shrink of the first component can hand the second
component a completely unrelated value. Shrinking is therefore hard to reason
about ("unpredictable redistribution").

falsify's answer is an **infinite binary sample tree**:

```haskell
data STree = STree Word STree STree     -- plus a `Minimal` node: zero everywhere
newtype Gen a = Gen (STree -> (a, [STree]))
```

At every combination point the tree is *split*: the left generator gets the left
subtree, the right gets the right subtree. Shrinking never deletes a sample; it
only lowers individual `Word`s in place. Therefore a shrink of the left component
provably cannot perturb the right component, shrinking can alternate between them
indefinitely (fixing bind), and the ordering is a *partial* order over trees.
Infinite structures and functions work because the tree is lazy. Ranges carry an
**origin** (`withOrigin`, `between`, `skewedBy`) — the value shrinking moves
toward — rather than assuming zero.

falsify also uses **selective functors** (`ifS`) so that a branch not taken
consumes no samples, avoiding the "generate then discard" pathology.

The cost: never deleting samples means the tape only ever gets *smaller in value*,
not *shorter*, so falsify leans on the generator to interpret a lowered sample as
"fewer elements". Hypothesis's deletion passes remain better at collapsing large
structures.

### 2.5 proptest (Rust) — per-value strategies

proptest's `Strategy` produces a `ValueTree` with `simplify()` / `complicate()`:
a binary search between "minimal" and "the value we drew". The key design note in
its docs: *"Unlike QuickCheck, generation and shrinking is defined on a per-value
basis instead of per-type, which makes it more flexible and simplifies
composition."* That is right, and it is why the trait alone is not enough — you
need first-class generator **values** so that `vec(0..100i32, 1..10)` is
expressible without a newtype.

proptest also ships `fork` + `timeout` features, running each case in a
subprocess so a segfault or hang is a counterexample rather than the end of the
run. Cheap in Rust only because it's opt-in; we can do better (§7.4).

The documented sharp edge: `complicate` must return you to *the same* parent you
simplified from, or shrinking cycles. Any `simplify/complicate` design carries
that obligation; a tape design does not.

### 2.6 `arbitrary` + libFuzzer (Rust) — byte-driven, and its limits

`Unstructured` treats the fuzzer's raw buffer as "a DNA string" and
`#[derive(Arbitrary)]` decodes typed values from it — structure-aware fuzzing
with coverage guidance for free. Two lessons:

- **The good one:** if generation is decoding, a mutation-based fuzzer and a PBT
  tool are the same tool with different search strategies.
- **The bad ones:** there is [no serialization direction][arb-readme] (you cannot
  build a corpus from known-interesting values), and the derive is expensive —
  Nethercote found `#[derive(Arbitrary)]` emitting 100+ lines for a two-field
  struct plus a thread-local recursion counter *per type*, whether or not the type
  could recurse ([speed wins][nn]). Our derive must (a) be bidirectional, and
  (b) special-case the shapes that cannot recurse.

### 2.7 jqwik / fast-check — the user-experience bar

Deliberate **edge-case injection** (0, ±1, MIN/MAX, empty, NaN, ∞, duplicates,
boundary dates) mixed into the random stream rather than left to chance;
exhaustive generation when the domain is small enough to enumerate; a failure
database; `Statistics`/`classify`; readable, deterministic reporting. This is
most of what users perceive as "quality".

### 2.8 Research worth encoding in the design

| Idea | Result | Where it lands here |
|---|---|---|
| [Swarm testing][swarm] (Groce et al., ISSTA'12) | Randomly *omitting* features per test run beats using all features every run; features compete for space, and some actively suppress others | §6.4: per-case feature masks on `one-of` |
| [Targeted PBT][tpbt] (Löscher & Sagonas, ISSTA'17/ICST'18) | Hill-climbing/simulated annealing on a user `target` metric finds counterexamples with far fewer cases; can be automated from a plain random generator | §7.6: `prop/target!` + annealing over the tape |
| [Coverage-guided PBT][fuzzchick] (Lampropoulos et al., OOPSLA'19) | FuzzChick found bugs "within seconds" that vanilla QuickChick could not find in an hour | §7.5: `-fsanitize-coverage` + tape mutation |
| [Test-case reduction via generation][ecoop] (MacIver & Donaldson, ECOOP'20) | The shortlex-greedy pass architecture, and the cost/benefit of normalization | §6 |
| [Parsing Randomness][pr] (Goldstein & Pierce, OOPSLA'22) | Generators factor into *parser* + *distribution over choice sequences*; supports Brzozowski-style derivatives for previewing a choice | §4.3, §5.3 |
| [Tuning random generators][tune] / [The search for constrained random generators][scrg] (2025–26) | Generator distributions can be *learned/synthesized* to satisfy sparse preconditions | §9, future work — the tape makes it pluggable |
| [Etna][etna] | A benchmark suite for comparing PBT tools on bug-finding power | §10: how we will evaluate |

---

## 3. Design decisions

| Decision | Choice | Why |
|---|---|---|
| Shrink representation | **Typed choice tape + span tree** | Hypothesis's deletion power, made structural by spans; avoids rose-tree memory tax and proptest's `complicate` cycle hazard |
| Choice types | bool, int (with range + origin + weights), float (with range/NaN policy), bytes | Directly shrinkable, injective, SMT-friendly ([#3921][h3921]) |
| Locality | **Span-local splicing**: edits inside a span never move the tape outside it | Recovers most of falsify's predictability without an infinite tree |
| Generation API | **Both** a monomorphized `Arbitrary` trait *and* first-class `Gen` values | Trait = zero-boilerplate defaults + user override; `Gen` = per-value control (proptest's lesson) |
| Shrinking API | Internal by default; `Shrink` trait as an opt-in *polish* pass | Answers falsify's "no user control" critique without making shrinkers mandatory |
| Derivation | Comptime reflection (`code-field-*`, `code-variant-*`), plus a bridge from `coil.serde/Deserialize` | `derive.coil` already proves the pattern; serde gives us corpus interop for free |
| Execution | In-process, arena-per-case; **a spawned worker only when a case dies from a signal** | ~10⁶ cases/sec; still shrinks segfaults, which no in-process tool can |
| Integration | `defprop` expands to the same `coil-test$…` shape `assert.coil` already discovers | Zero new tooling; `coil test` just works |

---

## 4. Architecture

Five layers. Each is usable on its own; each higher layer is a library over the
one below.

```
  L4  runner       defprop, phases, DB, statistics, stateful, cov-guided fuzzing
  L3  derivation   (derive Arbitrary T)  |  Deserialize-as-generator bridge
  L2  generators   Arbitrary trait  |  Gen values (map/bind/filter/one-of/…)
  L1  primitives   draw-int / draw-bool / draw-float / draw-bytes  + Range
  L0  Source       the typed tape, spans, RNG, fuel, per-case arena
```

### 4.1 L0 — `Source`: the tape

Everything else is a client of this struct. Illustrative Coil (final signatures
to be settled against the compiler):

```lisp
(module coil.prop.source)

;; One recorded choice. 16 bytes, POD, no pointers: a tape is a flat array and a
;; memcpy is a valid clone.
(defstruct Choice
  [(kind   u8)      ; 0=bool 1=int 2=float 3=bytes-len 4=byte
   (flags  u8)      ; forced? / from-edge-pool? / swarm-masked?
   (cnstr  u16)     ; index into the constraint table (range, origin, weights)
   (span   u32)     ; owning span index — the structural back-pointer
   (value  u64)])   ; the raw drawn value (float bits for kind=2)

;; A structural region of the tape, opened/closed by generators.
(defstruct Span
  [(label  u32)     ; interned generator/type name, for reporting + pass targeting
   (start  u32)     ; first choice index
   (end    u32)     ; one past last
   (parent u32)
   (depth  u16)
   (kind   u16)])   ; 0=generic 1=collection-element 2=variant-tag 3=recursive-node

(defsum Mode
  (Generate)                       ; draw from the RNG, append to the tape
  (Replay  [(tape (slice Choice))])  ; re-run over an edited tape
  (Mutate  [(tape (slice Choice)) (rate u32)]))  ; corpus-mutation (fuzzing)

(defstruct Source
  [(rng     Rng)                  ; xoshiro256++ / splitmix64-seeded
   (mode    Mode)
   (tape    (ArrayList Choice))
   (spans   (ArrayList Span))
   (cursor  u32)                  ; replay position
   (cur-span u32)
   (fuel    i32)                  ; size budget; decremented on recursion
   (arena   (ptr alloc/Allocator)) ; per-case arena — reset, never freed piecemeal
   (swarm   u64)                  ; feature mask for this case (§6.4)
   (status  u8)])                 ; ok / overrun / rejected(assume) / exhausted
```

Invariants that make everything else work:

1. **Determinism.** `(seed, mode, tape) ⇒ value`, always. No clocks, no
   addresses, no hash-order iteration inside generators.
2. **Replay tolerance.** In `Replay`, if the tape runs out or a choice's
   constraints no longer fit (a shrunk length made the generator ask for fewer
   elements), the `Source` synthesizes the *minimal* value for that constraint
   and marks `status = overrun`. An overrun candidate is still a legal test case;
   it is simply not required to reproduce the failure. This is what makes edits
   to the tape total rather than partial.
3. **The all-minimal tape is always valid.** An empty tape generates the minimal
   value of every type — 0, `false`, empty collection, first variant. Shrinking
   therefore always has a floor, and `(prop/minimal T)` is a cheap, useful thing
   to be able to print.

### 4.2 L1 — primitive draws

```lisp
(defn draw-bool  [(src (mut Source)) (p u32)] (-> bool))       ; p = P(true) in 2^-32
(defn draw-int   [(src (mut Source)) (r Range)] (-> i64))
(defn draw-float [(src (mut Source)) (r FRange)] (-> f64))
(defn draw-bytes [(src (mut Source)) (lo i64) (hi i64)] (-> (slice u8)))
(defn span-open  [(src (mut Source)) (label u32) (kind u16)] (-> u32))
(defn span-close [(src (mut Source)) (id u32)] (-> i64))
```

`Range` carries falsify's insight — an **origin**, not an assumed zero:

```lisp
(defstruct Range [(lo i64) (hi i64) (origin i64) (bias u8)])
;; (range-between 1 100)          origin = 1     (nearest endpoint to zero)
;; (range-origin -50 50 0)        origin = 0
;; (range-exponential 0 1000000)  bias toward the origin, log-uniform
```

Shrinking a `kind=1` choice means moving `value` toward `origin` by binary
search. That is why the origin lives in the *constraint*, not in the shrinker:
the shrinker needs no knowledge of what the number means.

Uniform ints use Lemire's multiply-shift, not modulo: one 64×64 multiply, no
division, no rejection loop in the common case, no modulo bias.

### 4.3 L2 — two generation APIs, deliberately

**The trait** — the default path, zero boilerplate, monomorphized to a direct
call:

```lisp
(deftrait Arbitrary [Self]
  (arbitrary [(src (mut Source))] (-> Self)))

;; parameterized generation (proptest's Strategy::Parameters), via Coil's
;; parameterized-trait-as-bound support:
(deftrait ArbitraryWith [Self Params]
  (arbitrary-with [(src (mut Source)) (p Params)] (-> Self)))
```

Generic impls cover the collections once and for all:

```lisp
(impl [(T Arbitrary)] Arbitrary (Option T) …)
(impl [(T Arbitrary)] Arbitrary (ArrayList T) …)   ; length drawn first, in its own span
(impl [(K Arbitrary Hash Eq) (V Arbitrary)] Arbitrary (HashMap K V) …)
(impl [(A Arbitrary) (B Arbitrary)] Arbitrary (Pair A B) …)
```

and specialization means a user can override *one instance* —
`(impl Arbitrary (ArrayList u8))` to generate realistic byte payloads — without
touching the general impl. This is the "overridable via traits" requirement, and
Coil's most-specific-impl-wins rule gives it to us with no extra machinery.

**The values** — for the per-call-site control that a trait cannot express:

```lisp
(defstruct Gen [T] [(run (fnptr c [(ptr Source) (ptr i8)] T)) (env (ptr i8))])

(gen/int      (range-between 1 100))
(gen/vec-of   [i64] (gen/int (range-between 0 9)) (range-between 1 32))
(gen/map      [A B] g f)
(gen/bind     [A B] g k)
(gen/filter   [T] g pred max-tries)      ; local resampling, NOT global rejection
(gen/one-of   [T] [(3 g-leaf) (1 g-node)])   ; weighted; swarm-aware
(gen/recursive [T] leaf-gen (fn [inner] …))  ; fuel-driven, guaranteed terminating
(gen/const    [T] v)
(gen/sample   [T] (slice T))
```

`Gen` is a closure pair, following `closure.coil`'s existing shape. Combinators
are ordinary functions; the compiler monomorphizes and inlines the common cases,
so `gen/map` over `gen/int` should compile to the same code as a hand-written
draw.

Two API surfaces is a deliberate cost. The justification: proptest's per-value
strategies and Hypothesis's per-type registry each exist because the other is
insufficient, and both libraries eventually grew the other half.

**Filtering.** `gen/filter` resamples *within its own span* — it rewrites only
that region of the tape and retries — rather than rejecting the whole case. That
is the fix for Hedgehog's `filter` pathology ([#281][hh281]): a rejected
candidate costs one span's worth of regeneration, not a whole re-run of the
generator tree. Exhausting `max-tries` marks the case `rejected`; the runner
reports an exhaustion rate, and a run that rejects >`x`% aborts with a real error
telling the user their precondition is too sparse (rather than silently testing
almost nothing — the classic PBT failure mode).

### 4.4 L3 — derivation

`(derive Arbitrary T)`, a macro over the same reflection builtins `derive.coil`
already uses (`code-field-count/-name/-kind/-qtype`,
`code-variant-count/-name/-fields/-field-type`):

- **struct**: open a span, draw each field through its own `Arbitrary`, close.
- **sum**: draw a variant index as a `kind=2` (variant-tag) choice with
  `origin = 0`, so shrinking always pulls toward the **first-declared variant**.
  Convention (documented, enforced by a lint): declare the base case first.
  Then draw the payload inside a nested span.
- **recursive sum**: the variant weights are a function of `fuel`. Fuel starts at
  the case's size parameter and is divided among recursive children; at zero
  fuel, only non-recursive variants are offered. Termination is *structural*, not
  a per-type thread-local counter — avoiding the exact overhead Nethercote
  measured in `arbitrary`'s derive. Whether a variant is recursive is decided at
  comptime by reflecting the payload types, so non-recursive sums emit no fuel
  logic at all.
- **hard errors, no silent stubs**: an unsupported field shape (raw `(ptr T)`
  with no ownership story, an `fnptr`, an `externref`) is a *comptime error*
  naming the field and telling the user to write the impl by hand — matching
  `derive.coil`'s existing policy.

**The serde bridge.** `coil.serde/Deserializer` is already a pull-based,
type-directed input driver, and every `(derive Deserialize T)` type has a decoder.
A `RandomDeserializer` — a `Deserializer` impl whose "input" is the `Source` —
makes every `Deserialize` type generable with no new derive:

```lisp
(derive-arbitrary-via-deserialize T)    ; T: Deserialize  ⇒  T: Arbitrary
```

This is [Parsing Randomness][pr] made literal, and it buys three things beyond
convenience:

1. **Corpus interop.** A JSON/msgpack/sexp corpus of real inputs becomes a
   seed set: decode with the real deserializer, record the choices, get a tape.
   This is precisely the direction the `arbitrary` crate [lacks][arb-readme].
2. **Counterexample printing for free** via `Serialize` → `serde_sexp`, so a
   minimal counterexample prints as readable, *re-parseable* source.
3. **Regression fixtures.** A shrunk counterexample can be emitted as a literal
   `(example …)` in sexp form, checked into the test file.

The bridge is opt-in, not a blanket impl: derived-from-schema generators know
nothing about domain invariants (a `Deserialize`-driven `Email` will not look
like an email), and `Arbitrary` should stay the place where invariants live.

---

## 5. The shrinker

### 5.1 Order

Candidates are compared by **shortlex over the tape**: fewer choices first, ties
broken by lexicographic comparison of `(kind, value-distance-from-origin)`. This
is a well-order, so the greedy loop terminates. "Smaller tape" corresponds to
"structurally simpler value" because every generator draws length before
contents.

### 5.2 The loop

Greedy fixpoint (ECOOP'20's architecture): run passes in a fixed order; any pass
that improves the current best restarts the round; stop when a full round makes
no progress, or the shrink budget is spent. Every candidate is checked against a
cache of already-tried tapes (hash of the choice array) so re-running the
property is never wasted.

### 5.3 The passes

Structural (these are what spans buy us):

1. **`delete-spans` (adaptive).** Try deleting a span; on success, try deleting
   2, 4, 8… consecutive sibling spans, doubling while it keeps working. This is
   what collapses a 500-element list to 3 in O(log n) test calls rather than
   O(n).
2. **`hoist-descendant`.** Replace a span with one of its own descendant spans of
   the same label. This is the pass that reduces `Add(Mul(x, Add(y, z)), w)` to
   `Add(y, z)` — indispensable for ASTs and any recursive type, and the reason
   spans carry labels.
3. **`minimize-variant-tag`.** Pull a sum's tag toward variant 0, re-running the
   payload generator (which will produce the minimal payload for the new
   variant).
4. **`dedupe-spans`.** Replace a span with an earlier span carrying the same
   label and smaller content — makes counterexamples use the *same* small value
   in several places, which reads much better.

Numeric / lexicographic:

5. **`minimize-choices`.** Per choice, binary-search `value` toward `origin`.
6. **`lower-together`.** Choices with equal value and equal constraint move down
   as a group (breaks the "two counters that must stay equal" plateau).
7. **`redistribute-pairs`.** For adjacent numeric choices `(a, b)`, try
   `(a-k, b+k)` — moves mass out of the first component when only the sum
   matters.
8. **`sort-spans`** / **`reorder-choices`.** Canonicalize order where the
   property is order-insensitive; makes two runs that found "the same" bug report
   the same counterexample.
9. **`zero-tail`.** Truncate the tape and let overrun-minimality fill the rest.

Optional, off by default (ECOOP'20 measured ~30× cost for ~45% smaller results):

10. **`normalize`.** Keep shrinking after a fixpoint by trying *alternative*
    minimal representations, so that all counterexamples of a given bug converge
    to one canonical form. Behind `--shrink=thorough`.

### 5.4 Locality — the falsify concern, addressed

De Vries's objection to a linear tape is that deleting from the middle shifts
everything after it, so shrinking component A perturbs component B. Two
mitigations, which together recover most of the guarantee at a fraction of the
complexity of an infinite tree:

- **Span-local splicing.** Every pass edits within a span and re-runs the
  generator; the *choices* outside the edited span are re-consumed unchanged by
  the same generators as before, because generators consume spans, not absolute
  offsets. Replay is span-indexed, not cursor-indexed: entering span *k* seeks to
  span *k*'s recorded content, so a shortened sibling cannot slide it.
- **Branch-local consumption.** Following falsify's use of selective functors,
  `gen/one-of` and `gen/if` consume choices only for the branch actually taken
  (each branch gets its own span). A discarded branch leaves no residue on the
  tape to be shifted.

Full falsify-style independence would need the infinite split tree; we are
choosing Hypothesis's deletion power over the last increment of predictability,
and documenting that as a deliberate trade with a fallback: if the span-local
scheme proves too surprising in practice, `Span` already gives us the tree
structure needed to switch the *replay* strategy to a split-tree walk without
changing a single generator.

**What was actually built (and the honest gap).** Replay is *linear* — a cursor
walking the tape, exactly as Hypothesis does it — not span-indexed. The span tree
is recorded and drives every structural pass, but a deletion still shifts what
later generators read. Two things make that far less painful than it sounds:
replay is total (a shifted generator gets a clamped or minimal value rather than
failing), and the shrinker keeps the tape the run *actually produced* rather than
the one it proposed, so a candidate that shifts into nonsense simply fails to
improve the shortlex order and is dropped. Span-indexed replay — seeking to the
recorded span whose label matches, so a shortened sibling cannot slide it — is
the one piece of §5.4 that remains future work, and the `Span` records already
carry the parent/label/depth it needs.

### 5.5 Shrinking crashes

A Coil property can segfault, hit UB, or hang. That is not an exceptional case in
a systems language; it is one of the most valuable things a PBT tool can find,
and it is exactly what in-process tools cannot minimize.

**As built**, and it is simpler and stronger than the sketch this paragraph
originally carried:

1. **Every property's generation phase runs in one worker process.** One process
   per property — not per case — so the happy path is untouched. The worker
   reports through its exit status alone: `0` all passed, `2` an ordinary
   counterexample, `3` the worker could not do what it was asked, *killed* a
   crash.
2. **A crash is located by bisection.** The parent binary-searches the case count,
   running prefix `[0, k)` in a fresh worker per probe and asking whether that
   prefix survives — `log₂(cases)` spawns, eight for a default run. No per-case
   bookkeeping, no shared memory, no syscall in the inner loop. This works
   because a case's input is a function of `(seed, index)` once the whole prefix
   has been drawn, which is exactly what the tape guarantees.
3. **The input is rebuilt without running the body.** A property compiles to a
   function with a mode argument, and `PROP-MODE-DRAW` draws the arguments and
   stops. Generation is pure; only the body crashes. So the parent can hold the
   crashing input in its own memory without ever being at risk from it.
4. **Shrinking spawns per candidate**, and "still failing" means *died from the
   same signal*, not merely "died". A reducer that accepts any crash cheerfully
   minimizes one bug into a different one; requiring the signal to match is the
   cheapest guard against that slippage.
5. **A hang is a crash.** The worker arms `alarm(--timeout)` (60s by
   default), so an infinite loop arrives as SIGALRM and flows through the same
   bisect-and-minimize path. Reported as "the property NEVER FINISHED on this
   input", because printing "signal 14" makes the reader look up something the
   runner already knew.
6. **The budget scales with what a candidate costs.** In-process ~100ns, so
   20 000 candidates are free; a candidate that needs its own process costs an
   exec (~2ms, more for a binary that starts a language runtime), so two hundred;
   timed-out *seconds*, so sixty-four. With a hang, a small input quickly beats
   the smallest input eventually.

Verified end to end: a property that segfaults above 10 minimizes to `a = 10`; a
property that loops forever above 10 minimizes to `a = 12` within its watchdog
budget. `--no-fork` opts out for debugger sessions, trading crash
minimization for a live backtrace.

**Every one of those processes is EXEC'd, not forked** (`scripts/tests/prop_spawn.py`
is the gate). A worker is the runner's own binary started again with hidden flags —
`--coil-prop-child NAME` plus `--coil-prop-cases N` or `--coil-prop-replay PATH` —
carrying the parent's whole command line so both processes read the same `--seed`,
`--cases` and `--db`, and so `coil test`'s own `--coil-test-only N` still selects the
one test the worker exists for.

The reason is nesting. `coil test` already runs each test in its own process, so a
property's children are the children of a process that is not the runner and whose
threads are not under the runner's control: a linked Go c-archive, CoreFoundation, a
sanitizer runtime. `fork` hands such a child an address space whose locks are held by
threads that do not exist in it, and the child deadlocks on its first call into the
runtime that owns one (or, on macOS, is SIGKILLed by libSystem's atfork handler
before it gets that far). The watchdog then turns that deadlock into
`TIMED OUT ... on case 0` — the tool inventing a bug in a property that is perfectly
true, with a "reproduction" that reproduces nothing.

What an exec costs is shared memory: a worker inherits no Source, no tape, no
statistics, so everything it needs is on its command line or in the tape database.
That is affordable precisely because of point 2 — generation is deterministic in
`(seed, index)`, so "run cases `[0, N)`" fully describes a phase, and a shrink
candidate is a tape, so it travels as a file (`.coil/pbt/<property>/candidate-<pid>`).
The measured cost against the fork it replaced is ~0.2ms per property on an ordinary
test binary.

### 5.6 User-controlled shrinking (the override story)

Internal shrinking handles ~95% of cases with no user code. For the rest, three
escalating overrides — this is the part falsify correctly says Hypothesis lacks:

1. **Range origins and weights** — `(range-origin lo hi o)`, `gen/one-of`
   weights, `gen/frequency`. Declarative, and by far the most common need.
2. **Span atomicity** — `(gen/atomic g)` marks a span as non-deletable and
   non-hoistable (for values that only make sense whole, e.g. a checksum-bearing
   header), and `(gen/shrink-first g)` / `(gen/shrink-last g)` bias pass order.
3. **`Shrink`, an opt-in polish pass.**

```lisp
(deftrait Shrink [Self]
  (reduce [(x Self) (out (mut (ArrayList Self)))] (-> i64)))  ; simpler candidates
```

Run only after the internal fixpoint, on the *value*, QuickCheck-style. Because
these candidates have no tape, the phase is terminal: it can improve the reported
counterexample but internal passes do not resume afterward. When both a `Shrink`
impl and a generator invariant exist, candidates that fail the generator's
`assume` are discarded, so an invariant-breaking `reduce` degrades to "no
improvement" rather than to a false counterexample. Documented as the escape
hatch, not the default.

---

## 6. Search quality

Shrinking makes failures *readable*; these make failures *happen*.

### 6.1 Edge cases, on purpose

The first ~15% of the budget draws from a per-constraint edge pool rather than
uniformly: for ints `{origin, lo, hi, 0, ±1, MIN, MAX, 2ⁿ, 2ⁿ±1}`; for floats
`{0.0, -0.0, ±1, NaN, ±∞, MIN_SUBNORMAL, MAX, 0.1, 2⁵³}`; for collections
`{empty, 1, 2, capacity-boundary, capacity+1}`; for bytes `{empty, NUL, 0xFF,
invalid UTF-8, long runs}`. Combinations of edge cases across arguments are drawn
too, not just one-at-a-time (jqwik's approach). This is cheap and finds an
outsized share of real bugs.

### 6.2 Size ramp

Case *i* of *n* gets fuel proportional to a ramp (small early, large late), so a
run finds trivial bugs in the first hundred cases and deep bugs in the last
thousand. Standard, and it interacts well with the shortlex order.

### 6.3 The example database

`.coil/pbt/<module>/<prop>/` holds tapes, keyed by content hash:
`failing/` (last known counterexample per distinct failure signature) and
`corpus/` (interesting cases from coverage-guided runs). Phase order matches
Hypothesis: **replay-failures → replay-corpus → edge cases → generate → target →
shrink**. A failing case is written *before* the property runs, so even a crash
that takes the process down leaves a reproducible artifact. `.gitignore`d by
default; `coil test --pbt-pin` promotes a tape to a checked-in `(example …)`.

### 6.4 Swarm testing

Per [Groce et al.][swarm], each case gets a random 64-bit **feature mask**;
`gen/one-of` omits masked-out alternatives entirely. Empirically this beats
uniform selection because features compete for space in a bounded test case and
some features suppress others (a generator that can emit `pop` on every step
rarely builds a deep stack). Cost: one AND per choice. It is on by default and
disableable per generator.

### 6.5 Statistics and honesty

`(prop/classify src "empty list" (= n 0))` and `(prop/collect src "len" n)`
produce a distribution report at the end of a run. This exists to stop the
single most common PBT failure: a test suite that has been generating the same
trivial value ten thousand times. The runner *warns automatically* when one
classification covers >90% of cases, or when the exhaustion rate from `assume`
exceeds 20%.

### 6.6 Targeted PBT

```lisp
(prop/target! src (cast f64 (queue-depth q)))    ; maximize
```

When a property calls `prop-target!`, the runner enters the **target phase**
after plain generation and hill-climbs the tape. Löscher & Sagonas report large
reductions in cases-to-failure, and the [automation paper][tpbt2] shows the
neighbourhood function can be derived from the generator alone — which, on a
tape, is trivially true: a neighbour is a tape with a few choices perturbed.

**As built:** acceptance is **threshold accepting** (Dueck & Scheuer, 1990) — take
any neighbour no worse than `best − threshold`, with the threshold decaying
linearly to zero — rather than the Metropolis rule, because `exp(-Δ/T)` would
drag libm into the standard library's test path to no benefit. The threshold
starts at a tenth of the objective's own magnitude, so the schedule behaves the
same whether the number reported is bytes or tree levels. A neighbour perturbs
one to three choices, and the step is a uniform jump, a ±8 nudge, or a snap to an
endpoint — the last of those is what actually matters for monotone objectives, a
±1 random walk being far too slow to cross a range inside a test run.

Measured: "the sum of ≤60 bytes never exceeds 12000" is unreachable for uniform
sampling (it needs a mean element above 200 across a full-length list) and the
targeted phase finds it in ~3 000 cases, under a second, at default settings.

### 6.7 Coverage-guided mode (phase 2)

Coil compiles through LLVM, so `-fsanitize-coverage=trace-pc-guard` gives an edge
counter table. With it, `coil test --pbt-fuzz` becomes a structure-aware fuzzer:
mutate tapes from the corpus (`Mutate` mode), keep tapes that hit new edges, and
shrink with the same shrinker. This is [FuzzChick][fuzzchick]/Zest/HypoFuzz, and
because the mutation operates on the **typed** tape rather than raw bytes, every
mutant is a well-formed value of the type — no wasted executions on inputs that
fail to parse. Same properties, same generators, no new user-facing concepts.

**Built** — `coil.prop.cov` plus a fuzz phase in the runner, reached with
`coil fuzz FILE.coil [-n N]`. It was originally scoped as
a compiler-side change — teaching the driver to pass `-fsanitize-coverage` — and
it turns out not to need one, because two pieces already exist:

1. **`coil emit-ir` produces complete, linkable LLVM IR for a whole program.** So
   the instrumented build is `coil emit-ir prop_test.coil | clang
   -fsanitize-coverage=trace-pc-guard -O1 - -o fuzz-bin`, entirely outside the
   compiler. Verified: instrumented, linked, ran.
2. **The SanitizerCoverage callbacks can be written in Coil.** `(export-c
   [cov-guard :as "__sanitizer_cov_trace_pc_guard"])` and its `_init` sibling are
   ordinary Coil functions over a `primitive/alloc-static` bitmap. That means an ORDINARY
   build still links — the symbols exist, nothing calls them, coverage queries
   return zero — and only the instrumented build has real edges. No C file, no
   weak symbols, no conditional compilation. Exclude them from instrumentation
   with `-fsanitize-coverage-ignorelist` or they call themselves.

Measured on a branchy function with opaque inputs: 7 new edges on the first call,
3 on a repeat (still-warming library paths), then 0 for an input on the same
path and 1 each for inputs that reach new branches. Two caveats the experiment
surfaced, both worth knowing before building on it: at `-O1` some source-level
branches compile to branchless selects and produce no edge at all, and
magic-value comparisons (`a + b == 500`) need `trace-cmp` feedback rather than
edge coverage to solve — which is exactly what libFuzzer's `trace-cmp` provides
and what the tape's typed choices are unusually well placed to exploit.

The loop is a corpus of tapes, mutate-and-keep-if-new-edges, and the shrinker,
the crash isolation and the database all apply unchanged — a fuzz finding is just
a failing tape, so it minimizes and replays like any other.

**Measured**, on `tests/prop/demos/fuzz_demo.coil`: a four-byte magic value
(`"FUZZ"`) behind four nested comparisons, five seeds, cases until the bug is
found. Blind sampling needs ~95^4 ≈ 10^8 cases by construction and finds nothing
at 20 000; every guided run shrinks its finding to exactly `s = "FUZZ"`.

| feedback | seeds solved | cases to failure | median |
|---|---|---|---:|
| blind (no feedback) | 0 of 5 | — | ~10^8 by construction |
| edges, uniform corpus | 2 of 5 | none, 124k, 184k, none, 74k | — |
| edges, frontier-biased corpus | 5 of 5 | 85k, 71k, 84k, 33k, 6k | 71k |
| **+ comparison feedback** | **5 of 5** | 2.1k, 11.6k, 10.6k, 5.4k, 6.8k | **6.8k** |

Ten times better again, and the mechanism is the one that scales: edge coverage
climbs a magic value one byte per round, so the cost grows with its length, while
a comparison that reports its operands makes each byte known rather than guessed.

Three things had to be right, and each was wrong first:

1. **The corpus must be biased toward the frontier.** An input that just found
   new coverage is the only one that has reached the branch whose far side is
   unexplored; under uniform selection its share of the budget decays as 1/n and
   the ladder stops being climbable. Uniform found the bug on 2 seeds of 5;
   biased, 5 of 5 (§`corpus-pick`).
2. **Mutation must be allowed to GROW an input.** A choice carries the
   constraints of the case that recorded it, and the size budget ramps — so the
   early cases that dominate the corpus recorded lengths bounded by a size of one
   or two, and clamping mutations to those bounds capped the search at inputs too
   short to reach a four-byte check. With the clamp, 20 000 iterations grew the
   corpus by zero.
3. **The target must have branches to discover.** A chain of `if` that only
   yields `true`/`false` is a pure boolean expression and compiles to
   `and`/`select` with no branches at all — no blocks, no edges, nothing to guide
   with. Real parsers do work as they consume, which is what makes them
   fuzzable; the demo had to do the same.

### Comparison feedback

`-fsanitize-coverage=trace-cmp` reports both operands of every integer
comparison. The naive use is a dictionary of "values that were interesting
somewhere", and it did not help — measured slightly WORSE than edges alone
(median 100k against 71k), because the mutator still has to guess which of the
input's choices should take the magic value, and because the runtime side of
every comparison pours into the same table as noise.

What works is storing the **pair**: "where you see 97, the program wanted 70".
The mutator then asks for the counterpart of the value a choice already holds, so
the input's own contents pick out which choice to change. That is Redqueen's
input-to-state substitution, and on a tape it is unusually direct — a byte-level
fuzzer has to locate the value's offset in the input, while here the mutator has
already selected a `Choice` and that choice carries the range the substitution
must fall within, so an out-of-range counterpart is dropped rather than clamped
into a value that only looks like progress.

Two details that cost measurements to find:

- **Only failed comparisons are recorded.** An equality that already holds is not
  something the search needs help reaching, and recording it evicts entries that
  are.
- **Recording is gated to the property call.** Every integer comparison in the
  process reaches the callback — overwhelmingly the engine's own loop counters —
  so the runner switches recording on around the property and off again.
  Instrumentation ignorelists (`fun:coil.prop.*`) help but cannot finish the job:
  sancov runs after inlining, so engine code inlined into the property's own
  function is instrumented regardless of the list. Some noise is inherent.

---

## 7. Performance

The target: **≥10⁶ simple cases/sec on one core**, i.e. three orders of magnitude
past Hypothesis, and enough that `coil test` can afford 10 000 cases per property
by default instead of 100.

Where the time goes, and what we do about it:

| Cost | Design response |
|---|---|
| Per-draw overhead | One xoshiro256++ step (~1ns), Lemire bounded reduction (one multiply, no division), one 16-byte store, one pointer bump. **~5ns/draw.** |
| Dynamic dispatch | None. `Arbitrary` is monomorphized to direct calls; `Gen` combinators inline at -O3. No vtables on the hot path (`dyn` only in the reporting layer). |
| Allocation | One **arena per case**, reset (pointer rewind) between cases, never freed piecemeal. `alloc.coil`'s `arena-allocator` already exists. A generated `ArrayList` costs a bump, not a `malloc`. |
| Tape growth | `ArrayList<Choice>` grown once to the high-water mark of the previous case and reused; steady state does zero allocation. |
| Process overhead | One spawned worker per property, not per case (contrast: proptest's `fork` feature, one process per case). A process per candidate only for crash shrinking (§5.5). |
| Spans | Two `u32` writes per span open/close; span table reused across cases. Recording spans on *passing* cases is the only tax the shrinker imposes, and it is ~2ns. |
| Shrinking | The expensive phase, but it runs at most once per failing property. Candidate cache (hash-set of tape hashes) prevents re-execution; adaptive deletion keeps the pass count logarithmic in structure size. |
| Parallelism | Splittable RNG (`splitmix64` seed → per-worker streams) means N workers explore disjoint, reproducible streams. Each worker owns its `Source`, arena, and tape — no shared mutable state, no locks. `thread.coil` exists. |
| Compile time | The derive emits one function per type, no per-type thread-locals, and no fuel logic for non-recursive types (the [`arbitrary` lesson][nn]). |

Memory: a case with 10 000 choices costs 160 KB of tape + spans, reused. The
whole system's steady-state footprint is a few hundred KB per worker plus the
arena high-water mark — versus rose trees, which allocate shrink structure for
every value on every passing case.

### Measured

`src/benchmarks/prop_bench.coil`, `-O3`, Apple M2 Max. Full write-up, including
the reproduction commands and the variance discussion, in the benchmark file's
own report.

| what | cost | rate |
|---|---:|---:|
| `rng-next!` (xoshiro256++) | 1.16 ns | 862 M/s |
| `rng-below!` (Lemire, bound 1000) | 1.33 ns | 748 M/s |
| `draw-int!` — a draw **including tape recording** | 6.18 ns | 162 M/s |
| a full property, two `i64` arguments | 13.96 ns | **71.6 M cases/s** |
| a full property, `(ArrayList i64)` at the stock distribution | 70.3 ns | 14.2 M cases/s |
| a full property, `(ArrayList i64)` of exactly 32 elements | 339 ns | 2.95 M cases/s |

The design target was 10⁶ cases/s; the floor is seventy times that, and the
default 200-case property costs ~3 µs of engine time. Recording is ~5 ns of the
6.18 ns draw — the tape is not free, but it is the cheapest part of the system
that anyone would notice. List generation spends ~10.3 ns per element, of which
roughly 45% is the two span records; that is the price of being able to delete an
element during shrinking, paid on every passing case, and it is the one number
worth revisiting if generation ever becomes the bottleneck.

Steady state was verified directly rather than assumed: over 1 000 000 cases the
tape, span-table and replay-buffer capacities are identical at case 1 000 and at
case 1 000 000, and the arena returns to zero between cases. A million cases
perform no allocation for any of them.

---

## 8. What it looks like to use

```lisp
(module myproject.list_test)
(import "coil.prop" :use *)
(import "coil.assert" :use *)

;; The common case: types are inferred, generators come from Arbitrary, and
;; nobody writes a shrinker.
(defprop reverse-involutive [(xs (ArrayList i64))]
  (assert-eq (list-eq (reverse (reverse xs)) xs) true))

;; Per-call-site control where the trait default is wrong.
(defprop parse-roundtrip
  [(s (gen/string-of (gen/char-range \a \z) (range-between 1 64)))
   (n (gen/int (range-origin 0 1000 0)))]
  (assume (> (str-len s) 0))
  (assert-eq (parse (render s n)) (Pair s n)))

;; Overriding generation for a whole type — this is all "overridable via traits"
;; requires, and specialization means it composes with the generic impls.
(defstruct Email [(local (slice u8)) (domain (slice u8))])
(impl Arbitrary Email
  (arbitrary [(src (mut Source))] (-> Email)
    (let [sp (span-open src (label "Email") 0)
          l  (draw-ident src 1 12)
          d  (draw-sample src DOMAINS)]
      (span-close src sp)
      (mk-email l d))))

;; Recursive data: fuel-driven, terminating, shrinks toward the first variant.
(defsum Expr (Lit [(v i64)]) (Add [(l (ptr Expr)) (r (ptr Expr))]))
(derive Arbitrary Expr)         ; Lit declared first ⇒ shrinks toward Lit 0

;; Model-based / stateful testing — the same core, commands as a generated list.
(defprop-stateful queue-matches-model
  :model    (ArrayList i64)
  :system   Queue
  :commands [(push [(v i64)] :run (q-push! sys v)      :next (push! (mut m) v))
             (pop  []        :run (q-pop! sys)         :next (al-shift! (mut m))
                             :pre  (> (len m) 0))]
  :invariant (= (q-len sys) (len m)))
```

Shrinking a command sequence needs no extra machinery: each command is a span, so
`delete-spans` removes commands, `hoist-descendant` shortens prefixes, and
`minimize-choices` shrinks arguments — the Erlang-QuickCheck workhorse, obtained
for free from the same shrinker.

Failure output:

```
test reverse-involutive ... FAILED (after 1,284 cases, 47 shrinks, 0.31s)

  counterexample:
    xs = (1 0)

  property: (assert-eq (list-eq (reverse (reverse xs)) xs) true)
       at  tests/list_test.coil:7

  reproduce:
    coil test list_test::reverse-involutive --pbt-seed=0x9E3779B97F4A7C15
    (saved to .coil/pbt/myproject.list_test/reverse-involutive/failing/3f2a…)

  statistics: len=0 12% | len=1..8 71% | len>8 17% | rejected 0%
```

---

## 9. Delivery plan

Each phase is independently useful and shippable.

**Phase 1 — the core (the 90%).**
`Source` + tape + spans, the primitive draws, `Range` with origins, `Arbitrary`
for scalars/collections/`Option`/`Result`/slices, `(derive Arbitrary T)` for
structs and non-recursive sums, `defprop` + `coil test` integration, the shrink
passes 1/2/5/9, seed printing and replay. This alone matches most of proptest.

**Phase 2 — the quality layer.**
Remaining shrink passes, fuel-driven recursive derive, the example database and
phase ordering, edge-case pools, `assume` with exhaustion reporting, `classify`/
`collect` statistics, `Gen` combinator values, `gen/filter` with span-local
resampling.

**Phase 3 — the differentiators.**
Crash shrinking in a separate process, swarm testing, `Shrink` polish trait, the
`Deserialize`→`Arbitrary` bridge and corpus import/export, stateful/model-based
properties, parallel workers.

**Phase 4 — research-grade.**
`target!` + simulated annealing, coverage-guided mode via
`-fsanitize-coverage`, `--shrink=thorough` normalization, and — the open door
the tape design leaves us — a pluggable *provider* interface in the shape of
Hypothesis's, so a future symbolic/SMT backend ([CrossHair][ch]) or a
learned/synthesized generator ([tuning][tune], [constrained generator
search][scrg]) can supply choices instead of the RNG without any generator
changing.

---

## 10. How we will know it is good

Not by assertion. Three measurable gates:

1. **Bug-finding power.** Port a subset of [Etna][etna]'s benchmark tasks (BSTs,
   red-black trees, STLC) and measure mean cases-to-failure against the published
   QuickCheck/Hypothesis numbers.
2. **Shrink quality.** For each benchmark bug, measure counterexample size
   against the known minimal one, and shrink-phase test-call count.
3. **Throughput.** A benchmark in `src/benchmarks/` asserting ≥10⁶ cases/sec for
   `(defprop [(a i64) (b i64)] …)` and ≥10⁵/sec for a 32-element list property,
   run in CI as a regression gate.

Plus dogfooding: the Coil compiler is full of properties worth stating —
`parse ∘ fmt = id`, `eval ∘ optimize = eval`, serde round-trips, `sexp`
round-trips, allocator invariants under random operation sequences. The
`llhttp` differential tests in `tests/` are already a hand-rolled version of what
this system automates.

---

## 11. Open questions (to verify against the compiler before implementing)

1. **Blanket impls.** Is `(impl [(T Deserialize)] Arbitrary T)` — implementing
   type is a bare parameter — legal? The rule "every declared param must appear
   in the implementing type" is satisfied, but the interaction with
   specialization needs checking. If it is rejected, the macro form
   `(derive-arbitrary-via-deserialize T)` is the fallback and costs only
   ergonomics.
2. **Trait-method name collisions.** `reduce` and `arbitrary` are globally
   unique-ish, but `Shrink::reduce` may collide with a future iterator `reduce`.
   Reserve names deliberately.
3. **Closure representation for `Gen`.** `closure.coil` heap-allocates env;
   generators want stack/arena envs. Likely needs a `Gen` that carries
   `(ptr i8)` env allocated from the case arena, or comptime specialization of
   the combinators so that no closure exists at runtime at all. Measure both.
4. **`defprop` and the `assert.coil` transform.** `defprop` should expand into
   the same `coil-test$…` naming so the existing whole-program transform
   discovers it with no change. Confirm a macro can expand to a `defn` whose name
   is built with `code-symbol` *and* be seen by a later `(transform …)`.
5. **Seed plumbing.** The synthesized `main` in `assert.coil` takes no argv.
   Seeds/settings arrive via environment (`--seed`, `--cases`,
   `COIL_PBT_DB`) using `coil.os/getenv`, with `coil test` flags setting them —
   or the transform is extended to synthesize an argv-taking `main`.
6. **Float shrinking.** `f64` deliberately has no `Eq` in Coil; the shrinker
   compares float choices by their *bit* distance from origin, which needs the
   documented memory round-trip bitcast idiom rather than `cast`.
7. **Deadlines/hangs.** Detecting a hung case in-process needs `SIGALRM` +
   `signals.coil`; confirm the interaction with the worker-process model.

---

## 12. Implementation status

Every module lives in `src/stdlib/`; a user imports exactly one namespace,
`coil.prop`, which `:reexport`s the rest.

| File | Namespace | What it carries |
|---|---|---|
| `prop_rng.coil` | `coil.prop.rng` | xoshiro256++ over splitmix64; splittable; Lemire bounded draw |
| `prop_source.coil` | `coil.prop.source` | **the tape** — typed choices, spans, replay, fuel, per-case arena |
| `prop_arbitrary.coil` | `coil.prop.arbitrary` | the `Arbitrary` trait, scalar/collection/string impls |
| `prop_show.coil` | `coil.prop.show` | `PropShow` — how a counterexample prints |
| `prop_shrink.coil` | `coil.prop.shrink` | the shrink passes and the greedy fixpoint |
| `prop_runner.coil` | `coil.prop.runner` | phases, process isolation, crash/timeout minimization, statistics, targeted search |
| `prop_db.coil` | `coil.prop.db` | the failure database: versioned tape encoding, `.coil/pbt/` |
| `prop_derive.coil` | `coil.prop.derive` | `(derive-arbitrary T)` / `(derive-show T)` by comptime reflection |
| `prop_gen.coil` | `coil.prop.gen` | first-class generator values and combinators |
| `prop_stateful.coil` | `coil.prop.stateful` | model-based command-sequence testing |
| `prop.coil` | `coil.prop` | `defprop`, `assume`, `classify`, `collect`, `prop-target!` |

Tests: `tests/prop/` — 111 of them across seven files: engine regressions,
shrink-quality assertions against known minima, derive, generators, stateful,
the database, and a 30-property suite over the standard library itself.
`tests/prop/demos/` holds the properties that fail ON PURPOSE (crash, hang,
targeted search, sparse precondition), named so `coil test` never collects them.
Example: `src/examples/property-testing.coil`. Benchmarks:
`src/benchmarks/prop_bench.coil`, results in `src/benchmarks/PROP_RESULTS.md`.
`scripts/tests/prop.sh` runs the whole thing against this checkout's stdlib.

### Where the implementation departs from this design

- **Replay is linear, not span-indexed** (§5.4). The span tree is recorded and
  drives every structural pass, but the shrinker's locality guarantee is
  Hypothesis's, not falsify's. Documented above with the upgrade path.
- **`Arbitrary` fills an out-parameter** — `(arbitrary [(out (mut Self)) (s (ptr
  Source))] (-> i64))` — rather than returning `Self`. A trait method with `Self`
  only in its return type has no argument to dispatch on; `coil.serde`'s
  `Deserialize/de` takes an out-pointer for the same reason. It also means the
  caller allocates one slot per argument instead of one per generated value.
- **Targeted search is threshold accepting**, not Metropolis annealing (§6.6).
- **Derivation is four macros, not two** — `derive-arbitrary` / `derive-show` for
  structs, `derive-arbitrary-sum` / `derive-show-sum` for sums. A Coil macro is a
  function every one of whose parameters is `Code`, so it cannot take a flag, and
  there is no `code-struct?`/`code-sum?` reflection op to branch on: `code-field-*`
  hard-errors on a sum and `code-variant-*` hard-errors on a struct, so a single
  macro cannot even probe which it was handed. `coil.serde.derive` split
  `derive-serde`/`derive-serde-sum` for exactly this reason.
- **Recursive generators bound depth as well as fuel.** Fuel bounds how many
  recursive nodes a value has; a linear chain of N nodes spends N fuel and
  recurses N native frames, so a large size budget overflows the C stack long
  before it runs out of fuel. `src-depth` exists so a generator can treat "too
  deep" as "out of fuel".
- **The `Deserialize`→`Arbitrary` bridge (§4.4) is not built.** The reflection
  path covers the derive case; the bridge's real payoff was corpus interop, which
  the database (`prop_db.coil`) delivers directly in the tape's own format.
- **Coverage-guided fuzzing (§6.7) is not built — but the mechanism is proven,
  and it needs no compiler change.** See §6.7 for the working pipeline.
- **Parallelism is at the test-file level**, via `coil test --jobs N`, not
  in-process across cases (§7). The splittable RNG that in-process workers would
  need is built and tested (`rng-split!`); the worker pool is not.
- **Normalization (§5.3 pass 10) is not built.** It costs ~30× for ~45% smaller
  counterexamples; the pass set that is built reaches the true minimum on every
  benchmark in `tests/prop/shrink_test.coil`.

### A compiler limitation worth recording

A bounded generic cannot call another bounded generic with the same bound —
`(defn f [(T Tr)] …)` calling `(defn g [(T Tr)] …)` is rejected with "'T' does not
implement 'Tr'". A direct trait-method call on a bounded parameter is fine. The
workaround is to inline the callee (see `prop-show-arg` in `prop_show.coil`). Worth
fixing in the checker; it makes bounded generics non-composable.

### What this found

**In the standard library.** `coil.fmt/print-i` printed `i64::MIN` as `-0`,
because it emitted `'-'` and then negated — and negating `i64::MIN` wraps back to
itself. Both serde text backends encode integers through it, so any structure
containing `i64::MIN` serialized to `-0` and decoded back as `0`: silent data
loss, no error anywhere. Found by `tests/prop/stdlib_props_test.coil` on a
round-trip property, shrunk to exactly `n = i64::MIN`, and fixed by printing the
magnitude through the unsigned path. That is the whole argument for this system
in one bug. Write-up: `tests/prop/FOUND_BUGS.md`.

**In this system itself.** `source-new` handed its caller's `Allocator` to
`arena-over-buffer`, which rewrites the struct it is given rather than building a
new one — so the Source's per-case arena and the process-wide malloc allocator
were the same three words. The tape, replay buffer and span table were then
allocated out of the arena that gets rewound between cases, and `malloc-allocator`
re-initializing its static on every call meant any later call anywhere silently
turned the arena back into malloc, leaking every generated value while looking
like a healthy steady state. Every test passed with this bug live; it was found
by a benchmark asking where the tape's storage actually was, and independently by
a generator deep enough to reset the arena while its own span table was in use.
The regression test is `tape-and-spans-live-outside-the-case-arena`, which asserts
the structural fact rather than waiting for a symptom.

## Bibliography

- Claessen & Hughes. *QuickCheck: A Lightweight Tool for Random Testing of Haskell Programs.* ICFP 2000.
- MacIver. [Compositional shrinking][cs]. hypothesis.works, 2016.
- MacIver & Donaldson. [*Test-Case Reduction via Test-Case Generation: Insights from the Hypothesis Reducer.*][ecoop] ECOOP 2020.
- Hypothesis. [Migrate our core representation to the typed choice sequence (#3921)][h3921].
- de Vries. [*falsify: Internal Shrinking Reimagined for Haskell.*][falsify-pdf] Haskell Symposium 2023. ([blog][falsify-blog], [Integrated vs Manual Shrinking][ivm])
- proptest. [`Strategy` / `ValueTree` documentation][proptest].
- rust-fuzz. [`arbitrary`][arb-readme]; Nethercote, [*Speed wins when fuzzing Rust code with `#[derive(Arbitrary)]`*][nn], 2025.
- Groce et al. [*Swarm Testing.*][swarm] ISSTA 2012.
- Löscher & Sagonas. [*Targeted Property-Based Testing.*][tpbt] ISSTA 2017; [*Automating Targeted Property-Based Testing.*][tpbt2] ICST 2018.
- Lampropoulos, Hicks & Pierce. [*Coverage Guided, Property Based Testing.*][fuzzchick] OOPSLA 2019.
- Goldstein & Pierce. [*Parsing Randomness: Unifying and Differentiating Parsers and Random Generators.*][pr] OOPSLA 2022.
- Goldstein et al. [*Etna: An Evaluation Platform for Property-Based Testing.*][etna]
- Goldstein et al. [*Property-Based Testing in Practice.*][pbtp] ICSE 2024.
- [*Tuning Random Generators: Property-Based Testing as Probabilistic Programming.*][tune] OOPSLA 2025.
- [*The Search for Constrained Random Generators.*][scrg] 2025/26.
- jqwik. [User guide][jqwik] (edge cases, exhaustive generation, database).
- [CrossHair][ch] — symbolic execution as a Hypothesis backend.

[cs]: https://hypothesis.works/articles/compositional-shrinking/
[ecoop]: https://www.doc.ic.ac.uk/~afd/papers/2020/ECOOP_Hypothesis.pdf
[h3921]: https://github.com/HypothesisWorks/hypothesis/issues/3921
[falsify-pdf]: https://well-typed.com/blog/aux/files/falsify.pdf
[falsify-blog]: https://well-typed.com/blog/2023/04/falsify/
[ivm]: https://well-typed.com/blog/2019/05/integrated-shrinking/
[hh281]: https://github.com/hedgehogqa/haskell-hedgehog/issues/281
[ptw]: https://frasertweedale.github.io/blog-fp/posts/2020-03-31-quickcheck-hedgehog.html
[proptest]: https://docs.rs/proptest/latest/proptest/strategy/trait.ValueTree.html
[arb-readme]: https://github.com/rust-fuzz/arbitrary
[nn]: https://nnethercote.github.io/2025/08/16/speed-wins-when-fuzzing-rust-code-with-derive-arbitrary.html
[swarm]: https://agroce.github.io/issta12.pdf
[tpbt]: http://proper.softlab.ntua.gr/papers/issta2017.pdf
[tpbt2]: https://proper-testing.github.io/papers/icst2018.pdf
[fuzzchick]: https://lemonidas.github.io/pdf/FuzzChick.pdf
[pr]: https://arxiv.org/abs/2203.00652
[etna]: https://arxiv.org/pdf/2603.27002
[pbtp]: https://harrisongoldste.in/papers/icse24-pbt-in-practice.pdf
[tune]: https://rtjoa.com/slides/oopsla25-tuning-generators.pdf
[scrg]: https://arxiv.org/abs/2511.12253
[jqwik]: https://jqwik.net/docs/current/user-guide.html
[ch]: https://github.com/pschanely/CrossHair
