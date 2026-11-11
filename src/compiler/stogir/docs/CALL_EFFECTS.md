# Declared call effects

A CALL's prototype may carry one of two effect bits, with the values of pinned
`ir.h`: CONST_FUNC (32) and PURE_FUNC (64). `src/stogir/call-effects.coil` is
the only reader. To this library both bits promise exactly one thing:

> the native target of the call writes no memory its caller can observe.

Nothing else follows from either bit. In particular the library does **not**
assume that

- the result is independent of memory. A PURE target (`memcmp`, `strlen`) reads
  through its pointer arguments, so its result changes when a store changes
  those bytes;
- two calls with equal arguments return equal results, or that a call can be
  moved, merged, hoisted out of a loop or deleted. A CALL is a control-chain
  instruction whatever its prototype says and stays where the frontend put it,
  in order with every STORE and every other CALL;
- the call returns, or does not trap.

What the promise is used for is the opposite direction only: a query that walks
the control chain backwards from a LOAD, looking for the instruction that last
wrote the loaded bytes, may step over the CALL. Those walks are
`load-forward.coil` (store-to-load and load-to-load forwarding, dead-store
barriers), `global-load-forward.coil`, `copy-forward.coil` and `entry-load.coil`
(reuse across joins and reading a loop-header LOAD once per loop entry). A load
of a location that only declared calls separate from an earlier read of the same
location is therefore the earlier value, and a location a loop only reads and
passes to declared calls is read once before the loop. A STORE between them is
judged by the ordinary alias rules and is unaffected by the calls around it.

## What qualifies

`declared-result` accepts the promise only from a well-formed prototype whose
result type and argument count match the CALL (`calls/signature`); an absent,
malformed or mismatched prototype promises nothing. Three levels follow:

| query | holds for |
| --- | --- |
| `preserves-memory?` | scalar or void result (role 0): the calling sequence itself writes nothing |
| `preserves-address?` | additionally a register-returned aggregate (role 1) whose capture place is provably disjoint from the queried bytes |
| `target-readonly?` | roles 0 and 1, for callers that account for the capture write themselves |

An indirect (x8) aggregate result is always a barrier: the callee writes the
caller's result place.

## Who may set the bits

The frontend, for a target it knows: the Coil adapter sets PURE_FUNC on direct
calls of the hosted C routines `memcmp`, `bcmp`, `memchr`, `strlen`, `strcmp`
and `strncmp`, and only when the callee is an undefined external symbol of
exactly that name called with the routine's own argument count. And the
library, for a body it has verified: `load-forward/nonwriting-verified-body?`
and `call-effects/register-result-body-readonly?` prove a definition
non-writing and the module annotates its direct callers. The inliner ignores
both bits when comparing a call site with a definition
(`call-inline.coil`), so an annotation never blocks inlining, and a CALL that
arrives in a caller by inlining keeps the prototype it was built with.

## Effect records computed from a body

A flag says "writes nothing". A record (`call-groups/Effects`, prototype trailer
version 4) says more, and is only ever written by something that has read the
target's body: `call-effects/summarize` walks one validated graph once and the
frontend attaches the result to the prototypes of direct calls of that
function (`groups/with-effects!`). The record is a property of the function's
behaviour, so it stays true of every later equivalent form of the body, and a
CALL that arrives in a caller by inlining keeps the prototype it was built
with. It is not part of the calling convention: `call-inline/compatible?`
compares result role and argument groups and ignores it.

| field | promise |
| --- | --- |
| `writes` (parameters 0..15) | every caller-visible write is a store at a literal offset in `[0, extent)` of one of these pointer parameters, unless `unknown` |
| `unknown` | the function may also write something the record cannot place: a store through any other address (a loaded pointer, a symbol, a varying offset, a negative offset), a call of something without a record or declaration, a tail call |
| `captures` (parameters 0..15) | the only parameters whose value may outlive the uses the walk understands: address of a LOAD or STORE, comparison, the pointer steps (full-width BITCAST, COPY, ADD/SUB with the pointer first), a builtin move or compare, an argument its callee's record does not capture. A RETURN, a stored value, a PHI, a selection and every other use is a capture |

A parameter in neither mask is only read through. Parameters 16 and up are
never described: a write through one is `unknown`, and consumers treat them as
captured. The function's own stack storage is not caller-visible, and for a
register-piece result parameter 0 is such storage. Volatile, atomic and
register accesses, variadic-argument access, guards, indirect jumps and inline
assembly give no record at all. A variadic or builtin prototype never carries
one. Because a record is derived from the callee's body, a frontend must only
attach it to calls of a function whose body is in the unit being emitted;
recursion needs no special case, since a call of a function not summarized yet
simply has no record.

### What consumers conclude

- `declared-result` treats a record with no `writes` and not `unknown` like
  PURE_FUNC, so everything above applies to it.
- `preserves-address?` (`written-arguments-disjoint?`): when the record is not
  `unknown`, a load crosses the call if every written argument's footprint
  `[argument, argument + extent)` is provably disjoint from the loaded bytes
  under the ordinary alias rules. No two incoming pointers are assumed to
  differ. An x8 result place is the callee's parameter 0 and is judged this way.
- `private-object.coil`: a function-lifetime frame object is *unshared* when
  every use of its address, on the graph as it is at the query, is the address
  of a LOAD or STORE, a comparison, a pointer step that `alias/decompose`
  resolves back to the object, the place of register result pieces, a builtin
  move or compare operand (the move's result unused), an argument a record
  does not capture, or an argument of a declared read-only target with a
  result narrower than a pointer. Then a pointer that does not decompose to
  the object cannot point into it: a STORE through any non-frame address
  spares it (`store-spares?`), and a CALL spares the loaded bytes unless it is
  handed a pointer that decomposes to the object at an argument its record
  writes through with an overlapping footprint (`call-spares?`); this holds
  for any callee, `unknown`, indirect or external, because it has no way to
  name the object. The proof is rebuilt from the use index for each query and
  is used by `load-forward/find-across` and `entry-load/returns-clean?`.
- `mem2ssa/promote-ordered!` (`reads-argument?`): a stack allocation whose
  address is otherwise only a load/store address may also be an argument its
  callee neither writes through nor captures. Every LOAD then takes the SSA
  value of the function's own stores (PHIs included); the stores and the
  allocation stay, so the callee reads current bytes at each call.

## Tests

`tests/call-effect-records.coil`: the encoding in every trailer version; the
summary of fourteen body shapes (each rule and each case that must break it:
write through the pointer, at a varying or negative offset, through a loaded
pointer; storing, returning or selecting the pointer; passing it to a writer,
a keeper, a reader; an indirect call; a volatile access; the function's own
stack); and promotion beside reading callees, executed natively for every
pairing of a reader, a writer, a keeper and a callee that writes what was kept,
with their true records and with none. `tests/entry-load.coil` modes 25 to 30:
loop-header loads across calls with records.


`tests/entry-load.coil` modes 3, 14, 16 and 17: a loop whose header reads its
bound from memory and whose body calls a function. With an undeclared callee
the read stays in the loop (and the callee really does write the bound); with a
PURE_FUNC callee the read moves in front of the loop; with a PURE_FUNC callee
followed by a store through a possibly-aliasing pointer it stays, and the
natively executed result shows the store taking effect. The Coil compiler's
`tests/backend/stogir-readonly-library-calls.coil` runs the same shapes through
real `memcmp`.
