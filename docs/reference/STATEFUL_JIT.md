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

### Generated types and versioned metadata roots

Records and sums also accept `:jit/retain false`, before their parameter/field or
variant list. A submission-only type remains available while retained checked
functions, initializers, ordinary types, traits or implementations need it.
Dependencies include nested field types, generic bodies and sum constructors.
Quoted source alone is not a checked type dependency. Native generation leases
continue to protect machine code after unused type metadata has retired.

An impl whose selection key includes a submission-only type is conditional
metadata: its generated methods do not independently keep that type alive.
The key includes the self type and inferred associated types. A migration impl
from Old to New therefore does not keep Old alive solely because New survives.
Retained callers and selected methods still keep their actual dependencies.
Inherent and generic impls follow the same rule. Retiring such an impl removes
its lookup entries and specializations together; a native lease continues to
protect already-published machine code independently.

For a generated schema that must stay constructible until its next revision,
publish a fresh descriptor through a versioned metadata root:

```coil
(defstruct Physical1 :jit/retain false [(value i64)])
(defn descriptor1 :jit/retain false :jit/root 1 :jit/root-version 1
  [] (-> Physical1) (Physical1 :value 7))
```

A later submission can define `Physical2` and `descriptor2`, using the same
positive root ID and a larger positive root version. Root IDs are scoped to the
function's module. Only the newest descriptor is a metadata root; its checked
call/type dependency closure remains retained. An older descriptor still stays
if other retained code calls it. Advancing a root to a fresh empty function
releases its old dependencies when no other roots need them.

The compiler rejects duplicate updates to one root in a submission, stale
versions, missing/nonpositive IDs or versions, and root annotations without
`:jit/retain false`. A rejected candidate does not advance the accepted root.
This is compiler metadata ownership; it does not replace the host's native code
leases or state publication transaction.

The structural `code-session-monomorphs` report is rebuilt from the native
program supplied to the accepted compilation. That program already includes
still-live reused specializations. Reports do not union all earlier reports:
retired artifacts disappear when they leave the compiler's native table, while
unrelated live artifacts remain. Rejected or aborted candidates do not replace
the accepted report.

## Ownership

Checked function bodies have immutable, nonmoving storage. Their typed pointer
closures are allocated as shared ranges; ordinary compiler indexes remain in
the replaceable snapshot. Overlapping ranges preserve interior aliases, and
any additional typed fields exposed by overlap are promoted before allocation.
The visitor generator audits the checked-body traversal to prevent mutable phase
state or separately owned source records from entering this boundary unnoticed.

Each snapshot owns every body block reached by its typed traversal. Blocks do
not own each other, so cycles can retire. The new snapshot acquires ownership
before the preceding one releases it. Source-provider snapshots have separate
ownership lists. This still traverses metadata and copies owner lists on each
publication; it is not yet a persistent query database.

Snapshot marking and relocation use a separate temporary arena. Pruning writes
retained metadata through its owning loader or resolution-state allocator;
marking tables are then discarded before relocation starts. After pointer
fixups and ownership transfer, relocation scratch is freed too. With
`COIL_TRACE=1`, `jit.snapshot.mark-scratch` and `jit.snapshot.copy-scratch`
report this arena separately from compilation scratch. Its peak counter spans
both traversals; live bytes describe the current traversal.

Accepted metadata is written once, up to the end of pointer fixups, and never
again. `COIL_JIT_PROTECT=1` enforces that for all of it: each sealed body block
and the whole published snapshot live in their own pages, made read-only once
publication completes, so a store into accepted metadata faults
at the store (SIGBUS on macOS, SIGSEGV on Linux) instead of corrupting a session
some edits later. It costs a mapping per block, so it is a checking mode rather
than the default; `scripts/tests/jit-static-session.py` runs every fixture with it
on. To locate a fault, run the fixture under `lldb --batch -o run -o bt`.

`COIL_JIT_TRACE=1` reports cumulative `body-copied-bytes` plus
`body-owned-bytes` and `body-owned-blocks` before releasing the preceding
snapshot. These count body payload storage, not allocator, page-index, or
ownership-list overhead. The memory gate checks body storage separately from
the relocated snapshot and also enforces its process-memory limits.

Source names, source text, and line tables are immutable shared payloads owned
independently of the copied metadata graph. Each accepted snapshot and configured
source provider retains its own deduplicated payload list. Replacing a source
slot creates a new payload; retiring the last snapshot that refers to a payload
releases it. Rejected candidates acquire no snapshot ownership. Other metadata
still uses the precise graph relocation path; this is not yet an incremental
semantic database.

With `COIL_JIT_TRACE=1`, `source-copies`, `source-copied-bytes`, and
`source-reuses` are cumulative counters for that session. `source-owned-bytes`
reports payload storage before the preceding snapshot is released. These
counters are separate from `retained-bytes`, which counts the relocated graph.

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
`jit-generation-release-token!`. For a coordinated publication that must avoid allocation, call `jit-generation-reserve-tokens!` before native acceptance, then `jit-generation-retain-reserved!` after acceptance. Reservation adds bookkeeping capacity without taking a lease; reserved acquisition returns `-1` without acquiring ownership if capacity is exhausted or there is no current generation. Reservation returns `-1` for an invalid count and `-2` on allocation failure. The ordinary retain API reserves its bookkeeping before changing native ownership.

Reset returns `-1` while client leases are live.
After releasing them, `jit-reset!` releases the accepted environment and native
resources. The session container itself has the allocator's lifetime.

Set `COIL_JIT_TRACE=1` to inspect actual parse/check/emit events and the accepted
metadata byte count. Add `COIL_JIT_TRACE_MEMORY=1` for a census of retained record
types. The trace separates live payload bytes from packed storage, which also includes
alignment gaps. These counts describe the compiler metadata graph; native mappings
and linker bookkeeping are separate. RSS also includes allocator caches and process
infrastructure, so the tests check both logical retained bytes and process memory.
