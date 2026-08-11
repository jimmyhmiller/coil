# R5RS Scheme as a Coil dialect

    (import "coil.scheme")

    (define (fib n)
      (if (< n 2) n (+ (fib (- n 1)) (fib (- n 2)))))

That is the whole idea. One import, and Scheme works — compiled to native code
through Coil's ordinary pipeline.

## Native by default; an explicit machine only where control is captured

**Scheme syntax is already Coil syntax.** Both are s-expressions read by the same
reader; `(define (fib n) …)` parses today, unmodified. What is missing is not a
frontend — it is the *bindings*:

    $ coil check fib.coil
    error: unknown top-level form 'define'

So `define` is a macro. It expands to `defn`. `lambda` expands to a closure,
`let` to a `let`, `cond` to nested `if`. Scheme's forms become Coil's forms at
expansion time, and what reaches codegen is an ordinary Coil program.

This is not a transpiler emitting text. Continuation-free programs use the
language's existing macro system with an R5RS surface bound to it and compile as
ordinary native Coil. A plain `.scm` entry that uses `call/cc`, `dynamic-wind`,
`eval`, or `load` is instead materialized as Scheme data and executed by the
portable CEK machine in `eval.coil`. That selective route is necessary because a
native return address cannot provide unlimited, multi-shot extent. It does not
tax the ordinary compiled fast path.

## The three pillars

| pillar | what it does |
|---|---|
| **libraries** | the R5RS surface — `define`, `lambda`, `let`, `cond`, `car`/`cdr`, the standard procedures — as ordinary Coil macros and functions under `coil.scheme.*` |
| **metaprograms** | make it a dialect: importing one module brings the whole surface into scope, and a transform lowers Scheme-shaped code to the GC'd form |
| **GC** | Scheme values are heap-allocated and never explicitly freed, so a transform inserts the rooting and the collector reclaims |

The lowering is **Scheme-shaped Coil → GC-managed Coil**. Not source → target.

## Plain `.scm` entry files

The public entry path is the ordinary `--use` mechanism, not a Scheme-specific
driver command:

    coil run program.scm --use coil.scheme

The driver performs only its general `--use` duties: it supplies an import and,
when the entry has none, a valid module name. The `coil.scheme` before-expand
transform supplies the language-specific part. It leaves definitions and syntax
definitions at module scope, gathers executable top-level forms into a native
`defn main`, and supplies a zero exit status. Existing module/import declarations
and an existing native `main` remain authoritative, so mixed Coil/Scheme entry
files are not double-wrapped.

This uses the normal transform fixed point. No second loader, textual rewrite,
runtime `load`, filename-triggered language mode, or Scheme branch in codegen is
involved. The generated entry is ordinary Coil syntax before expansion and then
passes through the same syntax-rules, closure, value, rooting, and tail-call
lowering as an authored wrapper.

`scripts/scheme-progress.py` builds untouched entry files with exactly this
command. Its direct-entry coverage includes a numeric-leading filename, syntax
rules, quasiquote, numbers, mutable data, recursive closures, and preservation of
an authored native main.

## Why GC is the hard pillar

A Coil program frees explicitly. A Scheme program never frees anything, and its
values outlive the frames that made them — a closure captures its environment, a
list survives the function that consed it. So the dialect has to supply:

- a heap and a collector (`heap.coil` — slab allocator, precise mark-sweep)
- a value representation the collector can trace (`value.coil` — tagged words,
  immediates for fixnums/booleans/nil/chars so they are never traced at all)
- **rooting**, inserted automatically. This is what `gcauto2.coil` already does
  for the old mini-scheme: rewrite the managed type, frame each function, root
  managed parameters and let-bindings, and A-normalize call arguments so a value
  from one allocation survives the next. The author writes none of it.

`symbol.coil` sits alongside: `eq?` on symbols must be O(1), so symbols intern to
a cached object and compare by id.

## What is genuinely hard, and what is not

**Not hard** — most of R5RS. `define`, `lambda`, `let`/`let*`/`letrec`, `cond`,
`case`, `and`/`or`, `do`, quasiquote: all ordinary macros over forms Coil already
has. The standard procedures are ordinary functions over the runtime.

**Continuation work is isolated from the ordinary fast path.** The native
compiled path remains the default for programs that do not capture control.

- **Proper tail calls (§3.5)** are implemented for direct, cross-arity, computed,
  first-class, `apply`, and `call-with-values` tail calls.
- **`call/cc` (§6.4) and `dynamic-wind`** use immutable, GC-traced heap frames.
  The machine supports unlimited post-return multi-shot re-entry, computes
  shared dynamic extents for correctly ordered `before`/`after` transitions,
  and keeps `eval`, derived syntax, promises, `load`, and ambient file ports in
  the same continuation protocol.

The former continuation conformance cases are now public bounded-gate cases:
`03-callcc.scm`, `03-callcc-tail.scm`, and `04-dynamic-wind.scm`.

**Still hard:**

- **`syntax-rules`.** Implemented for compiled Scheme and runtime `eval`, but its
  binding-identity and nested-ellipsis invariants remain regression-sensitive.
- **The numeric tower.** Implemented through arbitrary exact integers/rationals,
  inexact reals, and complex numbers; branch cuts and fast bignum algorithms
  remain active hardening/performance work.
- **GC rooting.** The one pillar that is genuinely unavoidable — see above.

The bounded development loop is:

    python3 scripts/scheme-progress.py

Use `--bench` after a semantic or allocation change.  `--all` additionally runs
the compiler's bounded `modernize-fast` gate with the selected `--compiler`.
This deliberately does not run `build full`; the repository's final-release
rule still applies.

## Testing

`tests/scheme/run.py` — each case runs under Chez, Guile and Chibi and under our
build, three-way voted; a case counts only where all three agree. `r4rstest.scm`
(~677 assertions) is the north star. See `tests/scheme/cases/README.md` for the
R5RS corners where conforming implementations legitimately differ.

The live feature-by-feature ledger and application acceptance target are in
[`../../../docs/reference/R5RS_STATUS.md`](../../../docs/reference/R5RS_STATUS.md).

## Status

The bounded Scheme gate covers 11 implementation suites, 22 public oracle
programs, all 201 first-class report procedures with no deferred entries, 39
negative cases, and two larger Scheme applications. The detailed current ledger
is the linked `R5RS_STATUS.md`; do not infer current status from historical test
counts in old commits.
