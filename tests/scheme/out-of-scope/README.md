# Out of scope

Cases for R5RS requirements this dialect deliberately does not implement. They
are kept, not deleted: the difference between *"we don't do this"* and *"we
haven't noticed this"* is the whole value of a conformance suite, and a case that
quietly disappears looks like the second.

`run.py` does not pick these up.

## 02-tail-calls

R5RS §3.5 requires an unbounded number of active tail calls — `(let loop ()
(loop))` must run forever in constant space, and mutual recursion must work to
arbitrary depth.

Coil guarantees **self**-tail calls only. General mutual tail calls would need a
trampoline, an explicit `musttail`, or a Cheney-on-the-MTA scheme, and each of
those is a tax on every Scheme function whether or not it recurses — paid so that
the shape of a program's *calls*, not its *work*, stays within a stack bound.

Deliberately not attempted. A Scheme program here recurses on the native stack
and is bounded by it, like C. Self-recursion still gets Coil's guarantee, which
covers the common loop idiom.

Consequences worth knowing:

- Deep non-self recursion overflows the stack rather than running forever.
- Mutually recursive `even?`/`odd?` over a large `n` will not survive.
- Any Scheme program written in the "loop by tail call" idiom across two or more
  functions has a depth limit here that it would not have under Chez.

This is a real conformance gap, not a bug to be filed. If it ever moves back in
scope, this case is the arbiter.

## 03-callcc

R5RS §6.4 requires `call-with-current-continuation` with unlimited extent: the
continuation may be invoked any number of times, from any dynamic extent, and
*after the capture already returned*. That is what makes generators, coroutines
and `amb` work.

Deliberately not attempted. Capturing a native stack so it can be resumed more
than once means copying it (Chicken-style) or never returning at all — decisions
that shape every function the dialect emits, in exchange for a feature most
Scheme programs never use.

Escape-only continuations — downward, one-shot, `setjmp`-shaped — are a separate
and much cheaper thing, and would cover early return and exception-like control.
If that turns out to be wanted, it is a different feature with a different case;
it is **not** a partial `call/cc`, and calling it one would be the kind of quiet
half-conformance this directory exists to prevent.

## 04-dynamic-wind

Goes with `call/cc` rather than being an independent decision. `dynamic-wind`'s
`before`/`after` thunks exist to run when a continuation enters or leaves an
extent; with no continuations to escape to, it degenerates to
`(begin (before) (thunk) (after))`.

That degenerate form may still be worth providing — it is what most uses of
`dynamic-wind` actually rely on — but it would not be the R5RS semantics, so the
conformance case stays here.
