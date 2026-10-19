# Hosted system library

## Ahead-of-time byte regular expressions

`coil.regex` provides macros that compile a string-literal pattern during
compilation and emit an allocation-free matcher at the call site:
`(is-match? PATTERN HAYSTACK)` (a bit-parallel Thompson state machine), and
`find`, `find-at`, `find-iter`, `captures`, `captures-at` and `captures-iter`
(a Pike VM with leftmost-first semantics that reports match spans and capture
groups). The runtime binary contains neither a regex parser nor a compiled-regex
object, and the haystack expression is evaluated exactly once.

The byte-oriented syntax supports literals, `.`, groups, alternation, greedy and
lazy repetition including counted forms, byte classes and ranges (including
negation), `\d`, `\w`, `\s`, the assertions `^`, `$`, `\b`, `\B`, and scoped
`i`/`s`/`m` flags. Dot excludes newline. `is-match?` is limited to 63 Thompson
states so the active set fits in one machine word, the Pike VM to 256; larger
expressions fail at compile time instead of selecting a hidden slow path.
Matching is linear in the haystack length and uses no runtime allocation. See
[REGEX.md](REGEX.md).

```coil
(import "coil.regex" :as re)

(defn valid-name? [(name (slice u8))] (-> bool)
  (re/is-match? "^[A-Za-z_][A-Za-z0-9_]*$" name))

(defn status-code [(log-line (slice u8))] (-> (Option (slice u8)))
  (match (re/captures "\" (\\d{3}) " log-line)
    (Some [caps] (re/group-bytes caps log-line 1))
    (None [] (None))))
```

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
(import "coil.alloc" :as alloc)
(import "coil.os" :as os)
(import "coil.primitive" :as primitive)

(defn main [] (-> i64)
  (try
    (let [a (alloc/malloc-allocator)
          cwd (try-or! (os/current-dir a) 1)
          (mut cwdp) (primitive/zeroed os/OwnedString)]
      (store! cwdp cwd)
      (println "{}" (slice cwd))
      (os/OwnedString::free! a cwdp)
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

`(os/get-env allocator name)` returns `Result (Option OwnedString) OsError`. The value
is copied before returning and survives later environment changes. `set-env!` supports
an overwrite flag; `unset-env!` succeeds for an absent variable. Empty names, names with
`=`, and embedded NUL bytes are `InvalidInput`.

`(os/current-dir allocator)` grows its buffer until `getcwd` succeeds; it does not assume
`PATH_MAX`. `change-dir` borrows its input for the call. Environment and cwd mutation
are process-global: applications must synchronize them with other threads.

Every `OwnedString` records its allocation capacity. `(slice s)` borrows its bytes.
Store the returned value in a place and call `OwnedString::free!` with the same
allocator. That operation clears the object and is idempotent for that object.

`OsError` distinguishes `Syscall(code)`, `OutOfMemory`, and `InvalidInput`. Numeric
errno is captured immediately and remains authoritative.

## `coil.time`

`Duration`, `Instant`, and `SystemTime` prevent mixing relative durations, monotonic
deadlines, and adjustable wall time. `Duration::seconds`, `Duration::millis`,
`Duration::micros` and `Duration::nanos` construct one, and `(Duration::new sec nsec)`
normalizes to seconds plus `0 <= nsec < 1e9`.

Use `monotonic-now` and `(Instant::from-now duration)` for timeouts; `(remaining
deadline)` is what is left of one, and `(add instant duration)` moves an instant.
`wall-now` is for timestamps. A `TimeError`'s `(code e)` is an errno-like number.
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

`Child::spawn` takes an allocator, caller-owned `Child`, program, argument slice, and
three stdio policies; `Child::spawn-with-options` adds a `SpawnOptions`
(`SpawnOptions::new` for the defaults: the current directory, and the child in this
process's group). Arguments exclude `argv[0]`; Coil sets it to the program. A program
without a slash is looked up on PATH, empty arguments are preserved, embedded NUL is
rejected, and no shell is involved.

A child is started with `posix_spawnp`, never `fork`, so spawning is safe from any
number of threads at once. What the child gets is the same on Linux and macOS, and is
what Python's and Java's children get:

- the current environment, `set-env!` included;
- its three standard streams as the policies say, and **no other descriptor** of this
  process: not one this library opened, and not one other code opened without
  close-on-exec. (On Linux that last part needs glibc 2.34; with an older C library
  only close-on-exec descriptors are kept from the child, and every descriptor this
  library opens is one.)
- no blocked signals, whatever the spawning thread blocks, as with Rust and Go.

The stdio policies are `inherit-stdio`, `null-stdio`, `pipe-stdio`, and
`merge-stderr` (stderr only; for stdin or stdout the spawn is `InvalidCommand`). Piped streams adapt to ordinary `coil.io` capabilities
through `Child::stdin-writer`, `Child::stdout-reader`, and `Child::stderr-reader`.

Lifecycle is explicit, through methods on the `Child`:

1. `close-stdin` sends EOF without touching output streams.
2. `try-wait` returns `None` while running; `wait` blocks and caches status.
3. `wait-until` returns `Timeout` while leaving the child valid and running. It
   sleeps until the system reports the exit (a pidfd on Linux, a kqueue on macOS),
   and only where neither is available asks on a 1–50 ms backoff, as Python does.
4. `terminate` and `kill` only send a signal; the caller still waits.
5. `kill-and-wait` is the forceful leak-free finalization path.
6. `close` closes parent streams but returns `StillRunning` until the child has
   been reaped. It never silently kills or detaches a child.

`ExitStatus` distinguishes `Exited(code)` from `Signaled(signal)`, and compares with
`=`. A missing or non-executable program is reported synchronously as `SpawnFailed`
with its errno, rather than as a child that exited with code 127.

`run` spawns with stdin from `/dev/null`, captures stdout and stderr up to their
limits, and waits for the exit as `wait-until` does, so a run costs what a spawn and
a wait cost.

Every descriptor the library makes is close-on-exec: pipes (`os/pipe-cloexec`), files
`coil.fs` opens whatever the flags say (as Rust's `File::open` does), sockets, and the
wakeup pipes of cancellations and signal subscriptions. Linux sets the flag as it
makes the descriptor; macOS has no such call for pipes and sockets, which is why a
child is also handed only the descriptors its spawn names.

`coil.process` provides `id`, `parent-id`, and typed `send-signal`. It also re-exports
the public `coil.subprocess` surface, so both `process/id` and `process/Child` work
through one qualified facade. Canonical child declarations remain owned by
`coil.subprocess`, matching Python's separation
between `os` process facts and `subprocess` command lifecycle.

## Next extensions

The stable surface intentionally leaves these staged rather than underspecified:

- multi-fd selector registration and bounded simultaneous `communicate`;
- child environment replacement/overlay, and handing a child descriptors beyond its
  standard streams (Python's `pass_fds`);
- sessions, resource usage, and priorities;
- Windows implementations and explicit shell helpers.

These are extensions of the organization above, not reasons for applications to own
C adapters for environment, cwd, time, readiness, or ordinary child lifecycle.

## Verification and handoff

The behaviour is tested by `tests/stdlib/system_test.coil` (FAST's `stdlib/system`
step): owned environment lookup and mutation, cwd change and restore, monotonic
time, readable pipes and selectors (`hosted-env-cwd-time-pipes-and-selectors`),
`run` with bounded capture, deadlines and cancellation (including after the child
closes its output), each stdio policy, a child's descriptors and signal mask,
`wait-until`, close-on-exec files, cancellation wakeups, signal subscriptions and
TCP and Unix sockets, and subscribed signals. The private re-export rejection is a golden in
`tests/diag/compile/names.coil`. Earlier focused files for exact argv bytes,
hosted line I/O, the facade's qualified re-exports and the Result-flow lint were
run by no gate and were deleted in the test restructure of 2026-10-12.

For iteration, build one candidate compiler and run FAST (`--quick` while iterating):

```text
python3 scripts/dev.py build candidate
python3 scripts/dev.py test fast --compiler build/bin/coil-candidate --only stdlib/system
python3 scripts/dev.py test fast --compiler build/bin/coil-candidate
```

FAST runs the suite on the machine it runs on. CI's Linux job builds the compiler but
does not run this suite, so the Linux-only paths (pidfd, `pipe2`, `closefrom`) are
exercised only where FAST runs on Linux.
