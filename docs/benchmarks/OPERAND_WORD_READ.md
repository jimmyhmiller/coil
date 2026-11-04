# Checked operand word reads

A fixed a1acd0d1 emitter compiles the old and new standalone library source.
The same opaque LLVM runner checks valid graphs and malformed layout, reference
and type cases. Each run uses 16 rotating CPU samples after an excluded warmup.
The retained baseline object is reemitted and verified against its recorded SHA.
These are source-algorithm runtime comparisons, not compiler-generation timings.

| Backend/source | First CPU ms | Repeat CPU ms | Object bytes |
| --- | ---: | ---: | ---: |
| Stogir before | 38.9480 | 38.9715 | 102092 |
| Stogir direct word read | 37.1155 | 37.1300 | 102483 |
| LLVM O3 | 10.1485 | 10.1705 | 39328 |
| TPDE O3 | 77.8915 | 77.9330 | 75646 |

Stogir runtime improves 4.7% in both runs; object size increases 391 bytes.
It remains approximately 3.65 times LLVM runtime on this reduction. This does
not establish either full-compiler performance target.

The emitted graph.operand reads the addressed payload with one 32-bit load,
rather than loading a complete Node and selecting fields. All existing positive
instruction membership and operand-index guards remain. Checked ArrayList.at
borrows a legitimate storage cell, including continuation cells; the pointer is
consumed immediately. The slot is bounded to the four words of Node16.
Upstream ir.h:ir_insn_op is the source model, with attribution centralized in
../../src/compiler/stogir/docs/PROVENANCE.md. See [first](results/operand-word-read/first.json) and [repeat](results/operand-word-read/repeat.json) JSON for compiler, fixture, runner and object hashes,
CPU samples and host snapshots.
