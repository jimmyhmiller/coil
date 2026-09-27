# Debugging Coil programs

Coil compiles in no checks unless you ask for them. This guide covers the
build flags that turn them on, the debugging allocators, and what to do when
the sanitizer runtime won't link.

| You suspect | Reach for |
|---|---|
| An index, slice or collection going out of bounds | `--debug-checks` |
| A leak, double free or bad free | `coil.dbgalloc` (or `--debug-checks` plus `(debug-allocator …)`) |
| Use-after-free or overrun that faults late | `--sanitize=address`, or `coil.guardalloc` |
| A data race | `--sanitize=thread` |
| A read of uninitialized memory (Linux) | `--sanitize=memory` |
| Integer overflow, division by zero, bad shifts | `--sanitize=undefined` |
| A crash with no clue where | `--debug-runtime` |
| A C function writing outside its out-parameter | `coil.checked-ffi` |

All of these flags work on `build`, `run`, `check` and `test`.

## Runtime checks: `--debug-checks`

```text
(import "coil.slice" :use [slice-get])
(defn main [] (-> i64)
  (let [xs [1 2 3]]
    (slice-get xs 5)))
```

```sh
$ coil run oob.coil --debug-checks
coil: invalid slice header or slice-get index out of bounds (--debug-checks)
```

With the flag, the standard library checks its own invariants:

- slice reads, writes and `subslice` bounds, and `subslice` with `lo > hi`;
- slice and string headers with a negative length or a null data pointer;
- `ArrayList` length/capacity and indexed `get`/`set!`;
- `HashMap` capacity, counts, storage, allocator and key operations;
- every allocator call's allocator and function slots.

It also loads a checker that warns when a function returns a pointer to one of
its own stack locals. Without the flag, Coil emits the same code as if the
checks had never been written.

## Sanitizers

```sh
coil run app.coil --sanitize=address     # invalid addresses, use-after-free, overruns
coil run app.coil --sanitize=thread      # data races, with both threads' stacks
coil run app.coil --sanitize=memory      # uninitialized reads (Linux only)
coil run app.coil --sanitize=undefined   # overflow, division by zero, bad shifts
```

Pick one mode per build; they use incompatible runtimes and Coil rejects
combinations. `undefined` covers signed add/subtract/multiply overflow,
division or remainder by zero, signed division overflow, and negative or
oversized shift amounts:

```text
coil: undefined behavior: integer division or remainder by zero (--sanitize=undefined)
```

Trust MemorySanitizer reports only when every native library the program
calls is also instrumented. Coil does not sanitize metaprograms, because they
run inside the compiler.

## When a program crashes: `--debug-runtime`

`--debug-runtime` is the development profile. It turns on `--debug-checks`,
AddressSanitizer, stack canaries and validation of indirect calls and dynamic
dispatch, and installs a crash handler. On a fatal signal the handler prints
the signal, fault address, thread, recent events and a stack trace, then
re-raises the signal:

```text
coil crash: signal=0x000000000000000b fault-address=0x0000000000000000 thread=0x00000001f80e1d80 ...
recent events:
  about to read a bad pointer
stack trace:
0   app        0x0000000100e7cb68 coil.crash.crash-handler + 952
1   libsystem_platform.dylib  0x000000018bee3744 _sigtramp + 56
2   app        0x0000000100e7d1d0 main + 760
```

Record your own breadcrumbs with `coil.debug-runtime`; the most recent ones
appear under `recent events` in the report:

```text
(import "coil.debug-runtime" :use [debug-runtime-event! debug-runtime-set-event-capacity!])
(debug-runtime-event! "loaded config")
(debug-runtime-set-event-capacity! 64)     ; how many recent events to keep
```

Set `COIL_CRASH_REPORT=/path/to/report` to also write the report to a file,
along with the compiler, profile, backend and target that built the program.

## Debugging allocators

Every allocator in Coil is a `(dyn Allocator)`, so you can pass a checking
allocator anywhere an ordinary one goes.

### Leaks and bad frees: `coil.dbgalloc`

```coil
(module example.leak-check)
(import "coil.alloc" :as alloc :use [malloc-allocator])
(import "coil.dbgalloc" :use [debug-allocator-init debug-allocator-view debug-allocator-deinit!])

(defn main [] (-> i64)
  (let [debug (debug-allocator-init (malloc-allocator))
        a (debug-allocator-view debug)
        kept (alloc/box! a i64 1)
        freed (alloc/box! a i64 2)]
    (alloc/destroy a freed)
    (let [leaks (debug-allocator-deinit! debug)]
      (println "live allocations at exit: {}" leaks)
      0)))
```

```output
live allocations at exit: 1
```

The debug allocator wraps any backing allocator. It tracks every allocation,
checks red zones before and after each block, and rejects frees of unknown or
interior pointers without touching them. It also catches double frees and size
or alignment mismatches, and poisons and quarantines freed memory.
`debug-allocator-deinit!` releases everything, prints a diagnostic if anything
is still live, and returns the live count. Call it only after every thread has
stopped using the allocator.

To check only in debug builds, use the macro form. `(debug-allocator inner)`
is the wrapped allocator under `--debug-checks`, and exactly `inner`
otherwise.

### Faults at the bad access: `coil.guardalloc`

`(guard-allocator inner)` places each allocation next to an inaccessible page
and protects freed pages while they sit in quarantine, so an overrun or stale
read faults at the instruction that made it. It is active only under
`--debug-checks`; otherwise it is `inner`.

### Counting allocations: `coil.tracealloc`

```coil
(module example.trace-alloc)
(import "coil.alloc" :as alloc :use [malloc-allocator])
(import "coil.tracealloc" :use *)

(defn main [] (-> i64)
  (let [(mut state) (zeroed TracingAllocator)
        a (tracing-allocator-view
            (tracing-allocator-init (mut state) "demo" (malloc-allocator)))
        first (alloc/box! a i64 1)
        second (alloc/box! a i64 2)]
    (alloc/destroy a first)
    (let [stats (tracing-allocator-stats (mut state))]
      (println "calls={} live={} peak={}"
               (.allocation-calls stats) (.current-live-bytes stats) (.peak-live-bytes stats))
      0)))
```

```output
calls=2 live=8 peak=16
```

`AllocatorStats` holds `allocation-calls`, `requested-bytes`,
`cumulative-bytes`, `current-live-bytes` and `peak-live-bytes`. `backing-bytes` is `-1`, because a generic
wrapper cannot see how much memory the inner allocator has reserved.

## Checking foreign out-parameters

When a C function fills a buffer you provide, `with-checked-out` from
`coil.checked-ffi` surrounds that buffer with canaries and checks them as soon
as the call returns:

```text
(import "coil.checked-ffi" :use [with-checked-out])
(with-checked-out allocator (sizeof Winsize) (alignof Winsize) out
  (ioctl fd TIOCGWINSZ out))
```

A write before or past the buffer aborts the program with a message naming
which boundary it crossed.

## Environment variables

| Variable | Effect |
|---|---|
| `COIL_CRASH_REPORT=PATH` | Also write `--debug-runtime` crash reports to PATH |
| `COIL_CC=PATH` | C driver used to link (and to link sanitized builds) |
| `LLVM_CONFIG=PATH` | Which `llvm-config` names the clang used for sanitizer builds |
| `COIL_TRACE=1` | Compiler phase timings and memory events |
| `COIL_MTRACE=rounds\|forms\|diff\|mem` | Trace metaprogram transform rounds; `mem` prints per-metaprogram allocation |
| `COIL_META_ARENA=0\|poison` | Disable per-expansion metaprogram arenas, or fill released arena memory with `0xDD` |
| `COIL_WORKER_STACK_SIZE`, `COIL_WORKER_GUARD_SIZE` | Compiler worker-thread stack and guard size, in bytes |
| `COIL_LLVM_WORKER_STACK_SIZE` | Stack size of parallel LLVM code-generation workers, in bytes |

A program that needs its own thread stack size uses
`coil.thread/thread-spawn-configured`, which takes explicit stack and guard
sizes.

## Troubleshooting sanitizer links

**`cannot find …/libclang_rt.asan.a`** (or `tsan`, `msan`). Sanitized builds
link with the clang beside `llvm-config --bindir`, not the `cc` on `PATH`, so
`CC=` has no effect. Run `llvm-config --bindir`:

- If it names an LLVM you did not intend, a different `llvm-config` is
  shadowing the one you want (a hand-built `/usr/local/bin/llvm-config`, for
  example). Fix which one wins, or set `LLVM_CONFIG` to the right one.
- If it names the right LLVM, that clang was built without compiler-rt. Point
  `LLVM_CONFIG` (or `COIL_CC`) at an LLVM that has the sanitizer runtimes, or
  install compiler-rt for it.

If the driver cannot be run at all, the error names the missing binary instead.
