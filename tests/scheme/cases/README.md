# Conformance cases

Each `.scm` is a self-contained program that prints its results. `../run.py` runs
it under Chez, Guile and Chibi, and under our implementation, and compares.

Cases are numbered by the implementation phase that should make them pass:

| case | what it pins down |
|---|---|
| 01-core-eval | quote/if/lambda/define/set!/begin, varargs |
| 05-derived-forms | let/let*/letrec/do/cond-=>/case/and/or/delay |
| 06-quasiquote | splicing, vectors, nesting |
| 07-syntax-rules | hygiene, nested ellipsis, trailing patterns |
| 08-numbers | bignums, exact rationals, rounding |
| 09-lists-strings | the standard-procedure surface |

Tail calls, `call/cc` and `dynamic-wind` are deliberately out of scope; their
cases live in `../out-of-scope/` with the reasoning. Numbering is left with gaps
so the two sets never collide.

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
