# Namespacing & name resolution

Coil's module system is **Clojure-like**: every module names its own definitions,
nothing leaks between modules without an explicit import, and one namespace —
`coil.core` — is auto-referred everywhere so the builtins are always in scope.

This doc covers what is namespaced, how a name resolves, and the one subtle part:
why name resolution runs in **two phases** when staged macros (`(meta …)`) are
present, and why the undefined-reference check is gated on the final phase.

Implemented across commits `fd8c75072` (macros), `36a0f34ba` (coil.core + trait
names), `f65ab9213` (trait methods + the undefined-reference check).

## The forms

```lisp
(module myproject.app)                    ; convention: project-prefixed namespace
(import "coil.control" :use *)        ; refer ALL of control's exported names
(import "coil.slice"   :use [slice-for push])  ; refer just these
(import "coil.io"      :as io)        ; qualified access only: (io/print …)
(import "coil.str"     :use * :exclude [len])       ; all but these
(import "coil.str"     :use * :rename [[len str-len]])  ; refer under a local name
(export foo Bar)                          ; what THIS module exposes (default: all public)
```

Module names are symbols and may be dotted. Project code conventionally owns a
prefix and declares `myproject`, `myproject.http`, `myproject.db.user`, and so on;
the compiler does not require this convention. A leading owner scope is supported,
so `(module @myname.project.thing)` is also a valid module identity. Imports remain
namespace-based and `:as` supplies the short name used at call sites. Coil indexes
module declarations beneath project source roots and dependency roots; filenames and
directory placement do not participate in identity.

- `import` alone (`(import "myproject.x")`) makes a module's names reachable **only**
  qualified via an alias — it does **not** refer anything. This matches Clojure's
  `require` (vs `require … :refer`). It is a behavior change from the old global
  model, where importing a file dumped its macros into the global namespace.
- `:use *` / `:use [names]` = Clojure's `:refer :all` / `:refer [names]`.
- `:as alias` enables `alias/name`.
- `:exclude [names]` subtracts from `:use *`. Pairing it with `:use [names]` is an error
  (that is already a whitelist), reported at the import site.
- `:rename [[from to] …]` refers the target's `from` under the local name `to`. Renaming
  REPLACES: the bare `from` stops being referred. Pairs rather than a map literal because
  the reader has no `{}` form.

## What is namespaced

Everything a module defines is renamed `module.name` internally and resolved
through module scope:

| Kind | Example | Notes |
|---|---|---|
| Functions | `app.helper` | `main` is never renamed (the entry point) |
| Structs / sums | `app.Point`, `app.Some` | variant constructors too |
| **Macros** | `coil.control.when` | a bare `(when …)` expands only if `when` is a macro visible here |
| **Trait names** | `coil.core.Eq`, `app.Show` | you can define your own `Eq` without colliding |
| **Trait methods** | `=`, `show` | name→all declaring traits; a call picks the one in scope |
| Conventions | `app.fast2` | |

Deliberately **not** namespaced: **externs** (C symbols are global by nature —
`malloc` is `malloc`), and **consts** (flat global, like C `#define`).

## How a bare name resolves (module M)

In order:

1. **M's own** definitions → `M.name`.
2. A bare **extern** → left as-is (C symbol).
3. A **`:use`d** module's *exported* name → `target.name`.
4. **`coil.core`** — the lowest-precedence tier, referred by every module implicitly →
   `coil.core.name`.
5. Otherwise: for a **call**, a hard "undefined function" error (see gating below);
   for other positions, left bare for a later pass.

Steps 3 and 4 both go through one predicate, `use-refers` in `src/compiler/loader.coil`,
which is where `:use`/`:exclude`/`:rename` are interpreted. Core sits at step 4 rather
than step 3, so an explicitly `:use`d module still shadows core.

`alias/name` skips straight to M's `:as` aliases (export-checked). A `.`-qualified
head (`coil.control.for`) is hygiene-generated and trusted as already-resolved.

The same scoping is mirrored in three places, by design: the canonical name resolver,
the decision of which `(head …)` calls are macro calls, and **referential hygiene** — a
symbol written in a macro template resolves in the *macro's* namespace (own defs + the
macro's own `:use`d imports), not the use site. This is why `slice-for`'s generated
`(for …)` becomes `coil.control.for` regardless of who calls `slice-for`, so a library's
macros work without the user importing the library's dependencies.

## coil.core (the prelude)

`src/compiler/prelude.coil` is `(module coil.core)`, compiled into the compiler and
auto-loaded. It defines the operator traits (`Eq`/`Hash`/`Add`/`Sub`/`Mul`/`Div`/
`Rem`/`Ord`) and their `i64`/`f64` impls, so `=`, `+`, `<`, `hash`, `case` work in
any module with **no import** — exactly like `clojure.core`. The auto-refer is the
last step of name resolution. Diagnostics strip the `coil.core.` prefix so errors read
`Eq`, not `coil.core.Eq`.

### Opting out of core

Every module behaves as if it began with `(import "coil.core" :use *)`. Writing **any**
explicit `(import "coil.core" …)` **replaces** that implicit line outright — no merging,
no stacking. This is Clojure's `:refer-clojure` rule.

```lisp
(import "coil.core" :use * :exclude [len get])   ; everything but these two
(import "coil.core" :use [Eq Ord Option Result]) ; a whitelist ( = `:refer-clojure :only`)
(import "coil.core" :use [])                     ; no core at all
(import "coil.core" :as core :use [])            ; nothing bare; `core/Option` still works
```

An `:exclude`/`:use` entry matches a **definition name**, a **trait name**, or a **method
name**. Naming a trait affects all of its methods; naming a method affects only that one:

```lisp
(import "coil.core" :use * :exclude [Ord])   ; drops <, <=, >, >= together
(import "coil.core" :use * :exclude [<])     ; drops only <
```

Parser-level forms are not names and are unaffected by any of this: `module` `import`
`export` `defn` `def` `let` `if` `loop` `break` `continue` `block` `do` `defstruct`
`defsum` `deftrait` `impl` `deftest` `meta` `comptime`. Same as Clojure, where
`(:refer-clojure :only [])` still leaves you `def`/`if`/`let*`. So a module with
`(import "coil.core" :use [])` still has the special forms, its own imports and
`(import "coil.primitive" :as primitive)` — a usable freestanding dialect, and how
`prelude.coil` itself is written.

**This is a naming feature, not a size feature.** Tree shaking is unchanged and already
works: `main` and `(export-c …)` targets get external linkage, everything else is
`internal`, and LLVM `globaldce` + `-dead_strip`/`--gc-sections` drop whatever nothing
calls. Core code you never call is already absent from your binary, excluded or not.

### One rule, four surfaces

`coil.core` used to be hardcoded as a last-resort branch in four separate passes. It now
goes through the same `use-refers` predicate as every other import, consulted by:

| Surface | Site |
|---|---|
| value / type / trait names | `resolve.coil` `resolve-uncached` |
| ambient primitive aliases (`load`, `store!`, `field`, …) | `resolve.coil` `primitive-bind-one!` |
| macros | `expander.coil` `macro-use-match` |
| trait methods (the operators) | `check.coil` `method-suppressed?` |

Four mirrors of one rule is what would make this a hack: an `:exclude [<]` that hid the
name from the resolver but left the operator callable would be worse than no feature.
Each surface has its own `tests/compiler/features/refer_exclude_*_rejected.coil` fixture
in the bounded inner-loop gate for exactly that reason.

Trait methods need one extra distinction. A method whose declaring trait is unique is
callable today with **no import at all**, so the mere absence of an import cannot suppress
it — only a deliberate statement can: an `:exclude`/`:rename` naming the trait or the
method, or an explicit `(import "coil.core" …)`, which states core's refer set in full.

## Trait-method resolution (the per-module part)

Method names are **not** globally unique. The checker maps a method name to *every*
trait that declares it; a call resolves it like so:

- **one** candidate (every operator) → use it directly.
- **several** (two modules each define a trait with a `show` method) → keep only the
  ones whose trait is visible in the caller's module (own / `:use`d / `coil.core`).
  Exactly one visible → use it; **zero or many** → a hard error telling you to
  `:use` the one you mean or rename.

The checker threads the import tables for this; the comptime sub-program checks pass
empty tables, which is fine because every method there is single-candidate anyway.

## The undefined-reference check and the staged-resolution gating

A still-bare callee after resolution that is **neither an extern nor a trait
method** is an undefined reference, reported at resolve time (the allowlist of
legitimately-bare names is externs ∪ method names).

This check is **gated** by a `strict` flag on the resolver, and that gating exists
because of staged macros.

### Why two resolve passes

`(meta …)` runs Coil code at compile time and **splices the definitions it returns
into the program**:

```lisp
(defn gen [] (-> Code) `(defn answer [] (-> i64) 42))
(meta (gen))                       ; produces (defn answer …) at compile time
(defn main [] (-> i64) (answer))   ; refers to a name that doesn't exist yet
```

When the resolver first walks `main`, `answer` does not exist — it only appears once
`gen` *runs*. But to run `gen`, you must resolve + check it (it's a real function).
Chicken-and-egg → resolution is staged:

1. **Intermediate resolve** (`strict = false`): produce a well-formed `program` so
   the generators can be found and checked. The program still references
   not-yet-generated names, so the undefined check is **off** here.
2. **Run the metas**: `gen` executes → `(defn answer …)`.
3. **Final resolve** (`strict = true`): re-resolve
   `tagged2 = original forms − meta forms + generated forms`. Now `answer` exists and
   resolves; `totally-undefined` is correctly rejected.

`strict` is also `false` for the macro-detection subset (an intentionally
incomplete program). It is `true` whenever the program is final:
`!has_metas` for the no-meta path, and the `program2` resolve for the meta path.

**Soundness:** `program2` is a superset of all real runtime forms, so every name
still undefined after generation is caught. Proven by
`undefined_call_still_caught_in_a_meta_program` (a meta program that calls both a
generated def and a genuinely-undefined fn — the undefined one still errors).

### This is not a Coil quirk

Definition-generating metaprogramming forces name resolution into ≥2 phases in every
language that has it; the universal rule is *the early phase must not treat
not-yet-generated names as errors*:

- **Rust**: pipeline is parse → macro expansion → name resolution; resolution runs
  after expansion precisely because macros generate items names refer to.
- **Racket**: formal phase levels + an expander that collects a body's definitions
  before resolving references (a fixpoint loop — the general form of Coil's two-pass).
- **Template Haskell**: `$(...)` splices emit declarations; a staging restriction +
  declaration groups bring them into scope before dependent code is checked.
- **C++**: two-phase name lookup in templates defers dependent names to instantiation.

Coil's two separate passes are the coarse-grained version. If meta-generated code
ever needed to contain *more* metas, the two passes would become a fixpoint loop
(as in Racket).

## How this is gated

Covered by `tests/compiler/oracle`:

- **`gate-cli.sh`** — end-to-end teeth: namespace lookup independent of file placement
  and process CWD, rejection of relative paths, pre-typecheck autofix of legacy imports,
  bundled namespace isolation, and located export errors.
- **`python3 scripts/oracle.py gate resolved|expand`** — snapshot focused resolver and
  expander fixtures, so any drift in name resolution or macro hygiene
  (including the second-order cross-module case) shows up as a diff.
- **`python3 scripts/oracle.py gate full`** — emitted IR for a compact cross-platform set,
  byte-exact, which catches a resolution change that
  survives to codegen.
