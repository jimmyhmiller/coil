# Binding and Shadowing — Coil is a Lisp-1 that behaves like a Lisp-2 in head position

> **Status: HALF FIXED.** The **binder** case below is fixed — a macro name is now
> usable as a field, payload or parameter name, because `expand-calls` no longer treats
> a binder vector as a call (`expand-def-list` in `src/compiler/expander.coil`). That
> was the commonly-hit half, and it needed no syntactic environment: a parameter list
> *establishes* names rather than referencing them, so nothing in it is ever a macro
> call, whatever is in scope.
>
> The **head-position** case is still OPEN: `(let [when 5] (when 1 2))` is still `2`,
> because a local binding still does not shadow a macro. That is tier 2 of the Clojure
> tiering below and it does need the environment threaded through the walk — items 1
> and 3 of "What the fix requires". Everything below is unchanged and still describes
> the target.

## The inconsistency

One expression, two meanings for the same name:

```lisp
(let [when 5] when)        ; => 5   — the LOCAL
(let [when 5] (when 1 2))  ; => 2   — the MACRO expanded; the local was ignored
```

`when` resolves to the local binding in argument position and to `coil.control/when`
in head position, in the same scope. Both were run against a compiler built from this
tree; the second returns 2 because `(when 1 2)` expanded to `(if 1 (do 2) 0)`.

The same root cause shows up in a second, more commonly hit shape — a **binder** that
happens to share a name with a macro:

```lisp
(defstruct S [(scope (ArrayList i64))])            ; error: scope: first argument must be a :label
(defn f [(scope i64)] (-> i64) scope)              ; error: scope: first argument must be a :label
(defsum V (Case [(scope i64)]))                    ; error: scope: first argument must be a :label
(deftrait T (m [(self (ptr i8)) (scope i64)] …))   ; error: scope: first argument must be a :label
```

`scope` is not a builtin — it is an ordinary macro (`src/stdlib/control.coil`), and
`(scope …)` in a parameter or field list is not a call at all. The diagnostic names a
form the author never wrote, which is what makes this expensive to debug.

Note the contrast that proves the point: the **real** special forms are fine as names,
because the parser is syntax-directed and only treats them specially while parsing an
expression.

```lisp
(defstruct A [(loop i64)])   ; ✅ compiles
(defstruct B [(if i64)])     ; ✅
(defstruct C [(let i64)])    ; ✅
(defstruct D [(match i64)])  ; ✅
(defstruct E [(block i64)])  ; ❌ — `block` is a MACRO, not a special form
```

## Why it happens

`expand-calls` (`src/compiler/expander.coil`) is a flat pre-pass over raw `Sexp`. For
any list node it looks up element 0 in a **global** macro table and rewrites if it hits.
It has no grammar knowledge, so it cannot tell a parameter list from a call; and
`resolve-macro` takes `(head, module, macros, impb, expb, allocator)` — there is no
environment parameter, so there is nowhere to record "`when` is bound here."

The asymmetry worth noticing: Coil already has real hygiene machinery
(`hygienize-expansion!`, `HygBox`/`HygEnt`, gensyms) for names a *macro* introduces.
What is missing is any notion of names the *user* binds. Hygiene without a syntactic
environment.

## What the other Lisps do

**Common Lisp** — behaves like Coil here, but by design. It is a Lisp-2: macros live in
the function namespace, variables in the value namespace, so `(let ((when 5)) (when 1 2))`
*correctly* still expands the macro — the two `when`s are unrelated bindings. Shadowing a
macro is done with `flet`/`macrolet`, which bind in the function namespace. The binder
case does not arise either: `(defstruct s (scope nil))` and `(defun f (when) …)` are fine,
because `defstruct` parses its slot specs and a lambda list is never evaluated as a form.

**Scheme** — Lisp-1, and specifies the opposite of CL: a variable binding *shadows* a
macro keyword. `(let ((when 5)) (when 1 2))` makes `when` a variable, so this is an
attempt to apply `5` — an error, not an expansion. The expander is syntax-directed: it
recognises `lambda`/`let` formals as **binders**, extends the syntactic environment, and
expands the body under it. A bound name is no longer a keyword there.

**Clojure** — Lisp-1, same answer as Scheme, implemented as a three-tier lookup in
operator position:

1. **special forms win unconditionally** — `isSpecial(op)` is tested *before* locals, so
   `(let [if 5] (if 1 2 3))` is still the special form. You cannot shadow `if`, `do`,
   `let*`, `fn*`, `quote`, `recur`, `try`.
2. **locals beat macros** — `isMacro` returns "not a macro" when the symbol resolves to a
   local binding, so `(let [when 5] (when 1 2))` tries to call `5`.
3. otherwise resolve the var.

`(let [if 5] if)` still yields `5`; the special form only wins in *operator* position.

## Decision: be a Lisp-1, target Clojure's tiering

Coil is a Lisp-1 — `(let [when 5] when) => 5` settles that; there is one namespace.
CL's behaviour is therefore not available to us as a justification: "variables never
shadow macros" only makes sense when there is a second namespace to fall back on.

Coil already matches Clojure on two of the three rows:

| position | Clojure | Coil today |
| --- | --- | --- |
| special form in head position | not shadowable | ✅ not shadowable |
| macro in head position | **shadowed by locals** | ❌ **not shadowed** |
| bare symbol reference | shadowed by locals | ✅ shadowed |

The single divergence is tier 2. **Macro expansion must still happen everywhere** — the
fix is emphatically *not* "skip expansion in certain positions." The fix is that a
locally bound name is not a macro reference.

## What the fix requires

1. Thread a **syntactic environment** (the set of names bound at this point) through
   `expand-calls` / `expand-top-form`.
2. Teach the walker the binding forms, so it knows which subforms **establish** binders:
   `defn` parameter vectors, `defstruct`/`defsum` field vectors, `deftrait`/`impl` method
   signatures, `let` bindings, `match` arm binds, `for`/`for-in` bindings.
3. Consult that environment before the macro table: if the head symbol is bound, it is
   not a macro here.

Item 2 also fixes the binder case, and for the same reason Scheme and Clojure never hit
it: a parameter list *establishes* names rather than referencing them, so nothing in it
is ever a macro call.

**Item 2 has landed on its own.** It did not have to wait for 1 and 3: knowing which
subforms are binders is enough to stop expanding inside them, even with no environment
to record what they bind. `expand-def-list` walks `defn`/`defstruct`/`defsum`/
`deftrait`/`impl`, copies every binder vector through untouched, and recurses one level
for `defsum` variants and trait/impl methods, whose vectors sit one deeper. Macro
expansion is unchanged everywhere else — this is not "skip expansion in certain
positions", it is "a binder list was never a call in the first place".

## Related, independent: narrow the prelude re-export

One line — `(import "coil.control" :reexport)` in `src/compiler/prelude.coil` — folds
coil.control's macros into `coil.core`, which is auto-referred into every program. That
is what makes these 21 words globally unavailable as identifiers:

`when` `unless` `case` `case-arms` `case-by` `while` `for` `for-in` `thread-first`
`thread-last` `|>` `|>>` `block` `return-from` `control-label` `escape-labels` `scope`
`defer` `inline-for` `all` `any`

(Internal helpers such as `scope-mains` are *not* re-exported — `:reexport` publishes the
macros only. Verified.)

`all` and `any` are the sharpest edges — both are natural variable names. `scope` has
**4 call sites in the entire tree** (`src/examples/defer.coil` plus its own definition),
so moving it behind an explicit `(import "coil.control")` costs almost nothing.

Narrowing the re-export reduces how often anyone trips over the shadowing bug. It is
worth doing and it is **palliative** — the tiering fix above is the cure. They compose.
