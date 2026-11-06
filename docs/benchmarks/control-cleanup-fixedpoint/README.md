# Control cleanup fixed point: validated optimizer correction, neutral components

Library e594b30 (diagnostic0051e46); Coil implementationf0985786 and provenance65ea51a8.
Candidate build passes; quick54.3s and live/prebuilt retention pass. Eight native
library suites and three ASAN suites pass; old-source negative control fails the
new real-graph assertion. No global installation or push.

The real graph.operand helper loses its intermediate Boolean Phis after normal
optimization. Its body shrinks212→184 bytes: CSET/UBFX and Boolean-merge branches
are replaced by direct failure branches. Signed /4 and %4 correction remains.
This is evidence of correct application, not compiler-wide speedup.

Eight alternating CPU samples after warmup, same source, identical opaque caller:

| Component CPU median | Before | After |
|---|---:|---:|
| Actual provider closure |104.0505ms|103.6625ms|
| LLVM provider control |53.2725ms|53.3040ms|
| Actual emitter |678.6530ms|676.9420ms|
| LLVM emitter control |371.1295ms|368.4105ms|

Both components are effectively neutral. Provider single generation1.014000→1.005378s;
emitter2.776722→2.831522s. Single generation samples establish no performance gain.
LLVM control objects are compared in results.json; all execution answers pass.
No own builds/tests/profiles overlapped timing. Other local compiler and NEON
jobs were visible before measurement; process snapshots are retained. These are
qualified diagnostics, not acceptance medians. No new whole-bootstrap claim;
latest whole target remains unmet at3.3763× generation and1.5460× runtime.

The final memory-only phase remains intentionally unchanged. Arbitrary memory
forwarding induced control fixed point is not claimed. Next action: profile the
current real emitter and LLVM control to identify substantial costs rather than
extrapolate this helper's smaller body into a whole-compiler gain.
