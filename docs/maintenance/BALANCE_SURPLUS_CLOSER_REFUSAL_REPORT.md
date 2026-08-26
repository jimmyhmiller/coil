# `coil balance` refuses a common surplus-closer repair

## Status

Observed and resolved on 2026-08-25. This report records the failure that motivated
the memory-linear, indentation- and type-directed balance implementation in commit
`df1ac75`.

## Summary

While editing a Coil function, one extra `)` was left at the end of a deeply nested
expression. `coil build` identified the exact unexpected closer. The prescribed
recovery command, `coil balance --write`, refused to change the file:

```text
error: more closing than opening delimiters here; a stray closer and a missing opener are indistinguishable, so balance will not choose between them
  --> src/experiments/heap-inspector/runtime.coil:148:98
```

Deleting the single closer at that location fixed the parser error immediately and
allowed compilation to proceed to typechecking. This is a routine damage shape for
agent-authored Coil, but the current command cannot repair it unless the closer is in
column zero.

## Reproduction

The damaged tail of the function was:

```coil
          (* (load sign) (if (> (load scale) 0.0) (/ (load value) (load scale)) (load value)))))))
```

The compiler reported:

```text
error: unexpected ')'
    --> src/experiments/heap-inspector/runtime.coil:148:98
    |
148 |           (* (load sign) (if (> (load scale) 0.0) (/ (load value) (load scale)) (load value)))))))
    |                                                                                                  ^
```

Following the `coil-balance-forms` skill exactly:

```sh
coil balance --write src/experiments/heap-inspector/runtime.coil
```

produced the refusal above and left the file unchanged. The successful manual repair
was one deletion:

```diff
-          (* (load sign) (if (> (load scale) 0.0) (/ (load value) (load scale)) (load value)))))))
+          (* (load sign) (if (> (load scale) 0.0) (/ (load value) (load scale)) (load value))))))
```

After that deletion, `coil build` passed the reader and reported an unrelated,
ordinary type error later in the transform. That establishes that the removed byte
was the delimiter defect rather than merely a different parse that happened to read.

## Why the old policy missed it

`src/compiler/formatter/balance.coil::plan-deletes` tracks delimiter depth within a
region. When it encounters a closer at depth zero, it deletes it only when its column
is zero. Every indented surplus closer is classified as `surplus-ambiguous` before
candidate compilation can select among hypotheses.

The refusal is logically defensible in isolation: a surplus closer could mean either
"delete this closer" or "insert an opener somewhere earlier." In this case, however,
the reader had already supplied stronger evidence:

- the unexpected byte was identified exactly;
- deleting exactly that byte yielded balanced, readable source;
- the repaired source reached semantic checking;
- inserting an opener would require choosing an unconstrained location and inventing
  a new form, while deletion is a local one-byte repair.

The old command's safety rule therefore prevented it from handling one of the most
common mistakes it was intended to repair. More importantly for agent use, the skill
said to start with `coil balance --write`, but offered no productive fallback for
this refusal: `--no-typecheck --strict` retained the same ambiguity rather than using
the compiler's diagnostic.

## Resolution

Commit `df1ac75` replaced combinatorial candidate generation with a deterministic,
line-local repair plan. Indentation supplies structural boundaries and available type
information resolves delimiter placement where syntax alone is insufficient. The
implementation uses memory linear in the source size and no longer invokes the old
candidate-generation helpers, which were deleted.

`coil balance --write` now handles indented surplus closers without moving or changing
non-delimiter bytes. Ambiguous cases remain refusals when indentation and types do not
establish a unique repair.

## Regression coverage

The balance gate includes fixtures for surplus closers and type-directed nested forms.
Coverage asserts the following:

- `coil build` points at the surplus closer;
- `coil balance --write` removes only that byte;
- the repaired file is byte-identical to the known-good fixture;
- no non-delimiter byte moves or changes;
- an adversarial sibling fixture with two viable repairs is still refused.

The fuzz harness also exercises indented damage without enumerating delimiter
combinations.
