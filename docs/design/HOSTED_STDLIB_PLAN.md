# Hosted OS and network standard library — implementation plan

**Status:** design, not yet complete.

This plan turns the native-gap report into an implementation sequence for Coil's
hosted standard library. It is written against the current checkout, which already
contains a blocking libcurl client, wall and monotonic clocks, and a low-level async
runtime with epoll/kqueue readiness.

The target is an application that can perform ordinary hosted work in Coil without
an application-owned C adapter:

- launch a child process without a shell;
- exchange bytes through its standard streams with deadlines;
- make outbound HTTP(S) requests;
- access time, environment, and the current directory;
- report actual OS errors;
- use explicit, documented ownership for every resource.

The first implementation target is macOS and Linux. Wasm and freestanding targets
must continue to compile when these hosted modules are not imported.

## 1. Current baseline

Already available:

- [`coil.io`](../../src/stdlib/io.coil): capability-based `Reader`/`Writer`, fd
  readers and writers, short-read handling, `write-all`, and fixed-buffer `read-line`.
- [`coil.fs`](../../src/stdlib/fs.coil): open/close, streaming adapters, and whole-file
  read/write helpers.
- [`coil.time`](../../src/stdlib/time.coil): wall-clock and monotonic millisecond reads.
- [`coil.http.client`](../../src/stdlib/http_client.coil): blocking libcurl transport,
  byte bodies, repeated response headers, status codes, and connect/total timeouts.
- [`coil.async`](../../src/stdlib/async.coil): explicit task/poll/close contracts.
- [`coil.async-runtime`](../../src/stdlib/async_runtime.coil): Linux epoll and macOS
  kqueue readiness plus monotonic timers.
- [`coil.thread`](../../src/stdlib/thread.coil): a minimal pthread spawn/join wrapper.

Still absent or incomplete:

1. a process and pipe API;
2. a simple synchronous readiness/deadline API;
3. allocator-backed line reading;
4. sleep and duration/deadline helpers;
5. environment and current-directory helpers;
6. accurate errno capture in `io` and `fs`;
7. ergonomic constructors and cleanup for HTTP responses and OS handles.

This work does not require a compiler intrinsic. `extern`, C callbacks, variadic
calls, target selection, opaque pointers, explicit allocation, and packed layouts
are already sufficient.

## 2. Design rules

### 2.1 Capabilities stay explicit

Hosted APIs take the capabilities they use:

- allocation is a `(ptr Allocator)` argument;
- byte input and output use `Reader` and `Writer`;
- asynchronous operations use `Task`, `Context`, and `Parker`;
- no hidden global allocator, executor, or stdout handle is introduced.

Convenience constructors may use caller-provided storage, but must not hide a shared
`alloc-static` instance behind an API that represents per-instance state.

### 2.2 Borrowed and owned data are distinct in documentation

Coil currently has explicit allocation but no automatic destructor or move checker.
Therefore every resource API must document:

- which input slices are borrowed and for how long;
- which returned slices are owned;
- which object performs the deallocation;
- whether close is required, idempotent, or invalid after another operation.

The first version should use explicit `close`/`free` functions rather than adding a
new ownership feature to the compiler.

### 2.3 Errors preserve the OS result

Do not encode an error as a negative return value. A syscall wrapper must capture the
platform errno immediately after failure and return that positive code in a typed sum.

The initial common shape should remain small:

```coil
(defsum OsError
  (Syscall [(code i64)]))
```

Domain errors such as `Timeout`, `Eof`, `InvalidRequest`, and `AlreadyClosed` should
remain distinct from `Syscall`. A later diagnostic helper can turn an errno into a
borrowed platform message; messages must not replace the numeric code.

### 2.4 Platform layouts live in stdlib platform modules

Applications must not redeclare `timespec`, `pollfd`, `pid_t`, `posix_spawn` file
actions, epoll events, or kqueue events. Keep those layouts and constants in hosted
stdlib modules selected by `primitive/target-os`.

The public modules expose Coil structs and sums, not libc storage layouts. Linux and
macOS implementations may differ behind the same public API.

### 2.5 Blocking and asynchronous APIs are separate layers

The first process API should be blocking and easy to use. It may reuse the same
platform readiness primitives as the async runtime, but it should not require every
caller to construct a `Runtime`, `Task`, and `Parker` merely to read one line with a
deadline.

The async API remains available for applications that need multiple concurrent
operations.

## 3. Shared foundations

### 3.1 `coil.io`: errors and small conveniences

Change `fd-read` and `fd-write` to capture actual errno through one private platform
helper. Apply the same rule to `fs`, `async-runtime`, and future hosted modules.

Add:

- `write-line(writer, bytes)`, which writes bytes then one newline;
- a reusable `read-line-alloc(allocator, reader, max-bytes)`;
- an explicit result for `LineTooLong` rather than silently splitting or truncating;
- a buffered reader state object for sources where one-byte reads are too expensive.

`read-line-alloc` should consume the newline, return a line without it, return `Eof`
only when no byte was read, and preserve a final unterminated line. Its buffer growth
must be allocator-backed and failure-safe.

Do not make line reading process-specific. A process stdout pipe is just another
`Reader`.

### 3.2 `coil.time`: durations and deadlines

Keep wall time and monotonic time separate. Add:

- a `Duration` representation with checked millisecond/microsecond/nanosecond
  conversions;
- `monotonic-now` and `wall-now` helpers with typed failure;
- `deadline-after(duration)` and `deadline-remaining(deadline)`;
- `sleep(duration)`, retrying after interruption;
- `sleep-until(deadline)` for timeout loops.

Timeout APIs should accept an absolute monotonic deadline where practical. This
prevents repeated relative-time calculations from extending a timeout.

Conversion rules must reject negative durations where the underlying operation does
not support them and saturate or return an error instead of overflowing.

### 3.3 `coil.os` and `coil.fs`: environment and cwd

Add a small hosted OS module:

- `env-get(allocator, name) -> Result (Option (slice u8)) OsError`;
- optionally `env-get-borrowed(name)` for code that explicitly accepts libc lifetime
  and environment-mutation rules;
- `current-dir(allocator) -> Result (slice u8) OsError` with retrying growth, not a
  fixed path buffer.

The ordinary API should return allocator-owned bytes. The caller frees them with the
allocator used to obtain them.

Document that environment mutation is not synchronized by these helpers. Do not add
environment mutation until there is a clear cross-platform ownership contract.

## 4. Synchronous readiness

Add a `coil.poll` module with a small facade such as:

```coil
(defsum WaitError
  (Timeout)
  (InvalidFd)
  (Syscall [(code i64)]))

(defsum Interest (Readable) (Writable))

(defn wait-fd-until
  [(fd i32) (interest Interest) (deadline i64)]
  (-> (Result bool WaitError)))
```

The exact names may change, but the contract should distinguish readiness, timeout,
invalid descriptors, and syscall failure. A negative or explicit sentinel deadline
may represent “wait forever” only if that convention is documented consistently.

The implementation can use `poll`/`ppoll` initially. It should:

- convert an absolute monotonic deadline to a bounded relative timeout;
- retry `EINTR` without extending the deadline;
- report descriptor error/hangup as a readable event so callers can observe EOF;
- never close the descriptor it waits on;
- keep `pollfd` layout private to the platform module.

The async runtime may later share this platform code, but that refactor is not a
prerequisite for the process migration.

## 5. Child processes and pipes

Create [`process.coil`](../../src/stdlib/process.coil) as the main missing P0 module.
It should expose behavior rather than raw fork bookkeeping.

### 5.1 Public concepts

The public API needs these concepts:

- `Command`: executable plus argv, with no shell interpolation;
- stdio policy: inherited, null, or pipe for stdin/stdout/stderr;
- `Process`: child identity and lifecycle state;
- stdin as an `io.Writer`;
- stdout and optionally stderr as `io.Reader`;
- `try-wait`, `wait`, `terminate`, and `kill`;
- typed `ExitStatus` with normal exit code versus terminating signal;
- typed spawn and pipe errors.

An illustrative shape is:

```coil
(defsum Stdio (Inherit) (Null) (Pipe))

(defstruct Command
  [(program (slice u8))
   (argv (slice (slice u8)))
   (stdin Stdio)
   (stdout Stdio)
   (stderr Stdio)])

(defsum ExitStatus
  (Exited [(code i64)])
  (Signaled [(signal i64)]))

(defsum ProcessError
  (InvalidCommand)
  (Pipe [(error OsError)])
  (Spawn [(error OsError)])
  (Wait [(error OsError)])
  (NotRunning)
  (Timeout))
```

The final representation must account for Coil's caller-owned storage. A process
handle must not hide a global static or silently close a caller-owned descriptor.

### 5.2 Lifecycle policy

Make policy explicit:

- closing stdin closes only the parent-side pipe;
- closing stdout/stderr closes only the parent-side stream;
- `process-close` releases streams and reaps an already-terminated child;
- closing a live process does not terminate it unless the caller selected an explicit
  kill-on-close policy;
- `wait` is idempotent after a completed wait and returns the saved status;
- `try-wait` never blocks;
- `terminate` is best-effort signal-based termination; `kill` is forceful termination;
- every successful spawn has one clear reaping path, including partial setup failure.

### 5.3 Implementation strategy

Prefer `posix_spawn` where the platform's file-action ABI can be represented safely.
If the required storage is not stable or portable enough, use a carefully isolated
`fork`/`dup2`/`exec` fallback and document the multithreaded restrictions.

The implementation must set close-on-exec for parent-only pipe descriptors, close all
unused pipe ends in both parent and child, and never invoke shell parsing. Missing
executables and setup failures must be returned as errors rather than reported as a
normal child exit.

Process stdout reads should compose with `coil.poll` and `coil.io`:

1. wait for readability until the monotonic deadline;
2. read through the normal `Reader`;
3. distinguish timeout, EOF, and syscall error;
4. close stdin before waiting when the protocol requires EOF;
5. always reap the child.

## 6. HTTP client completion

Keep the current libcurl backend and public blocking request as the first stable path.
Do not expose curl option numbers or variadic calls to applications.

First make the existing API reliable and pleasant:

- add request initialization/defaults and a builder-like set of typed helpers;
- validate method, URL, timeout, and header inputs before allocating curl state;
- check every curl setup and response-info return code;
- make allocation failure distinguishable from an empty body/header;
- state TLS certificate and hostname verification as an explicit default contract;
- make all cleanup paths handle setup failure, callback abort, transport failure, and
  response allocation failure;
- keep repeated and ordered headers;
- retain the rule that non-2xx HTTP responses are successful transport results.

Add streaming only as a separate API after the blocking API is sound. Its callback
must specify:

- the byte ownership duration;
- whether the callback may retain or mutate the bytes;
- how backpressure is expressed;
- how cancellation/abort is returned;
- who frees state after callback abort.

The existing `response-free` contract can remain for the first release, but a response
constructor/deinitializer pair should remove the need for callers to manipulate raw
fields.

## 7. Test plan

Every milestone gets a focused Coil test plus at least one integration test. Use the
debug allocator and, where available, AddressSanitizer or leak detection for repeated
operations.

### I/O and time

- short writes and short reads;
- actual errno for a bad descriptor;
- interrupted sleep resumes for the remaining duration;
- monotonic deadlines do not extend after `EINTR`;
- line at EOF without newline;
- empty line;
- line exactly at the limit;
- line over the limit;
- allocator failure during line growth.

### Environment and filesystem

- present and absent environment variables;
- owned environment result survives later helper calls;
- cwd longer than the initial buffer;
- cwd failure preserves errno;
- file reader/writer composition with the new line helpers.

### Readiness

- readable pipe;
- writable pipe;
- timeout;
- EOF/hangup;
- invalid descriptor;
- signal interruption;
- descriptor remains open after wait.

### Process

- argv containing spaces and empty arguments;
- no shell expansion;
- stdin/stdout round trip;
- explicit stderr inheritance, null, and pipe;
- EOF after closing stdin;
- read timeout followed by successful cleanup;
- missing executable;
- normal exit;
- signal termination;
- already-exited child;
- repeated close and wait;
- concurrent spawn from multiple threads;
- cleanup after each pipe/spawn failure point.

### HTTP

- binary request and response bodies;
- empty body;
- repeated request and response headers;
- non-2xx response as a successful transport result;
- invalid URL and connection failure;
- connect timeout and total timeout;
- callback abort once streaming exists;
- repeated requests under allocation/leak checking;
- TLS verification failure and successful verified HTTPS request.

## 8. Delivery milestones

### M0 — contracts and regression fixtures

Write the public API docs, error conventions, ownership rules, and Linux/macOS test
fixtures. No behavior migration yet.

### M1 — I/O correctness and small helpers

Fix errno capture, add `write-line`, add allocator-backed line reading, and add tests
for short I/O, EOF, limits, and interruption.

### M2 — time and small hosted OS APIs

Extend `time.coil` with duration/deadline/sleep. Add environment access and dynamic
current-directory retrieval. Migrate callers immediately so these APIs get exercised
by real code.

### M3 — synchronous readiness

Add `coil.poll`, platform-private layouts, and deadline-aware fd waits. Integrate the
line reader with readiness without making `Reader` process-specific.

### M4 — processes

Implement pipes, spawn, stream adapters, wait status, termination, and cleanup.
Migrate the Codex-style app-server use case first, then add the full lifecycle tests.

### M5 — HTTP client hardening

Polish the existing libcurl client, add typed request helpers, close all error-path
leaks, and add streaming/cancellation only if a real caller needs it.

### M6 — application migration and deletion gate

Migrate all application callers. Then verify:

- no application-owned `.c` or `.h` files remain;
- no application `[cc].sources` entry remains;
- no direct provider curl/process shims remain;
- `coil verify` and the hosted integration suite pass on Linux and macOS;
- all timeout tests use monotonic deadlines;
- OS and transport errors retain their numeric codes.

## 9. Explicit non-goals

This plan does not add:

- a general async HTTP client before the blocking client is reliable;
- shell execution as a convenience default;
- environment mutation;
- Windows support;
- automatic destructors or a compiler ownership extension;
- compiler intrinsics for ordinary POSIX or libcurl operations;
- a promise that every libc ABI is portable through application-level externs.

Those can be revisited after the hosted API has real users and platform tests.

## 10. Definition of done

- `coil.process` launches commands without a shell and guarantees reaping.
- Process streams compose with `coil.io.Reader` and `coil.io.Writer`.
- Blocking reads and sleeps use monotonic deadlines.
- `coil.time`, `coil.os`, and `coil.fs` expose owned, allocator-explicit results.
- `coil.io` and `coil.fs` report actual errno values.
- `coil.http.client` has checked setup/cleanup paths and documented TLS behavior.
- Linux and macOS exercise the hosted APIs in CI.
- The consuming application contains no authored native adapter.
- The consuming application passes `coil verify` and its integration suite without
  project-owned C or C headers.
