# Destructuring and binding macros

Status: implemented. This document records the syntax, semantics, and compiler
boundaries of binding destructuring. It supersedes the brace/`:keys` direction
in the earlier pad sketch. Ordinary core macros implement the binding language
over a small compiler-owned set of forms.

## 1. Decisions

1. Public `let`, `fn`, and `defn` become ordinary hygienic core macros.
2. Their compiler-owned counterparts are `let*`, `fn*`, and `defn*`.
3. Square brackets destructure sequences. Constructor-shaped patterns select
   named struct fields: `(Point :x x :y y)`.
4. One recursive pattern elaborator serves all three macros, method bodies, closure
   generators, and sum-match payloads.
5. Public `let` remains sequential. This does not introduce parallel Lisp `let`
   semantics or change existing simple binding behavior.
6. Keep Coil's existing typed function headers, return annotations, generics,
   declaration annotations, calling conventions, and Code-based macro detection.
7. No braces, `:keys`, map literals, implicit cloning, or implicit iterator
   consumption are part of this proposal.
8. Runtime closure capture, multiple function arities, and general partial moves
   are separate features. Making `fn` a macro does not introduce them.

## 2. Public syntax

### 2.1 Simple and sequential bindings

Existing code remains valid:

```clojure
(let [x 10
      y (+ x 2)
      (mut total) y]
  (set! total (+ total 1))
  (load total))
```

Every initializer is evaluated once, left to right. Each binding's names become
visible after its initializer and before the next initializer. Later binding
pairs may shadow earlier ones using the existing lexical rules.

### 2.2 Sequence patterns

```clojure
(let [[a b] values] ...)
(let [[a _ c] values] ...)
(let [[a [b c]] values] ...)
(let [[head & tail] values] ...)
(let [[a b :as pair] values] ...)
(let [[a b & rest :as all] values] ...)
```

A fixed prefix requires at least that many elements; extra elements are ignored.
`_` occupies a position but creates no accessible binding. `&` binds the remaining
suffix; the suffix is a view, not an implicit copy. `:as` names the entire source.

`[]` is a valid zero-selection pattern on a supported sequence, regardless of the
current restriction on empty array literals in expression position. `[& all]`
binds the entire suffix view; `[:as all]` binds the original source. Those may have
different types: the suffix of an array is a slice, whereas its source is an array
place. An underscore suffix `[a & _]` requires no materialized suffix view.

Only one `&` and one `:as` are permitted. The suffix pattern follows `&`; an
optional final `:as name` follows it. `:as` accepts an identifier, not an arbitrary
pattern. Duplicate names within a pattern are errors, except repeated `_`.

There are no literal tests inside binding patterns. `[1 x]` is invalid; it does
not mean “match a sequence beginning with 1.” Such tests belong in `match` or a
future explicitly fallible binding operation.

### 2.3 Constructor-shaped struct patterns

```clojure
(defstruct Point [(x i64) (y i64)])

(let [(Point :x x :y y) point]
  (+ x y))

(let [(Point :x horizontal :y vertical) point]
  (+ horizontal vertical))

(let [(Point :x x) point]
  x)
```

A keyword identifies the field; the following pattern describes its binding.
This follows the same field-first ordering as named construction. Field names
are not lexical identifiers and must not be captured or expanded as macros.

Fields may be omitted, reordered, renamed, or recursively destructured. Reject
unknown fields and repeated field selections. Do not support positional struct
patterns: `(Point x y)` would silently couple consumers to declaration order.
A zero-field selection `(Point)` asserts the source's nominal struct type and
binds no fields.

The head resolves as a struct type, including imported aliases and qualified
names. It is not called and is not macro-expanded in a pattern position. The
checker must verify this type constraint; merely lowering `.x` and `.y` would
incorrectly accept any unrelated struct with those fields.

```clojure
(let [(Rect :origin (Point :x x :y y)
            :dimensions [width height]) rectangle]
  ...)
```

Generic struct heads use the ordinary applied-type syntax:

```clojure
(let [((Pair i64 bool) :first count :second enabled) pair]
  ...)
```

Initially require the explicit type arguments for generic heads. Do not invent
an independent pattern-only generic inference system.

### 2.4 Whole-value names on struct patterns

Reserve `:as` only in bracket patterns. A struct may legally have a field named
`as`, so `(Point :as p)` must mean field selection if such a field exists.
Use a common explicit wrapper when naming a whole struct:

```clojure
(let [(as point (Point :x x :y y)) expression]
  ...)
```

`(as name pattern)` is binding syntax, not an expression macro. It works on any
pattern; `[a b :as pair]` is shorthand for `(as pair [a b])`. It must bind the
source directly under `name`, not move an already-bound owner a second time.
Reject multiple whole-value names for the same pattern node.

Recognize the wrapper by core syntax identity. Permit an explicitly qualified
struct name in the unlikely case that a user type also has the spelling `as`.
The same approach distinguishes reserved `(mut name)` binding syntax from type
names. No new reservation is needed for these spellings in expression position.

### 2.5 Named functions and anonymous functions

```clojure
(defn translate
  [((as point (Point :x x :y y)) Point)
   ([dx dy :as delta] (slice i64))]
  (-> Point)
  (Point :x (+ x dx) :y (+ y dy)))

(translate :point p :delta offsets)

(defn add-pair [([a b] (slice i64))] (-> i64)
  (+ a b))

(fn [[a b]] (+ a b))
(fn [(Point :x x :y y)] (+ x y))
```

The parameter entry remains `(pattern Type)`. It represents exactly one argument,
not one argument per leaf. Its annotation describes the whole argument; projection
types come from the ordinary type checker. Return annotations and generic
parameter vectors retain their existing syntax.

A simple parameter name is its existing named-call label. An outer whole-value
name supplies that label for a structured parameter. Without one, the parameter
is positional-only. Nested whole-value names never become call labels. Preserve
existing named/positional argument mixing restrictions; reject named calls that
would need to address an unlabeled parameter. Never expose generated identifiers
as public labels.

Anonymous functions retain contextual parameter typing and inferred returns.
Their body prologue contains the same binding expansion as a named function.
The existing non-capture rule remains in force. `&` inside a sequence parameter
pattern consumes a suffix of that one argument; it does not make a function
variadic. Existing outer `&` for variadic Code macros remains unchanged.

For simple struct selections, keeping a named parameter and destructuring in a
body `let` is equally valid and can be easier to read than a dense signature.

### 2.6 Sum-match payloads

Variant payload vectors accept the same recursive patterns. Variant dispatch and
exhaustiveness remain compiler-owned; after a variant is selected, an arm-local
primitive binding prologue materializes and projects structured payload fields:

```clojure
(defsum Event
  (Pair [(values (slice i64))])
  (Located [(point Point)]))

(match event
  (Pair [[left right & rest]] (+ left (+ right (len rest))))
  (Located [(Point :x x :y y)] (+ x y)))
```

Each entry in the arm vector corresponds to one variant payload field. An inner
pattern is required destructuring once its variant has matched; failure does not
backtrack to another arm. General fallible patterns over literals and ordinary
struct scrutinees remain a separate pattern-matching feature.

## 3. Primitive language and library organization

| Public form | Compiler primitive | Responsibilities of public macro |
| --- | --- | --- |
| `let` | `let*` | Validate patterns; emit sequential simple bindings |
| `fn` | `fn*` | Introduce simple parameters; emit binding prologue |
| `defn` | `defn*` | Preserve header metadata; introduce parameters and prologue |

`let*` accepts only `name` and existing `(mut name)` bindings. `fn*` accepts only
simple contextual parameters. `defn*` accepts only simple typed parameters and
retains the existing named declaration representation. Keep the existing AST
representations; destructuring need not survive into backend code generation.

Primitive identity must be unambiguous and unshadowable in operator position.
Public names participate in ordinary core macro lookup and lexical shadowing.
Generated primitive heads carry core definition context. Do not retain a hidden
parser special case for public `let`, `fn`, or `defn` after the migration.

Put the implementation in a small core binding module (proposed
`coil.binding`), reexported by `coil.core`. Its macro definitions and minimum
bootstrap dependencies use `defn*`, `fn*`, and `let*` directly. It must not import
an ambient facade that recursively requires itself. Establish and test a minimal
primitive-defined dependency layer before moving any public form.

The shared elaborator consumes a pattern and root syntax and produces ordered
binding syntax plus any required checked projections. It creates fresh identifiers
through the existing hygiene API and preserves user syntax objects. Keep the
helper accessible to other binding macros through a documented module API; do not
make each library macro rediscover the pattern grammar.

`defn` must preserve annotations, documentation, source identity, type parameter
bounds, calling conventions, inline policy, and any existing declaration behavior.
Its expansion returns `defn*`, not a generic runtime `def` of an anonymous function:
that would change nominal function and macro-discovery behavior unnecessarily.

## 4. Typed projections and sequence support

Syntax expansion cannot infer a runtime argument's type. Split the work cleanly:
macros choose binding structure; the ordinary checker validates typed projections.

For a constructor pattern, introduce a narrow internal checked-view operation
(proposed `primitive/pattern-view Type source`). It checks that the source is a
place/reference/value of the exact nominal type after ordinary type normalization,
without casts, copies, implicit loads of owners, or new storage. The implementation emits a borrowed nominal-type assertion and then projects
from the original root, retaining its place information. Bind the root first if
an rvalue needs materializing. Erase this operation after checking.

Sequence patterns require a defined indexed-view contract, not just `Get i64`:
integer-keyed maps also have `Get`, and fixed arrays currently lack length generics.
Implement a small checked sequence-view/projection bridge for Code and arrays/
slices first. Proposed internal operations validate the sequence and required
prefix, select an element, and produce a suffix. Their checked lowering uses
existing code-child access, indexing, and slice/view operations. They introduce no
new backend collection representation. Keep this bridge separate from pattern
parsing and leave a documented extension point for a future collection trait.
Do not claim that current traits can express the whole contract unchanged.

For a statically known short array, report a compilation error. For a dynamically
short sequence, perform a bounds failure through the existing runtime failure
mechanism, before any element projection for that sequence node. Specify and test
the behavior on each supported execution backend; do not rely on undefined
out-of-bounds loads. For malformed Code, issue a located metaprogram diagnostic.
Code scalars are not sequences even though the current Len implementation gives
them count zero.

Visit nested nodes depth first and fields in source order. Each node validates
its own shape before selecting children. Already-completed pure projections are
not rolled back when a nested shape fails; pattern binding is not transactional.
Code projection and suffix operations retain original child syntax, source spans,
and identifier identities. No stringify/read round trip is permitted.

## 5. Expansion order, lexical scope, and hygiene

For each let pair:

1. Expand the initializer in the scope before that pair.
2. Establish its root binding once.
3. Check/project the pattern in its defined order, introducing its names.
4. Expand the next initializer in the resulting scope.
5. Expand the body after every pair is established.

The macro should return unexpanded initializer/body syntax in `let*`; the primitive
expander performs this ordered traversal. Do not separately pre-expand them in the
macro and then expand them again. Binding patterns themselves are syntax data;
never traverse `(Point :x x)` as if it were a function call.

The same principle applies to `fn*` and `defn*`: bind raw parameters before
expanding the generated `let*` prologue and body. Preserve contextual inference
through the anonymous-function prologue. Every generated reference to a temporary
must reuse the same fresh syntax identity, not merely the same printed name.

Fix the confirmed existing bug in `expand-let-form`: it walks the entire binding
vector before adding any names to the macro-shadowing environment. The checker
already processes bindings sequentially. The reproduction
`(let [when 42 result (when true 7)] result)` currently expands a shadowed macro;
it must report the attempt to call the local value. The report is in `coil-bugs`
under `let-sequential-macro-shadowing`.

## 6. Ownership and mutation

Hidden roots own temporaries where ordinary let binding would own them. Keep the
root alive throughout all projections and the body. Omitted fields and `_` do not
suppress destruction. Preserve the normal cleanup ordering on fallthrough and
all supported exits.

Bare leaves follow existing field/element value and view rules. Never clone an
affine value implicitly or move a field out and then drop the entire original
aggregate as though it were still initialized. Where current checker rules cannot
represent a projection safely, emit a diagnostic rather than implement a partial
move workaround. Full destructive owning patterns require separate partial-move
and drop elaboration support.

Initially allow `(mut name)` only as an existing top-level simple let binder;
reject mutable leaves nested inside patterns with a specific diagnostic. Use the
existing explicit form to borrow a field mutably:

```clojure
(let [(mut x) (mut (.x point))]
  (set! x 10))
```

A future mutable pattern extension must distinguish a new mutable cell from a
mutable alias, including aggregate-place behavior. No ambiguity is needed to ship
immutable destructuring. Coil's current affine checking is not a general raw
pointer lifetime proof; the implementation must not promise otherwise.

## 7. Declarations, macro discovery, and bootstrap

The difficult migration is declaration discovery, not generating a let prologue.
Several compiler passes currently find functions by the literal head `defn`.
Replace these independent assumptions with a phase boundary:

1. Load a minimal primitive-defined core macro layer.
2. Expand declaration macros to primitive declaration heads, preserving module,
   import, source, and annotation context.
3. Register resulting `defn*` signatures in the same machinery that currently
   registers functions and recognizes Code-to-Code macros.
4. Compile macros in dependency order using existing recursion/cycle diagnostics.
5. Expand ordinary bodies and finish checking normally.

Implement this by adapting the existing staged expansion pipeline, not adding a
second unrelated loader. Expansion of a `defn` header must not eagerly expand its
body: forward references, mutually recursive runtime functions, and macros whose
bodies call later helpers must retain their supported behavior. Newly emitted
primitive declarations participate in the existing fixpoint/worklist process.
No special text scan of public `defn` should be necessary for correctness.

Normalize public `defn` inside impl bodies at the declaration phase as well.
Trait signatures, extern declarations, and `declare` have no body to destructure;
keep their parameters simple. Library `defclosure`/`defarcclosure` generators
must eventually use the shared parameter normalizer where they inspect names,
not index a pattern as if it were a symbol. Preserve their existing capture
syntax; extending captures is outside this change.

Use a temporary, explicitly bounded bootstrap transition:

- First teach the old compiler implementation the primitive spellings while
  retaining its existing public spellings; build a bridge compiler.
- Introduce the primitive-defined core macros and declaration normalization using
  that bridge. Public macro lookup must take precedence over temporary legacy
  handling once providers are available.
- Migrate compiler/prelude sources and generated-form producers as needed; remove
  public parser handling and compatibility paths in the final state.
- Build the final compiler and verify it bootstraps itself and consumes existing
  simple-form programs through library expansion.

Do not run the full bootstrap repeatedly during development. Use explicit
candidate builds and focused gates at each transition; run the full release
verification once after focused gates are green. Keep enough bootstrap artifacts
outside the final source semantics to reproduce the transition from supported
stage0. The final release must not depend on an undocumented locally installed
bridge compiler.

## 8. Source and tooling audit

Audit consumers by semantic role, not just global search-and-replace:

- `src/compiler/parser.coil`: primitive dispatch, simple parameter parsing,
  built-in definition guards, internal projection parsing.
- `src/compiler/expander.coil`: binder traversal, staged declaration expansion,
  macro discovery, primitive-generated heads, hygiene and metadata transport.
- `src/compiler/loader.coil` and `resolve.coil`: declaration/name indexing,
  type-head resolution, exports and imports, normalized declaration visibility.
- `src/compiler/check.coil`: anonymous contextual typing, exact constructor type
  checks, indexed views, named-call labels, ownership and diagnostics.
- `src/compiler/prelude.coil` and new binding module: dependency layering,
  public reexports and the macro/helper implementations.
- `src/stdlib/primitive.coil`: internal checked projection declarations as needed.
- `src/stdlib/closure.coil`, transforms such as `arc_auto.coil`, generators,
  linters, doc extraction, syntax dumpers, formatter rules, and editor support:
  distinguish original public syntax from normalized primitive syntax.

In particular, source-level tools must continue seeing documented public defn
forms, while tools consuming expanded syntax must recognize defn*. Do not rename
user-visible docs to primitive names merely because the internal representation
changed. Preserve source links between both views.

No reader node or delimiter is needed: brackets, lists, keywords and type syntax
already exist. Update formatting rules to recognize constructor patterns as
binding syntax and primitive binders where appropriate. Regenerate the stdlib
manifest when adding the binding module, and regenerate the embedded guide after
updating the language guide during implementation.

## 9. Work packages and acceptance gates

### A. Establish the sequential primitive core

Introduce `let*`, `fn*`, `defn*` with current simple-binding behavior. Fix sequential
macro shadowing in the common primitive binder path. Verify ordinary functions,
Code macros, named calls, mutable simple bindings, and annotations are unchanged.

### B. Make public forms actual macros

Build the minimal binding module, staged declaration normalization, metadata
preservation, and primitive-only final parser. Verify aliases/reexports of macros,
macro-generated declarations, macro definitions written with public defn, forward
references, hermetic/full core profiles, and a clean bootstrap dependency graph.
The primitive-defined macro implementation must be understandable ordinary Coil.

### C. Add the common pattern elaborator

Implement names, `_`, brackets, constructor patterns, `(as ...)`, and bracket
`:as`. Define malformed-pattern diagnostics before migrating users. Add the typed
projection bridge with Code, slice, and array support; suffix views follow the
same explicit contract. Share the implementation across let, fn and defn.

### D. Integrate signatures and ownership

Preserve named-call labels, generic substitutions, anonymous contextual typing,
variadic Code signatures, and impl methods. Test owning temporaries and cleanup,
unsupported moves, nested field views, underscore handling, and explicit mutable
bindings. Reject unsupported patterns rather than accepting a partial feature
silently. Adapt closure parameter generators that assume simple names.

### E. Migrate examples and finish the release

Replace representative code-nth binding runs with sequence patterns and selected
field-binding runs with constructor patterns. Do not mass-rewrite unrelated code.
The thirteen-slot backend remains a Code sequence until a separate design validates
a named metaprogram representation; this plan does not assume Code can be stored
in arbitrary runtime structs.

Update guide, formatter, source tools, migration notes, manifest and snapshots.
Run focused regressions and `modernize-fast` against the candidate without
rebuilding between tests. Run the generated gate because declaration generation,
Code transport and lifetime behavior are affected. Audit all snapshots together;
use `refresh-snapshots` for intentional cross-cutting changes. Finally run
`python3 scripts/dev.py build full` once, install the verified toolchain globally,
commit, and push as required by the repository guide.

### Required regression matrix

- Every initializer and nested source evaluated exactly once; left-to-right order.
- Earlier local shadows a macro in later initializer and body; initializer sees
  the previous outer binding rather than its own new binding.
- Hygiene under imported macros, nested expansions, same printed temporary names,
  constructor types with aliases, and leaf names matching macro names.
- Short static arrays, short dynamic slices, malformed/scalar Code, extra items,
  empty prefixes, empty suffixes, nested failures, and view identity.
- Wrong nominal struct with identical fields, unknown/repeated fields, omitted
  fields, field named `as`, generic heads, and deeply mixed sequence/struct patterns.
- Invalid markers, duplicate leaf names, pattern nodes mistaken for expressions,
  unsupported mutable leaves, and clear source-located errors.
- Named and positional function calls, nested versus outer whole-value names,
  generic functions, inferred anonymous signatures, macros and impl methods.
- Roots and leaves with ownership: no double drops, leaks, implicit clones, or
  accepted illegal partial moves; cleanup on normal and nonlocal exits.
- Documentation, annotations, formatter output, original/expanded syntax tooling,
  strict installed stdlib lookup, and reproducible self-host bootstrap.

Completion means the public forms are genuinely ordinary macros, all supported
patterns use one elaborator, the primitive forms carry only core semantics, and
no temporary bootstrap compatibility behavior remains in the final language.

## Bootstrap implementation

The checked-in `scripts/compiler/stage0.py` adapter probes the selected stage0
compiler for primitive binding forms. For a legacy compiler only, it stages a
prelude without the two new binding imports, allowing that compiler's existing
public binding forms to compile the new compiler sources. Embedded compiler and
stdlib sources remain the new sources. A compiler that supports primitive forms
uses the full prelude. Both `dev.py build candidate` and release stage0 selection
use this adapter; the final parser has no legacy public-binding dispatch.

Source tools retain an authored syntax snapshot alongside normalized declarations.
Storage snapshots preserve node identities; semantic revisions assign canonical
IDs when a form changes. Source checkers join authored nodes to checked nodes only
when source interval, node kind, and lexical scope identify one canonical node.
Ambiguous projections remain unknown. This lets checkers propose edits to authored
forms without attributing a generated expression's type to the wrong source node.
Generated declaration bundles participate in the same staged expansion and parsing
pipeline. Named declarations are matched by module and name before comparing their
syntax and lexical scope, so adding source locations does not discard a normalized
helper body. Quoted templates remain data; expansion visits only active unquotes.
Isolated stage programs normalize public bindings while keeping their declared
entry functions out of ordinary macro invocation. `dump-ast` remains a primitive-parser view; its fixtures use starred forms,
while loaded and expanded stage fixtures exercise the public binding macros.
