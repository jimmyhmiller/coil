# Porting dossier: Brainfuck reader-metaprogram proof

## Goal

Prove that reader metaprograms are language frontends, not merely configurable
s-expression readers. Raw Brainfuck source should compile directly into native
Coil code:

```sh
coil run tests/read_metaprogram/hello.bf --use coil.brainfuck
printf 'reader metaprogram\n' |
  coil run tests/read_metaprogram/echo.bf --use coil.brainfuck
```

The resulting executable must contain direct tape operations and native loops.
It must not contain a Brainfuck opcode array, program counter, dispatch loop,
interpreter, evaluator, or preprocessing process.

## Branch provenance

- `b89b693` — first proof, including an interim runtime interpreter.
- `efef838` — replaced the interpreter with direct Coil generation and deleted
  `brainfuck_runtime.coil`.

Only the final direct-compilation design should be transferred.

## Source layout

- `src/stdlib/brainfuck.coil`
  - setup module declaring
    `(reader-provider "coil.brainfuck.reader" read-brainfuck)`.
- `src/stdlib/brainfuck_reader.coil`
  - compile-time parser and Coil emitter.
- `tests/read_metaprogram/hello.bf`
  - output and nested-loop proof.
- `tests/read_metaprogram/echo.bf`
  - input, EOF, and loop proof.
- `tests/read_metaprogram/unmatched.bf`
  - malformed bracket proof.
- `tests/read_metaprogram/README.md`
  - public commands and architectural claim.
- `src/compiler/embedded_stdlib.coil`
  - generated entries for both provider modules.

## Generated program

`read-brainfuck` receives `(read-context PATH SOURCE KIND)`, extracts the raw
source, recursively parses balanced bracket sequences, and emits a complete Coil
module containing:

- a 30,000-byte zeroed stack tape;
- a checked data pointer;
- direct loads/stores for `+`, `-`, `<`, and `>`;
- `putchar`/`getchar` calls for `.` and `,`;
- native `loop`/`break` constructs for `[` and `]`;
- explicit exit codes for pointer underflow/overflow.

Non-command characters are comments and are ignored.

## Extraction strategy

1. Land generic reader metaprograms first.
2. Port only `brainfuck.coil`, the final `brainfuck_reader.coil`, fixtures, and
   documentation.
3. Regenerate the embedded stdlib manifest with
   `python3 scripts/compiler/gen-embedded-stdlib.py`.
4. Add the proof to an existing bounded CLI/read gate or a small dedicated gate.
5. Inspect emitted IR/object symbols once to substantiate the “no interpreter”
   claim; do not make every test depend on brittle backend text.

The branch implementation recursively appends forms with quasiquote splicing.
When porting to main's array-backed `Code`, review its asymptotic behavior. The
fixtures are small, but a long Brainfuck input should not become quadratic.
Fix that locally with an accumulator/builder; do not import linked `Code` lists.

## Known gaps and questions

- The current recursive bracket parser can overflow the native metaprogram stack
  on pathological nesting. Establish a depth limit or use an explicit stack.
- Decide whether unmatched `]` is a compile diagnostic. The historical README
  described a runtime exit in one version; the final direct compiler calls
  `primitive/error` during reading. The dossier's intended result is a compile
  error, and tests/docs must agree.
- Tape-cell overflow currently follows `u8` cast behavior. Document wrapping.
- EOF maps to zero. Keep this explicit.
- `alloc/stack (array u8 30000)` is one fixed allocation, not an allocation in a
  loop, but backend stack limits should still be considered.
- The generated module name is fixed. Confirm multiple custom-language inputs in
  one project cannot collide, or derive a stable name from context.

## Acceptance

- Hello prints the canonical Brainfuck greeting.
- Echo reproduces piped input and terminates on EOF.
- Pointer underflow and overflow return documented nonzero codes.
- Both unmatched bracket directions fail during compilation with useful source
  context.
- A large flat program compiles in approximately linear time/memory.
- The proof works outside the repository with strict bundled lookup.
- Removing the reader provider makes the raw `.bf` file fail as ordinary Coil,
  demonstrating that no extension-specific driver case was added.

