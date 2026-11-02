# Reusable pressure-query storage

The solver allocates its free-until, next-use and fixed-at arrays once per
allocation run. Every pressure query resets all entries before computing the
same intersections and fixed constraints. Ordinary and post-eviction queries
share that storage only after the prior decision has been reduced to scalar
values. No decision or constraint is cached between queries.

Scratch storage is initialized after input/shape validation, only when the work
queue is nonempty. Error and empty-work paths release the empty owned buffer.
The buffer is released once when allocation ends. The owned pressure-indexed
compatibility API still returns a separately owned result. The original pressure
query remains unchanged as an independent oracle. All storage creation/reset
work remains within IR-to-machine-code generation.

Focused AddressSanitizer evidence:

- 256 configurations and 41,216 query positions compare both fresh owned and
  reused buffers against the original query: 2,627,520 fields for each API.
  Reused storage spans split/appended-child and later-reservation phases.
- Allocation, mixed spills, scalar/call/switch/floating pressure, stencil and
  empty-work image programs pass. Invalid-input coverage remains in allocation.
- The captured public O3 object is byte-identical to the installed batch:
  2037 bytes, SHA-256
  972e555d8c3c655d9eb42cafad2b611c81f041efb64e01576d2b1175ef74d881.

This change is isolated in .worktrees/pressure-buffer, unmerged, unvendored and
uninstalled. Full 235-program / 72-linked compatibility validation passes with frozen
source/toolchain and fresh-object checks. No
production compile-time gain is claimed until that validation and a Coil build
and unchanged-workload comparison complete. Runtime code should remain unchanged;
this does not close the remaining runtime target by itself.
