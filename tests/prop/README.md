# `stdlib_props_test.coil` — property tests over the standard library

These are laws, not examples. Each one says something that must be true of
*every* input, and `coil.prop` goes looking for an input where it is not. A
failure arrives already shrunk: the smallest list, the shortest string, the
`None` rather than the `Some`.

The suite is also the acceptance test for `coil.prop` itself. It is written the
way a user writes a property suite — `(import "coil.prop" :use *)` plus the
library under test, no generator registration, no shrinker — so anything that
needed a workaround here is a defect in the system rather than in the test. Two
did, and both are still open:

- The hand-written `PropShow` impl for `Rec` mentions `Writer`, which
  `coil.prop` does not reexport, so this file also has to
  `(import "coil.io" :use *)`. A user writing their first `PropShow` impl will
  hit that and have no way to guess the fix.
- `coil.prop.derive` is not reachable through `coil.prop`, so the `Arbitrary`
  impl for `Rec` is written out by hand. That is worth having as an
  override-path test regardless, but it should not have been the only option.

The other files in this directory test `coil.prop`'s own machinery (the tape,
the shrink passes, the combinators, the example database). This README covers
`stdlib_props_test.coil` only.

## Running them

Stdlib edits are invisible to the installed compiler unless you point it at this
checkout, so every command starts the same way:

```
COIL_STDLIB_DIR=. coil test tests/prop/stdlib_props_test.coil
```

Typecheck without running, or turn the library's own runtime checks on — bounds
checks, header validation, and a memory sanitizer are worth far more against
generated inputs than against hand-written ones:

```
COIL_STDLIB_DIR=. coil check tests/prop/stdlib_props_test.coil
COIL_STDLIB_DIR=. coil test --debug-checks tests/prop/stdlib_props_test.coil
COIL_STDLIB_DIR=. coil test --sanitize=address tests/prop/stdlib_props_test.coil
```

`coil test` has no per-property selector for a named file; narrow by editing
`COIL_PBT_CASES` down and reading the output instead.

### Turning the search up

Every knob is an environment variable; none of them change the properties.

| Variable | Default | What it does |
|---|---|---|
| `COIL_PBT_CASES` | 200 | cases per property |
| `COIL_PBT_SIZE` | 60 | maximum size budget a case may reach (list lengths, string lengths) |
| `COIL_PBT_SEED` | derived from the property's name | the seed; a failure report prints the one to reuse |
| `COIL_PBT_SHRINK` | 20000 | shrink call budget |
| `COIL_PBT_VERBOSE` | 0 | print per-property case counts on success |

The default run is the fast one for CI. A real hunt looks like:

```
COIL_PBT_CASES=5000 COIL_PBT_SIZE=120 COIL_STDLIB_DIR=. coil test tests/prop/stdlib_props_test.coil
```

The suite has been run green at 5000 cases / size 120, at 3000 cases / size 200,
on several explicit seeds, and under both `--debug-checks` and
`--sanitize=address`. The seed defaulting to a hash of the property
name matters: two properties never explore the same stream, and a green run is
the same green run on every machine.

### When one fails

The report names the shrunk counterexample, the property, the source location,
and the exact command to reproduce it. Read the counterexample first — it is
usually small enough to reason about directly. Then decide which of the two
things went wrong: the law, or the library. Do not weaken the law to find out.
Bugs confirmed to be the library's are written up in
[`FOUND_BUGS.md`](FOUND_BUGS.md).

## What each property claims

### `coil.arraylist`

| Property | Claim |
|---|---|
| `al-push-then-pop-roundtrips` | `pop` after `push` returns exactly what was pushed and restores the previous length and contents |
| `al-len-tracks-pushes-and-pops` | `len` is pushes minus pops exactly, across reallocation, and the elements come back off in LIFO order |
| `al-get-after-set` | `get` after `set!` returns what was set — **and every other index is untouched** |
| `al-reserve-never-loses-elements` | `reserve!` changes nothing observable except capacity, which afterwards really is at least what was asked for |
| `al-extend-equals-repeated-push` | `extend!` is bulk `push!`, element for element |
| `al-slice-views-exactly-the-elements` | the slice view stops at `len`; capacity slack never leaks into it |
| `al-clear-empties-but-keeps-usable` | `clear!` empties by every measure (`len`, `empty?`, `pop`), and the list still works afterwards |

The second half of `al-get-after-set` is the one that earns its keep: an
off-by-one in the element address passes the first half and dies on the second.

### `coil.slice`

| Property | Claim |
|---|---|
| `subslice-bounds-and-elements` | `(subslice s lo hi)` has length `hi - lo` and holds `s[lo..hi]` |
| `subslice-composes` | a window into a window is a window into the original at the summed offset — same length, same elements, same base pointer |
| `sort-yields-sorted-permutation` | `sort` leaves the slice non-decreasing **and** a permutation of the input (multiset equality) |

Sortedness alone is satisfied by a function that writes zeros, which is why the
multiset half is there.

### `coil.str`

| Property | Claim |
|---|---|
| `str-substr-halves-concat-to-whole` | cutting a string anywhere and concatenating the halves gives it back |
| `str-equal-strings-hash-equally` | equal content ⇒ equal `str-hash` and `str-cmp = 0`, for strings that share no storage |
| `str-cmp-is-antisymmetric-and-agrees-with-eq` | `sign(cmp a b) = -sign(cmp b a)`, and `cmp = 0` exactly when `str-eq` |
| `str-find-returns-first-occurrence` | `str-find` finds the needle where it says, and there is no earlier occurrence — checked against an independent scan, on the `None` answers too |
| `str-find-locates-an-embedded-needle` | the same law with a needle cut out of the haystack, so the search actually succeeds |
| `str-starts-with-iff-found-at-zero` | `starts-with` is exactly "the first occurrence is at index 0" |
| `str-trim-is-idempotent-and-tight` | trimming is idempotent, never grows, and leaves no whitespace at either end |
| `str-parse-int-roundtrips-every-i64` | render then `str-parse-int` is the identity over the **whole** i64 range, `i64::MIN` included |
| `str-parse-int-agrees-with-hand-parser` | `str-parse-int` accepts exactly `-?[0-9]+` and agrees with a hand-rolled parser on the value |
| `str-parse-int-grammar-over-numeric-alphabet` | the same law, over strings drawn from `-0123456789x`, so the sign rules are actually reached |
| `str-split-then-join-roundtrips` | splitting on a separator and rejoining with it reconstructs the original, empty pieces included |

Two of these are deliberately built so the interesting branch actually happens.
`str-find-locates-an-embedded-needle` cuts the needle out of the haystack, and
`str-split-then-join-roundtrips` lifts its separator out of the string — a
random needle or a random separator essentially never matches, and a search that
never finds anything proves nothing.

`str-parse-int-agrees-with-hand-parser` only claims the *value* for inputs of 18
digits or fewer: `coil.str` documents itself as having no overflow check, so
past that the two parsers agree only on the wrap, which is not a law worth
pinning. The accept/reject judgement is claimed for every input.

The two `str-parse-int` grammar properties state the same law and differ only in
where their strings come from, which is the point. Measured with a mutant that
makes a lone `"-"` parse as `0`: the random-`(slice u8)` property catches it on
6 seeds out of 12, and the alphabet-shaped one on 12 out of 12. A law is only as
strong as the inputs that reach it, and "the generator will get there eventually"
is how a suite ends up green against a bug it nominally covers. When a property
depends on a specific narrow shape, generate that shape.

### `coil.hashmap`

Keys are folded into a small space (mod 8 or mod 16) on purpose. A map only gets
interesting when keys collide and slots get reused, and 64-bit random keys
collide never.

| Property | Claim |
|---|---|
| `hm-put-then-get-and-len-counts-distinct-keys` | `get` returns the last value put, `len` counts distinct keys, and keys never inserted are absent |
| `hm-put-same-key-twice-overwrites` | the second value wins and `len` stays 1 — overwrite, not duplicate |
| `hm-matches-model-under-put-remove-churn` | a random put/remove sequence agrees with an association list **after every single operation** |
| `hm-for-visits-every-key-exactly-once` | iteration visits each live key exactly once with its current value, and nothing else, while the table carries tombstones |
| `hm-string-keys-survive-their-buffers` | `str-keyops` deep-copies keys: lookups keep working after the caller's bytes are overwritten |

`hm-matches-model-under-put-remove-churn` is the highest-value property in the
file. Tombstones, probe-chain repair and the rehash-in-place that clears them
are only reachable through churn, each of them can silently lose or resurrect an
entry, and the association-list model shares no structure with the thing it is
checking. Checking after *every* operation rather than at the end is what makes
the shrunk counterexample name the first operation that diverged.

`hm-string-keys-survive-their-buffers` scribbles `!` over the key bytes right
after inserting them. A borrowing keyops would fail; the owning one must not.

### `coil.serde` (derived codecs)

`Rec` is a struct with one field of each shape the derive has to handle — a
scalar, a string that needs escaping, a bool, an `Option`, and a nested list —
carrying a hand-written `Arbitrary` and `PropShow` impl. Those two impls are the
user-facing override path, exercised here rather than described.

| Property | Claim |
|---|---|
| `sexp-i64-roundtrips-every-value` | `from-sexp ∘ to-sexp-str = id` over the **whole** i64 range, `i64::MIN` included |
| `sexp-encode-then-decode-is-identity` | `from-sexp ∘ to-sexp-str = id` |
| `json-encode-then-decode-is-identity` | `from-json ∘ to-json-str = id` |
| `sexp-encoding-is-deterministic` | equal values encode to equal bytes |

A round-trip is the cheapest way to test a codec: it needs no expected output,
and it covers the cases nobody writes by hand — a name containing a quote, an
empty list, `None`.

`sexp-encoding-is-deterministic` looks redundant next to the round-trips and is
not: a codec can round-trip correctly while its encoder leaks uninitialized
padding, which is exactly what makes a wire format irreproducible.

**`sexp-i64-roundtrips-every-value` is why this suite exists.** It failed when it
was written, and it failed because the library was wrong: `coil.fmt/print-i`
negated before printing, so `i64::MIN` encoded as the two bytes `-0` in both
formats and decoded back as `0` — silent data loss, no error anywhere. Fixed in
`src/stdlib/fmt.coil` (commit `7698159`); write-up in
[`FOUND_BUGS.md`](FOUND_BUGS.md) #1. The property stays as the regression test,
and the two struct round-trips — which had been narrowed to dodge `i64::MIN`
while the bug was open — are back at full strength.

Note what the shrinker bought here. The struct round-trips hit the bug first,
but the smallest `Rec` they could produce still had five fields; the scalar
property shrinks to `n = i64::MIN` and nothing else, which is the entire bug in
one value. When a law holds for a container and a scalar both, state it for the
scalar too — that is the version whose counterexample you can read.

## Notes for adding a property here

- **Generate valid inputs; do not filter them.** There is an `assume`, and it is
  a last resort — the runner warns when rejections dominate, because a suite
  that discards most of what it generates is green without testing anything.
  Most "I need a valid index" situations are a `mod`, not an `assume`.
- **State a law that can fail.** `(and (>= n 0) (<= n len))` is not a property.
  If you cannot describe an implementation that passes your property and is
  still wrong, the property is too weak.
- **Model-based beats point-wise.** Where a naive O(n²) model exists — an
  association list for a map, a copy-and-push list for `extend!` — check against
  it after every operation. The model is allowed to be slow; it has to be
  obviously correct.
- **Allocate from the case arena**, `(src-alloc (prop-src))`. The runner rewinds
  it between cases, so nothing in this file frees anything and nothing leaks.
- **Prove the property can fail, by breaking the library on purpose.** Copy
  `src/` somewhere, introduce the bug you think the property catches, and run
  with `COIL_STDLIB_DIR` pointed at the copy. If the suite stays green, the
  property does not test what its name says. Do this across several
  `COIL_PBT_SEED`s, not one: a property that catches the bug on half the seeds
  is a property that will let it through.
- **Never weaken a law to make the suite green.** Work out whether the law or
  the library is wrong. If it is the library, write it up in `FOUND_BUGS.md`,
  disable that one property with a comment pointing at the entry, and leave the
  rest of the suite at full strength.
