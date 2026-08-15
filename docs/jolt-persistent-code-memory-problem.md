# Jolt before-expand memory and runtime problem

## Scope

This document describes a reproducible performance and memory problem encountered
while compiling Jolt's runtime with Coil's Scheme dialect. It records the current
compiler behavior, the relevant `Code` representation and ownership boundaries,
and the measurements collected while investigating it.

This is a problem report, not a design proposal. It intentionally does not
recommend an implementation or allocation strategy.

## Reproduction environment

The repository used for the investigation was:

```text
/home/jimmyhmiller/Documents/Code/coil
```

The Jolt checkout was available at:

```text
/home/jimmyhmiller/Documents/Code/coil/.coil/jolt-coil/jolt
```

The compiler is self-hosted. Build a candidate compiler from a known stage-0
compiler before running the Jolt reproduction:

```sh
cd /home/jimmyhmiller/Documents/Code/coil

STAGE0=/tmp/coil-x64-s2 \
COIL_LLVM_LIBDIR=/usr/lib/llvm-21/lib \
python3 scripts/dev.py build x64 --output /tmp/coil-jolt-candidate
```

The build verifies the x64 self-hosting fixpoint and runs the corpus, C ABI, and
encoder gates. The exact stage-0 path can be changed to another known-good
self-hosted compiler.

Run the unchanged Jolt input with transform-round and memory tracing enabled:

```sh
cd /home/jimmyhmiller/Documents/Code/coil/.coil/jolt-coil/jolt

env \
  COIL_NAMESPACE_ROOTS=/home/jimmyhmiller/Documents/Code/coil \
  COIL_MTRACE=rounds \
  /usr/bin/time -v \
  /tmp/coil-jolt-candidate \
  build host/chez/rt.ss \
  --use coil.r6rs.exceptions \
  --meta-opt=0 \
  -o /tmp/jolt-rt-coil
```

For dialect-stage timing, add:

```sh
COIL_SCHEME_STAGE_TRACE=1
```

The process can be monitored independently with:

```sh
pgrep -af '/tmp/coil-jolt-candidate build host/chez/rt.ss'
ps -o pid,etime,%cpu,%mem,rss,vsz,stat,cmd -p PID
cat /proc/PID/status | rg 'VmPeak|VmSize|VmRSS|RssAnon|Threads'
```

It is important to check for old compiler processes before and after each run.
An interrupted shell or tool timeout can leave a compiler child alive even after
its parent command has returned:

```sh
pgrep -af '^/tmp/coil-jolt'
```

During this investigation, five stale `check src/apps/scheme/dialect.coil`
processes were found consuming approximately 10 GiB in aggregate. They were not
included in the Jolt process's per-process RSS figures, but they materially
increased total machine pressure.

## Expected result

The command should finish compiling `host/chez/rt.ss`, write the requested Jolt
runtime executable, and return successfully. That runtime can then be used to
run a Jolt program containing an actual lexical closure.

That complete result has not yet been established. No successful closure-runtime
claim should be made from the measurements in this report.

## Observed result

With the original resumable 64-form dialect batching and no global transform
round limit, the build continued making semantic progress beyond round 64. It
reached at least round 141. The rounds were therefore not an immediate
non-convergence loop: the Scheme dialect was advancing a cursor through a very
large generated module.

Despite that progress, performance and memory usage became pathological:

- One run remained at essentially 100% CPU for approximately two hours.
- Its resident set reached about 50.5 GiB.
- Its virtual size reached about 67.8 GiB.
- Individual late transform rounds could take minutes.
- The requested Jolt runtime was not produced.

The representative process status was:

```text
ELAPSED   CPU    RSS          VSZ
02:00:03  99.9%  50,466,744K  67,778,776K
```

This behavior is not explained by the number of rounds alone. The program was
changing, but the cost of later rounds increased with the amount of program
already processed.

## The before-expand fixpoint

The relevant compiler loop is `run-before-expand` in
`src/compiler/expander.coil`.

A before-expand transform receives the complete program represented as a list of
modules. It returns another complete program. The compiler converts the result
back into top-level `TaggedForm` values and compares the new and previous form
lists structurally.

Conceptually, each round is:

```text
TaggedForm list
    -> grouped module Code
    -> invoke transform
    -> returned module Code
    -> TaggedForm list
    -> structural equality test
```

If the two form lists are equal, the fixpoint is complete. Otherwise, the new
form list becomes the input to the next round.

The former global 64-round limit was removed because it rejected a valid
bounded-batch transform solely because the input was large. Jolt contains enough
top-level generated forms that a 64-form batch can legitimately require well
over 64 rounds.

## Scheme dialect batching

The Scheme dialect is an ordinary before-expand transform defined in
`src/apps/scheme/dialect.coil`. There is no Scheme evaluator embedded in the
compiler's transform loop. The compiler sees only a normal metaprogram that
accepts and returns `Code`.

Syntax expansion is resumable. The dialect inserts a cursor form into a module,
rewrites a bounded group of forms, and leaves the remainder for later fixpoint
rounds. On the next invocation it finds the cursor and resumes syntax expansion
instead of rerunning all one-time surface preparation.

The current persistent-tail behavior matters:

- A module is represented as a linked `Code` list.
- `primitive/code-cdr` exposes the existing tail.
- `primitive/code-cons` creates a new pair whose tail may be an existing list.
- Returning an existing suffix is therefore constant-time inside the
  metaprogram and preserves that suffix by identity.
- Quasiquote splicing generally materializes list structure; explicit
  `code-cons` is used in hot paths where retaining the original tail matters.

The dialect can consequently build a changed prefix that points to an unchanged
suffix without copying the suffix itself while the metaprogram is running.

## Persistent `Code`

`Code` is represented by an `Sexp` value. Lists use `SexpPair` nodes containing:

```text
head  Sexp
tail  Sexp
flat  optional cached flattened representation
owner allocator
```

The linked representation permits structural sharing. Several lists can share
the same tail, and operations such as `code-car` and `code-cdr` can return
subtrees without rebuilding them.

This persistence is value persistence rather than automatic lifetime
management. A pointer to a shared pair remains valid only while the allocator
that owns the pair remains alive. The `owner` field records the allocator used
for a pair, but the `Code` graph is not a garbage-collected heap and does not
independently retain or release all of its transitive owners.

Atoms can also contain borrowed byte slices. Consequently, safely moving a
`Code` result between allocator lifetimes involves more than copying the outer
pair. Symbols, keywords, strings, C strings, vectors, and every transitively
reachable list node can carry storage whose lifetime matters.

## Metaprogram invocation memory

Native metaprogram calls are handled by `meta-engine-invoke` in
`src/compiler/metaengine.coil`.

Each invocation creates a `ScratchArena` backed by the malloc allocator. The
metaprogram's `CtCtx` uses the invocation arena allocator. Code constructors and
metahost callbacks allocate invocation temporaries from that allocator.

The arena is intentionally disposable. On a successful invocation, the compiler
copies the returned result out of invocation memory and closes the arena. This
prevents pointers into the metaprogram's temporary storage from surviving after
the call.

The boundary copy is implemented by `me-copy-result`. It copies:

- atom byte storage;
- every pair node;
- every vector and its elements;
- the complete transitive graph reachable from the result.

It uses maps to preserve sharing when the same source pair or vector is
encountered more than once during a single copy. The copy is therefore graph
aware within one result, but it still constructs an owning destination graph for
the whole returned value.

After copying, `me-result-escapes-arena?` verifies that the copied result contains
no pointers into the invocation arena. Only then is the invocation arena closed.

## Where persistence is lost

Inside the dialect, an unchanged suffix can be returned by identity. At the
native metaprogram boundary, `me-copy-result` deliberately copies that suffix
anyway.

The effective flow is:

```text
old compiler generation
    -> borrowed by metaprogram input
    -> new prefix shares old suffix inside invocation
    -> complete result copied into next compiler generation
    -> old compiler generation released
```

The destination result is independent of the old generation, which makes its
lifetime straightforward. It also means that structural sharing across
fixpoint rounds is not preserved. Sharing within one copied graph survives;
sharing with the previous round does not.

As a result, a transform that changes only a small batch still pays to copy the
complete live program returned from the metaprogram.

## Compiler generations

`run-before-expand` currently uses two scratch generations for successive
transform results. A new round is built in the generation not holding the
current input. Once a changed result has been accepted, the prior generation can
be reset.

This ping-pong arrangement bounds the lifetime of obsolete complete results. It
does not make a complete result small, and it does not avoid constructing that
result in every round.

The compiler also maintains per-round data such as:

- grouped module records;
- returned `TaggedForm` arrays;
- qualified definition-name indexes;
- staged declarations and stage expansion data;
- structural-copy memo tables;
- flattened list caches created by consumers.

Some compiler-root bookkeeping remains live across rounds. Tracing showed a
small approximately 188 KiB increase per batch in one experiment, distinct from
the multi-gigabyte transient copying behavior.

## Why late rounds cost more

The syntax cursor advances through source order. Early rounds have a relatively
small processed prefix. Later rounds contain more expanded forms, and some Jolt
forms expand into very large generated trees.

Even when only the next bounded batch changes, the returned program includes:

- all forms already expanded;
- the newly expanded batch;
- all pending forms;
- module wrappers and cursor state.

The ownership boundary copies the complete returned graph. Therefore the amount
of data copied in one round is related to the size of the entire current program,
not just the batch changed in that round.

The live generation reported at round boundaries can be much smaller than peak
RSS during an invocation. Round-boundary tracing observes retained arena state
after the transform has returned. It does not by itself account for every
intermediate tree constructed and discarded while expanding a large form, nor
for simultaneously live source, invocation, and destination graphs.

## Instrumentation

`COIL_MTRACE=rounds` prints before-expand entries and leaves, including whether
the transform changed the program. The current trace also reports:

```text
scratch-live=...
malloc-live=...
```

These values should be interpreted separately from operating-system RSS:

- `scratch-live` describes reserved storage tracked by Coil scratch arenas.
- `malloc-live` describes allocations tracked through Coil's malloc allocator.
- RSS includes resident pages from those allocations plus stacks, loaded code,
  allocator overhead, untracked native allocations, and other process memory.
- Peak RSS inside a round may be higher than either value printed at the round
  boundary.

`COIL_SCHEME_STAGE_TRACE=1` shows which dialect stage is executing. In the
bounded syntax phase, repeated `syntax-batch` entries are expected. The trace
also shows later whole-program stages such as `load-values`, `scaffold`,
`continuations`, `lambda-lift`, `reserved-forms`, `forms`, and `rooting`.

Nested compilation of phase declarations can produce similar stage names for a
different compilation context. Stage-name output alone is therefore not enough
to prove that the outer fixpoint is repeating. The `before-expand` round trace is
the authoritative view of the outer transform loop.

## Measurements from controlled experiments

### Original 64-form cursor

- Advanced beyond round 64 and reached at least round 141.
- Continued to change the program legitimately.
- Reached approximately 50.5 GiB RSS after two hours.
- Did not produce the runtime.

### Single long-lived transform arena

One diagnostic experiment retained transform results in a single arena and
reused pairs already owned by that destination. Superseded prefixes remained in
the monotonic arena. Retained memory grew by roughly 112 MiB per round and
reached approximately 7.3 GiB by round 54. This experiment was reverted.

### Compact persistent cursor experiment

A diagnostic cursor represented the processed prefix in reverse and retained an
exact pending suffix. Early batches completed in roughly 0.5--0.7 seconds, and
RSS initially remained around 1.6 GiB. This demonstrated that repeatedly walking
the processed prefix inside the dialect was a real cost.

As large expanded forms accumulated in the cursor, the meta-engine still copied
the full cursor graph at every return. With a larger batch, one run reached round
47, stalled inside the invocation, and rose to approximately 9.58 GiB RSS. The
experiment was stopped and reverted.

The compact cursor also exposed that generic stage expansion descended into
quoted cursor data. A stage-like list inside quoted syntax was treated as a live
stage invocation. The compiler now treats `(quote ...)` payloads as data during
stage-marker traversal. That issue is independent of Scheme-specific compiler
behavior.

## Diagnostics that are not this problem

The bounded modernization gate currently reports that a facade leaked a private
re-export. The same failure occurs with the baseline compiler used for
comparison, so it was not caused by the Jolt memory investigation.

An earlier C ABI failure was also unrelated to the Jolt transform memory curve.
The self-hosted candidate used during this investigation passed its corpus, C ABI,
and x64 encoder gates.

## Current status

- The arbitrary global 64-round before-expand limit is removed.
- Large transforms can continue until structural equality is reached.
- The Scheme dialect has a resumable syntax batch and can preserve an untouched
  suffix internally with persistent `Code` operations.
- Native result ownership still requires a complete transitive copy at the
  metaprogram boundary.
- Unchanged structure shared inside a metaprogram is not shared with the next
  compiler generation.
- The unchanged Jolt build has not completed successfully under an acceptable
  memory profile.
- A produced Jolt runtime has not yet been used to establish execution of a real
  closure program.

