# `ScratchArena` and `read-line-alloc` turn a recoverable growth into false OOM

Date: 2026-08-06

Status: Reproduced in `coil-agent-harness`; fix needed in the generic allocation/I/O
contract or in `read-line-alloc`.

## Summary

After migrating the harness's per-model-turn allocations from `Region` to the new
`coil.scratch/ScratchArena`, the first real Codex turn succeeds but every continuation
turn fails immediately with:

```text
error: Codex app-server allocation failed
```

This is not process exhaustion. `io/read-line-alloc` grows its line buffer with
`raw-resize` and maps any `None` directly to `io/OutOfMemory`. `ScratchArena` returns
`None` whenever the existing allocation cannot grow in place in the current segment,
including an ordinary growth that crosses the segment boundary. There may be abundant
space available through a new segment, but `read-line-alloc` never tries allocate/copy.

The failure exposes an existing inconsistency in Coil's generic allocator contract:
`ArrayList.al-reserve!` treats failed resize as “cannot resize this block” and falls back
to allocate/copy/free, while `io/read-line-alloc` treats the same result as terminal OOM.

## Full-program reproducer

Repository: `coil-agent-harness`

The affected runner revision initializes a turn scratch arena and passes its ordinary
allocator view to the provider:

```coil
(let [(mut turn-scratch) (primitive/zeroed scratch/ScratchArena)]
  (scratch/scratch-init turn-scratch (malloc-allocator))
  (let [turn-result
          (execute-model provider
                         current
                         emitter
                         (scratch/scratch-allocator turn-scratch))]
    ...))
```

Build and run:

```sh
cd /Users/jimmyhmiller/Documents/Code/projects/coil-agent-harness
coil build
./harness tui
```

Then submit three messages in one conversation:

```text
test
hello?
asdf
```

Captured result:

```text
test    -> Ready.
hello?  -> Codex app-server allocation failed
asdf    -> Codex app-server allocation failed
```

The durable event boundary for the second turn is:

```text
1786050397004 model.request.started
1786050397062 model.request.failed "Codex app-server allocation failed"
1786050397062 run.failed           "Codex app-server allocation failed"
```

The first turn successfully establishes a Codex session. The second turn restores that
session and receives a larger protocol line, reaching the line-buffer growth path within
approximately 58 ms; this is not provider latency.

## Exact failure path

Harness:

```text
codex-child-read
└── io/read-line-alloc scratch-allocator ...
    └── raw-resize existing-buffer old-cap new-cap 1
        └── scratch-resize-hook
            └── None
    └── Err(OutOfMemory)
└── "Codex app-server allocation failed"
```

`scratch-resize-hook` succeeds only when the allocation is the current segment's tail
and `start + new <= current.cap`. If the new capacity crosses the segment boundary it
returns `None`; it does not allocate a new segment and copy `old` bytes.

`read-line-alloc` currently handles `None` as follows:

```coil
(match (alloc/raw-resize a data old-cap new-cap 1)
  (None []
    (do
      (alloc/raw-free a data old-cap 1)
      (return-from :done (Err (OutOfMemory)))))
  ...)
```

By contrast, `ArrayList.al-reserve!` documents and implements the required generic
fallback: try resize, then allocate a new block, copy the existing elements, and free the
old block.

## Minimal regression shape

A focused test does not require Codex:

1. Initialize `ScratchArena` with a small fixed initial capacity.
2. Feed `io/read-line-alloc` a line large enough that its doubling buffer must exceed the
   current scratch segment.
3. Use a maximum larger than the input line.
4. Assert that the line is returned intact rather than `OutOfMemory`.

The important case is not merely a non-tail block. A tail allocation that must move to a
new segment is already sufficient to reproduce the false OOM. Add a second case with an
intervening allocation so the old buffer is non-tail as well.

## Recommended fix

### Immediate fix: make `read-line-alloc` use allocate/copy fallback

On failed `raw-resize`, it should:

1. `raw-alloc` the requested new capacity;
2. copy the `len` initialized bytes from the old buffer;
3. `raw-free` the old buffer;
4. continue reading;
5. report `OutOfMemory` only if the new allocation also fails.

This matches `ArrayList` and makes `read-line-alloc` work with bump, segmented scratch,
fixed-buffer, and other allocators that cannot relocate every existing allocation.

### API fix: centralize realloc-with-fallback

Coil should provide one standard helper with unambiguous generic semantics, for example:

```coil
(allocator-realloc a pointer old-size new-size alignment initialized-size)
```

It should attempt the allocator's resize hook, then allocate/copy/free when resize is not
available. Generic consumers should use this helper instead of each implementing a subtly
different interpretation of `None`.

Longer-term, separating these operations would make the contract clearer:

```text
try-resize-in-place -> Option(pointer)
realloc             -> Result(pointer, AllocationError), may move and copy
```

The existing `resize` hook sometimes relocates (`malloc/realloc`) and sometimes means
in-place-only (`Arena`, `ScratchArena`). `Option` cannot distinguish unsupported growth
from genuine exhaustion. That ambiguity is the underlying API problem.

### Optional ScratchArena improvement

`ScratchArena.resize` could itself allocate/copy when in-place growth fails. That would
make its ordinary `Allocator` view more broadly substitutable, at the cost of retaining
the abandoned old block until reset. This behavior is normal for a bump arena, but it
should not be the only fix: other valid allocators can still decline resize, and generic
I/O must handle that correctly.

## Required coverage

- `read-line-alloc` with a scratch-backed line larger than one segment;
- a non-tail scratch line buffer;
- exact preservation of initialized bytes after fallback;
- line-limit behavior remains `LineTooLong`, not OOM;
- genuine failure of both resize and replacement allocation remains `OutOfMemory`;
- multi-turn Codex PTY acceptance, because the first turn's smaller protocol traffic did
  not exercise the failing growth boundary.

## Harness action

Until the generic path is fixed, the harness should use the now-constant-time `Region`
for provider calls that require the full ordinary allocator contract. The initial
single-turn live acceptance test was insufficient; it must submit at least two messages
in the same conversation and verify that the second response completes.

## 2026-08-06 installed-fix verification: still failing

The initial fix added allocate/copy/free fallback to `read-line-alloc` and added
`tests/stdlib/io_scratch_test.coil`. The source contains the expected fallback, but the
globally installed compiler does not pass that exact regression:

```sh
coil run /Users/jimmyhmiller/Documents/Code/projects/coil/tests/stdlib/io_scratch_test.coil
echo $?
# 4

coil build /Users/jimmyhmiller/Documents/Code/projects/coil/tests/stdlib/io_scratch_test.coil \
  -o /tmp/io-scratch-global
/tmp/io-scratch-global
echo $?
# 4
```

Exit code `4` is the test's `io/OutOfMemory` result from the first `check-line` call,
which is the scratch segment-boundary growth case. The installed compiler SHA-256 is:

```text
5a881b73b19dc9a032a341cc88cce16d3dc5149c85065e7d98c6f16c3624f883
```

The harness was rebuilt with that compiler. Its corrected two-turn live PTY test reaches
the second submission in the same conversation, then still records:

```text
model.request.started
model.request.failed "Codex app-server allocation failed"
run.failed           "Codex app-server allocation failed"
```

This rules out a stale harness executable and independently reproduces the failed
stdlib regression through the real `io/read-line-alloc` consumer. The earlier claim
that the new regression passed does not match the behavior of the active global
installation. Verify the installed binary's embedded stdlib payload and run the test
executable, not only its compile/check step; `coil test <standalone-main-file>` returned
success without executing this standalone `main`, while `coil run` and an explicitly
built executable both returned the failing status.
