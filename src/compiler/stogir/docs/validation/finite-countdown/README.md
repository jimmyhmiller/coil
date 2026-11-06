# Finite unit-countdown loop elimination (register-carried form)

Independent optimizer extension; not claimed as a pinned upstream pass port.
Integrated into the affected-node iterative optimizer, before the existing
single reachability/merge cleanup boundary. Revisit a header from an affected
Phi so promotion-created counters can expose the rule without a CFG rescan.

Proof: a w-bit wrapping integer SUB by1 strictly decreases the unsigned bit
representation whenever nonzero, reaching0 in at most2^w-1iterations. A matched
loop has one carried Phi, one zero equality/inequality branch, and a backedge
with no intervening effects. Initial value is constant or sequenced before
entry. No second Phi, call, volatile/atomic access or memory store qualifies.
Every other counter observation must be directly sequenced after the exact
exit along SRC-only ancestry. Floating/unproved data uses are rejected. Step
has no other users. Protected counter/predicate/step/interior observations
prevent rewriting; the backedge reachability root maps to the eventual exit.
Both LOOP_BEGIN/LOOP_END and SCCP's cyclic MERGE/END form qualify by actual edges.

This rule removes the backedge and replaces counter with typed0; the existing
pruner/merge logic removes disconnected nodes. It does not remove stdlib drops
or change owning-element semantics. No machine-code peephole or builtin-name
recognition is used. Input graph is the optimizer's private owned graph.

Tests cover EQ/NE, swapped entry/back slots, signed/unsigned8/16/32/64,
decrement2, LT, extra Phi, volatile effect, escaping pure user and protected
counter root. Native original and optimized graphs agree on all0..255inputs:
12288answers. Stogir O3/debug host passes. LLVM O1/debug/ASAN result recorded
separately. Existing JIT loop, SCCP-control, iterative-fold, switch-loop and
checked-pressure regressions pass using Stogir O3/debug host.

Actual post-inline clear kernel captured from Coil9589bb7e replays through
ordinary optimize-memory and emits48bytes (was64; LLVM16).257native calls check
zero result/length and unchanged storage/capacity. This is semantic/static
evidence; no new timed compiler or microbenchmark result yet.

The hot allocator clear is DIFFERENT: free-decision loop418 carries its state
through LOAD422 / STORE428, with fullword bitcast423 and equivalent constant
field addresses421/426. Register-only rule does not solve that loop. A memory
variant must preserve the initial read and zero-trip no-write behavior: an
unconditional zero store would introduce a write when initial count0 (possibly
read-only storage). A sound next form keeps the first test and writes0 only on
the nonzero path, joining at the exit; it must prove exact invariant addresses,
ordinary nonvolatile accesses, same-width modulo arithmetic and no other effects.
Current replay files preserve this evidence. No performance adoption or whole
bootstrap update.

Reproduce clear: copy generate.py and clear-inspect-tail.coil.in into
build/frame-origin-audit (tail named inspect-tail.coil.in), decompress
clear-snapshot.txt.gz, run generate.py with snapshot path; build replay.coil
using b27ffeb4 compiler with Stogir O3/debug or LLVM O1/debug/ASAN; execute.
For allocator graph use the free tail/snapshot; its replay prints graph facts
only and must NOT be called with the clear kernel ABI.

LLVM O1/debug/ASAN host passes all12288 baseline/optimized answers as well.
That host binary predates only the constant-time header-use-count prefilter;
the final Stogir O3/debug host includes it. The prefilter rejects already
unsupported multi-use headers without rescanning all users, and avoids requeueing
headers with multiple Phis. No timing claim for this filtering change.

A separate existing Coil bug reappeared while authoring this pass: inline
field-access vectors in for report zero-argument iter. Existing open report
coil-bugs/for-field-vector-iter-missing-argument already covers the exact case;
confirmed with9589bb7e. Named vectors are the normal valid iteration form used
here. No duplicate bug or compiler change was added.
