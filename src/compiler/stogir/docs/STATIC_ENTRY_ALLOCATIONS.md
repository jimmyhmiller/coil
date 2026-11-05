# Fixed function-lifetime objects and rematerialization

Based on bulk128 source0d6d545. Native frame storage and address rematerialization
are implemented. Compiler integration and bootstrap performance acceptance remain
open. No whole-compiler speedup is claimed.

## Semantics and provenance

Pinned ir_aarch64.dasc selects IR_STATIC_ALLOCA for numeric constant ALLOCA in
entry block1 under IR_FUNCTION; fixed objects have frame offsets and addresses
can be rematerialized. The port previously emitted every ALLOCA as an SP change.

An initial unconditional conversion failed572 of the2640 existing stack checks:
zero-sized ALLOCAs observe raw SP and relative object distances. That conversion
was removed. Existing tests and raw-stack behavior are retained.

`builder/frame-object!` explicitly declares a positive constant-extent,
function-lifetime object in the entry allocation prefix. It uses ALLOCA's existing
operand layout and auxiliary32768 as an independent semantic attribute. This
attribute is Coil code, not upstream metadata compatibility. Ordinary ALLOCA
retains its original raw-SP meaning. Frame objects do not contribute to AFREE
or saved-SP scopes. Their physical position relative to raw SP is unspecified.
The native validator checks the marker, extent, entry prefix, type and alignment;
the builder rejects invalid requests without appending a node.

Call cloning clears this attribute and lowers the callee's object to call-local
storage inside the existing explicit save/restore scope, preserving bounded
caller stack use. The million-iteration native inline-result loop exercises this
path. The opcode and cell format remain unchanged. Attribution remains centralized
in LICENSE, NOTICE and PROVENANCE.

## Native pipeline

Matching records an immutable graph-reference-indexed size plan before liveness.
Frame layout allocates distinct checked aligned local slots, separate from spills
and outgoing arguments. Fixed definitions have no virtual-register ranges or
constraints. Their source locations are immutable x29- or SP-relative addresses,
not memory contents. The finalized location index records them in reference order.
Dynamic storage still establishes the anchored frame and follows original lowering.

Scalar operands materialize addresses in reserved temporaries, just as literal
addresses do. Call/return capture and typed/untyped simultaneous copies support
these read-only sources. Parallel-copy identities include both kind and offset,
so a spill slot's contents and its address remain distinct. Read-only destinations,
narrow/wide address transfers, duplicate destinations, and invalid scratch/base
combinations fail transactionally without appending bytes. Phi edge sources are
excluded from register liveness and rematerialized into their selected destination.
Generic identity plans retain this intrinsic frame-object behavior too.

## Validation

Debug checks and AddressSanitizer pass the new selection/native matrix: fixed
objects, distinct objects, variable counts, nonentry raw allocations, zero size,
8193-byte/64-aligned storage, saved scopes after fixed storage, and mixed fixed
storage with dynamic allocation/free. Native results use an independent x+13
oracle. The same8193-byte object is emitted as Mach-O, linked by cc and checked
from C on8 inputs including unsigned wraparound.

Existing suites pass: stack builder/errors,2640 raw nested stack cases,
jit-stack-scopes, jit-stack-branch, jit-stack-loop, jit-call-stack,
jit-frame-address, jit-local-frames, jit-locals, jit-bulk-pressure,
jit-aggregate-results, inline-stack-results, and verify. Bulk pressure now covers
both raw and fixed objects with calls and spills; inline result cases cover both
storage declarations. Logs, C caller, assembly and source hashes are archived in
validation/static-entry-allocations.

The native pipeline additionally rejects forged markers with nonentry control,
variable or zero extent, unknown marker bits and wrong result type. Constructor
rejections preserve graph length; tests mutate headers directly to exercise the
validator independently of the checked builder.

Additional rematerialization validation covers72 native simultaneous-copy answers:
SP and x29 bases, moved SP under an anchored frame, two copy orders, large offsets,
GPR cycles, SIMD captures and mixed widths. Rejection cases verify output atomicity.
Pointer Phis and nine-pointer calls (including a stack argument and live call
results) pass independent arithmetic answers at O1/O2/O3. Allocation checks prove
fixed objects have no ranges, uses or allocation parts. Independent C AOT tests
also exercise the Phi/call object, including unsigned wraparound.

Rematerialization evidence is in validation/static-entry-rematerialization. The
call/Phi checks run with both fixed SP and a displaced dynamic SP anchored by x29.
Independent C checks link all three Mach-O objects. Parallel copies additionally
preserve NZCV; error cases cover incompatible bases and negative offsets. The
original2640 raw stack variants, scoped/dynamic stack suites, aggregate-result
ABI checks and allocation/transfer/edge regression suites still pass.
