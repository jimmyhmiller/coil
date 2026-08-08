# Coil — what's left

An honest map of the gap between "a sharp, self-hosted compiler" and "a language you'd
reach for instead of C or Zig". Ordered by what blocks adoption, not by how interesting
the work is.

## Where Coil stands

The compiler core is done and is not the bottleneck. Coil is self-hosted, self-verifying
(rebootstrap fixpoint + the `tests/compiler/oracle` gates over a 96-file corpus), self-hosts on
macOS arm64 and Linux x86-64, emits wasm, and even runs *inside* wasm where it
self-compiles to a byte-identical arm64 binary. Diagnostics carry `file:line:col` and a
caret. DWARF works through lldb. Traits, generics, sums, slices, strings, a module
system, comptime with the whole language available, whole-program checkers and
transforms, `coil test`, `coil fmt`, `coil repl`, `Coil.toml` projects, `cimport` — all
shipped.

What is missing is livability, reach, and the ability for someone who is not the author
to use it.

---

## 1. Nobody else can adopt it yet

### 1.1 Dependency story: mostly LANDED; no lockfile

Largely stale. `Coil.toml` has `[dependencies]`, and it works:

    [dependencies]
    local_math  = { path = "../local-math" }          # or the shorthand "../local-math"
    remote_math = { git = "https://…", sha = "0123…" }

Each dependency root joins the namespace index, so a consumer imports the namespace the
dependency's source DECLARES (`local_math.numeric`) regardless of where it sits inside
that dependency. Git dependencies are fetched and checked out detached under
`.coil/deps/<name>-<sha>`; a full 40- or 64-digit commit SHA is required and branches
and tags are deliberately refused, so pinning is content-addressed by construction.
`[link] search-paths` covers the library search path this section also claimed missing.
Verified end to end with a path dependency, including a library shipping a metaprogram
that the consumer enables with one `[metaprograms] use` line; the git path is
implemented (`m-prepare-deps`) but has not been exercised against a real remote here.

**Still genuinely missing: a lockfile.** A `path` dependency floats with whatever is on
disk, and while a `git` dependency is pinned by its own SHA, nothing records the
resolved set for a whole tree, so transitive resolution is not reproducible from the
manifest alone.

### 1.2 No release or versioning story

`coil --version` does not exist — it prints `coil: unknown command '--version'`
followed by the usage text and exits 1. There is no release artifact, no install path,
no channel — the compiler is a binary committed to a repo.
Anyone adopting Coil needs to answer "which Coil?" and today there is no answer.

### 1.3 Diagnostics stop at the first error

The type checker reports one error and stops. Spans across `import`/`include` are
`DUMMY`, so a diagnostic about imported code cannot point at it — that needs multi-source
span ids, which is also the last gap in DWARF for imported functions.

This blocks more than daily use: `docs/design/SEMANTIC_METAPROGRAMS.md` needs a
collect-and-continue mode for metaprogram-authored diagnostics, so one fix pays twice.
`warn`/`report` already collect — the compiler's own checker is the part that doesn't.

### 1.4 No LSP

`src/tooling/editors/emacs/coil-mode.el` is the entire editor story. Spans exist, the resolver already
computes definitions and references, and `coil check` is fast on a single file, so the
hard inputs are in place — this is mostly plumbing, and it is the highest-visibility
adoption item. It requires 1.3 first: an editor cannot show one error at a time.

---

## 2. Blocks writing real programs

### 2.1 Standard library breadth

25 modules, ~3.2k lines total. Missing outright: **time/clock**, **process/env**,
**sockets**, **random**, general **sort**, **path** manipulation, **buffered** reader/
writer, **UTF-8** handling beyond bytes, a growable **string builder**, **JSON** (it
lives in `src/examples/`).

**Concurrency is the biggest hole**: `src/stdlib/thread.coil` is 23 lines wrapping
`pthread_create`/`join`, with no mutex, condvar, channel or thread pool — while
`metaengine.coil` contains a working portable counting semaphore that should be lifted
into `src/stdlib/`.

### 2.2 Compile speed and scale

Measured: the 31k-line self-host builds in ~18s wall (`emit-obj`, ~14.4s user); a small
file is ~0.24s. There is no incremental compilation, no per-module object cache, no
parallel codegen, and monomorphization is whole-program. At 100k lines that is a minute
per edit.

Options, roughly in order of payoff per effort: cache per-module expansion and IR;
parallel codegen; use the arm64 backend as the fast debug path (it is already ~17× faster
than LLVM on the compiler itself); then attack incremental mono.

One cheap win sitting inside mono: `seed-concrete-funcs` (`mono.coil:1065`) seeds the
worklist with *every* non-generic function in the program, so an empty `main` still
monomorphizes and emits 214 LLVM functions that `globaldce` then deletes. Mono's worklist
already is a precise, type-aware reachability analysis — seeding it from roots (`main`,
`export-c` entries, `deftest`s, plus an explicit keep list for asm/linker-script
references) would let it drop dead code before codegen instead of after. Two latent gaps
have to close first, both harmless while everything is seeded: `EFnPtrOf` (`mono.coil:711`)
never queues its target, and `EMakeDyn` (`mono.coil:733`) ignores its `methods` list, which
is exactly the vtable contents. The wasm collector `wcollect-expr!`
(`codegen_wasm.coil:492`) has the same `EMakeDyn` omission today, which is an independent
wasm+`dyn` bug. Binary size would not change — only compile time. Expect a whole-corpus
snapshot re-bless.

### 2.3 Windows

macOS arm64 and Linux x86-64 only. Windows needs PE/COFF and the MS x64 ABI. This is the
single biggest reach gap for desktop users.

---

## 3. Known defects

These are real, reproduced, and each has a clear repro:

- **A local does not shadow a macro in head position.** `(let [when 5] when)` is `5` but
  `(let [when 5] (when 1 2))` is `2` — the same name means the local in argument position
  and the macro in head position. The same root cause makes a *binder* named after a macro
  fail with a diagnostic about a form the author never wrote: `(defn f [(scope i64)] …)`,
  `(defstruct S [(scope …)])`, `(defsum V (Case [(scope …)]))`, `(deftrait T (m [(scope …)] …))`.
  Coil is a Lisp-1, so Clojure's tiering is the target (special forms win, then locals beat
  macros, then vars). Full analysis, repros and the fix sketch:
  [BINDING_AND_SHADOWING.md](BINDING_AND_SHADOWING.md).
- **Runaway comptime crashes the compiler.** A self-tail-recursive `(comptime …)` is not
  TCO'd on the comptime-thunk path, so around 10M frames it dies with a bus error
  instead of erroring. Core `loop` at comptime is fine, and the same function at runtime
  is fine. The tree-walking interpreter had a fuel budget; nothing replaced it.

  Re-measured: `coil check` on `(comptime (spin 100000000))` exits **138** (SIGBUS)
  with **zero output** — no diagnostic, no location, nothing naming comptime. Silent is
  the worst part; the failure is indistinguishable from a compiler bug.

  Why the obvious fix does not apply: the pipeline already runs on a 512 MiB pthread
  stack with a guard page (`run-on-big-stack`), and the comptime thunk runs on that same
  thread, so this IS the guard page firing — raising the ceiling only moves the cliff.
  A fuel budget cannot simply be restored either: the thunk is JIT-compiled native code,
  so a counter means instrumenting generated code. The contained option is to catch the
  fault — `sigaltstack` plus a SIGBUS/SIGSEGV handler on the worker thread that
  recognises a fault near its guard page and reports "comptime evaluation exhausted the
  stack; it may not terminate" — which converts a silent crash into a diagnostic without
  making runaway comptime terminate.
- ~~**An aggregate-typed `const` is not supported**~~ — FIXED, by deletion. The
  checker classified these as STATICS and elaborated references to `EStaticRef`, which
  no backend can lower because not one of the four ever pushes to `cg.statics` —
  statics were a half-built representation with no consumer. Dropping the
  classification lets an aggregate const take the path a non-literal const already
  took: `EComptime` of its value, materialized by the comptime engine at each use.
  Struct, sum, payload-carrying sum and array consts all work, on both backends. The
  trade is materialization per use rather than one shared global, and the const is now
  a VALUE rather than a place — `(field CONST x)` needs a `let` first, which the
  field-on-value diagnostic now tells you.
- **A comptime result cannot be a generic-instance aggregate** — `(Option i64)`,
  `(Pair i64 i64)` report "cannot be materialized". Plain structs, plain sums and arrays
  work.
- ~~**`--use` requires the target file to declare `(module …)`**~~ — FIXED. An entry
  file is named on the command line and imported by nobody, so it needs no namespace of
  its own; the compiler synthesizes one when the file declares none and something
  imports (`prepend-uses`). A file with no module and no imports is untouched, so only
  previously-rejected programs changed behaviour. Covered by four `gate-cli` cases.
- ~~**`--sanitize=address` cannot link**~~ — STALE, already fixed in code. The driver
  does not hardcode `cc` for a sanitized link: it uses `"$(llvm-config --bindir)/clang"`
  (`driver.coil`, the libmode branch), so the instrumenting LLVM and the ASan runtime
  are the same toolchain by construction. Verified end to end on macOS with Homebrew
  LLVM: the binary links `libclang_rt.asan_osx_dynamic.dylib` and reports both
  `heap-use-after-free` READ and WRITE.

  ⚠ One real trap while testing this, worth knowing before filing a "sanitizer does not
  work" bug: at the default `-O3` a store whose value is never read is dead-store
  eliminated, so a write-only use-after-free is optimized away BEFORE it can be
  reported and the program looks clean. Reads are caught at any level. Use `-O0` when
  probing writes.

## 4. Robustness

Gating is snapshot- and corpus-based. There is no fuzzing in the gates and no
differential property testing of the arm64 backend against LLVM beyond the fixed corpus.
A 60-case mutation fuzz (truncations, byte flips, chunk deletions) over `coil check`
produced no crashes or hangs, which is a good sign but not a guarantee. Worth adding: a
fuzz target in the gates, and a random-program generator diffing the two backends.

---

## 5. The moat — what to lean into once the above is handled

Coil has capabilities that are unusual or unique, and they are the reason someone would
switch rather than use Zig:

1. **Calling-convention-as-type.** Hand-rolled ABIs, syscall conventions, interrupt
   handlers, naked functions, JIT trampolines, register-pinned hot paths. The remaining
   piece is `adapt` — general convention-to-convention trampolines synthesized from two
   `defcc` descriptions.
2. **Raw LLVM IR + C embedding.** Coil hosts arbitrary LLVM IR and therefore hosts C.
   That opens `coil cc`, mixing C and Coil in one module with cross-language inlining,
   and reaching every LLVM intrinsic without compiler changes — a capability `@cImport`
   does not have.
3. **Metaprograms.** Checkers and transforms make a *dialect* a single import. The open
   work is core-form demotion (an interceptable `store!`), which unlocks write barriers
   and bounds checks on unmodified Coil, and function-signature reflection.
4. **Layout-as-types.** Per-field endianness in `:explicit` layouts is the missing piece
   for wire formats by value.
5. **Freestanding and embedded.** `--target …-none`, linker scripts, interrupt
   conventions, and MMIO are a natural fit; an MCU blink/UART demo in pure Coil, with
   device registers as `:bits` layouts and the vector table as shim-convention handlers,
   would be a compelling proof.

## 6. Suggested order

1. Multi-error reporting + multi-source spans (1.3) — unblocks the LSP and metaprogram
   diagnostics.
2. LSP (1.4) — the highest-visibility adoption win.
3. Packages + versioning (1.1, 1.2) — largely independent, can run in parallel.
4. The defects in §3 — each is small and each is a trust problem.
5. Stdlib breadth (2.1), starting with concurrency primitives and time.
6. Compile speed (2.2) before anyone has a 100k-line program, not after.
