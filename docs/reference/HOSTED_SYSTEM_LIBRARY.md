# Hosted system library

Coil's hosted system APIs follow Python's separation of concerns while retaining
Coil's typed errors, explicit allocation, and caller-owned resources. They target
native Linux and macOS. Importing none of these namespaces keeps freestanding and
WebAssembly programs independent of libc.

| Python area | Coil namespace | Stable surface |
|---|---|---|
| `os.environ`, `os.getcwd`, `os.chdir` | `coil.os` | owned environment lookup, set/unset, dynamic cwd lookup, cwd change, centralized errno and fd primitives |
| `time` | `coil.time` | wall and monotonic clocks, normalized durations, monotonic deadlines, interruption-safe sleep |
| `selectors` | `coil.selectors` | synchronous readable/writable/hangup/error waits with relative or absolute timeout |
| `subprocess` | `coil.subprocess` | shell-free spawn, inherited/null/piped/merged stdio, stream adapters, nonblocking/blocking/deadline waits, signals, reaping |
| process facade/facts | `coil.process` | PID/parent PID, typed signals, and qualified re-exports of `coil.subprocess` |

This is Python-inspired organization, not a promise that dynamically typed Python
objects or every platform-specific `os` function are reproduced verbatim.

## Result-flow ergonomics

`try`, `try!`, `try?`, `try-or!`, `some-or!`, and `ensure!` are ambient core macros.
They keep system code linear:

```coil
(defn main [] (-> i64)
  (try
    (let [a (alloc/malloc-allocator)
          cwd (try-or! (os/current-dir a) 1)
          cwdp (alloc/stack os/OwnedString)]
      (store! cwdp cwd)
      (println (os/owned-string-slice cwd))
      (os/owned-string-free a cwdp)
      0)))
```

For existing code, the standard lint profile includes the Result-flow checker and safe fix:

```text
coil lint app.coil --diff
coil lint app.coil --fix
```

It rewrites only `Result` matches whose ignored `Err` arm is a plain fallback. If the
error binder is used, the match contains domain logic and is deliberately untouched.

## `coil.os`

`env-get(allocator, name)` returns `Result (Option OwnedString) OsError`. The value is
copied before returning and survives later environment changes. `env-set` supports an
overwrite flag; `env-unset` succeeds for an absent variable. Empty names, names with
`=`, and embedded NUL bytes are `InvalidInput`.

`current-dir(allocator)` grows its buffer until `getcwd` succeeds; it does not assume
`PATH_MAX`. `change-dir` borrows its input for the call. Environment and cwd mutation
are process-global: applications must synchronize them with other threads.

Every `OwnedString` records its allocation capacity. Store the returned value in a
place and call `owned-string-free` with the same allocator. That operation clears the
object and is idempotent for that object.

`OsError` distinguishes `Syscall(code)`, `OutOfMemory`, and `InvalidInput`. Numeric
errno is captured immediately and remains authoritative.

## `coil.time`

`Duration`, `Instant`, and `SystemTime` prevent mixing relative durations, monotonic
deadlines, and adjustable wall time. Constructors accept seconds, milliseconds,
microseconds, or nanoseconds and normalize to seconds plus `0 <= nsec < 1e9`.

Use `monotonic-now` and `deadline-after` for timeouts. `wall-now` is for timestamps.
`sleep` uses `nanosleep` and resumes the reported remainder after `EINTR`;
`sleep-until` uses a monotonic deadline. The older `wall-now-ms` and
`monotonic-now-ms` remain convenient compatibility functions.

## `coil.selectors`

Create an interest with `interest-readable`, `interest-writable`, or
`interest-read-write`, then call:

- `wait-fd` to wait indefinitely;
- `wait-fd-for` with a `Duration`; or
- `wait-fd-until` with an absolute monotonic `Instant`.

The result has independent `readable`, `writable`, `hangup`, and `error` flags.
`InvalidFd`, `Timeout`, and syscall failure are distinct. A wait never closes or takes
ownership of the descriptor. Readiness is advisory, and concurrent close/reuse of the
same integer descriptor must be synchronized by the application.

## `coil.subprocess` and `coil.process`

`spawn` takes an allocator, caller-owned `Child`, program, argument slice, and three
stdio policies. Arguments exclude `argv[0]`; Coil sets it to the program. `execvp`
performs PATH lookup, empty arguments are preserved, embedded NUL is rejected, and no
shell is involved.

The stdio policies are `inherit-stdio`, `null-stdio`, `pipe-stdio`, and
`merge-stderr` (stderr only). Piped streams adapt to ordinary `coil.io` capabilities
through `child-stdin-writer`, `child-stdout-reader`, and `child-stderr-reader`.

Lifecycle is explicit:

1. `child-close-stdin` sends EOF without touching output streams.
2. `child-try-wait` returns `None` while running; `child-wait` blocks and caches status.
3. `child-wait-until` returns `Timeout` while leaving the child valid and running.
4. `child-terminate` and `child-kill` only send a signal; the caller still waits.
5. `child-kill-and-wait` is the forceful leak-free finalization path.
6. `child-close` closes parent streams but returns `StillRunning` until the child has
   been reaped. It never silently kills or detaches a child.

`ExitStatus` distinguishes `Exited(code)` from `Signaled(signal)`. A missing
executable is reported synchronously as `SpawnFailed`, using a close-on-exec child
error pipe rather than pretending it exited with code 127.

The current POSIX implementation performs only async-signal-safe setup between
`fork` and `exec`. Pipe creation plus close-on-exec setup is not yet an atomic portable
operation across Linux and macOS, so concurrent spawning from multiple threads is not
claimed as safe in this release. A future platform shim or `posix_spawn` backend can
remove that limitation without changing the public lifecycle.

`coil.process` provides `id`, `parent-id`, and typed `send-signal`. It also re-exports
the public `coil.subprocess` surface, so both `process/id` and `process/Child` work
through one qualified facade. Canonical child declarations remain owned by
`coil.subprocess`, matching Python's separation
between `os` process facts and `subprocess` command lifecycle.

## Next extensions

The stable surface intentionally leaves these staged rather than underspecified:

- multi-fd selector registration and bounded simultaneous `communicate`;
- child cwd and environment replacement/overlay;
- atomic multithread-safe spawning backend;
- process groups, sessions, resource usage, and priorities;
- Windows implementations and explicit shell helpers.

These are extensions of the organization above, not reasons for applications to own
C adapters for environment, cwd, time, readiness, or ordinary child lifecycle.

## Verification and handoff

The focused behavioral entry points are:

- `tests/hosted_system_test.coil`: owned environment lookup/mutation/unset, cwd
  change/restore, process identifiers, monotonic sleep, readable pipes, timeout,
  hangup/EOF, invalid descriptors, and proof that selector waits retain fd ownership;
- `tests/subprocess_test.coil`: exact argv bytes (spaces, shell metacharacters, and an
  empty argument), missing executables, stdin/stdout round trip, null stdio, nonblocking
  and deadline waits, signal termination, cached repeated waits, and idempotent close;
- `tests/io_hosted_test.coil`: hosted fd and allocator-backed line I/O;
- `tests/compiler/features/reexport_*.coil` and `process_facade.coil`: qualified,
  transitive, macro/type/function facade lookup plus private-export rejection;
- `tests/metaprogramming/result_flow_lint.coil`: the linear Result-flow diagnostic.

For iteration, build one candidate compiler and run:

```text
python3 scripts/dev.py test modernize-fast --compiler /tmp/coil-candidate
```

The bounded gate includes the hosted system and facade fixtures and has a hard
30-second budget. Final compiler evidence is an ARM64 candidate rebuild with a
byte-for-byte object comparison, followed by one consolidated snapshot audit:

```text
cmp /tmp/coil-candidate.o /tmp/coil-candidate-next.o
python3 scripts/oracle.py gate all --compiler /tmp/coil-candidate-next
```

The current POSIX backend is exercised on macOS. Linux uses the same public API and
target-selected errno/clock constants, but Linux runtime CI remains a release follow-up.
Concurrent multithreaded spawn is also explicitly deferred until pipe creation and
close-on-exec setup can be atomic on every supported POSIX target.
