# Native infrastructure sources

These library passes supply the `native.*` modules to both the standalone
backend and Coil's compiler. `src/compiler/native/generated/` is their build
artifact, written by `scripts/compiler/gen-declarative.py` and checked by FAST.
The source project's manifest excludes that generated directory and reads the
passes themselves. There is one implementation for both uses.

- `cir.pass`: CIR records, instruction builders, sealed-block SSA construction,
  definition-table generations, function reuse, debug positions and snapshots.
- `cir-copies.pass`: aggregate copy analysis, dominators, address escape and
  liveness checks, argument summaries, and module forwarding phases.
- `asm.pass`: sections, relocations, symbols and their stable chunked storage.
  The symbol lock still protects insertion after `share!`; readers' symbol
  addresses remain stable as later chunks are added.
- `buf.pass`: the byte-buffer schema: growth capacity, little-endian integer
  widths and LEB128. Appends, reads and patches are generated from the same
  encoding declaration and accept unaligned offsets. Native and LLVM builds
  use a width-specific memory operation with alignment 1; the portable wasm
  backend uses byte operations selected at expansion, without a runtime branch.

Library mode in `.pass` has explicit function parameters instead of an implicit
graph state. `record` declares storage. List fields default to empty owned
lists; other fields default to zero unless given an initial value. `capacity` on a list field declares its initial reservation; the assembler
uses that to keep its symbol-chunk table stable. `construct`
generates a constructor from those declarations, and `release` frees the
record's list fields. A release can name its parameter, for example
`release Func as func-free!(f);`, preserving named-argument callers. It does not own references, borrowed spans, or resources
inside record elements: an algorithm closes those explicitly, as the assembler
does for section buffers and its mutex. `fill`, `append-list` and `truncate`
keep list representation and allocation out of algorithms. The buffer storage
generator is the layer that calls allocation and byte-memory primitives.

The algorithm language supports typed fixed-width values, references at API
boundaries, records and collections, infix expressions, and structured loops.
It has no raw Coil forms or source-text escape. The native types and entry
points retain their existing ABI, so the lowering, object writers and JIT use
the generated library without a compatibility implementation.

After editing:

    python3 scripts/compiler/gen-declarative.py
    python3 scripts/tests/declarative.py /absolute/path/to/coil

The second client in `toy/storage.pass`, called by `tests/toy.coil`, exercises
record construction and release and the buffer generator with a different
record name and initial capacity.
