# The CEK machine

Phase 1's evaluator. State is a triple, stepped by a flat loop:

    (C)ontrol       the expression being evaluated, or a value being returned
    (E)nvironment   the lexical frame chain
    (K)ontinuation  what to do with the result — a heap-allocated frame chain

    step : (C, E, K) -> (C, E, K)

The loop never recurses. `while (not (done? state)) (set! state (step state))`.

## Why this shape, and not a tree-walker

Two R5RS mandates decide the architecture before anything else does, and both
fall out of this one for free:

**Proper tail calls (§3.5).** A tail call is not an optimization here — it is the
*absence* of an operation. Evaluating `(f x)` in tail position reuses the current
`K` instead of pushing a frame, so `(let loop () (loop))` runs forever in constant
space because nothing accumulates. In a host-stack tree-walker the same program
grows a C frame per iteration, and no amount of care fixes that without becoming
this.

**`call/cc` (§6.4).** `K` is already a first-class heap value, so capturing it is
just handing it to the argument. Re-entering it is just installing it as the
current `K`. Both are O(1) and neither cares how many times it happens — which is
what makes continuations *re-entrant* rather than escape-only. An escape-only
`call/cc` built on `setjmp`/exceptions passes the easy tests and fails every
generator, coroutine and `amb`, and is not conformant.

The cost is real: every non-tail call allocates a frame, so expect 2–5× a naive
tree-walker before frame reuse. That is the price of the two mandates, and the
migration path (CEK → bytecode VM → native closures with a heap continuation
chain) preserves the continuation representation at each step, so paying it now
does not mean paying it again later.

## Frames

A continuation is a linked list of frames, each an `Obj` tagged
`tag-continuation` with `a=frame`, `b=next`, `c=wind-list`. The frame kinds are
exactly the places evaluation can be interrupted mid-expression:

| frame | waiting for | then |
|---|---|---|
| `KHalt` | — | the machine is done; C is the answer |
| `KEvalArgs` | one argument | evaluate the next, or apply |
| `KIf` | the test | pick the consequent or alternative |
| `KSet` | the value | assign, return unspecified |
| `KDefine` | the value | bind in the current frame |
| `KSeq` | a non-final body form | discard it, continue the sequence |
| `KWind` | a `dynamic-wind` body | run the `after` thunk |

There is deliberately no `KApp` for the operator: the operator is just argument
zero, so `KEvalArgs` covers it and application has one code path.

## `dynamic-wind` lives in the continuation, not beside it

Each `K` carries a **wind list** — the chain of active `dynamic-wind` frames. This
is why it is in Phase 1 and not deferred: invoking a continuation must compute the
least common ancestor of the current wind list and the target's, run `after`
thunks outward to the LCA, then `before` thunks inward to the target. Re-entering
an extent re-runs its `before`.

Bolting that on later means touching every site that installs a `K`, which is
every frame kind above. The list is a field from the first commit even while
nothing pushes to it.

## Tail positions

The evaluator must treat exactly R5RS §3.5's list as tail positions — no more, no
fewer. `tests/scheme/cases/02-tail-calls.scm` pins the ones that are easy to get
wrong (`cond`, `and`, `or`, `case`, mutual recursion):

- last body expression of `lambda`, `let`, `let*`, `letrec`, `begin`, named `let`
- both branches of `if` — **not** the test
- the last expression of a selected `cond`/`case` clause; for a bare `(test)`
  clause, the test itself; for `(test => recv)`, the call to `recv`
- the last expression of `and`/`or`
- `do`'s result sequence, or its test when that sequence is empty
- the procedure `apply` calls, and the one `call-with-values` calls

Deriving the forms as macros over `if`/`lambda`/`begin` (Phase 2, then properly in
Phase 4) means these fall out rather than each needing its own rule — a good
reason not to special-case `cond` in the evaluator.
