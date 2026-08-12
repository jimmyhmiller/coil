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

Continuations moved into the optional compiler setup and are now tested under
`tests/scheme/continuations/`. This directory retains only requirements still
deferred by the implementation.
