# A full R5RS Scheme in Coil

The goal: `(import "coil.scheme")` and you are writing Scheme. Not a toy subset —
the real report, including the three things toy Schemes skip because each one
dictates the architecture.

Built out of three Coil facilities, all of which already exist:

| pillar | what it does here |
|---|---|
| **libraries** | the Scheme runtime and the numeric tower are ordinary Coil modules under a `coil.scheme.*` namespace |
| **metaprograms** | the Scheme *frontend* is a Coil transform: it reads `.scm`, and rewrites it into Coil. No Python. |
| **garbage collection** | the transparent-GC transform inserts rooting; the collector traces continuations and environments |

## Why the existing mini-scheme is not the starting point

`src/apps/mini-scheme/` is good work and its numbers are real (~1.0–1.15× Chez on
fib(30)). But it scores **0 of 9** on `tests/scheme/`, and not because of missing
library procedures. Three R5RS mandates are architectural:

1. **R5RS §3.5 requires unbounded tail calls.** All four existing variants are
   recursive tree-walkers over the host stack. `(let loop () (loop))` must run
   forever in constant space; theirs cannot.
2. **R5RS §6.4 requires full re-entrant `call/cc`.** Not escape-only. A
   continuation must be invocable many times, after its capture has returned.
   With frames on the host stack this is not implementable.
3. **`syntax-rules` requires hygiene**, which means identifiers cannot be bare
   symbols — they carry scope. Every binding form depends on that representation.

Each is a rewrite, not an extension, and the fib(30) benchmark that vindicates
the current design exercises none of them: no tail calls, no continuations, no
macros. It is a good *performance* baseline and a misleading *architectural* one.

## Architecture

### Execution: a CEK-style explicit-continuation machine

State is `(control, environment, kontinuation)` in a flat loop. Continuation
frames are heap values.

This is chosen for one reason: **tail calls and call/cc both fall out by
construction.** A tail call pushes no frame. `call/cc` reifies the current `k`,
which is already a first-class heap value. `dynamic-wind` is a wind-list field on
the continuation, so the least-common-ancestor unwind/rewind has somewhere to live
from day one.

Cost: every frame is an allocation, so expect 2–5× a naive tree-walker before
frame reuse. That is the price of conformance and it is worth paying. The
migration path if we want the performance back — CEK → bytecode VM → native
closures with a heap continuation chain — preserves the continuation
representation at every step, so nothing here has to be rebuilt.

### Values: tagged immediates + boxed heap objects

Keep what `sval.coil` converged on, which the repo's own measurements already
vindicate: low bit 1 = immediate, `...01` fixnum, `...11` special. Immediates for
fixnum, `'()`, `#t`/`#f`, char, EOF, the unspecified value, and the letrec hole.
Heap objects carry a header tag: pair, symbol, string, vector, closure, primitive,
port, promise, **continuation**, bignum, ratnum, flonum, environment.

Making nil and booleans immediate took the existing implementation from 233M to
21.5M allocations. That result carries over unchanged.

### Numbers: a sum type with exactness, from the start

R5RS §6.2.3 requires exact integers and rationals of "practically unlimited size
and precision" — bignums are not optional, and `r4rstest.scm` detects their
absence. Retrofitting exactness onto an `i64`/`f64` pair means touching every
arithmetic dispatch, so the tower is a sum type from the first commit even while
only the fixnum arm is implemented.

### Identifiers are not symbols

The single most important up-front commitment. An identifier carries scope
information — initially it may wrap nothing but a symbol, but the type is opaque
from day one. Hygiene and lexical addressing both need "who binds what," so the
expander and the resolver are **one pass**, not two.

### Environments: lexical addressing, with names retained

Compile references to `(depth, index)` over frame vectors; keep a parallel vector
of symbol names so `eval` and `interaction-environment` stay possible. Assignment
conversion boxes only `set!`-ed variables, so closures can be flat.

### Hygiene: explicit renaming

`syntax-rules` implemented over an explicit-renaming substrate (`rename` /
`compare`). Roughly 300 lines of machinery instead of psyntax's thousands, and
`compare` gives R5RS's literal-matching rule directly — the rule that says a
rebound `else` must stop acting like the `else` keyword, and the one nearly every
naive implementation gets wrong by comparing symbol names.

## Phases

Each phase is independently testable against `tests/scheme/`.

| phase | contents | gated by |
|---|---|---|
| 0 | reader, printer, data types | — |
| **1** | **CEK core: tail calls, call/cc, dynamic-wind** | 01, 02, 03, 04 |
| 2 | derived forms, hand-desugared | 05, 06 |
| 3 | standard procedures, list/string/char/vector | 09 |
| **4** | **`syntax-rules`**, then re-derive phase 2 from R5RS §7.3 | 07 |
| 5 | numeric tower: bignums, rationals, exactness | 08 |
| 6 | ports, `eval`, environments | — |
| 7 | conformance grind against `r4rstest.scm` | all |

Phase 4's acid test: delete the hand-written desugarings and re-derive `let`,
`cond`, `case`, `do` and `quasiquote` from the report's own `syntax-rules`
definitions. If those work, the expander is right.

## Testing

`tests/scheme/run.py` — see `tests/scheme/cases/README.md`. Every case is voted
three ways across Chez, Guile and Chibi; a case only counts when all three agree,
because where they disagree R5RS left the corner open. `r4rstest.scm` (~677
assertions) is the north star, fetched rather than vendored.

Tail-call and call/cc cases must run under a bounded stack (`ulimit -s`), or
"constant space" is only ever "didn't crash on this machine."
