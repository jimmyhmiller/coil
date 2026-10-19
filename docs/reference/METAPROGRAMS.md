# Metaprograms in Coil

A **metaprogram** is a Coil function that runs at compile time and operates on the
program. There is no separate metalanguage — it is Coil operating on Coil, compiled
to native code and run, its output type-checked and compiled normally.

## The four kinds

Distinguished only by *what they receive* and *what they return*.

| kind | signature | receives | returns | status |
|---|---|---|---|---|
| **Macro** | `[Code…] -> Code` | its own call site | replacement code | shipped |
| **Generator** | `() -> Code` (via `meta`) | nothing | new top-level forms | shipped |
| **Checker** | `Modules -> Code` | all modules, grouped | veto/report | **shipped** |
| **Transformer** | `Program -> Program` | the whole program | a rewritten program | **shipped** |

## Applying a metaprogram

- **Macros** — *call* them: `(when c body)`. Detected by their `Code` signature.
- **Checkers / transformers** — *register* them at top level: `(checker lint-icmp)` /
  `(transform desugar-inc)`. The compiler runs them during compilation. A **checker is
  handed the program as a list of modules** — `((name form…) …)`, one record per module
  (head = module name symbol, rest = its top-level forms). The checker owns the loop and
  decides which modules to look at. A **transformer** receives the same module-shaped
  input and returns a `do` bundle of module records (see “Transforms” below).
- **Dialects** — *import* a module that contains those registrations: one
  `(import "safe_dialect")` applies its whole stack.
- **From the CLI, optionally** — `coil run app.coil --use lint.coil` imports a
  metaprogram module (which self-registers its `(checker …)`) **without editing the
  source**. Repeatable; works on `run` and `build`. This is how you run a linter on
  demand: `coil run app.coil --use lint.coil`.

All four share one substrate: the `Code` value, the `code-*` operations, type
reflection, and the compiled comptime engine. The difference is **scope** (my-call-site
vs whole-program) and **power** (produce vs reject vs rewrite). An ordered stack of
checkers/transformers is what we mean by a **dialect** (e.g. the GC dialect, a
Rust-like ownership dialect, a Scheme frontend).

### Walking the whole program

`Code` implements `Len`, `Get`, `Iterable`, and `Iterator`. Prefer the ordinary
collection loop over hand-written `(modules i n)` recursion:

```coil
(import "coil.primitive" :as primitive)

(defn walk-form [(form Code)] (-> Code)
  ; Replace this with the check to perform on each top-level form.
  form)

(defn walk-module [(module Code)] (-> Code)
  (do
    ; The record head is the module name; its O(1) rest view contains the forms.
    (for form (iter (primitive/code-rest module))
      (walk-form form))
    `0))

(defn check-program [(modules Code)] (-> Code)
  (do
    (for module (iter modules) (walk-module module))
    `0))

(checker check-program)
```

Iteration preserves syntax identity and source provenance. `iter` itself allocates no
collection, and advancing a `Code` iterator replaces its remaining O(1) view, so the
walk is linear and does not build intermediate lists. Use `primitive/code-nth` directly
when an algorithm genuinely needs random access; use `CodeBuilder` plus `push!` when it
needs to construct output.

### Building lists by recursion costs what it looks like

Write the recursion the way it reads. A splice of a long list does not copy it: the
result shares the list it was given and lays its items out once, the first time one is
read (and once more when the expansion finishes), so each of these is linear:

```text
;; one item, then the rest
(defn nat [(i i64) (n i64)] (-> Code)
  (if (>= i n) `() `(~i ~@(nat (+ i 1) n))))

;; an accumulator that grows by a splice
(defn gather [(i i64) (n i64) (acc Code)] (-> Code)
  (if (>= i n) acc (gather (+ i 1) n `(~@acc ~i))))

;; items before and after a long list, and joins of joins
`(first second ~@(nat 0 n) last)
```

`code-rest` and `code-slice` are windows onto the same items and copy nothing either.
Short splices (under 32 items) are copied, since that is the cheaper join. Reading an
item of a joined list lays it out, so a recursion that reads every level's result before
using it pays that layout at each level; it is still correct. `code-copy` and
`code-concat` copy, and say so.

## The API (the vocabulary), all shipped

- **Take Code apart:** `code-count`, `code-nth`, `code-rest`, `code-sym`,
  `code-list?`, `code-sym?`, `code-int?`, `code-keyword?`, `code-str`, `code-eq`.
- **Build Code:** quote `` ` ``, unquote `~`, splice `~@`, `code-symbol` (make a
  name from a symbol/string base plus suffix parts — a keyword part is its name
  without the colon, an int part becomes its decimal
  digits, and a **generic instantiation** base `(Gen A B)`, the same shape
  `code-field-count` accepts, is mangled deterministically (`(Box i64)` → `Box__i64`)
  so `derive` can name a helper over a generic instance), `code-str` (same, yielding a
  string), `gensym` (fresh hygienic name).
- **Bytes ↔ names:** `(primitive/int->str N)` → the integer's decimal as a `(slice u8)`, so a
  name minted from a counter/index is one call; `(primitive/str-bytes S)` → a Code list of a
  string's byte values; `(primitive/bytes->str LIST)` → the inverse (list of ints → string).
- **Reflect on types:** `code-type-shape` safely classifies a type, answering a
  `primitive/TypeShape`: `(StructShape)`, `(SumShape)` or `(UnknownShape)`;
  `code-type-traits` answers a `primitive/Traits`, `(TraitsAre NAMES)` with the
  traits a type implements (their qualified names, generic impls included when
  their bounds hold, so `(Option S)` lists Debug only when `S` has it) — ask it of a
  type as `type-of` reports it, in a checker or semantic transform, where the
  checked program exists, and it answers `(TraitsUnknown)` anywhere else;
  `code-field-count/name/kind/type`, `code-variant-*`
  (including `code-variant-field-name`/`-type`, which reflect a variant's
  PAYLOAD fields by `(SUM VARIANT-INDEX FIELD-INDEX)` — the type comes back
  structured, e.g. `(coil.core.Option (slice u8))`, so a derive over an existing
  sum sees real field types), `code-trait-*` (and value-form `field-count`,
  `struct?`, `field-name`, …).
  Kind tags: `0=int 1=float 2=bool 3=struct 4=sum 5=ptr 6=array 7=slice 8=other`.
- **Compute:** the compiled engine runs arbitrary Coil — including generics,
  collections, allocation and FFI.
- **Fail / branch:** `error` (abort expansion with a message), `target-arch`,
  `target-os`.

`(target-arch)` and `(target-os)` answer for the platform being
**compiled for** — read from the resolved `--target` triple, not probed from the
machine running the compiler. `target-arch` is a `coil.core` function returning
the sum `coil.core.Arch` (`X86_64`, `Aarch64`, `Riscv32`, `Wasm32`, `Wasm64`),
so a choice is an exhaustive `match` and an architecture it leaves out is an
error; `arch-name` spells one as a triple does. `target-os` returns the sum
`coil.core.Os` (`Linux`, `Darwin`, `Wasm`, `BareMetal`; an Apple embedded triple
such as `arm64-apple-ios18.0` is `Darwin`, a `*-none` triple is `BareMetal`), and
`os-name` spells one. A triple whose OS `Os` does not name is an error where a
macro asks. Both answer for the host when no `--target` is given; the
primitives beneath them, `primitive/target-arch` and `primitive/target-os`,
yield the same answers as symbols.

That distinction is the whole point, and it is easy to get wrong: a platform
constant folded at compile time from a *runtime* probe silently records the
build host, so cross-compiling bakes in the wrong answer. `src/stdlib/fs.coil` is the
worked example — its `open()` flags differ per OS (512 is `O_CREAT` on darwin
and `O_TRUNC` on Linux), and it selects them with `coil.os`'s `os-pick`, which
takes one form per operating system (Linux, Darwin, wasm) and has no default: a
target it was not given a form for is a compile error at the choice, instead of
silently getting another OS's numbers. (`os-pick-with-none` adds a fourth form for
bare metal, and a top-level `(os/requires-os)` makes a whole module an error to
load there, as Rust has no `std::fs` on a `*-none` target.)

```coil
(import "coil.primitive" :as primitive)
(import "coil.os" :as os)

;; A generated const the surrounding PROGRAM refers to is a published name, not a
;; template binder. A bare `O_CREAT` in the template would carry this module's
;; definition context and the program's own reference could not see it, so the
;; name is declared through the explicit context removal.
(defn explicit-public-name [(name Code)] (-> Code)
  (primitive/syntax->datum name))
(defn gen-open-flags [] (-> Code)
  `(do (const ~(explicit-public-name `O_CREAT) ~(os/os-pick `64 `512 `512))
       (const ~(explicit-public-name `O_TRUNC) ~(os/os-pick `512 `1024 `1024))))
(meta (gen-open-flags))
```

so the flags stay true compile-time literals (no runtime branch at any use) and
are still right under cross-compilation. FAST's `cli/cross` step pins this by
checking the folded `(target-arch)`/`(target-os)` choice across `--target` values,
which is the only place the property is observable — a cross-built binary never runs on the builder.

### Code that runs inside the compiler

Macros, `(meta …)` generators, transforms and checkers run inside the compiler,
on the machine building the program, so in a cross build they are compiled for
that machine, the **host**, as Rust compiles proc macros and Racket keeps
phases apart. The questions answer for **the code being produced at that
moment**:

- **The program's own code** answers for `--target`.
- **A function a macro calls while it runs** was compiled for the host, so its
  body's platform choices (an `os-pick` constant, a `freestanding-or`, the width
  of `usize`) are the host's. A macro that opens a file gets the host's `O_CREAT`.
- **A macro or generator asking `target-os` itself, as it runs,** gets the
  platform of the code it is producing: `--target` while it expands or generates
  the program, so `gen-open-flags` above emits the target's flags.

So a generator that produces per-platform definitions asks when it runs, as
`gen-open-flags` does (its `os-pick` calls receive Code values, so they are
ordinary calls made at run time); one that called an ordinary helper which had
already baked in a choice would get the host's answer. When `--target` is the
host's own platform, all of this is one expansion and nothing changes. FAST's
`cli/cross` step checks each case with a target whose OS differs from the
builder's.

A cross build's program also leaves out what only the compiler's code uses, so a
macro or generator can read and write files through `coil.fs` while the program is
built for bare metal, where `coil.fs` cannot load. Coil works out the phase of
every use from the source:

- the program's own code, ordinary definitions and top-level forms, is **phase 0**;
- the **body of a compile-time definition** (one whose signature takes or returns
  `Code`) runs in the compiler, **phase 1**, and so does every function it calls;
- a **quasiquote template** holds code being produced, one phase earlier: a
  template in a macro is phase 0, code for the program.

The program loads the modules phase-0 code names, every module the build was
asked for, and an import nothing names (one kept for its registrations or impls).
A function only compile-time code calls stays out of the program when it names
something the program does not have, so a macro's helpers may call `coil.fs` too,
and a macro whose template names `fs/…` keeps `coil.fs` out until a program uses
that macro. A bare-metal build that does need an OS module says which use brought
it in:

```
error: <bundled fs.coil> needs an operating system, …; `coil.fs` is in the
program because a template in `probe.exists-call` uses `fs/exists?` at run time
```

`COIL_TRACE_PHASES=1` prints, for a cross build, each module and function left to
the host and why every other module is in the program. The phases are inferred,
so a macro that builds a name from a string (`code-symbol`) instead of writing it
gets a resolve error in a cross build rather than the module it meant.

A generator can use what another generates: one that calls `fs/write-file` needs
the `O_CREAT` `coil.fs`'s own generator produces. The generators run as one
program when they check as one; otherwise each that checks on its own runs first,
the program is expanded with its output, and the rest run after. FAST's
`cli/cross` step and COMPREHENSIVE's `freestanding` step (`build_time.coil`, run
under QEMU) check these cases.

New API this project added (all shipped):

- **`(primitive/report NODE MSG)`** — a located compile-time **error** at `NODE`. It **collects**:
  a checker keeps running and surfaces EVERY error in one pass; the build fails after
  printing them all.
- **`(primitive/warn NODE MSG)`** — a located, **non-fatal** warning at `NODE`; collects and all
  print, the build succeeds. What a *linter* wants.
- **`(primitive/suggest NODE MSG REPLACEMENT)`** — a `warn` that also proposes a **rewrite**.
  `REPLACEMENT` is a `Code` value, normally built from the author's own subnodes; the
  diagnostic gains a `help: try: …` line, and `coil lint --fix` (and only it) splices it
  into the file. Any node that came from source is written back as its ORIGINAL bytes,
  so comments and formatting in untouched branches survive. A round that stops compiling
  is reverted. Comments BETWEEN nodes — the one thing no `Code` value records — are
  carried across the rewrite too, so a commented chain is fixed like any other. Demo:
  `src/examples/metaprogramming/condlint.coil` rewrites a chain of 3+ nested `if`s as a `cond` with
  `:else`. Full design + what changed on contact with reality: `docs/archive/AUTOFIX.md`.

  A replacement is the one metaprogram output that becomes **source text**, and text
  carries no lexical scope. An identifier the rule introduced and one transported out
  of the author's program are distinct syntax objects even when they print the same,
  so the renderer **disambiguates** before writing: whether a collision can capture
  anything is decided from the type-checker's binding map (only a transported
  reference bound to a LOCAL is capturable), the author's syntax always keeps its
  text, and each rule-introduced identity becomes `name__N`. Heads, globals and
  qualified names collide harmlessly and are untouched, which is why a `cond`-shaped
  rewrite still reads exactly as written. So a rule may bind around the author's code
  — `(let [tmp 1] (primitive/imul ~their-node tmp))` — without silently rebinding
  their `tmp`; it is rendered `(let [tmp__1 1] (primitive/imul tmp tmp__1))`. Pinned by
  `tests/meta/suggestion_capture_rule.coil` in FAST's `meta` step.
- **`(primitive/delete NODE MSG)`** — a `warn` that proposes REMOVING the node. Deletion is a
  separate op rather than a `suggest` with an empty replacement for two reasons: no
  `Code` value renders as nothing, and a deletion legitimately covers source the
  node's own span does not — the comment block written directly above it, which
  documents the thing being removed. `coil lint --fix` takes that block, the form,
  any trailing `; …` on its line, and the line itself; it stops the backward scan at
  a section banner (a run of six or more punctuation characters, i.e. `; ==== … ====`),
  which introduces everything below it rather than the one definition underneath.
  `suggest`'s refusal to drop a comment is waived here, because dropping it is the
  point. The bundled user: **`coil.lint.unused`** (`src/stdlib/lints/unused.coil`),
  whole-program dead-code elimination for source — reachability over a name graph,
  deleting to a fixpoint. It is deliberately NOT in `coil.lint.default`; run it with
  `coil lint FILE --use coil.lint.unused --fix`.
- **`(primitive/code-macro? NODE)` → bool** — true for a node the expander produced. Checkers run
  on the EXPANDED program, so every `cond`/`when`/`case` the author wrote is already
  nested `if`s by the time a rule sees it; this is how a rule about `if` tells the two
  apart. It is the same `ctxt ≠ 0` test autofix uses internally to refuse to edit
  macro-generated code.
- **Metaprograms are fed the WHOLE program, including all imports** (their own modules
  and bundled stdlib). A checker sees imported code too, so a linter flags an `icmp`
  in an imported user module as well as in the entry.
- **Checkers also see source `import` and `export` declarations.** The loader keeps
  these out of the checked runtime program but adds their original, source-spanned
  forms to the checker-facing module records. That makes syntax-policy rules and
  surgical suggestions possible; `coil.lint.no-star-imports` is the bundled opt-in
  example.
- **Checkers run AFTER resolve + typecheck** (the *semantic* layer; see
  `docs/design/SEMANTIC_METAPROGRAMS.md`). A checker is registered at `expand-stage3` but
  executed later, once the whole program is checked, so it reads the compiler's
  authoritative output. A checker therefore layers *policy* on a program that already
  typechecks.
- **Authored references in lint profiles.** `coil.meta` joins original source
  syntax to resolver evidence, including macro heads before expansion. In a
  semantic checker loaded with `coil lint --use`, `meta/source-modules` answers
  original module records, `meta/imports MODULE` editable import records, and
  `meta/references MODULE` authored reference occurrences, each as a
  `primitive/SourceView`: `(SourceIs RECORDS)`, or `(SourceUnavailable)` outside
  this lint phase. Use `meta/reference-node`, `meta/reference-role`, and
  `meta/reference-binding` to read a reference. A binding is a
  `primitive/SourceBinding`: `(BindsGlobal QUALIFIED-NAME)`, `(BindsLocal ID)`,
  `(LocalUnknown)` or `(LocalAmbiguous)` for a local lacking a unique checked
  identity, `(BindingUnknown)`, or `(BindingAmbiguous)`. `meta/source-binding NODE`
  is strict occurrence lookup: a newly constructed symbol never acquires a binding
  from its spelling. The evidence covers the files the user wrote, which are the
  only ones a fix can edit: a bundled library module has no reference records, and
  a binding asked of its syntax is `(BindingUnknown)`.

  `meta/references-through IMPORT` selects references resolved through that
  import's facade. `meta/reference-import` and `meta/reference-exported-name`
  preserve that route separately from canonical ownership, including renames and
  reexports, as `(Some NAME)` when the reference resolved through an import and
  `(None)` when it did not. `meta/import-node` and `meta/import-target` expose the
  declaration and its resolved module namespace.

  `meta/qualify-import IMPORT ALIAS MODE` answers a `primitive/ImportPlan`:
  `(PlanEdits EDITS)`, EDITS a list of `(edit NODE REPLACEMENT)`, or
  `(PlanRefused "reason")`. MODE is `` `strict `` or `` `assume-no-shadow ``: strict
  refuses when a quasiquote template names something the import supplies, since
  nothing records how a template's bare name binds; `assume-no-shadow` rewrites
  those names as references to the import, which is right unless the template binds
  the same spelling itself. `coil.lint.import-aliases` selects it with
  `--lint-param coil.lint.import-aliases.assume-no-shadow=true`. `meta/suggest-edits EDITS MESSAGE` submits a
  plan's edits as one coordinated lint suggestion group and answers a
  `primitive/Suggestion`, `(Suggested)` or `(SuggestionRefused)`; writing still
  requires `--fix`.
  Qualification refuses incomplete evidence, alias conflicts, names inspected by
  macros, repeated imports of one module, and imports that reexport their target.
  Inert quoted data is excluded. Generic type occurrences whose identity cannot
  be distinguished conservatively remain ambiguous. The opt-in policy is
  `coil lint FILE --use coil.lint.import-aliases --diff` (replace `--diff` with
  `--fix` to apply). It replaces wildcard imports with aliases and qualifies
  references while preserving local shadowing and the facade's exported spelling.
- **Transforms are MODULE-SHAPED and may ADD/REMOVE top-level forms.** `(transform
  FN)` hands FN the program as `((name form…) …)` (one record per module, like a
  checker) and FN returns those records **`do`-wrapped**: `` `(do ~@records) ``. Every
  form in a returned module record is tagged with that module, so a transform may EMIT
  new top-level defns (a GC dialect's per-type `trace-T`, a root table, a runtime
  import) or drop forms. Demo:
  `tests/meta/addforms.coil` emits a whole new defn.

  The `do` is not optional padding, and it is the easiest thing to get wrong: a
  return value that is not a `do` bundle is read as ONE module record, so handing
  back the argument unchanged — the identity transform — fails with *"a module
  record's head must be its name symbol"*. `tests/meta/safe_dialect.coil`
  shows the shape.
- **Phase selection.** The two-item registrations keep their semantic behavior: they
  run after expansion and have access to the checked model. A phase is a value of
  `coil.phase.Phase`, written under `(import "coil.phase" :as phase)`. Add
  `:phase (phase/BeforeExpand)` to run on the loaded surface syntax instead:
  `(checker raw-depth :phase (phase/BeforeExpand))` or `(transform surface-pass :phase
  (phase/BeforeExpand))`. Syntax transforms
  reach a fixpoint before syntax checkers run; their output then undergoes normal macro
  expansion. A transform may instead use `(transform lower :phase (phase/AfterExpand))` to
  see the result of ordinary macro expansion exactly once, before resolution and
  typechecking. Its output goes directly into the semantic pipeline and is not expanded
  again, so it must not rely on newly emitted macro calls. Semantic reflection is empty
  in both boundary phases, and registrations must be literal top-level forms rather
  than generated retroactively.
- **`(primitive/binding-of NODE)` → the local-binding identity** a reference resolves to (an
  i64; 0 = a global const/function), recorded by the type-checker per reference.
  Two references with the same positive id name the SAME local, so a checker
  distinguishes a **shadowed** local from its outer namesake — which name-matching
  cannot. This is what a borrow/move checker keys its dataflow on. Demo:
  `tests/meta/borrowlike.coil` (a use-after-free checker).
- **Generic reflection.** `code-field-type`/`code-field-kind` accept a type
  **instantiation** `(Gen A B)`, not only a bare name, and substitute the type
  parameters — `code-field-type (Pair i64 (ptr u8)) 1` → `(ptr u8)`. So a derive/
  trace generator sees concrete field types through a generic.
- **`(transform FN)`** — there is ONE kind of transform, and it is semantic. It runs
  to a fixpoint: each round it reads the checked program (via `code-decl` etc.) to
  decide its rewrite, then the pipeline re-resolves + re-typechecks. It also TOLERATES
  a program that doesn't yet typecheck: the model is then **partial**. Every
  declaration and function that checks answers `code-decl`/`type-of`/`binding-of`
  as usual. Inside a function that fails, checking continues past each error: the
  failing expression gets an internal error type, every error is recorded (a failure
  caused only by an earlier one is not reported again), and all subexpressions that
  do not depend on a failure keep their real types and resolutions. Only nodes the
  checker could not establish answer `(TypeUnknown)`/`(DeclUnresolved)`; an expression whose
  own type depends on a failed child, such as `(.x (.origin r))` when `.origin` fails,
  gets its type once a fixpoint round has rewritten that child. When resolution itself fails
  there is no model and the transform rewrites purely syntactically (e.g.
  `inc`→`iadd`, where `inc` is undefined until the rewrite). The authoritative
  strict check happens once, after the fixpoint. So one primitive covers
  both type-aware rewrites and syntactic desugarings: rewriting a marker by the
  wrapped call's real return type, or `inc`→`iadd` (`tests/meta/safe_dialect.coil`).
- **`(transform-once FN)`** — the single-pass semantic variant. It receives the
  same checked program and its output still receives the authoritative strict
  resolve/typecheck, but Coil does not execute it a second time to prove a
  fixpoint. Use it only when one traversal is the complete rewrite.
- **`(primitive/code-decl NODE)` → a `primitive/DeclAnswer`**, read from that
  authoritative checked program: `(Declared MODULE KIND QUALIFIED-NAME SIGNATURE)`,
  KIND a `primitive/DeclKind` — `(FunctionDecl)`, `(MethodDecl)`, `(StructDecl)`,
  `(SumDecl)`, `(VariantDecl)` for a construction, `(TraitDecl)`, `(ConstDecl)`,
  `(ExternDecl)` or `(PrimitiveDecl)`. A function's SIGNATURE is
  `([PARAM-TYPE…] RET)`. A method's reads the same, then adds OWNER-TYPE, the type of
  the impl the checker chose, and for a trait method the trait; its MODULE is the
  module that declares that type (`coil.arraylist` for a method of `(ArrayList T)`),
  and empty for a type no module declares (`i64`, `(ptr T)`). The other kinds have an
  empty SIGNATURE. The qualified name is the exact identity selected by resolution
  rather than the spelling used at the call site, including through aliases and
  import renames. The other answers are `(DeclUnresolved)` and `(DeclAmbiguous)`.
  **Pass a resolved
  REFERENCE node and it resolves to the EXACT entity** the checker picked (via node
  identity), unambiguous even when the simple name lives in several modules. This covers
  every resolved reference: **function calls, function-pointer refs (`fnptr-of`), and
  variant constructions** (which resolve to the variant, in its sum's module). A bare symbol falls back to
  a name-based lookup (which answers `(DeclAmbiguous)` on a cross-module name clash). A type
  reference such as `wb/Box` resolves to its module too, even when `Box` is defined in
  several. `tests/meta/run_code_main_decls.coil` lists the answers for a module's method
  calls.
- **`(primitive/model-status)` → a `primitive/ModelStatus`**: `(ModelComplete)`,
  `(ModelPartial)` or `(NoModel)` — whether the model the transform is reading is of
  a program that fully checks, one that partly checks, or no model at all. A
  transform that must only see valid programs matches `primitive/ModelComplete`.
- **`(primitive/check-error NODE)` → a `primitive/CheckOutcome`**: `(FailsAt MESSAGE)`
  with the checker's message, a string, for the error located exactly at NODE in a
  partial model, or `(ChecksClean)`. A dialect transform uses it to find the
  expressions that do not check yet, and why, and rewrite exactly those; together with
  `type-of` on their subexpressions it can make type-directed rewrites of code that is
  not valid Coil until rewritten.
- **`(primitive/type-of NODE)` → the expression's inferred type**, a
  `primitive/TypeAnswer`: `(TypeIs TYPE)` with TYPE as `Code` (e.g. `i64`,
  `(ptr i64)`), or `(TypeUnknown)`. This is the type the real type-checker inferred, not
  syntax — a call `(getf)` reports `f64` because `getf` returns `f64`. Demo:
  `tests/meta/nofloat.coil` bans floating-point-typed expressions.
- **`(primitive/code-file NODE)` → the source file name** of a node, and **`(primitive/code-from-user? NODE)`
  → bool** (true for a real file, false for a bundled `<…>` source). So a linter can
  *scope itself*, warning only where `(primitive/code-from-user? f)`, which
  skips the standard library while still linting the user's own modules. (Checkers can't
  call imported string functions — the closure doesn't include them — so `code-from-user?`
  does the check in the compiler and hands the checker a bool.)
- **`(primitive/code-call-site)` → the macro call being expanded**, as Code, so a macro
  can say where it was written with `code-file`, `code-line` and `code-col` even when it
  takes no arguments: `(unreachable)` reports its own location this way. Outside a
  macro's expansion (in a checker, a transform or compiled code) it is an error.
- **Asking the compiler about the program.** A checker or transform can ask the
  compiler what the program is, for instance to describe it to another unit (a JIT
  session inside the program, say). `coil.meta` wraps each query, and each answers
  a `primitive/ProgramAnswer`: `(Answer VALUE)`, `(NotInProgram)` for a name the
  program does not define, or `(NoProgram)` where there is no checked program;
  `(meta/answered ANSWER)` is VALUE, or a compile error for the other two.
  `(meta/modules)` lists every module, the library's included;
  `(meta/definitions M)` lists M's definitions as qualified symbols;
  `(meta/definition-kind NAME)` answers a `primitive/KindAnswer`, `(KindIs KIND)`
  with a `primitive/DefinitionKind` — `(Function)`, `(Macro)`, `(Generic)`,
  `(Def)`, `(Const)`, `(Struct)`, `(Sum)`, `(Trait)`, `(Alias)` or `(Extern)` — or
  `(KindNotInProgram)` or `(KindNoProgram)`;
  `(meta/declaration NAME)` is the form that declares NAME to another unit: a
  `declare` of a function's exact signature (an aggregate parameter is spelled
  `(ref T)`, as `fnptr-of` types it) or of a `def`'s storage, a record or sum with
  qualified types, or the source of what is instantiated or expanded where it is
  used; `(meta/definition-source NAME)` is the form that defines NAME as written;
  `(meta/module-header M)` and `(meta/module-impls M)` are its
  `module`/`import`/`export` and `impl`/`derive` forms; `(meta/annotations NAME)`
  is the `:key value` pairs NAME's `defn` or `def` carries, as one list (empty if
  it has none), which is how
  a transform finds the definitions an annotation marks; `(meta/toolchain)` names
  the compiler and target the declarations assume; `(meta/source CODE)` renders any
  form as text. `(meta/embed-text MODULES HOST NAME TEXT)` adds a function `(NAME)`
  to module HOST returning TEXT, and `(meta/transform-result MODULES)` is what a
  transform returns. `(meta/embed-environment MODULES HOST NAME DESCRIBED EXPOSE)`
  is a helper built from these queries for handing the program to a JIT session:
  it describes the modules DESCRIBED and hands over the functions and `def`s in the
  list EXPOSE ([STATEFUL_JIT.md](STATEFUL_JIT.md)). These are functions a metaprogram
  calls. The compiler does nothing with them by itself, and what to hand over is
  always the caller's choice.
  `tests/jit/host_environment*.coil` embed an environment and hand it
  to a session.
- **`(checker FN)` / `(transform FN)`** — register a whole-program metaprogram.
- **A dialect is a single import.** A module that contains `(checker …)`/`(transform …)`
  registrations *is* a dialect — importing it applies the whole stack (import order =
  pass order; transformers run before checkers). No new syntax; the module is the
  manifest. See `tests/meta/safe_dialect.coil`.

## The engine: everything compiles

There is **one engine**. `expand-stage3` lowers the metaprogram sub-program to a normal
program (`metalower.coil`: `Code` -> opaque handle, code ops -> boundary calls),
compiles it with the ordinary pipeline (cached content-addressed under
`~/.cache/coil/metaprog`), and runs each entry as **native code**. Everything the
language can do, a metaprogram can do — generics, HashMap, `malloc`, libc FFI at
expansion time (`tests/meta/samecode_test.coil` runs the same code both ways).

This covers **every** compile-time call site with one semantics: macros, `(meta …)`
generators, checkers, transforms, and `(comptime E)` / `(const …)` folding. So a helper
behaves the same whether it is reached from a macro, a generator, or a `const`.

How the metaprogram object is produced depends on the host, invisibly: the LLVM build
uses the LLVM backend, the LLVM-free `main_a64` compiler uses the arm64 backend's
`export-c`, and inside a wasm sandbox the bytecode interpreter (`interp.coil`, see
`docs/reference/BYTECODE_INTERP.md`) runs the same mono'd sub-program in-process. Same semantics,
three ways of getting native (or emulated) execution.

**Macro bodies can call macros** (the TOWER): `when`/`cond`/`try!`/`fmt` inside a
metaprogram's own body expand at definition time, type-directedly — a call to a
Code-signature function whose arguments all typecheck as Code stays a FUNCTION
call (passing code values, e.g. cond-arms' recursion); one with non-Code
arguments is surface syntax and is expanded, with the checker as the only judge.
An argument that is itself a macro use is read by its expansion's type:
`` (f (let [y `x] y)) `` is a call to `f` with a Code value, while in
`(when (let [n (count)] (> n 1)) …)` the `let` is bool, so `when` is expanded, and
receives its arguments as written, not the expanded `let`.
Staging is lazy and per-qual: an engine miss stages that macro on demand, and a macro
that cannot be staged is a hard error rather than a silent fallback.

Known limits: entries are capped at 8 parameters; a comptime **result** must be
materializable as a literal (a pointer, or an aggregate that is a generic instance,
is a located error); and deep self-recursion at comptime is not TCO'd, so a runaway
comptime recursion crashes rather than reporting.

## What metaprograms can and can't do

Can: read any form's syntax; **see the whole program**, including imports and bundled
stdlib; generate code (inline + new top-level defs); **rewrite code they don't own**
(transforms, to a fixpoint, adding or removing top-level forms); **reject precisely**
— `warn`/`report` are located, collect, and surface every diagnostic in one pass;
read the compiler's authoritative model (`code-decl`, `type-of`, `binding-of`);
compute at compile time with the whole language; reflect on struct fields, sum
variants and trait method signatures; compose to a fixpoint; abort the build; branch
on target.

The first three walls in this doc's original framing are **gone** — that was the point
of the project. What remains:

1. **Intercept core special forms.** `if`, `store!`, `index`, `alloc-stack` are parsed
   as special forms, so a macro named `store!` cannot shadow them. Demoting `store!`
   to an interceptable call over a `%store!` primitive is the open design (below); it
   is the one change that would re-bless the oracle snapshots.
2. **Function-signature reflection** for auto-coercion at dialect boundaries.
3. **A comptime result that is a pointer or a generic-instance aggregate**, and
   **runaway comptime recursion**, which is unbounded and crashes rather than
   reporting.

## Still open

### Core-form demotion
**Demote `store!` first** — the parser would emit an interceptable `(primitive/store! …)` call
over a `%store!` primitive so transforms can rewrite it on idiomatic code. This is the
one change that re-blesses the oracle snapshots. Unlocks write barriers on unmodified
Coil. (Checks on operators, indexing and casts need no such change: a semantic
transform rewrites those calls with the checker's types, which is what
`coil.safety` does.)

### Richer reflection
Function-signature reflection, for auto-coercion at dialect boundaries.

## Related work
These live in the **coil-experiments** repository, not here:
- `src/experiments/gc-dialect/` — a precise mark-sweep GC built entirely as macros + a runtime
  library (implicit allocation + reclamation, reflection-generated tracers).
- `src/experiments/transparent-gc/` — the same idea with rooting made transparent by a transform, so
  no explicit `gc-let`/`gctype` is needed.
- `src/apps/scheme/` — an R5RS dialect as a whole-program transform; the largest
  metaprogram written in Coil.
- Jai comparison: it confirms codegen only sees post-comptime concrete code and keeps
  generics duck-typed, and leaves the comptime↔instantiation cycle undocumented.
