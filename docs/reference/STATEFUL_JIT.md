# The REPL and the stateful JIT

Coil can keep a compiler running inside a process. The terminal REPL is one
client of it; `coil.jit` lets your own program be another. Both use one
model: a **session** holds an accepted environment (types, functions, traits,
impls, macros, generic specializations) plus the native code compiled so far.
Each submission compiles only its new forms against that environment, and is
either accepted as a whole or rejected as a whole.

## The terminal REPL

```text
$ coil repl
coil> (defn double [(x i64)] (-> i64) (* x 2))
coil> (defn quad [(x i64)] (-> i64) (double (double x)))
coil> (quad 3)
12
coil> (defn double [(x i64)] (-> i64) (* x 10))
coil> (quad 3)
300
coil> (double :x 3)
30
```

Forms may span lines; the prompt changes until the brackets balance. A result
prints through `Debug` if its type implements it, otherwise `Display`,
otherwise the REPL says it cannot print that type yet.

| Command | Does |
|---|---|
| `:type EXPR` | Show an expression's type without running it |
| `:load NAMESPACE` | Import a module (from the project, when run in one) |
| `:compile FORMS` | Submit arbitrary top-level forms, including metaprogram registrations |
| `:defs` | List current definitions |
| `:reset` | Throw away the environment and start fresh |
| `:cancel` | Abandon a half-typed multi-line form |
| `:help`, `:quit` | |

### What redefinition does

Ordinary non-generic `defn`s are live. Redefining one with the same signature
updates it everywhere, including in functions compiled earlier, like `quad`
above. Each REPL function is published through a `Var`: a stable, typed
function-pointer cell. Callers go through the cell, and a redefinition swaps
what it holds.

- A redefinition with a different signature, including different parameter
  names, is rejected, and the working definition stays.
- A failed submission changes nothing. `alloc-static` storage from accepted
  submissions survives later ones.
- Types, macros, generic functions, `def` bindings and `defn*` functions are
  static: you can't redefine them.
- A `(module NAME)` form switches the namespace for later input. It does not
  move existing definitions.

### A project's REPL

Run inside a project, `coil repl` reads its `Coil.toml`, so `:load app.module`
imports project sources and dependencies.

A native GUI usually has to own the main thread. For that, run
`coil repl --app package.module` and type `:run`. The module must define three
functions, each taking no arguments and returning `i64`:

| Function | Called |
|---|---|
| `repl-launch` | Once, on `:run`, on the main thread |
| `redraw` | On the UI thread after each accepted edit |
| `repl-stop` | On `:quit`, before the session is released |

You type edits on a terminal thread; the REPL compiles and publishes them on
the UI thread. It loads the frameworks the manifest lists into its own
process.

### Making an existing module live

Functions compiled in the initial build are normally bound statically, so
redefining one in the REPL does not reach callers compiled before it. To make
a module's functions live from the start, add this marker to it:

```text
(import "coil.repl")
(defn __repl_vars [] (-> Code) (coil.repl/var-module))
```

Its runtime functions then use the same `Var` publication as REPL
definitions. An ordinary ahead-of-time build leaves them at their initial
values.

## Embedding the compiler: `coil.jit`

```coil
(module example.jit-basics)
(import "coil.alloc" :use [malloc-allocator])
(import "coil.jit" :use *)

(defn main [] (-> i64)
  (let [(mut session) (jit-session-new (malloc-allocator))]
    (jit-compile! (mut session)
      "(defn base [] (-> i64) 40)
       (defn answer [] (-> i64) (+ (base) 2))
       (export-c [answer :as \"demo_answer\"])")
    (let [address (jit-symbol-address (mut session) "demo_answer")
          answer (cast (fnptr c [] i64) address)]
      (println "answer = {}" (call-ptr answer)))
    (jit-reset! (mut session))
    0))
```

```output
answer = 42
```

Importing `coil.jit` links the compiler into your program; a program that
doesn't import it links none of it. The installed toolchain ships it as a
prebuilt unit, so building against it is quick after the first time per
backend. `jit-session-new` finds the matching toolchain through `coil` on
`PATH`; `jit-session-new-with-toolchain` takes an explicit compiler command.

### Session API

| Call | Returns | Does |
|---|---|---|
| `(jit-compile! s SOURCE)` | 0 or nonzero | Compile top-level forms into the session |
| `(jit-compile-with-entry! s SOURCE ENTRY)` | 0 or nonzero | Compile, then run the `i64` expression ENTRY: 0 accepts, anything else rejects |
| `(jit-evaluate! s EXPR)` | 0 or nonzero | Evaluate an expression of any type and discard its value |
| `(jit-prepare! s SOURCE)`, `(jit-prepare-with-entry! s SOURCE ENTRY)` | 0 or nonzero | Compile without publishing |
| `(jit-commit-prepared! s)`, `(jit-abort-prepared! s)` | | Publish or discard the prepared candidate |
| `(jit-symbol-address s NAME)` | `(ptr i8)` | Address of an `export-c` symbol; null if absent |
| `(jit-diagnostic s)`, `(jit-pending s)`, `(jit-status s)` | | Why the last submission failed; the pending candidate |
| `(jit-reset! s)` | 0, or -1 | Release everything and start empty; -1 while leases are held |
| `(jit-session-free! s)` | 0, or -1 | Reset, then free the session itself and null the handle; -1 while leases are held |

A submission sees everything accepted before it. Never resubmit accepted
source, because definitions are not overwritten (see below). A `(module NAME)`
form selects the namespace for later submissions; it starts as `jit.session`.
A module accepted earlier, or declared earlier in the same source, can be
imported by name like one on disk.

- Compilation and publication are transactional. A rejected candidate,
  including one rejected by its entry expression, leaves the accepted
  environment and native code as they were. Coil does not roll back the
  entry's own runtime effects; undoing them is the caller's job.
- Preparing a second candidate aborts the first. There is no API to replace
  the whole source or replay it.
- Serialize calls into one session. You may nest calls synchronously, but never
  call it from two threads at once. The calls may all come from one worker
  thread, and other threads may run code published by any session meanwhile.
  `jit-evaluate!` and entry expressions run on the calling thread.
- `COIL_META_MAIN=1` asks for metaprograms on the process main thread. An
  embedding host honors it only when it compiles on its main thread; a
  submission from any other thread fails with a diagnostic saying so.
- The session does not keep the source it was given. If you need a journal,
  keep one yourself.

### Calling compiled code

To call a function directly, give it a C name with `export-c`, look up its
address with `jit-symbol-address`, and cast the address only to its exact C
function-pointer type. An address stays valid while the generation that
published it is alive. To hold one beyond the current operation, take a lease:
`jit-generation-retain-current!` returns a token and
`jit-generation-release-token!` gives it back. `jit-reset!` refuses (returns
-1) while any lease is outstanding.

To lease without allocating at publication time, reserve capacity first with
`jit-generation-reserve-tokens!`, then call `jit-generation-retain-reserved!`
after acceptance. Reserving returns -1 for a bad count and -2 on allocation
failure. The reserved retain returns -1 if capacity is exhausted or there is
no current generation.

## Opting into redefinition

Plain SDK sessions are static: redefining an accepted function is an error,
and existing callers keep what they were compiled against. A metaprogram
decides whether to hot reload, and the REPL uses `coil.repl`'s policy. Opt in
by importing it and using its `publish` entry:

```coil
(module example.jit-reload)
(import "coil.alloc" :use [malloc-allocator])
(import "coil.jit" :use *)

(defn main [] (-> i64)
  (let [(mut session) (jit-session-new (malloc-allocator))]
    (println "first: {}"
             (jit-compile-with-entry! (mut session)
               "(import \"coil.repl\") (defn f [] (-> i64) 15)"
               "(coil.repl/publish)"))
    (println "replacement: {}"
             (jit-compile-with-entry! (mut session)
               "(defn f [] (-> i64) 27)"
               "(coil.repl/publish)"))
    (jit-reset! (mut session))
    0))
```

```output
first: 0
replacement: 0
```

Under this policy each function gets a fresh implementation identity per
version, published through a `Var`. Compatible replacements reach existing
callers. The policy records the identities in transactional session state, so
it never resubmits earlier bodies. Because such functions are `Var`s,
`export-c` cannot name them.

A metaprogram implementing its own policy can keep state across submissions
with `primitive/code-session-state` and `primitive/code-session-stage!`. A
later stage of the same transaction reads what an earlier stage staged with
`primitive/code-session-staged-state`.

### Renaming and retiring declarations

`(defalias Name Target)` gives a declaration a second name. It works for types,
constructors, functions, variants, consts and macros, used bare, through
imports, or fully qualified. A later submission may point the alias somewhere
else. New code then binds the new target, while code accepted earlier keeps
the target it bound:

```coil
(module example.jit-alias)
(import "coil.alloc" :use [malloc-allocator])
(import "coil.jit" :use *)

(defn main [] (-> i64)
  (let [(mut session) (jit-session-new (malloc-allocator))]
    (jit-compile! (mut session)
      "(defn area-v1 [(w i64) (h i64)] (-> i64) (* w h))
       (defalias area area-v1)
       (defn old-caller [] (-> i64) (area 2 3))")
    (jit-compile! (mut session)
      "(defn area-v2 [(w i64) (h i64)] (-> i64) (+ (* w h) 1))
       (defalias area area-v2)
       (defn new-caller [] (-> i64) (area 2 3))")
    (println "old and new callers agree with their own versions: {}"
             (jit-compile-with-entry! (mut session) ""
               "(if (and (= (old-caller) 6) (= (new-caller) 7)) 0 1)"))
    (jit-reset! (mut session))
    0))
```

```output
old and new callers agree with their own versions: 0
```

A submission can also retire accepted declarations, so it can declare
replacements under the same names:

```text
(retire-alias Name)             ; the alias stops resolving
(retire-trait Name)             ; the trait and every impl of it
(retire-impl [T…] Trait Type)   ; the trait impl with exactly this pattern
(retire-inherent [T…] Type)     ; inherent impls with exactly this pattern
```

The replacement may change method signatures. Native code already accepted
keeps what it bound. Retiring something that is not there has no effect. One
submission may bind a given name only once.

## Letting generated code go

Metaprograms that generate a new implementation per edit would otherwise keep
every old version's compiler metadata alive. Mark generated concrete
definitions so they stop being metadata roots once published:

```text
(import "coil.jit.lifetime")
(defn implementation :jit/retain false [] (-> i64) 27)
```

The native code stays callable through any pointer you hold. The compiler
metadata survives only while something retained still depends on it (a
caller, an initializer, a generic). The annotation is rejected on generic and
`Code`-returning functions.

Records and sums accept `:jit/retain false` too, before their field or
variant list. Their impls do not keep them alive by themselves: an impl
selected by a retired type is dropped along with it, so a migration impl from
`Old` to `New` does not keep `Old` alive.

### Versioned roots

A generated schema that must stay constructible until its next revision can be
kept alive through a versioned root:

```text
(defstruct Physical1 :jit/retain false [(value i64)])
(defn descriptor1 :jit/retain false :jit/root 1 :jit/root-version 1
  [] (-> Physical1) (Physical1 :value 7))
```

A later submission defines `Physical2` and `descriptor2` with the same root ID
and a larger version. Only the newest descriptor is a root, and its
dependencies stay alive; the older version's are released unless something
else needs them. IDs are scoped to the module. Duplicate updates of one root
in a submission, stale versions, non-positive values, and root annotations
without `:jit/retain false` are errors. A rejected candidate does not advance
a root.

## Checked states as values

A checked-only session (`jit-checked-session-new`) can hand out compiler states
as values, for tools like a live type checker that never run code.

| Call | Does |
|---|---|
| `(jit-env-empty)` | The state to build the first one on |
| `(jit-env-check s BASE SOURCE)` | Check SOURCE against BASE; returns a new state. BASE is unchanged |
| `(jit-env-valid? E)` | False for the empty state and for a failed check (see `jit-diagnostic`) |
| `(jit-env-defines? s E NAME)`, `(jit-env-live-function allocator s E …)` | Query a state |
| `(jit-env-stale-count s E)`, `(jit-env-stale-name s E I)` | Earlier functions this check may have broken |
| `(jit-env-definition-source s E NAME)` | The source to resubmit to recheck one |
| `(jit-env-release! s E)` | Release a state; any order |

Hold as many states as you like, such as before and after an edit, or two
edits of the same base. A check never rechecks functions it was not given, so
it reports instead the ones that read a function whose signature, or a struct
or sum whose shape, it changed. Those stay in the new state as they were.
Resubmit their source to recheck them. Body-only edits report nothing. Macros,
constants that mention constants, and impl availability are not tracked yet,
and a redefined function with trait bounds always counts as changed.

`jit-reset!` refuses while any state is held. A session that generates native
code refuses `jit-env-check`, as does source that stages session state.
`tests/compiler/features/jit_live_checker.coil` is a complete client.

## Discovering a program's sources

`(jit-read-source-graph allocator ENTRY)` finds an entry's source modules using
the same namespace roots and configuration as a build, without compiling
anything. Check `jit-source-graph-ok?`, then read `jit-source-graph-entry`,
`jit-source-graph-count`, and, by index, `jit-source-graph-module`,
`jit-source-graph-path` and `jit-source-graph-text`. On failure,
`jit-source-graph-diagnostic`, `jit-source-graph-error-path` and
`jit-source-graph-error-line` describe the error. The result belongs to the
allocator you passed. Prebuilt units appear as opaque dependencies, not as
sources.

## Platforms

On macOS arm64 the JIT uses Coil's own arm64 backend. On Linux x86-64 it
lowers each submission through LLVM, so a program embedding `coil.jit` there
must link LLVM:

```sh
coil build app.coil --link-flag "-L$(llvm-config --libdir)" --link-flag -lLLVM
```

The stock `coil repl` is already linked against LLVM. On both platforms, old
code stays mapped for function pointers that captured it. Each new
generation's `alloc-static` storage keeps the addresses the previous
generation gave it.

## Memory and tracing

Each accepted submission replaces one compact graph of live compiler metadata
and frees the compiler's scratch memory, so accepted compilations do not
accumulate. Scratch segments of 1 MiB and more are page mappings returned to
the system when freed, so a host does not stay large after a compile. The
first compile in a session, and the first after a reset, checks the implicit
prelude and takes about 250 ms; later compiles take a few milliseconds. Native code is owned separately: retiring metadata does not unmap
code that a published pointer may still call, and `jit-reset!` releases both.
Source text is kept only while live metadata refers to it.

| Variable | Shows |
|---|---|
| `COIL_JIT_TRACE=1` | Per-submission events on stderr: parsed declarations, checked and emitted function bodies (including nested units), the retained catalog, and retained byte counts |
| `COIL_JIT_TRACE_MEMORY=1` | With the above, a census of retained record types |
| `COIL_JIT_PROTECT=1` | Make accepted metadata read-only. A stray store faults at the store (SIGBUS on macOS, SIGSEGV on Linux) instead of corrupting a later edit. A checking mode: it costs a mapping per block |
| `COIL_TRACE=1` | Compiler phase timings, including the snapshot's scratch arenas |

To find the writer behind a `COIL_JIT_PROTECT` fault, run the program under
`lldb --batch -o run -o bt`.
