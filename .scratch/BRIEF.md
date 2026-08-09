# Implementation brief — coil.prop (property-based testing)

You are extending a WORKING property-based testing system in the Coil standard
library. The core is done and green. Your job is one well-scoped piece of it.

## Read these first (they are the reference for style and idiom)

- `docs/design/PROPERTY_TESTING.md` — the design this implements.
- `src/stdlib/prop_source.coil` — the tape (choices + spans + replay). THE core.
- `src/stdlib/prop_arbitrary.coil` — the `Arbitrary` trait and its impls.
- `src/stdlib/prop_shrink.coil` — the shrink passes.
- `src/stdlib/prop_runner.coil` — the run loop and failure report.
- `src/stdlib/prop.coil` — the `defprop` macro (reexports everything).
- `src/stdlib/prop_show.coil` — `PropShow` for printing counterexamples.
- `coil guide` (or `docs/reference/LANGUAGE_GUIDE.md`) — the language.
- `src/stdlib/derive.coil` — how comptime reflection macros are written here.

## The build/test loop — YOU MUST USE THIS EXACT FORM

Stdlib edits are invisible to the installed compiler unless you point it at this
checkout. From the worktree root:

    COIL_STDLIB_DIR=. coil test tests/prop/your_test.coil     # ~0.5s
    COIL_STDLIB_DIR=. coil check tests/prop/your_test.coil

A test file must start with `(module NAME)` and use `(deftest name …)` from
`coil.assert`, or `(defprop name […] …)` from `coil.prop`.

DO NOT run `python3 scripts/dev.py build full` — it rebuilds the whole
self-hosted compiler and takes many minutes. You do not need it.

Your work is NOT done until your test file passes with real assertions. A test
that only checks `(assert true)` is not a test. If you cannot make something
work, say so explicitly in your final report — do NOT leave a stub that returns a
wrong-but-plausible value. If you must leave a hole, it has to fail loudly
(`primitive/error "…"` at comptime, or `abort` at runtime with a clear message).

## Coil gotchas that will bite you (learned the hard way in this codebase)

1. **`(mut x)` coerces to a `(ptr T)` parameter, and a `(ptr T)` coerces to a
   `(mut T)` parameter.** Both directions work.
2. **A bounded generic CANNOT call another bounded generic with the same bound** —
   "'T' does not implement 'Trait'". Inline the body instead. A direct trait-method
   call on a bounded parameter IS fine. (See `prop-show-arg` in prop_show.coil.)
3. **`if` needs both branches, same type.** Effect-only: `(if c (do …effects… 0) 0)`.
   There is no `return`; use `(block :b … (return-from :b v))`.
4. **Deeply nested `if` chains are unreadable and easy to misparen — use `case`:**
   `(case k 0 e0 1 e1 … default)`.
5. **`(field p name)` needs a PLACE** (a pointer / mut), not a value.
   `(al-elem [T] list i)` gives a pointer to an element; `al-get` gives a copy.
6. **`alloc/stack` inside a loop leaks the C stack.** Hoist the slot out.
7. **Struct construction is `(zeroed T)` + `store!` per field** — there are no
   positional constructors. Write a `mk-…` helper.
8. **`primitive/ishr` is logical only when its operands are unsigned** — cast to
   `u64` for a logical shift.
9. **`f64` has no `Eq`** — use `primitive/fcmp-eq`. `cast` between f64 and i64 is a
   NUMERIC conversion; for bits use `f64->bits`/`bits->f64` in prop_source.coil.
10. **Stdlib macro expansions must reference names the CALLER can see.** `coil.prop`
    `:reexport`s its submodules so `defprop` expansions resolve. If you add a macro
    whose expansion calls a function, make sure that function is reachable from a
    user file that only did `(import "coil.prop" :use *)`.
11. **A user file must import ONLY `coil.prop`** (not also `coil.prop.source`), or
    names are ambiguous. Test files: `(import "coil.prop" :use *)`.
12. **New stdlib file** ⇒ add `(module coil.prop.xxx)` at the top, name the file
    `src/stdlib/prop_xxx.coil`. Do not run the embedded-stdlib generator; the
    integration agent does that once at the end.
13. `println`/`fmt` take a LITERAL format string. `{d}` int, `{s}` slice-u8, `{f}`
    float (6dp), `{x}` hex.
14. Mutators take `(mut …)`: `(al-push! (mut l) v)`.
15. Don't name anything `call`, `block`, or `type`.

## Ownership — DO NOT EDIT FILES YOU DO NOT OWN

Every agent owns specific files. Editing another agent's file loses their work.
If you need a change in a file you do not own, say so in your final report
instead of making it.

## What "done" means

- Your files compile.
- Your test file passes via `COIL_STDLIB_DIR=. coil test …`.
- Every public definition has a `;;` doc comment explaining WHY, not what.
- Comments explain reasoning, tradeoffs, and traps — match the density and voice
  of `prop_source.coil` / `prop_shrink.coil`. No "AI slop" filler, no restating
  the code in English, no bullet-point summaries in comments.
- Your final report states: what you built, what passes, what does NOT work, and
  anything you needed from a file you did not own.
