# Conformance cases

Each `.scm` is a self-contained program that prints its results. `../run.py` runs
it under Chez, Guile and Chibi, and under our implementation, and compares.

Cases are numbered by the implementation phase that should make them pass:

| case | phase | what it pins down |
|---|---|---|
| 01-core-eval | 1 | quote/if/lambda/define/set!/begin, varargs |
| 02-tail-calls | 1 | R5RS 3.5 — unbounded tail calls in every tail position |
| 03-callcc | 1 | full re-entrant call/cc (escape-only is NOT conformant) |
| 04-dynamic-wind | 1 | wind/unwind, including escape via a continuation |
| 05-derived-forms | 2 | let/let*/letrec/do/cond-=>/case/and/or/delay |
| 06-quasiquote | 2 | splicing, vectors, nesting |
| 07-syntax-rules | 4 | hygiene, nested ellipsis, trailing patterns |
| 08-numbers | 5 | bignums, exact rationals, rounding |
| 09-lists-strings | 3 | the standard-procedure surface |

## Writing a case

The oracles must agree, or the case is worthless. Avoid the corners R5RS leaves
open — each of these bit us while writing these nine:

- **Argument evaluation order is unspecified.** `(list (g) (g))` with a
  side-effecting `g` gives three different answers from three conforming Schemes.
  Sequence with `let*`.
- **`display` on nested data differs.** Chez strips string quotes recursively,
  Chibi does not. Use `write` when the structure contains strings or chars.
- **`number->string` radix case is unspecified** (`FF` vs `ff`).
- **The quasiquote abbreviation is a printer choice** (`` `x `` vs `(quasiquote x)`).
- **`(case "a" (("a") ...))`**: R5RS mandates `eqv?`, so a string must NOT match.
  Guile and Chibi agree; Chez does not. Left untested deliberately.
- Never print the unspecified value, and never compare error text.
