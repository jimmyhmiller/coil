# Sprout: explicit metaprogram stages

Sprout is the small Lisp in [`../src/examples/sprout.coil`](../src/examples/sprout.coil).
It exists to make staging, output, and ownership observable. The same model now
drives Scheme: each syntax/lowering pass returns one complete program into the
next compiler-owned generation; there is no streaming transform protocol or
syntax cursor.

The example program is:

```scheme
((define (square x) (* x x))
 (print (square (inc (+ 2 4)))))
```

It currently has three ordinary `Code -> Code` stages.

The complete compiler-driven example is
[`../src/examples/sprout_staged.coil`](../src/examples/sprout_staged.coil), used by
[`../src/examples/sprout_staged_test.coil`](../src/examples/sprout_staged_test.coil).
It uses the existing syntax-stage protocol—not a separate pipeline runner:

```text
before-expand round 1
  (stage fresh-marker imports payload-helper desugar-entry)
  (fresh-marker "sprout_staged_test.sprout-stage-desugar" program)

before-expand round 2
  (stage fresh-marker fold-entry)
  (fresh-marker "sprout_staged_test.sprout-stage-fold" desugared-program)

before-expand round 3
  (stage fresh-marker lower-entry)
  (fresh-marker "sprout_staged_test.sprout-stage-lower" folded-program)
```

Stage state is cumulative: the fold and lower entries call
`sprout-stage-payload`, which was declared only in round 1. All stage declarations
and marker calls disappear; the resulting runtime program prints `49`.

## 1. Desugar

```text
coil run src/examples/sprout.coil --meta sprout.sprout-desugar -- \
  '((define (square x) (* x x)) (print (square (inc (+ 2 4)))))'
```

```scheme
((define (square x) (* x x))
 (print (square (+ (+ 2 4) 1))))
```

## 2. Fold constants

```text
coil run src/examples/sprout.coil --meta sprout.sprout-fold -- \
  '((define (square x) (* x x)) (print (square (+ (+ 2 4) 1))))'
```

```scheme
((define (square x) (* x x))
 (print (square 7)))
```

## 3. Lower to Coil

```text
coil run src/examples/sprout.coil --meta sprout.sprout-lower -- \
  '((define (square x) (* x x)) (print (square 7)))'
```

The result is a complete Coil module with an `i64` `square` function and a
`main`. The checked fixture
[`../tests/metaprogramming/sprout_lowered.coil`](../tests/metaprogramming/sprout_lowered.coil)
prints `49`.

## Observing invocation memory

```text
COIL_META_ALLOC_TRACE=1 \
COIL_META_ALLOC_ENTRY=sprout.sprout-desugar \
coil run src/examples/sprout.coil --meta sprout.sprout-desugar -- '<program>'
```

The trace reports callbacks, boxed syntax values, quasiquote pushes, allocation
count, bytes, segments, and peak reservation for the disposable invocation
arena. The returned tree has already crossed the ownership boundary when it is
printed: the engine deep-copies it into the runner's result arena, verifies that
it does not reference invocation storage, then closes the invocation arena.

## Stage compiler ownership

The `(stage MARKER ...)` driver uses two rotating arenas for successive syntax
programs. Stage compilation itself now has a separate disposable arena:

```text
cumulative stage source (final compiler arena)
        |
        +-- loader / resolver / checker (stage-compilation arena, then close)
        |
        +-- callable signature (final compiler arena)
        +-- engine image + quote registry (engine-owned arena)
```

The stable signature is deliberately bodyless: stage invocation needs only the
entry name, Code parameter names/count, Code return type, and variadic flag. The
executable body belongs to the engine image. Engine entry names and quoted Code
registries belong to that same image arena, so replacing the final entry from an
image releases the whole image without borrowing from the compiler that built it.

`COIL_MTRACE=rounds` reports every released stage compiler lifetime as
`phase=arena-release owner=stage-compilation`, including allocation count,
requested bytes, segment count, peak reservation, bytes actually released, and
remaining global live arena memory.

Current allocation traces establish the baseline for the tiny sample:

| staged entry | invocation bytes | invocation peak | compiler global live |
|---|---:|---:|---:|
| desugar | 19,385 | 65,536 | 303,104,000 |
| fold | 22,144 | 65,536 | 318,832,640 |
| lower | 40,665 | 65,536 | 318,832,640 |

The individual invocation arenas are bounded and released. More importantly,
compiler live memory now plateaus after fold instead of growing by roughly 50
MiB on every stage (the previous sequence was 329,318,400; 378,601,472;
428,933,120). The remaining retained state is explicit: cumulative stage source,
bodyless signatures, and the current engine images.
