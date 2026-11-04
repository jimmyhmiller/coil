# Bulk initialization for def-use storage

Pinned upstream `ir.c:ir_build_def_use_lists` allocates range and edge extents
in bulk. Our compact graph keeps its existing two count/fill walks, exact
reference categories, definition/user/operand ordering and mutable-list API.
Only initialization changes: ArrayList.extend-zeroed! initializes known final
range/cursor/edge extents once instead of repeated zero push loops. Range and
Use contain only integer fields, so zero bytes are their existing zero values.
The empty graph retains its zero range sentinel and no edges. Capacity is an
implementation detail; downstream mutation does not require spare geometric capacity.

ASAN/debug empty/small uses, mutable-use redirects/growth, switch native matrix
and verifier suites pass. The opaque reduction materializes every edge and
checks the sum of all definition/user/operand triples against an independently
accumulated construction oracle. Stogir, LLVM and TPDE all pass.

Fixed LLVM-built Coil86648db1, O3/no-debug, caches off. Initial runs have eight
rotating generation and sixteen CPU samples after warmup. Native paired repeat
rotates all six before/after/backend binaries with16 CPU samples after warmup;
its opaque LLVM runner is byte-identical for all binaries.

|Backend|Before CPU ms|After CPU ms|Paired before ms|Paired after ms|
|---|---:|---:|---:|---:|
|stogir|12.5385|10.6490|12.4860|10.6580|
|LLVM|6.8705|5.9900|6.7490|5.8480|
|TPDE|60.8140|46.7965|60.7860|46.8235|

Stogir CPU improves15.1%/14.6%, while LLVM also improves12.8%/13.4%.
Stogir still takes1.82× LLVM in the paired repeat. The separately measured
kernel generation16.2515→16.4675ms is neutral; LLVM61.0025→57.8885ms.
These generation times compile this reduction; they do not measure running the
compiler's improved def-use builder. No full bootstrap speedup is established.

[Before](validation/uses-initialization/before.json), [after](validation/uses-initialization/after.json),
[paired repeat](validation/uses-initialization/native-repeat.json), [driver](validation/uses-initialization/measure.py).
Fixtures: benchmarks/compiler-gaps/uses-graph{,-runner}.coil. Assembly excerpts
in the same evidence directory show the actual initializer change.

Do not replace the reference walk blindly with upstream input-prefix counts:
our use categories additionally include selected control/label operands. Any
later traversal change must preserve those exact extra edges.
