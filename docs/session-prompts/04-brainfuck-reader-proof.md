# Copy-ready prompt: Brainfuck reader proof

```text
Start from the latest `main` branch after generic reader metaprograms have landed.
Read and follow AGENTS.md, then run `coil guide` before writing Coil code.

Implement the Brainfuck proof described in:

  git show origin/feat/scheme-continuation-pass:docs/landing/03-brainfuck-reader-proof.md

Research provenance is `b89b693` followed by `efef838`. The first version used a
runtime opcode interpreter; the second removed it. Port only the final design:
the read metaprogram parses raw Brainfuck at compile time and emits a complete
Coil module with direct tape operations and native loops.

Do not add a `.bf` special case to the driver. Do not add an interpreter,
evaluator, preprocessing process, shared-library adapter, linked Code lists, or
Scheme/Jolt dependencies.

Provide:

- `coil.brainfuck` setup/provider modules;
- hello and echo raw `.bf` fixtures;
- compile-time diagnostics for unmatched `[` and unmatched `]`;
- documented pointer-boundary, wrapping-cell, and EOF behavior;
- a larger flat-source test that catches quadratic Code construction;
- strict bundled-stdlib/out-of-repo coverage.

Use an explicit accumulator/builder suitable for main's current Code
representation rather than recursive suffix splicing. Regenerate the embedded
stdlib manifest. Verify the public CLI examples and inspect one emitted IR/object
to substantiate that no Brainfuck runtime interpreter remains.

Commit this as an independent proof/example and report exact outputs, diagnostics,
performance sanity results, and gate coverage.
```

