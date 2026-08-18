# Running a metaprogram as the main program

Status: **implemented and verified** (2026-08-17): Linux rebootstrap
fixpoint byte-identical and every oracle gate green on the final tree
(gate-full IR byte-exact, so the resolve change alters nothing existing),
and `gate-run-meta.sh` passes under the native engine, the interpreter
(`COIL_META_INTERP=1`), and `COIL_META_ARENA=poison`. §"As built" records
what implementation taught. This is the fresh design the branch
experiment report asked for (`feat/scheme-continuation-pass`:
`docs/landing/07-run-metaprograms-as-programs.md`, marked "incomplete
experiment — do not port"). It supersedes both branch experiments; the final
section records what was learned from them and where the evidence lives.

## Goal

Point `coil run` at a metaprogram and it just works — no flag, no subcommand,
no registration. Its input is code, its output is code on stdout, and
everything in between is the standard compiler running the standard way:

```sh
coil run desugar.coil input.coil            # prints the transformed code
echo '((inc 41))' | coil run desugar.coil   # stdin works like any program
coil run gen.coil > generated.coil          # a generator writes a file
coil run stage1.coil in.coil | coil run stage2.coil   # stages compose in a pipe
coil run mylint.coil suspicious.coil        # a lint prints located diagnostics
```

The point is debuggability and composition: inspect exactly what a transform
returns on real input, break in a metaprogram with a native debugger, run a
metaprogram over another metaprogram's source or output, pipe generated code
into the next compile.

## The contract: the signature of `main` IS the declaration

Coil already decides what a metaprogram is purely by type — a metaprogram is
any function whose parameters and return are `Code` (`code-sig-funcs`,
`expander.coil:1477`; the four kinds in `docs/reference/METAPROGRAMS.md` are
distinguished *only* by what they receive and return). This design extends
that exact rule to the program entry point:

**A program whose `main` has a Code signature is a code→code program.
`coil run` feeds it code and prints the code it returns.**

```coil
(defn main [(prog Code)] (-> Code)
  (transform-somehow prog))
```

- `main [Code] -> Code` — reads one input (a file argument, or stdin), prints
  the result.
- `main [] -> Code` — a generator: no input, prints code.
- `main [Code Code] -> Code` — two inputs, two file arguments.
- `main [] -> i64` (or any non-Code main) — a normal program; `run` behaves
  exactly as today (build + exec). Nothing changes for existing programs.

There is no ambiguity and no mode flag because the two cases are disjoint:
`Code` exists only at compile time (`drop-code-funcs` removes Code-signature
functions before mono), so a Code-signed `main` cannot be linked into a native
executable — today such a file is simply an error. This design makes it mean
the one thing it can mean. The signature is the contract, exactly as it
already is for macros, generators, checkers, and transforms.

Argument mapping follows the same logic a normal program has — argv is
consumed the way `main`'s signature says. A normal `main` gets strings; a
Code `main` gets the *contents* of the inputs as code, under two contracts
selected by the signature and the input kind (still no flags):

**The code-base contract** — `main [(prog Code)]` given **file** arguments:
the files are **loaded as additional roots of the same pipeline** that
compiles the metaprogram — imports resolved, macros expanded, the combined
program resolved and typechecked once. `prog` is the settled program as
`((module-name FORM…) …)`, the exact shape a registered checker or transform
receives (including bundled stdlib, which `code-from-user?` scopes away, and
the metaprogram's own modules — the same self-inclusion a `--use`'d lint
has). Because the target is checked in-pipeline, the semantic model answers
about it: `type-of`/`code-decl`/`binding-of` on the target's nodes return
the compiler's real answers, and located `report`/`warn` point into the
target's own files. One pipeline also means one source registry and one
authority — none of the split-state hazards a separate target compile would
create. A target that does not typecheck fails the run with the compiler's
own diagnostics, exactly as a registered checker only ever sees valid
programs.

**The fragment contract** — stdin (piped, or named `-`), or a multi-param
`main` given N files: each input is `read-all`'d into one raw `Code` list of
its forms, registered as a real source, never loaded or expanded. This keeps
pipes cheap (`stage1 | stage2`) and macro experiments direct.

Argument count must match `main`'s arity (within the engine's existing
8-parameter cap); a mismatch is a clean diagnostic naming the signature.

## The one-sentence model

**`coil run` on a code→code program is the normal compiler frontend run on
the metaprogram's own file to its normal stopping point, followed by one
ordinary `expand-macro` call whose arguments are the inputs read from argv,
and whose promoted result goes to stdout instead of back into a tree.**

Everything below is consequences of that sentence. There is no new execution
machinery: no new engine operation, no second Code runtime, no child process,
no reduced context. The architectural requirement from the experiment report
— "the full compiler and one authoritative metaprogram context" — is met by
construction, because the runner *is* the compiler's own invocation path.
This is the standard way — the only way — metaprograms ever execute:
lowered by `metalower`, compiled by the ordinary backend, run as native code
(or the interpreter/wasm engine on hosts that use them) against a real
`CtCtx`. Running one as the main program changes *where the result goes*,
nothing about *how it runs*.

## Why `expand-macro` is the whole runner

`expand-macro` (`src/compiler/expander.coil:755`) already contains the entire
invocation contract that the branch runner re-implemented (worse) below it:

- **the expansion arena** (META_MEMORY phase 3/6, default on): created per
  invocation, `CtCtx.a` points at it, one value survives;
- **promotion**: `ct-own-sexp` deep-copies the `Ok` result — structure, string
  payloads, and `KView` flattening — out of the arena before it closes;
- **diagnostic ownership**: the `Err` path copies the message via `ct-own-str`
  before the arena closes (`expander.coil:780`), so the branch's
  leak-the-arena-on-error hole does not exist here;
- **poison mode** (`COIL_META_ARENA=poison`) and **per-invocation memory
  attribution** (`COIL_MTRACE=mem` → `mtrace-mem-record!`);
- **arity checking**, including variadic packing (`expand-macro-run`,
  `expander.coil:832`);
- **the real `CtCtx`**: `qmodule`/`qimports`/`qexports`/`module_fns` from the
  entry's own module, merged generated structs/sums, fuel — identical to
  compile-time execution, which is what makes reflection, hygiene, and
  diagnostics answer identically;
- **lazy staging**: `finish-macro` (`expander.coil:898`) hits
  `meta-engine-entry` or stages the qual on demand via `stage-one-macro!`
  (`expander.coil:2019`) — so `main` needs no wrapper, no registration, no
  annotation: it is staged exactly like a macro the expander just met;
- **engine dispatch**: `meta-engine-run-env` (`metaengine.coil:1210`) picks
  interpreter / wasm / native exactly as expansion does.

`run-checkers` (`expander.coil:2622`) already demonstrates the pattern: it is
a non-call-site caller of `expand-macro`, handing a synthesized `Code`
argument (the module list). The runner is the same pattern with the argument
list read from argv.

Consequence worth stating plainly: the runner adds **no execution
machinery**. As built it is driver orchestration, one expander function that
mirrors `run-registered-checkers`, and one resolve-time naming fix (see "As
built"); `metaengine.coil`, `metahost.coil`, `metalower.coil`, and the
engine ABI are untouched.

## Semantics

### The flow

`coil run FILE ARGS…`:

1. Run the standard frontend on `FILE`, exactly as `coil check` would:
   `ls-init!` → `register-source!` → `initial-read` (reader metaprograms
   run) → `load-program` (with `--use` prepended, as today) →
   `expand-stage3` → `run-transforms-and-check` → `run-registered-checkers`.
   The metaprogram file is a completely ordinary program: its imports load,
   its macros expand, its registered dialects apply, it typechecks.
2. Find `main` in the entry module of the checked program (`prog-fn-find`).
   **Non-Code `main`: proceed to build + exec exactly as today** — this
   design adds a branch, it moves nothing.
3. Code-signed `main`: validate the v1 contract — every parameter `Code`,
   return `Code`, not variadic, ≤ 8 parameters — with a specific diagnostic
   per violation. Read the inputs (files / stdin) per the argument mapping
   above.
4. Invoke via one `expand-macro` call with `margs` = the inputs, threading
   the same `allfns`/`genstructs`/`gensums`/`impb`/`expb` state the pipeline
   hands its other `expand-macro` callers.
5. Print the promoted result with `sexp-display` (`parser.coil:325`) plus a
   newline. Exit 0.

### Running existing metaprograms

Every existing metaprogram works unchanged, as a callee. The principle:
**`main` is a macro body as far as the compiler is concerned** — staged by
`stage-one-macro!`, compiled into the same closure, invoked by the same
`expand-macro` — and macro bodies can already call other metaprograms (the
tower: a call to a Code-signature function with Code arguments stays an
ordinary function call). So anything callable from a macro body today is
callable from `main`, which is all four kinds. Running an existing
metaprogram is a two-line driver file:

```coil
(module rundesugar)
(import "safe_dialect" :as sd)
(defn main [(prog Code)] (-> Code) (sd/desugar-inc prog))
```

This is not a workaround; it is the normal-program rule. `coil run` has
never run arbitrary library functions — it runs `main`, and `main` calls the
library. Two adaptation notes:

- **Checkers/transforms take module-shaped Code** (`((module-name FORM…) …)`)
  while `main` receives a flat list of the input file's forms; the adapter is
  one line of quasiquote in `main` (wrap the forms as a one-module record).
- **Semantic queries don't answer about the input.** A checker leaning on
  `code-decl`/`type-of`/`binding-of` runs, but the input is raw read data —
  never resolved or typechecked — so those ops return their sentinels
  (`:unresolved`/`:unknown`), which checkers are already contractually
  required to tolerate. Syntactic metaprograms are fully faithful; semantic
  answers about the *input* are the loaded-graph extension in §Non-goals.

### Diagnostics and exit codes

Rendered by the same paths compilation uses, to stderr; stdout carries only
the result, so the command composes with pipes.

- `(primitive/report NODE MSG)` collects located errors against the *input's*
  registered sources → all print, exit 1. `(primitive/warn NODE MSG)` →
  print, exit 0. So a lint whose `main` walks its input behaves like a
  compiler run on that input: `coil run mylint.coil app.coil` prints located
  findings and sets the exit code. Drain via the pipeline's existing
  `drain-warnings` machinery.
- `(primitive/error MSG)`, staging failures (`stage-fail-diag`,
  `expander.coil:927`, which names the real cause inside the closure), and
  signature/arity violations → diagnostic, exit 1.

### What the printed value is

The metaprogram's promoted return value, with its syntax-object scopes,
definition modules, origins, and source provenance intact. Normal integration
adds expansion provenance when the value enters a surrounding tree; it does not
run a spelling-based qualification or binder-repair pass. There is no
surrounding tree here, so the debugger-truth is the scoped syntax value the
function returned.

Printing follows the language's own generator convention (`splice-do-into!`,
the same splice `(meta …)` results get): **a `(do …)` result is a program —
its forms print one per line, so a generator's output is a compilable file;
any other result is one form, printed as-is.** Verified round trip:
`coil run gen.coil > generated.coil && coil run generated.coil` exits with
the generated program's own exit code. To emit a multi-form file, return
`(do form…)`, exactly as a `(meta …)` generator would.

### Engines and memory

The runner uses whatever engine the host build registered — native
`cc -shared` dylib (Linux x86-64 today), arm64 in-memory JIT, the interpreter
(`COIL_META_INTERP=1`), or the wasm side module — through the unchanged
`meta-engine-run-env` dispatch. **The x86-64 in-memory JIT from the branch
(`jit_x64.coil`) is explicitly not part of this feature**; it is a separately
motivated engine improvement (inventory item L9) and the runner must not
depend on it.

`COIL_MTRACE=mem` and `COIL_META_ARENA=poison` work unchanged, because the
invocation is an `expand-macro`. That is the observability story: one
invocation, exact per-invocation bytes, poison-on-close aliasing checks. And
because execution is in-process compiled code, a native debugger breaks in
`main` and everything under it with no ceremony.

## As built (what implementation taught)

The change is three files plus fixtures and a gate:

- **`driver.coil`** — `code-main-form?`/`code-main-file?` (the syntactic
  pre-scan, built on the existing `raw-code-sig?` plus a name check, run once
  on the raw entry file so a normal `run` is otherwise untouched);
  `run-code-main-cmd` (arg collection, `--use` via `argv-apply-uses!`, `-`
  and missing-single-input map to `/dev/stdin`); `run-code-main-pipeline`
  (the frontend prefix — initial-read/casefold → load → `expand-stage3` →
  `run-transforms-and-check` → `run-registered-checkers` — run through the
  existing mode-3 `run-dump-on-big-stack` harness, zero `DumpCtx` changes);
  `run-code-main-invoke` (signature validation, input reading with real
  source registration, invocation, do-splice printing, exit codes). Dispatch
  is one added branch in `driver-main`'s `run` arm; `run-cmd` is untouched.
- **`expander.coil`** — one function, `run-code-main`: the invocation,
  mirroring `run-registered-checkers` exactly (same `checker-reg-box`
  metaprogram context, same `expand-macro` boundary, same `drain-warnings`).
- **`resolve.coil`** — the one discovery that needed a compiler change.
  `main` is deliberately never module-qualified (the linker-entry
  convention, `qualify-func-sig`). A *Code-signed* `main` left bare loses
  its module identity — `module-of "main"` is `None` — so the
  definition-time tower judged its body without the module's imports and
  wrongly expanded cross-module metaprogram calls (`(sd/desugar-inc prog)`
  failed under plain `coil check` on the unmodified compiler; the same body
  named `outer` passed). The fix: qualify `main` like any function when its
  signature is Code-signed (`rs-sig-is-code?`), which is safe because a
  Code-signed `main` can never be a linker entry (`drop-code-funcs` removes
  it). This bug was unreachable before this feature — a Code-signed `main`
  had no reason to exist.
- **Entry lookup** (`code-main-lookup`): a Code-signed `main` is always
  module-qualified (the resolve rule above), so the runner looks up the
  declared-module spelling first, then the unique Code-signed function whose
  leaf name is `main` (covers the synthesized module of a module-less entry
  file, `_source_.main`) — and **never bare `main`**, which can only be a
  normal main (e.g. the loaded target's own entry point).
- **The code-base loader** (`code-main-load-roots!`) mirrors
  `load-test-roots!` exactly — including taking the source id from the
  `srccount` COUNTER, not the sources-array length. Getting that wrong
  produced the subtlest bug of the implementation: everything compiled and
  ran, but every span-keyed side table (the type map included) missed the
  target's nodes, so semantic queries silently answered `:unknown`.
- **`SemMapsSnap`** (`comptime.coil`): `check-program` resets the S0–S3
  semantic maps at entry, and `stage-one-macro!` checks a scratch closure —
  so lazily staging a metaprogram *during* an invocation wiped the maps the
  semantic model was still serving. The staging check is now bracketed by a
  save/restore of the map values. This was a latent mainline hazard (any
  checker that triggers lazy staging mid-run loses its own `type-of`); the
  runner just hit it deterministically.
- **`coil build` on a code->code file** currently fails at link with the
  generic missing-main guidance; a targeted "this is a code->code program;
  `coil run` it" message is deferred polish.

### Pre-existing limits discovered (parity holds; not runner bugs)

Both reproduce on the unmodified compiler with *registered* checkers:

- **`type-of` does not cover alias-imported modules' bodies.** A registered
  `nofloat` over a program whose f64 call lives in an `:as`-imported module
  reports nothing; same-file f64 calls report fine. The runner behaves
  identically in both cases (the parity claim, satisfied).
- **The icmp lint demos have drifted**: `<`/`>`/`=` parse to `ECmp` special
  forms now, so `lint_test.coil` and `imports_test.coil` produce zero
  icmp warnings on today's compiler — registered or via the runner.

Fixtures:
`tests/metaprogramming/run_code_main_{id,inc,gen,two,lint,warn,sem,tower}.coil`
plus targets `run_code_main_{target_a,target_b,float}.coil` —
`run_code_main_inc.coil` calls the pre-existing `safedialect.desugar-inc`
unchanged through a two-line wrapper `main`, and `run_code_main_sem.coil`
does the same with the pre-existing `nofloat` *semantic* checker. Gate:
`scripts/compiler/oracle/gate-run-meta.sh` — identity; the existing desugar
(byte-expected `(primitive/iadd 41 1)`); two-input fragment mapping; a macro
(`cond`) in `main`'s body; the generator round trip (generated program exits
42); a fragment warn located at `/dev/stdin`; a loaded-code-base warn
located in the target's own file; the existing semantic checker reporting a
type-inferred f64 in a loaded target (exit 1, clean stdout) and passing on a
clean target; the arity diagnostic; pipe composition; and the
normal-program regression. Run under the native engine, `COIL_META_INTERP=1`,
and `COIL_META_ARENA=poison`.

## Delivery phases

Gated by the usual discipline (fixpoint rebootstrap, gate all, gate-cli,
arm64 where relevant).

1. **The runner.** Signature branch, input reading, invocation, printing,
   diagnostics. Fixtures: identity; structured/dotted output; a real
   desugaring on file input; a generator (`main [] -> Code`); a two-input
   `main`; stdin/pipe; a lint `main` using `warn`/`report` with located
   output and exit codes; each signature diagnostic; a `main` calling helper
   metaprograms (the tower). New gate
   `scripts/compiler/oracle/gate-run-meta.sh` with exact-output comparisons,
   run per host under the default engine **and** `COIL_META_INTERP=1` (the
   branch exercised exactly one arm of the three-way dispatch; parity is
   asserted, not assumed), plus one full pass under `COIL_META_ARENA=poison`.
   A round-trip test: a generator's stdout re-read and compiled.
2. **Docs + decision.** A "Running a metaprogram directly" section in
   `docs/reference/METAPROGRAMS.md` extending the four-kinds table with the
   entry-point rule; a worked staging example (the branch's
   `docs/sprout-staging.md` is the model for what this should read like); a
   DECISIONS.md entry recording the signature-directed dispatch and the
   expand-macro-reuse model.

## Acceptance criteria

- A file whose `main` is Code-signed runs, prints parseable source, and its
  output re-reads and compiles; a non-Code `main` behaves byte-for-byte as
  today.
- `main` is staged lazily with no registration; helper metaprograms and
  macros inside the metaprogram's own body work (the tower).
- Wrong arity / non-Code parameter / variadic / >8 params each produce their
  own clean diagnostic naming `main`'s actual signature.
- Located `report`/`warn` against input nodes print with the input file's
  real spans; exit codes match compilation's conventions.
- Reflection, source locations, imports, FFI, and target queries answer
  identically to compile-time execution (fixture: a metaprogram that probes
  several and returns the answers as Code).
- Native and interpreter engines produce identical gate output; no process,
  linker-fallback, or reduced-runtime path exists in code or tests.
- A poison-mode gate pass is clean; `COIL_MTRACE=mem` attributes the
  invocation.

## Non-goals (v1), each deliberate

- **Mixed signatures.** `main [Code (slice u8)] -> Code` (code plus string
  options) and scalar/aggregate results are a real design question about
  mapping CLI text to values; deferred, not fudged.
- **A pre-transform view of the target.** The code-base contract hands main
  the settled program (post-expansion, post-check) — checker parity. A mode
  that shows the target before its own dialect's transforms is coherent
  future work.
- **The 8-parameter engine cap** — pre-existing; lifting it is engine work.
- **x86-64 in-memory JIT** — separate feature, separate motivation.
- **`coil build` on a Code-signed `main`** — an error with a helpful message
  for now ("this is a code→code program; `coil run` it"). Ahead-of-time
  caching already exists at the engine layer (`~/.cache/coil/metaprog`).

## What the branch taught (evidence index)

The two experiments live on `feat/scheme-continuation-pass` (checkpoint
`4ab6105`; report `docs/landing/07-run-metaprograms-as-programs.md`;
inventory `docs/branch-main-landing-inventory.md` items L8/L9/L13). Neither
is ported; this design keeps their lessons:

**Kept as ideas:**
- lazy staging through `stage-one-macro!` as the no-registration UX — the
  branch's soundest move, and it costs nothing here because `finish-macro`
  already does it;
- one dispatch point shared with expansion — the branch built
  `meta-engine-run-argv` and refactored the expansion path to delegate to
  it; this design gets the same property with zero engine change by entering
  above `finish-macro` instead of below it;
- parseable stdout as the composition surface, and
  `docs/sprout-staging.md` as the documentation model.

**Superseded:** the branch's `--meta QUAL` flag and `--program` mode. The
flag is replaced by signature-directed dispatch on `main` — consistent with
how the language already classifies metaprograms, and zero new CLI surface.
`--program`'s "keep the target as data" goal (which the branch approximated
by filtering modules out of setup compilation, by file basename, with a
mode-divergent `Program` source) is trivially true here: input is read,
never compiled.

**Kept as warnings:**
- `coil.meta.runtime` — a third Code implementation with faked source
  reflection, `abort()` for errors, a no-op `code-consume!`, and an
  unconditional mono lowering that deleted the "comptime-only code value
  reached mono" guard. The diagnosis to remember: *the hard part is not
  calling the function, it is supplying an authoritative `CtCtx`* — a
  reduced runtime can satisfy the calling convention and still be wrong
  about every question a metaprogram asks.
- The branch runner's own invocation layer sat below the promotion boundary,
  so it had to rebuild copy-out/escape-checking and still leaked the arena on
  every error path because `Diag` couldn't own its slices
  (branch `metaengine.coil:1665`, `docs/jolt-code-memory-ownership-options.md`
  §10). Entering through `expand-macro` sits *above* the boundary where main
  already solved this.
- Four-pass CLI parsing and `--`-blind option scans — avoided here by having
  almost no CLI surface to parse at all.
