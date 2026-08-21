# Coil FFI and Hosted Runtime Gaps Found by the Agent Harness

## Implementation status

The foundational gaps identified here are now implemented in Coil:

- `cimport` discovers the active Darwin SDK, compiles header names through a real
  include translation unit, preserves Clang diagnostics, strips nullability and
  restrict qualifiers, maps fixed C arrays, folds object-like macro expressions,
  and emits ABI-sized/aligned opaque records when fields cannot be represented.
- `coil.selectors` supports waiting for multiple tagged descriptors against an
  absolute or relative deadline.
- `coil.cancellation` supplies an idempotent, thread-safe, selector-readable wake
  source.
- `coil.region` supplies a thread-confined tracked allocator with exact-size and
  exact-alignment allocation, resize, individual free, and idempotent bulk close.
- `coil.sync` supplies allocator-aware mutexes, conditions, retryable once execution,
  and generation events. Pthread storage uses probed target size/alignment rather than
  guessed layouts or private platform type names.
- `coil.signals` converts the supported termination/user signals into a nonblocking,
  selector-readable subscription with explicit process-global ownership and cleanup.
- `coil.socket` owns IPv4 TCP listener/connection layouts, options, time-bounded accept,
  selector watches, I/O, and idempotent descriptor cleanup.
- `coil.subprocess/run` adds cwd, bounded concurrent stdout/stderr capture, deadlines,
  cancellation, process-group termination, and guaranteed reaping.

Focused executable regressions live under `tests/stdlib/*_test.coil`. The remaining
architectural recommendation is to keep these facilities in Coil rather than recreating
them in application-local C shims.

## Context

The Coil agent harness introduced a project-local C file, `harness_posix.c`, while
hardening concurrent service lifecycle behavior. That file implemented authorization
wakeups, shutdown signaling, socket configuration, a test client, and scoped allocation
ownership.

The C file was not introduced because Coil lacked C interoperability. Coil already
supports direct C function declarations, callbacks, function pointers, target-aware
metaprogramming, custom allocators, and header importing. Earlier versions of the
harness implemented several of these facilities directly in Coil through the C FFI.

The real problem was ergonomic: application code had to reconstruct low-level ABI and
concurrency protocols which belong in Coil's importer or hosted standard library. The
local C shim made those details convenient, but placed them in the wrong repository and
created an unnecessary second implementation language.

## What Coil already supports

Coil already provides the fundamental capabilities needed by the harness:

- direct calls to C and POSIX functions with `extern`;
- C-compatible callbacks and function pointers;
- opaque pointer handles represented as `(ptr i8)`;
- `cimport` generation from real C headers;
- import of function declarations, typedefs, enums, records, and literal macros;
- compile-time target selection and metaprogramming;
- `sizeof` and `alignof` for types represented in Coil;
- atomics and hosted threads;
- selectors and file-descriptor I/O;
- subprocess spawning and pipe access;
- explicit allocator vtables.

Accordingly, the harness did not encounter a general FFI limitation. It encountered
several places where correct, portable use of those capabilities was too manual.

## Opaque pointers versus opaque values

Coil can represent a C-owned opaque object as a pointer:

```coil
(ptr i8)
```

This is sufficient when C creates and owns the object's storage. LLVM handles are a
typical example: Coil passes the handle back to C without knowing its representation.

`pthread_mutex_t` and `pthread_cond_t` are different. Their fields are intentionally
opaque to applications, but POSIX expects the caller to provide storage:

```c
pthread_mutex_t mutex;
pthread_mutex_init(&mutex, NULL);
```

To allocate such a value, Coil must know its target-specific size and alignment even
though it must not expose or depend on its fields.

The harness previously worked around this by allocating 64 bytes aligned to 8 bytes for
each pthread object. That was a guess, not a portable ABI contract.

### Needed feature: caller-owned opaque C values

`cimport` should preserve ABI metadata for opaque or intentionally uninspectable value
types. Conceptually, this should work:

```coil
(cimport "pthread.h")

(defstruct Mailbox
  [(mutex pthread_mutex_t)
   (condition pthread_cond_t)])
```

The imported type needs:

- target-specific size;
- target-specific alignment;
- C ABI identity;
- permission to allocate it and take its address;
- prohibition on inspecting fields when the header does not provide a stable layout.

An explicit form would also be sufficient:

```coil
(defopaque pthread_mutex_t
  :size (c-sizeof "pthread_mutex_t")
  :align (c-alignof "pthread_mutex_t"))
```

The important property is that an unsafe `(primitive/alloc-stack pthread_mutex_t)` and allocator-backed
storage become target-correct without a guessed byte count.

## System constants and record layouts

POSIX constants such as `SOL_SOCKET`, `SO_REUSEADDR`, `AF_INET`, and `SOCK_STREAM` are
usually macros or enum values rather than linker symbols. A plain `extern` declaration
cannot retrieve them at runtime.

This is exactly what `cimport` is intended to solve. It already processes:

- integer and floating-point object-like macros;
- enum constants;
- typedefs;
- record declarations;
- function declarations.

The harness should import socket constants and layouts from the platform headers:

```coil
(cimport "sys/socket.h")
(cimport "netinet/in.h")
```

It should not manually select numeric constants or construct `sockaddr` as a byte array
with target-specific offsets.

### Needed improvements

#### Reliable system-header discovery

`coil cimport pthread.h` and imports of standard socket headers should work without
manually locating a platform SDK. On macOS, the importer must use the active Xcode or
Command Line Tools SDK and its sysroot. During cross-compilation, it must use headers
for the selected target rather than the host.

#### Constant-expression evaluation

Simple literal macros are already supported. System headers also contain aliases,
casts, and expressions:

```c
#define OPTION_A (BASE_OPTION | 4)
#define OPTION_B ((int)0x1000)
```

The existing probe machinery should be integrated into ordinary importing so these
constants are evaluated automatically when they cannot be translated syntactically.

#### Complete record importing

Common hosted types such as `sockaddr_in`, `timespec`, `timeval`, and `pollfd` require
support for:

- typedef chains;
- nested and anonymous structs or unions;
- fixed arrays;
- target-specific integer types;
- padding and alignment;
- records whose storage is known but whose fields are intentionally unavailable.

If a record cannot be safely exposed as a normal Coil struct, it should fall back to an
opaque ABI-sized value rather than being skipped or manually reconstructed.

## Hosted standard-library abstractions

Even perfect header importing should not require every application to implement
pthread, signal, socket, and process protocols itself. These facilities belong in the
hosted Coil standard library.

### Synchronization

Coil needs typed synchronization values such as:

```coil
Mutex
Condition
Event
Once
```

For the harness, a generation-based event would directly replace its authorization
mailbox:

```coil
(let [event (event-new allocator)
      observed (event-generation event)]
  (event-notify-all! event)
  (event-wait event observed timeout-ms))
```

The implementation must prevent lost wakeups and return a typed result distinguishing
notification, timeout, and failure.

### Selector-integrated cancellation

The harness frequently needs to wait for one of several conditions:

- a listening socket becomes readable;
- a subprocess writes stdout or stderr;
- an authorization decision arrives;
- a cancellation token is requested;
- an absolute deadline expires.

A unified interface should permit:

```coil
(select
  [(Readable listener)
   (Readable process-stdout)
   (Readable process-stderr)
   (Cancelled cancellation)]
  :deadline deadline)
```

This would remove application-specific condition variables, self-pipes, and polling
loops.

### Signals

Signals should be surfaced as selector events:

```coil
(let [signals (signal-subscribe [SIGINT SIGTERM])]
  (select [(Readable listener)
           (Signal signals)]))
```

The library should own the async-signal-safe platform mechanism. Applications should
not need to install callbacks, maintain process-global signal state, or construct
self-pipes.

### Typed sockets

The socket library should own header imports, descriptor lifetime, address structures,
and option constants:

```coil
(let [listener (tcp-listen
                 :host "127.0.0.1"
                 :port 8080
                 :reuse-address true)]
  (tcp-accept listener
              :read-timeout-ms 5000
              :write-timeout-ms 5000))
```

This replaces manual calls to `socket`, `bind`, `listen`, `accept`, `setsockopt`, and
`poll`, along with hand-built `sockaddr` storage.

### Region allocator

The harness needs allocation ownership scoped to a request, run, or worker. Closing the
scope must release every retained allocation, including allocations made through a
normal Coil allocator vtable.

```coil
(let [region (region-new parent-allocator)]
  (let [allocator (region-allocator region)]
    ...)
  (region-close! region))
```

The API should state whether a region is thread-confined or thread-safe. A thread-safe
implementation must preserve requested sizes and alignments and support allocation,
resize, individual free, and bulk close.

### Complete subprocess execution

The immediate application need is a safe Bash tool. The existing subprocess module can
spawn processes and expose pipes, but the harness needs a cohesive operation which
coordinates output draining, process completion, cancellation, and deadlines:

```coil
(subprocess/run
  :program "/bin/bash"
  :args ["bash" "-lc" command]
  :cwd workspace
  :stdout (Capture :limit 1048576)
  :stderr (Capture :limit 1048576)
  :deadline deadline
  :cancellation cancellation)
```

The result should report:

```text
stdout
stderr
exit status or terminating signal
timed out
cancelled
stdout truncated
stderr truncated
```

The implementation must drain stdout and stderr concurrently so a child cannot block
when one pipe fills. Cancellation and timeout must terminate the process group, not
only the immediate shell, and cleanup must reap the child on every path.

## Mapping from the harness C shim

The current project-local functions map to Coil features as follows:

| Existing facility | Coil replacement |
| --- | --- |
| `harness_mailbox_*` | Standard-library `Event` or `Condition` |
| `harness_shutdown_*` | Signal subscription plus selector cancellation |
| `harness_accept_with_timeout` | Typed socket accept and socket options |
| `harness_open_partial_client` | Coil socket client code in the test |
| `harness_allocation_domain_*` | Standard-library region allocator |

Once these replacements exist, the harness can delete:

- `src/infra/harness_posix.c`;
- the `[cc]` source entry in `Coil.toml`;
- every `extern harness_*` declaration;
- the Coil wrapper modules which exist only to wrap those symbols.

## Recommended implementation order

1. Complete subprocess execution with cwd, bounded capture, deadlines, cancellation,
   and process-group termination. This immediately enables a Coil-native Bash tool.
2. Selector-integrated cancellation and deadlines.
3. A scoped region allocator.
4. Standard synchronization primitives, especially a generation-based event.
5. Signal subscriptions integrated with selectors.
6. Typed TCP listener and connection APIs.
7. Caller-owned opaque C values and stronger system-header importing.

The ordering is based on immediate product value and dependency leverage, not on the
importance of the underlying FFI work. Opaque values and header importing remain the
correct long-term solution for portable hosted bindings.

## Architectural rule

Application repositories should not add native source merely because direct FFI is
verbose or a hosted protocol is subtle. If Coil can express the operation but the code
is repetitive, unsafe, or platform-specific, the missing abstraction belongs in
Coil's importer or hosted standard library.

Project-local native code should require a documented capability gap, a minimal
reproduction, and an explicit decision that the gap cannot reasonably be addressed in
Coil first.
