# Refer control: `:exclude`, `:rename`, and opting out of `coil.core`

**Status: implemented.** Clojure's `:refer-clojure :exclude/:only/:rename` and
qualified-only requires, for `coil.core` and for every other import.

This is a **naming** feature. It does not change what ends up in your binary — see §5.

User-facing documentation lives in `docs/reference/NAMESPACING.md` and the language
guide; this file records the design and why it is shaped the way it is.

---

## 1. What Clojure gives you

```clojure
(ns my.app
  (:refer-clojure :exclude [map filter])      ; keep the rest of core, drop these two
  (:refer-clojure :only   [defn let])         ; whitelist instead of blacklist
  (:refer-clojure :rename {map core-map})     ; refer under a different local name
  (:require [clojure.string :as str]          ; QUALIFIED ONLY — str/join, no bare names
            [clojure.set    :refer [union]]   ; refer these
            [clojure.walk   :refer :all]))    ; refer everything
```

| Clojure | Steal? | Why |
|---|---|---|
| `:refer-clojure :exclude` | **yes** | the actual request: define your own `len`/`get` |
| `:refer-clojure :only []` | **yes** | the "no core at all" mode |
| `:rename` | **yes** | cheap once `:exclude` exists; avoids exclude-then-requalify |
| `:require … :as` (qualified only) | **already have it** | `(import "x" :as x)` refers nothing today |
| `:as-alias` (alias without loading) | **skip** | exists to break Clojure's cyclic-load problems, which Coil doesn't have |

The load-bearing detail: in Clojure, `:refer-clojure` **replaces** the default refer, it
doesn't stack with it. That's the rule to copy.

---

## 2. Where Coil is today

`(import "ns" :as a)`, `:use *`, `:use [names]`, `:reexport` — parsed in `process-import`
(`src/compiler/loader.coil:874`) into `ModImports { aliases, uses, reexports }`
(`loader.coil:60-70`). `:as`-only already means qualified-only, so half of "import only
qualified things" exists.

`coil.core` is not an import at all. It is a hardcoded last-resort branch in **four**
separate places:

| Site | What it hardcodes |
|---|---|
| `resolve.coil:516` (`resolve-uncached`) | bare value/type/trait names fall back to `coil.core.name` |
| `expander.coil:252` | a bare `(head …)` is a macro call if core (or a core `:reexport`) defines it |
| `check.coil:3031` (`trait-visible`) | a trait whose module is `coil.core` is visible to everyone |
| `resolve.coil:2250` | core's `def` aliases (`load`, `store!`, `field`, `cast`, …) bind ambiently |

Four mirrors of one rule is what would turn this feature into a hack. `:exclude` bolted
onto a subset of them silently doesn't apply to the rest — an `:exclude [<]` that hides
the *name* but leaves the *trait method* callable is worse than no feature at all.

---

## 3. Proposed syntax

### 3.1 `coil.core` becomes an ordinary import with an implicit default

Every module behaves as if it began with:

```lisp
(import "coil.core" :use *)
```

Writing **any** explicit `(import "coil.core" …)` **replaces** that implicit line
outright — Clojure's `:refer-clojure` rule. No merging, no stacking.

```lisp
(module app)
(import "coil.core" :use * :exclude [len get])   ; everything but len/get
(import "coil.core" :use [Eq Ord Option Result]) ; whitelist ( = Clojure's :only )
(import "coil.core" :use [])                     ; NO core. primitives + special forms only
(import "coil.core" :as core :use [])            ; no bare names; core/Option stays reachable
```

### 3.2 Two new modifiers, on *every* import

```lisp
(import "coil.slice" :use * :exclude [get set!])
(import "coil.str"   :use * :rename [[len str-len] [get str-get]])
```

- `:exclude [a b]` — subtract from what `:use *` refers. Only legal with `:use *`; with
  `:use [names]` you already have a whitelist, so combining them is an error rather than
  a silent no-op.
- `:rename [[from to] …]` — refer `from` under the local name `to`. Vector-of-pairs
  because the reader has no map literal (checked: no `{}` form in `reader.coil`).
  Renaming implies referring, so it works with both `:use *` and `:use [names]`.

### 3.3 What an excluded name means for operators

`+`, `<`, `len`, `get`, `push!`, `next`, `iter` are **trait methods**, not module-level
definitions — they live in `TraitDef`s, and calls are resolved by the checker's
method-name → declaring-traits map, not by the resolver. So:

> An `:exclude`/`:use` entry matches a **definition name**, a **trait name**, or a
> **method name**. Naming a trait affects all of its methods; naming a method affects
> only that method.

```lisp
(import "coil.core" :use * :exclude [Ord])   ; drops <, <=, >, >= together
(import "coil.core" :use * :exclude [<])     ; drops only <; <=/>/>= still core's
```

Method-level exclusion lands in `trait-visible` (§4), which is already the place that
decides "is this trait's method callable from this module" — so it reuses the existing
mechanism instead of adding a parallel one.

### 3.4 What excluding core does *not* take away

Parser-level forms are not names and are unaffected: `module` `import` `export` `defn`
`def` `let` `if` `loop` `break` `continue` `block` `do` `defstruct` `defsum` `deftrait`
`impl` `deftest` `meta` `comptime`. Same as Clojure, where `(:refer-clojure :only [])`
still leaves you `def`/`if`/`let*` because they're special forms, not vars.

So `(import "coil.core" :use [])` leaves a module with special forms, its own imports,
and `(import "coil.primitive" :as primitive)`. That's a usable freestanding dialect —
it's how `prelude.coil` itself is written.

---

## 4. Implementation: one predicate, four callers

`coil.core` **stops being special**. The loader records the module's effective core refer
into `ModImports.core` as an ordinary `Use`, and every pass that used to hardcode
"coil.core is always visible" now asks the same predicate.

**What actually shipped, versus the first sketch.** The original plan put core into the
`uses` list as a low-precedence "tier 1" entry so it would be structurally identical to
any other import. That elegance turned out to be illusory: because core must stay
*lower* precedence than an explicit `:use`, every consumer would have had to scan tier 0
and then tier 1 — which is the same shape as "explicit uses, then core", just with more
churn and a new failure mode when a module has no import record at all (comptime
sub-programs pass empty tables, and there core must still default to fully referred).

So core is held in its own `ModImports.core` slot and consulted last, and the shared
thing is the *predicate*, not the list position:

```lisp
(defn use-refers   [(u (ptr Use))      (name (slice u8))] (-> (Option (slice u8))))
(defn use-local-of [(u (ptr Use))      (exported (slice u8))] (-> (Option (slice u8))))
(defn use-drops?   [(u (ptr Use))      (name (slice u8))] (-> bool))
(defn core-refers  [(imp (ptr ImpEntry)) (name (slice u8))] (-> (Option (slice u8))))
```

`use-refers` answers "does this import put NAME in scope, and under which of the target's
exported names" — one place where `:use`, `:exclude` and `:rename` are interpreted.
`use-local-of` is its inverse, for the one pass that walks from declarations rather than
from use sites. `core-refers` defaults to fully-referred when a module has no import
record, which is what keeps comptime sub-programs working.

- **`loader.coil`** — `Use` carries the two new lists, and `ModImports` carries core:
  ```lisp
  (defstruct Rename [(from (slice u8)) (to (slice u8))])
  (defstruct Use [(target (slice u8)) (spec UseSpec)
                  (exclude (ptr (ArrayList (slice u8))))
                  (renames (ptr (ArrayList Rename)))])
  (defstruct ModImports [(aliases …) (uses …) (reexports …)
                         (core Use) (core_set bool)])
  ```
  `process-import` parses `:exclude`/`:rename` in the existing keyword loop, and
  `import-record!` routes a `coil.core` target to `mi-set-core!` instead of `uses` —
  that one branch *is* Clojure's `:refer-clojure` replaces-the-default rule. `coil.core`
  also short-circuits source resolution, since the prelude has no file under any source
  root. Null exclude/rename pointers mean "none", so an ordinary import allocates nothing.

- **Precedence is unchanged**: own defs > explicit `:use` > core. Core is consulted in
  the same last step it always was, so it still cannot collide with a `:use`d module.

- **`resolve.coil` `resolve-uncached`** — the core fallback now goes through
  `core-refers`, and honors a `:rename` by qualifying the target's original name.
  `ResMemo` is unaffected (it keys on module/name/kind, and the refer set is fixed for
  the whole pass).

- **`resolve.coil` `resolve-use`** — `use-refers` replaces the inline spec match.

- **`resolve.coil` `primitive-bind-one!`** — the ambient alias push uses `use-local-of` /
  `core-local-of`, so `:exclude [load]` really does force `primitive/load`.

- **`expander.coil`** — `macro-use-match` uses `use-refers`; the core branch consults
  `core-refers` on the *caller's* entry. `:reexport` chasing is unchanged.

- **`comptime.coil` `resolve-in-module`** — the fourth `uses` walker, found during
  implementation; also converted.

- **`check.coil` `method-suppressed?`** — the surface that makes `:exclude [<]` bite.
  Deliberately *not* the same question as `trait-visible`, which only breaks ties among
  several traits declaring one method name. A method whose declaring trait is unique is
  callable today with **no import at all**, so absence of an import must not suppress it —
  only a deliberate statement can: an `:exclude`/`:rename` naming the trait or the method,
  or an explicit `(import "coil.core" …)`, which states core's refer set in full. It runs
  in *both* candidate loops, including the single-candidate fast path, because every
  operator is single-candidate.

- **The entry-module gap.** `main` is the one function the resolver never renames, so its
  qualified name carries no module and the checker could not tell which module it was in —
  refer control silently stopped applying inside `main`, which is where a small program
  keeps most of its code. Fixed by recording the entry file's declared module on `LS` and
  threading it to `Cx` (`entry_module`), used whenever `fname` has no dot. This also makes
  `trait-visible` behave correctly inside `main` for the first time.

- **Errors.** `:exclude` combined with `:use [names]` is rejected at the import site.
  Typo-checking `:exclude`/`:rename` names against the target's exports was **not**
  implemented: a valid entry may name a definition, a trait, or a method, and methods are
  not in the def table, so the check would reject valid programs. Clojure ignores these
  silently too. The use-site diagnostic distinguishes "you did not refer this" from "no
  trait in scope declares it", so suggesting `Ord::<` to someone who just wrote
  `:exclude [<]` does not happen.

- **`display-name`** (`resolve.coil:764`) keeps stripping the `coil.core.` prefix from
  diagnostics.

Cost: one hash probe per lookup, as today. The refer set is built once per module in
`build-deftable`, alongside the existing `Defs` bitmask index.

---

## 5. This does not change binary size

Worth stating plainly, because "exclude core" sounds like a size feature and isn't.

Tree shaking already works, at the back end. `main` and `(export-c …)` targets get
external linkage; everything else is `internal` (`docs/reference/SYMBOL_EXPORT.md`), and
LLVM `globaldce` + `-dead_strip`/`--gc-sections` drop whatever nothing calls. On
`(module hello) (defn main [] (-> i64) 0)`: 214 LLVM functions defined, 11 symbols in the
linked binary.

So core code you don't call is already absent from your binary, excluded or not.
`:exclude` controls which names you may write; it doesn't control what gets emitted.

(Separately: those 214 functions are built and then discarded, which is wasted *compile*
time — mono seeds every concrete function rather than seeding roots. That's an unrelated
optimization, not a prerequisite for this feature. Noted in `FUTURE_WORK.md`.)

---

## 6. Gating

In the focused inner-loop gate (`scripts/dev.py test modernize-fast`), so a regression
shows up in seconds rather than in a release rebootstrap:

| Fixture | Asserts |
|---|---|
| `refer_control.coil` | `:exclude` + `:rename` + everything core still refers, run for real |
| `refer_no_core.coil` | `(import "coil.core" :use [])` compiles and runs |
| `refer_core_qualified.coil` | `(import "coil.core" :as core)` — alias works, nothing bare |
| `refer_exclude_value_rejected.coil` | surface 1: resolver |
| `refer_exclude_macro_rejected.coil` | surface 2: macro expander |
| `refer_exclude_method_rejected.coil` | surface 3: trait methods |
| `refer_exclude_alias_rejected.coil` | surface 4: ambient primitive aliases |

The four `_rejected` fixtures are the point: one predicate feeding four passes is only
trustworthy if each pass is independently pinned. The gate names the surface in its
failure message.

The mechanism refactor was verified inert before any syntax was added —
`scripts/oracle.py gate all` passed with zero snapshot movement across all eleven stages.

---

## 7. Docs

`docs/reference/NAMESPACING.md` (new §"Opting out of core" and §"One rule, four
surfaces"), the `LANGUAGE_GUIDE.md` imports section, and `src/compiler/guide.coil`
(regenerated via `scripts/docs/gen-guide.py`).

---

## 8. Follow-on work, deliberately not done

- **`--no-core` / `Coil.toml [build] core = false`** (§3.5). Per-module exclusion is
  visibility only; a whole-program knob is the only thing that can stop the prelude from
  being *parsed*. Compile-time saving only — it is not what keeps excluded code out of
  the binary.
- **Typo-checking `:exclude`/`:rename` names.** See §4: needs a name table that spans
  definitions, traits and methods, which does not exist in one place yet.
- **`:exclude` on a `:reexport`.** A reexporting facade cannot currently narrow what it
  republishes.
