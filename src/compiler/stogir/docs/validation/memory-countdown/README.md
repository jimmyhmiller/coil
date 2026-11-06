# Guarded memory countdown elimination

Independent finite-loop optimizer extension, not an upstream pass parity claim.
The register countdown proof in ../finite-countdown extends to one ordinary
memory cell, provided its exact invariant address and access width are proved,
its only body effect is storing the counter minus1, and its loaded value has no
other observers. Full-width signedness BITCAST / soft COPY chains are supported;
hard COPY, width changes, pointer/BOOL counters, calls, volatile/atomic accesses,
other body effects, other address bases/offsets/indices and extra users decline.
The existing address-alias decomposition proves identical base+offset; base must
be a parameter or static stack object before entry, or a fixed literal. Symbolic
indices and unproved bases decline. Only EQ/NE0 with unit modular decrement
qualifies. Store value and load have identical byte widths.

The unsigned bit-pattern rank decreases on every nonzero iteration. Intermediate
ordinary writes have no observer in the loop. It is NOT safe to replace the
whole loop by an unconditional zero store: initial0 used to perform no write.
The rewrite retains the initial load/test and stores typed0 only on the nonzero
path, preserving zero-trip behavior even for read-only storage.

No new graph nodes or broad CFG analysis: initial LOAD bypasses old loop header
to entry's prior control; entry END becomes the zero-path END; backedge becomes
ordinary END after the zero store; old header becomes the acyclic exit MERGE.
Preexisting exit SRC users and exit reachability roots redirect to that merge.
Protected entry/header/load/views/step/store/predicate/inside/branch decline.
The existing affected queue and control cleanup re-establish normalized graph.
Unique entry and backedge ownership are checked before reusing those nodes.

Tests cover signed/unsigned8/16/32/64, EQ/NE, swapped slots, full-width signedness
views and duplicate exact addresses. Original and optimized native graphs pass
20480answers on0..255, preserving upper bytes on narrow writes. Additional RX
zero mappings prove no zero-trip write (an added store would fault). Negative
cases: volatile LOAD/STORE, second body effect, offset mismatch, step2, escaped
counter, protected load/entry/header/store. Protected exit-root remapping executes
correctly. Stogir O3/debug host passes. LLVM O1/debug/ASAN gate recorded separately.
Existing register countdown, JIT loop, SCCP-control, iterative-fold, switch-loop,
wide/narrow call-pressure and checked-call pressure pass.

Actual captured free-decision-with-limits graph from ../finite-countdown now has
LOAD422 controlled by prior144; entry413 follows zero projection415; STORE428
writes0 only through nonzero projection416; MERGE418 joins413/417 and is acyclic.
Counter423 is a same-width I64→U64 view; ADD/bitcast addresses421/426 normalize to
parameter115+8. Raw pregraph/provenance/reproducer are in ../finite-countdown;
postgraph is free-decision-rewritten.txt.gz. Graph validation passes. Native
execution of the full allocator function will be exercised through Coil and the
actual emitter workload, not by guessing its multi-argument ABI here.

No new timing or whole-bootstrap result yet. Source integration/candidate/quick
and live-emission gates and paired small measurements are next. Whole target
remains5× IR-to-code generation and generated compiler runtime≤1.10×LLVM O3.

Final source passes LLVM O1/debug/ASAN:20480 native answers and all readonly/upper-byte/protected-root checks. No sanitizer finding.
