# Stateful JIT

Import `coil.jit`. One session owns the accepted environment and native code.
Every submission parses, expands, checks, and emits only its new forms. Later
submissions can use accepted types, functions, generics, macros, and imports.

```coil
(import "coil.alloc" :use [malloc-allocator])
(import "coil.jit" :as jit)

(let [(mut session) (jit/jit-session-new (malloc-allocator))]
  (jit/jit-compile! (mut session)
    "(defstruct Point [(x i64)]) (defn base [] (-> i64) 40)")
  (jit/jit-compile! (mut session)
    "(defn answer [] (-> i64) (+ (base) 2))")
  (jit/jit-compile-with-entry! (mut session) ""
    "(if (= (answer) 42) 0 1)")
  (jit/jit-reset! (mut session)))
```

Compilation returns zero on acceptance. Read `jit-diagnostic` after failure.
`jit-compile-with-entry!` evaluates an `i64` entry: zero accepts the candidate;
nonzero rejects it. Runtime side effects are the metaprogram/client's transaction
policy. A rejected or aborted candidate does not replace accepted metadata.

Use `jit-prepare!` / `jit-prepare-with-entry!`, then `jit-commit-prepared!` or
`jit-abort-prepared!`, to control publication separately from compilation.
`jit-evaluate!` accepts an expression of any type and discards its result.

## Definitions and metaprogram policy

Ordinary definitions are static. Reusing an accepted function identity is an
error. Dynamic update semantics belong to metaprograms, such as `coil.repl`:

```coil
(jit/jit-compile-with-entry! (mut session)
  "(import \"coil.repl\") (defn f [] (-> i64) 15)"
  "(coil.repl/publish)")
(jit/jit-compile-with-entry! (mut session)
  "(defn f [] (-> i64) 27)"
  "(coil.repl/publish)")
```

The policy publishes through a typed Var. Existing callers observe compatible
updates. The terminal REPL enables this policy by default. Types, macros, generic
functions, and `defn*` definitions remain static.

For your own publication policy, import `coil.jit.lifetime` in the submitted
program and annotate generated concrete runtime implementations:

```coil
(import "coil.jit.lifetime")
(defn implementation :jit/retain false [] (-> i64) 27)
```

`false` excludes that function from the session's metadata roots after publication.
Its native code can still be called through a published pointer. A retained
initializer, generic, or metaprogram can keep the compiler definition alive
through a dependency. An unused implementation loses its compiler metadata.
The annotation is rejected on generic and Code-returning functions. Omission
preserves ordinary static retention. Give replacements distinct native identities.

## Ownership

A successful submission publishes a compact graph of live metadata and releases
its compiler and linker scratch. The next success replaces that metadata graph;
accepted compilation arenas do not accumulate. Source locations and hygiene
aliases are retained only while referenced by live metadata or session Code.
The API does not retain a submission-source journal; the former `jit-source`
accessor has been removed. Keep a journal in the client if your application needs one.

Native code and its necessary symbol/dependency data have separate ownership.
Previously published function pointers may remain callable after metadata is
retired. Code mappings are page-sized, and code that remains callable still
occupies memory. LLVM uses one ORC linker per session and resource trackers per
object, rather than retaining a compiler engine per submission.

Use `export-c` for a stable C symbol/ABI and `jit-symbol-address` for its address.
Retain a generation token with `jit-generation-retain-current!` when holding a
pointer outside the owner's immediate operation; release it with
`jit-generation-release-token!`. Reset returns `-1` while client leases are live.
After releasing them, `jit-reset!` releases the accepted environment and native
resources. The session container itself has the allocator's lifetime.

Set `COIL_JIT_TRACE=1` to inspect actual parse/check/emit events and the accepted
metadata byte count. Add `COIL_JIT_TRACE_MEMORY=1` for a census of retained record
types. The trace separates live payload bytes from packed storage, which also includes
alignment gaps. These counts describe the compiler metadata graph; native mappings
and linker bookkeeping are separate. RSS also includes allocator caches and process
infrastructure, so the tests check both logical retained bytes and process memory.
