# Darwin AArch64 scalar ABI

The standalone backend currently targets macOS AArch64. Function graphs and callee
annotations retain binary prototypes in the graph-owned string table. The layout
follows [Apple's ARM64 ABI](https://developer.apple.com/documentation/xcode/writing-arm64-code-for-apple-platforms).

## Declaring a function

Use `calls/create` to construct a scalar prototype, then
`calls/function!` to attach it to the graph. The graph owns a serialized copy;
release the construction-time prototype with `calls/release!` afterwards.
Declaring the same prototype again is allowed; a conflicting declaration errors.

`PARAM` operand 3 is the **source parameter ordinal**, starting at zero. It is
not a physical register number. A declared signature allows unused projections
to be omitted while preserving the types and positions of all parameters.
The projection's type must agree with the declaration, and each ordinal has at
most one projection. Its region must be the function entry.

For graphs without an explicit declaration, the backend infers a signature from
all PARAM nodes before liveness removes unused projections. That requires a
complete prefix of parameter types through the highest projected ordinal. A gap
produces a diagnostic asking for a declaration; it does not guess a missing type.

The existing `calls/attach!` API annotates a callee address with a PROTO node.
It is separate from `calls/function!`, which describes the function being built.

## Locations and lifetime

Integer, boolean, character, and address parameters use x0–x7 in integer-argument
order. Floating parameters consume their own d0–d7/s0–s7 locations. The classifier
accounts for unused floating parameters, including their stack slots. Live f32/f64
parameters and results now use SIMD allocation, typed incoming stack loads and
exact-bit constant return materialization. Incoming register reservations cover
both banks, and entry PARAM capture precedes calls even when constructed later.

Once a scalar class exhausts its eight argument registers, fixed stack parameters
use their natural size and alignment. Signed byte/halfword parameters load with
sign extension; unsigned and boolean values load without sign extension. Pointer
parameters occupy eight bytes. Incoming stack offsets are relative to entry SP,
so emission adds the finalized local frame size after the prologue adjusts SP.

Block starts and parameter projections precede body instructions in each block's
schedule. Physical reservations protect incoming GPR values from entry until
capture, including when earlier stack projections need registers. Calls reserve
caller-saved registers; live-through values spill. Non-leaf functions link and
restore a frame record containing x29 and x30.

Outgoing call arguments use a separate area at current SP below spill slots and
the non-leaf frame record. Darwin integer variadic calls place unnamed promoted
values in aligned eight-byte slots after the fixed arguments. The outgoing-area
planner and emitter share the same layout model. Sub-32-bit register arguments
are sign/zero-extended to 32 bits after simultaneous copies consume their sources.
Fixed stack arguments use byte/halfword stores where appropriate; unnamed narrow
integers are promoted before their eight-byte variadic slots. Narrow call results
and generated function results are normalized by signedness.

A void RETURN uses zero for its absent value operand. Non-void RETURN requires a
value of the declared type. The builder, patcher, structural verifier, semantic
verifier, and emitter agree on that distinction.

## SIMD scratch

Integer population count uses v31 for scalar transfer, CNT and ADDV. v31 is
caller-saved under the current Darwin target and is reserved for emission,
consistent with the [AAPCS64 SIMD register convention](https://github.com/ARM-software/abi-aa/blob/main/aapcs64/aapcs64.rst#simd-and-floating-point-registers).
The SIMD allocation mask now excludes v30/v31, preserving v31 for this
sequence and reserving two floating emission temporaries. Scalar numeric conversion and truth/selection now use these reserved
temporaries. Vector lowering remains incomplete. No callee-saved SIMD
registers are changed.

## Current limits and evidence

Incoming live integer scalars, including byte/halfword values, bool, char, and
pointers, have lowering. Native coverage includes mixed 32/64-bit stack slots,
narrow sign/zero extension, a stack pointer parameter, omitted projections,
reversed projection order, and unused floating arguments. A separate regression
constructs a call before a register PARAM and verifies capture before clobber.
The mixed stack/non-leaf function also links and runs as AOT code. Narrow binary
operations and comparisons normalize operands locally and preserve original live
values. The 24-value call-pressure test includes signed byte/halfword values
widened for a call and then stored from their original SSA values after the call.
Even-position reloads run before odd-position pre-clobber spill stores; each
subposition remains its own parallel-copy group.

Outgoing calls support scalar integer, bool, char, address, f32 and f64 arguments
and results, plus void/narrow results and Darwin integer/floating varargs.
A shared per-argument plan assigns GPRs and FPRs independently, packs exhausted
fixed arguments at natural sizes, and puts unnamed promoted arguments in
eight-byte stack slots. f32 variadic values convert numerically to f64. JIT and linked AOT checks exercise a
sixteen-argument callback with narrow register/stack permutations, signed and
unsigned return boundaries, variadic promotion through libc snprintf, and a
non-leaf void-returning function. A native callee probe reads the already-extended
32-bit argument register, detecting missing extension of negative constants.

Further control/intrinsic semantics, reading variadic function arguments, aggregate ABI
lowering, other conventions, additional special constants, and additional
AOT formats/features remain unfinished. Named FUNC calls and FUNC/SYM/STR
addresses now lower through shared image relocations, including recursive calls. See [IMAGES.md](IMAGES.md) for the shared
image relocation support. Unsupported cases must produce explicit diagnostics. ABI coverage is
not a claim of full upstream parity or measured compile/runtime performance.

## Register-class and transfer foundation

Allocation parts now carry admissible physical-register masks, preserved across
splits and enforced by both allocation decisions and independent checks. Target
physical IDs are GPR 0..31 and SIMD 32..63. The AArch64 bridge retains 16-register
scans for GPR-only functions and can represent mixed classes without assigning
floating values to GPRs. Live floating PARAM/RETURN/call ABI is now connected to this foundation.
Floating arithmetic, memory, bitcasts and phi constants now have selection.
Numeric conversions and scalar truth/conditional selection now have lowering;
remaining control/intrinsic semantics still prevent full-library parity.

Allocatable GPRs remain x0..x15. The SIMD mask admits v0..v7 and v16..v29;
v8..v15 are excluded until callee-save preservation is implemented. v30/v31 are
reserved for floating emission, and integer CTPOP also uses v31. GPR scratches
x16/x17 remain separate from these SIMD registers.

Physical scalar transfers support GPR, SIMD and stack locations, including raw
32/64-bit moves between banks for bit reinterpretation. Parallel-copy resolution
uses disjoint register and spill-location encodings and preserves payload bits
through mixed cycles. Target frame copies hold their cycle temporary in reserved
v31, with x16 for addresses and x17 for memory data. Raw FMOV transfers do not
numerically convert values. The legacy immediate-only API can still use a GPR
cycle temporary. SIMD loads/stores and transfers
preserve NZCV. Failed transfers do not partially append code bytes.

## Floating ABI evidence

Native tests cover all eleven FP source ordinals (d0/s0 through d7/s7, then three
stack positions) for both widths, exact NaN/signed-zero returns and constants,
and incoming values retained across a non-leaf call. The latter deliberately
constructs the call before the PARAM projection and verifies capture first.
Mixed calls carry ten integer and ten alternating f64/f32 arguments, exhausting
both banks and exercising natural stack packing. Checks cover floating results
and live-through values in either bank, including an integer retained across an
FP-result call and an f32 retained across an f64-result call. Linked objects
exercise mixed calls, stack inputs above the non-leaf frame, and snprintf default
floating promotion. Arithmetic/comparisons, memory, live bitcasts and phi constants now pass native
and linked tests. A 24-value FP call-pressure test covers both widths and forced
SIMD spills. Numeric conversions and scalar truth/selection now have native and linked
coverage. Wider compiler/intrinsic/control semantics remain separate gates.

## Numeric conversion and truth contract

INT2FP uses source storage signedness and width, normalizing narrow sources into
scratch before SCVTF/UCVTF. Integer-to-f32 folding converts directly to f32; it
never routes through f64 and therefore avoids double rounding at 64-bit integer
midpoints. FP2INT rounds toward zero. Folding decodes IEEE sign/exponent/fraction
bits with integer arithmetic and folds only when the truncated result fits the
destination storage range, including negative fractions that truncate to unsigned
zero. NaN, infinity and out-of-range truncated values stay unfolded; native AArch64
instruction behavior outside that domain is not a portable conversion promise.
Narrow results normalize to their storage width. Boolean results are canonical
0/1 after byte-width integer conversion, distinct from testing FP nonzero truth.

FP2FP is an exact identity at equal types. Precision-changing finite conversions
use FCVT; constant NaNs remain unfolded so the target handles payload processing.
Scalar folding assumes the normal default rounding environment; explicit FP
environment control and observable exception flags are not represented by these
pure IR operations.

IF and COND share typed truth flags: either signed floating zero is false, NaNs
are true, and integer/address comparisons use their full declared width. COND
captures flags before literal materialization and chooses CSEL or FCSEL according
to the result bank. Typed arm materialization preserves flags and raw payloads.
LLVM i1 casts and signedness-specific LLVM conversion opcodes require explicit
frontend lowering rather than blindly using the IR Boolean storage byte.

## Typed local storage

`builder/variable!` creates a named VAR in a block-start region. Its scalar or
vector type sets the object size. Alignment zero means natural type alignment; explicit
power-of-two alignment is in bytes. The AArch64 target selects a frame alignment
A equal to the maximum of sixteen, resolved VAR alignments and ALLOCA requests, then aligns
the actual SP to A. Relative slot alignment therefore establishes actual address
alignment even when the caller guarantees only sixteen bytes.

`builder/variable-address!` creates an ADDR-valued VADDR. VAR itself denotes
storage and cannot serve as an ordinary register-value operand. It contributes
graph dependencies without creating a register interval. VLOAD/VLOAD_v use
`[control variable]`; VSTORE/VSTORE_v use `[control variable value]`. Access types
may differ from the declared storage type when their complete size fits the object.
Volatile variants remain explicit control-chain operations. Objects are not
automatically initialized.

Fixed outgoing arguments, the non-leaf frame record, local objects and spill
slots occupy disjoint frame storage. The outgoing area lies at SP with the frame
record above it when some call passes an argument in memory, which its callee
reads at SP, and in every anchored frame. Otherwise the area holds only the
function's private call storage (ARGVAL copies and result-pointer saves) and
lies above a frame record placed at SP itself (`frame-address.Base.call-area`).
A record at SP in a frame of at most 496 bytes is stored with SP pre-decrement
and reloaded with post-increment, so the prologue and every epilogue need no
separate SP adjustment; `tests/frame-shapes.coil` executes each frame shape. Local objects and spilled values have
separate ownership maps, so equal owner IDs cannot cause accidental aliasing.
Local addressing handles offsets beyond ADD-immediate encoding. Native coverage
includes all scalar types, mixed storage views, literal/volatile accesses,
alignment, integer/FP loops, 24 local addresses live through a mutating call with
forced spills, and 1,100 local objects in an 8.8 KB frame. Linked objects cover
Boolean/integer/floating storage, loops and the large frame.

Large scalar spill and outgoing-call offsets have explicit address materialization
as described below. Over-aligned frames use saved entry SP as described next.

## Anchored fixed frames

`builder/frame-address!` emits ADDR-valued FRAME_ADDR. The current target policy
establishes a real x29 frame record whenever this operation is selected, even in
a leaf function. FRAME_ADDR returns that record address. Its first eight bytes
hold the previous x29 and the next eight hold saved LR. This policy selects the
upstream frame-pointer case rather than its entry-SP fallback.

`frame-address/Base` records the physical base and logical anchor offset. Fixed
storage lowering uses SP/zero bias for ordinary functions, or x29/frame-record
bias for anchored functions. The context reaches split/parallel transfers, phi
edge stores, incoming arguments, locals and call operand capture. Outgoing call
argument stores use current SP. Existing low-level emission APIs retain their
SP-based behavior; their `-at!` forms accept an explicit frame base.

Frames with A greater than sixteen add a saved original entry-SP field at x29+16
and reserve a 32-byte record. The prologue captures entry SP in x16, subtracts the
fixed frame using x17 when a scratch is needed, then aligns SP down through x17.
Frame-record stores preserve x16 until its saved slot is installed. Incoming
stack arguments load through that saved pointer rather than assuming a constant
entry-to-frame displacement. `incoming/emit-entry!` provides this low-level path;
the existing `emit-at!` path retains the constant-displacement behavior.

At every anchored return, fixed SP is restored from x29 before the saved frame
registers are loaded. Over-aligned returns retain saved entry SP in x17 while x16
addresses the record, then restore SP exactly, including alignment padding.
Native tests verify prior-frame linkage and saved LR,
both scalar widths and register classes under forced spills, incoming stack
parameters, FP phi cycles and local storage in ordinary and anchored modes.
A separate native test moves SP by 256 bytes and verifies GPR/SIMD/memory
parallel-copy cycles through the fixed anchor. Dynamic ALLOCA/AFREE now use this
anchor and the outgoing-area policy below.

## Dynamic stack objects

`builder/stack-allocate!` emits ALLOCA with control, integer byte-count value and
alignment metadata. `builder/stack-free!` emits AFREE with control and byte count.
Both use the same `round_up(count, A)` size, where A is the function frame
alignment and is at least sixteen. Counts can use any scalar integer
storage type, including ADDR. Signed counts must be nonnegative; all counts must
be at most `i64::MAX - (A-1)` so rounding fits. Construction checks constants using
the request's known minimum alignment; target lowering rechecks against the final
function alignment. Dynamic counts normalize their declared width/signedness
and trap before allocation/free changes SP when outside that domain. Available stack capacity
remains a platform limit.

Alignment zero requests the sixteen-byte minimum; larger power-of-two requests
raise the function's alignment. A zero-size operation moves SP by zero. AFREE must match the byte
count of the most recent live allocation; its original unrounded count is valid.
Function return restores the frame anchor and discards any remaining objects.

Every function with ALLOCA/AFREE uses x29 for fixed storage. Let N be its maximum
outgoing argument area, rounded to A. `[SP, SP+N)` stays reserved for calls.
Allocating d rounded bytes subtracts d from SP and returns `SP+N`. The new object
occupies `[newSP+N, oldSP+N)`, below older objects and the anchored frame record.
Outgoing stack arguments therefore cannot overwrite live dynamic data. Fixed
locals/spills and incoming stack parameters remain independent of current SP.

Native checks cover one thousand size/type/alignment/nesting variants, both
freeing and return-only restoration, invalid-count traps in isolated children,
24 dynamic addresses live through a mutating call with forced spills/outgoing
stack arguments, FP pressure with a live dynamic count freed after the call,
incoming arguments, integer/FP memory-state loops with changing allocation sizes,
and distinct returns at different stack depths. Linked objects cover dynamic
call objects, both loop result classes and branch-dependent restoration.

Over-alignment evidence includes 1,664 scalar local-storage variants through 4 KB,
2,640 nested allocation/free variants through 8 KB, large aligned GP/FP call
pressure, and an external callback checking 24 dynamic addresses at 4 KB alignment
with the outgoing area expanded to match. A separate caller sweeps all 278
sixteen-aligned entry-SP positions modulo 32/64/256/4096 and checks incoming
mixed-width stack values, fixed/dynamic addresses, calls, free and exact SP
restoration. Linked 64-byte and 4 KB frame fixtures execute too.

## Large scalar frame accesses

`a64.frame-memory/access!` first tries the direct scaled load/store encoding,
then materializes an address in a caller-owned GPR when necessary. It handles
integer byte/halfword/word/doubleword accesses, signed narrow loads and f32/f64
accesses, including unaligned views. Address construction and memory operations
preserve NZCV. Incoming stack arguments, outgoing stack stores and saved-frame
record accesses use this path.

`transfers/emit-addressed!` accepts separate data and address scratches for large
register/memory and memory/memory copies. `transfers/parallel-frame!` reserves
v31/x16/x17 for cycle/address/data values so address materialization cannot
destroy a live copy-cycle temporary. It remains valid when SP moves under an
anchored function. The solver uses dense stack identities mapped to i64 byte
offsets, rather than casting offsets into its i32 move IDs. The legacy low-level
immediate-only APIs retain their explicit range diagnostics.

Native tests cover direct-encoding boundaries, unaligned offsets through 65 KB,
surrounding-byte integrity, signed loads, exact FP payloads and preserved flags;
distant mixed GPR/SIMD/memory cycles; and whole functions with 4,200 fixed objects
pushing GP/FP spills and incoming arguments past immediate ranges. Offsets beyond
i32 are checked for emission only. A 4,105-argument variadic call exercises a last
stack argument at SP+32768 and a still-higher frame record, with/without a live
dynamic object, through JIT and linked AOT.

Fixed prototype parameter counts retain the upstream one-byte limit of 255.
Total CALL inputs use sixteen bits: after control/callee, up to 65,533 actual
arguments are representable. Variadic call construction now distinguishes those
limits; boundary tests reject excess counts before graph mutation.

## Dynamic stack scopes

`builder/stack-save!` emits upstream BLOCK_BEGIN, a control-pinned ADDR result
containing raw SP. `builder/stack-restore!` emits BLOCK_END and restores that
pointer. A restore releases all allocations after the snapshot, so their sizes
need not be available. Both operations require a control predecessor that has
not ended its block; restore additionally requires an ADDR value. A VAR storage
identity is not an address value.

The saved pointer includes the outgoing argument prefix. Do not adjust it by
`outgoing-size` or treat it as an ALLOCA object address. Snapshots are ordinary
allocated values and may spill across calls; fixed-frame slots stay relative to
x29. Save/restore-only functions also establish a frame record. Both instructions
preserve condition flags.

The caller must use a live snapshot from the same function invocation, preserving
its stack/frame alignment, and must stop accessing objects released by restore.
The IR does not insert runtime provenance checks on saved pointers. Whole-function
return restores the entry stack regardless of remaining dynamic scopes.

## Indirect aggregate arguments

`builder/argument-value!(graph, source, size, alignment)` emits the reference
ARGVAL node: an ADDR result with an ADDR source and signed i32 size/alignment
metadata. Size must be nonnegative. Alignment may be zero (natural minimum) or a
positive power of two. The AArch64 private copy has at least eight-byte alignment;
requirements above sixteen also raise the function's actual frame alignment.
A VAR identity is not an address; use VADDR. ARGVAL cannot wrap another ARGVAL.

ARGVAL is only valid as a CALL argument. Declare that prototype parameter ADDR.
At the consuming call, the object is copied into private caller storage and the
copy's pointer is passed using the ordinary integer bank or stack pointer slot.
Incoming indirect parameters are normal ADDR projections. A preceding
control-ordered write is visible in the copy. The callee may mutate its copy
without changing the source. Reusing one ARGVAL node in several argument
positions creates distinct copies; each call refreshes its copies.

Private buffers follow all scalar stack arguments in the outgoing area, with
checked alignment and size accounting. Consequently they are distinct from
fixed locals/spills and live dynamic allocations. Calls may reuse the outgoing
area, and a pointer to a copy must not outlive that call. The source must denote a
readable normal-memory range of the declared size and must not alias internal
outgoing storage. A zero size performs no source access and reserves a distinct
aligned byte for the private pointer. Available native stack space remains a
platform limit.

The copy emitter uses exact eight/four/two/one-byte accesses for small objects
and bounded eight-byte loops with exact tails for larger objects. It uses only
reserved x16/x17/x30/v31, before x30 captures an indirect target and before scalar
argument copies. It makes no runtime helper call and preserves allocatable GP/FP
values. Arguments passed through Darwin `...` receive their private pointer in
an eight-byte stack slot.

This implements the reference's indirect ARGVAL path. It does not by itself
classify small C aggregates, HFAs/HVAs, grouped register arguments, multi-register
returns, or the dedicated x8 indirect-result pointer. Separate grouped and result
interfaces below provide those ABI roles; compiler classification remains open.

Checks cover malformed construction and illegal uses, distinct/aligned per-use
copy placement, bounded code through i32::MAX bytes (emission only), 74 native
protected-boundary copy sizes, and 672 whole-function size/alignment/frame/GP-FP/
fixed-variadic combinations. The latter retain forty values through repeated
mutating calls, including two copy pointers on the stack, and verify untouched
source bytes. Four linked fixtures exercise aligned dynamic objects and both
result banks for fixed and variadic calls.

## Grouped scalar pieces

`calls/create-grouped(flags, result, parameters, groups, allocator)` describes
arguments that must travel together. `call-groups/Group` contains `first` (a
zero-based ordinal in the flattened scalar list), `count`, and `alignment`.
Records are sorted, disjoint, and cannot cross the fixed/unnamed boundary.
Existing `calls/create` keeps the original scalar prototype bytes unchanged.

Supported groups are two identical U64 or I64 pieces, or one through four
identical f32/f64 or 64/128-bit short-vector members. These are classified ABI pieces, rather than source
record addresses. The frontend must classify and marshal the source aggregate,
including exact-width loads of partial words. Group alignment is a power of two
from the member width through sixteen, and the complete payload must satisfy it.
For an integer pair, use eight- or sixteen-byte alignment. Vector members use
their natural eight- or sixteen-byte alignment. Padded homogeneous representations
are outside this interface's current coverage.

Use the same grouped prototype with `calls/function!` for an incoming function.
PARAM ordinals still index the flattened pieces. The complete prototype retains
all group members even when some PARAM projections are unused or absent.
Outgoing calls and incoming parameters now use one Darwin layout planner.
Groups fit completely in their bank or go completely to the stack and exhaust
that bank. The other bank remains independent. Darwin permits a sixteen-aligned
integer pair to start at an odd-numbered register.

Named floating groups keep tightly packed members in memory with their declared
alignment and payload size. For example, a three-float group can occupy stack
bytes4..15 after a one-byte stack argument at0. An unnamed group uses eight-byte
stack alignment and rounds its whole extent to eight bytes. Its f32 members are
not individually promoted to double; an ordinary unnamed f32 scalar still is.
Call-site descriptors may cover unnamed arguments beyond the fixed type prefix;
those members are checked against actual operands. Function declarations may
only describe their named parameters.

Grouped prototypes retain the upstream flags/result/count/type prefix, followed
by a Coil extension when groups exist: `SGAG`, version1, a zero byte, u16 record
count, then eight-byte records containing u16 first, u8 count, u8 alignment and
four zero reserved bytes. Integers use little-endian order. Empty extensions,
unknown versions, nonzero reserved fields, malformed/truncated records and
incompatible types are rejected. Extended signatures describe Coil's additional
ABI contract; they are not an upstream aggregate-prototype format.

The native tests compare actual C aggregate interfaces in both directions,
including aligned integer pairs, f32/f64 homogeneous groups of every supported
length, register-bank boundaries and omitted incoming projections. C callbacks
use explicit exports and typed by-value pointers to select Coil's C ABI thunks.
Outgoing functions retain forty integer or floating values through the callback.
Named calls use resolved JIT images and linked external C symbols.


## Aggregate result storage

`calls/create-result(flags, parameters, groups, result, allocator)` describes a
classified aggregate result with an explicit storage operand. Its IR return type
is VOID, and fixed parameter ordinal zero must be ADDR. This address is a CALL
operand and a generated function PARAM, rather than an ordinary native argument.
VAR and ARGVAL references cannot stand in for the result address. The caller must
provide writable storage for the complete classified extent and any alignment
required by the source ABI.

`call-results/pieces(type, count)` supports one or two U64/I64 words, or one
through four homogeneous F32/F64 members. The result address consumes no native
argument register or stack slot. Before calling, the emitter saves it in a
private outgoing slot. Immediately after the call it writes the complete return
bank into that storage, before allocation transfers can overwrite those registers.
A generated callee exposes a private fixed-frame buffer as PARAM zero; its body
writes the classified pieces there and RETURN installs x0–x1 or v0–v3 from it.
Every executed return must have initialized the required pieces.

`call-results/indirect()` passes the result address in x8 independently of x0–x7.
The callee writes directly through PARAM zero. No post-call result-bank capture
or return-bank installation is needed. Fixed parameters after ordinal zero use
the normal argument banks and stack placement, including grouped arguments.

Partial integer aggregates need storage for the full coerced register extent.
For example, a three-byte record uses one eight-byte classified word. Source
padding has unspecified contents; compiler marshaling must preserve logical
fields without reading beyond the source object's bounds. The result-storage
contract does not perform source-language aggregate classification.

Aggregate signatures append SGAG version2 to the unchanged scalar prefix. The
sixteen-byte header contains magic at0..3, version at4, result kind at5, little-
endian u16 group count at6..7, result piece type/count at8..9 and six reserved zero
bytes at10..15. Group records retain their eight-byte format. Kind1 is a register
result; kind2 is indirect and requires zero type/count. Kind0 uses the original
scalar encoding or version1 grouped encoding. Unknown kinds, malformed shapes,
invalid result roles, reserved bytes and truncated trailers are rejected.

Focused tests cover 204 native graph variants with real C aggregate interfaces:
integer words, homogeneous floating results, indirect records and partial logical
payloads. They check exact payload bits, live values across nested calls, dynamic
stack storage, over-aligned frames and surrounding output bytes. Thirty linked
AOT objects exercise both directions, including named calls through resolved JIT
images and external C symbols. Twelve additional self-recursive functions run
through JIT and linked AOT with 16/4096-byte alignment, dynamic storage, two return
paths and depths through31. They check per-frame guards after recursive calls and
exact logical field bits. Protected-page checks cover all twelve register-result
shapes, with both ends of source/destination extents abutting inaccessible pages
and complete surrounding-byte comparisons. Vector results and compiler-specific
classification/marshaling remain open.


## Short-vector transport foundation

`types/vector-type(base, count)` constructs the upstream byte encoding: scalar
base in bits0..3 and log2(count)+1 in bits4..6, for power-of-two counts1..64.
`vector?`, `valid?`, `base-type`, `lanes` and `size` validate/decode that geometry;
`size` takes the target pointer width. Void has zero lanes. The existing
`valid-scalar?`, scalar predicates and `scalar-size` retain their behavior.
Representation validity does not imply that an operation or target accepts that
shape. `short-vector?` identifies vector extents of eight or sixteen bytes.

The native transfer layer now accepts sixteen-byte payloads in SIMD registers
or stack slots. Full-width register moves use ORR Vd.16B,Vn.16B,Vn.16B, rather
than scalar FMOV, and memory operations use Q-register loads/stores. Scaled
immediates and materialized large/unaligned addresses share the checked frame
access path. A sixteen-byte GPR or cross-bank transfer is rejected, including
an identity transfer through a GPR. Invalid transfers preserve output bytes.

A sixteen-byte memory-to-memory transfer needs a caller-owned SIMD data scratch,
separate from a GPR address scratch. `parallel-frame!` uses reserved v31 for the
cycle value, v30 for memory data and x16 for addresses. Scalar groups retain
their existing scratch policy. Every simultaneous group has one raw width and
distinct stack identities must describe nonoverlapping storage extents.

Forty-eight native cases exercise register, stack and mixed cycles, fan-out,
large/unaligned offsets and frame bias, comparing complete buffers and preserved
flags. Protected-page checks put both ends of sixteen-byte source/destination
extents against inaccessible regions. Instruction words match LLVM MC reference
output. A separately linked Mach-O fixture verifies a four-way register/stack
cycle through large, unaligned frame slots and preserved flags. Vector graph memory and Phi paths are now connected to this transport layer
(see below). Vector constants now use the shared image path below; vector arithmetic and
broader vector/HVA ABI validation remains open.


## Mixed-width copy and spill ownership

`moves/resolve-sized` plans simultaneous raw copies with a byte extent on each
edge. A cycle save uses the maximum extent read from its original source;
ordinary writes retain their own edge extent. This preserves a full vector even
when its register is also the destination of a narrower scalar write. Splitting
a simultaneous group by width would not preserve that dependency.

`a64.typed-transfers/Copy` pairs a `locations/Transfer` with size4,8 or16.
`parallel-frame!` emits all copies through one sized plan, reserving v31 for
cycle state, v30 for sixteen-byte memory data, x17 for scalar memory data and
x16 for addresses. These registers cannot participate in input copies. GPR
locations cannot carry sixteen bytes. Distinct stack identities must not overlap;
extents and frame bounds are checked before emission. Stack overlap validation
sorts unique offsets in O(n log n). Output bytes remain unchanged on failure.
Scalar register destinations define only their declared low extent.

`allocation/run-shaped!` takes an immutable `SpillShape` slice indexed by virtual
parent ID. Each shape specifies byte size and alignment; every live virtual
parent must have a positive size and power-of-two alignment. A split child uses
its original parent's entry. Evicting an owner consults that owner's shape,
rather than the shape of the value requesting the register. Physical reservations
need no storage entry. `run!` remains the uniform-shape interface. Missing or
invalid shapes reject before the allocation queue or frame is changed.

The AArch64 allocation bridge now supplies a shape for each graph reference.
Scalar slots remain eight bytes; the machinery can represent sixteen-byte
values. Split-boundary and ordinary/Phi edge groups now derive transfer extents
from their owning graph value and use one mixed-width plan. Byte/halfword values
retain their normalized four-byte register form. Calls still use their current
scalar/grouped ABI interface, extended to short-vector pieces as described below.
Vector memory/Phi graph values are supported.

Validation includes729 byte-level sized-copy cases,120 native mixed GPR/SIMD/
stack cases and a linked Mach-O mixed cycle. Native allocation tests force
repeated eviction/reload of three values sharing one SIMD register, across all
six4/8/16-byte size permutations and four payload seeds. They check complete
buffers, frame padding, parent slot identity, alignment, values at all required
uses and flags. A linked fixture repeats the shaped-spill path. No backend or
performance conclusion follows from these correctness checks.


## Vector memory and Phi graph values

The structural builder/verifier accepts valid upstream vector type codes.
`builder/vector-load!` and `vector-store!` validate vector types, target pointer
width, an open control chain and an ADDR value before adding a node. Ordinary
and volatile forms use the existing LOAD/LOAD_v and STORE/STORE_v opcodes.
The vector semantic validator checks data operands separately from control
edges: a scalar return controlled by a vector load does not consume its vector
payload. Unsupported vector operations or ABI uses reject before scheduling,
including dead invalid uses. Phi incoming types must agree exactly.

AArch64 supports memory/Phi transport for eight- and sixteen-byte vector extents.
They use SIMD register classes, correctly sized/aligned spills and mixed-width
split/edge copies. Larger vector shapes remain representable but target emission
rejects their unsupported value extent. Vector local storage supports the paths
described below. Selected vector arithmetic is implemented as described below;
remaining operations are unfinished. Short-vector signatures have native coverage
as described below. Vector constants use the path below.
Scalar arguments/results may surround internal vector computations and calls.

Phi results are defined simultaneously at block entry. Their live ranges start
there, their edge destinations are looked up there, and they have no artificial
register requirement at a later textual Phi position. A Phi result may enter in
its own stack slot and acquire a register at a real data use. This rule applies
to scalar and vector values and avoids duplicate edge destinations under pressure.

Native coverage includes 52 ordinary/volatile branch graphs over all 26 supported
base/lane shapes, eight vector loop/call-pressure graphs and a scalar f64 pressure
regression. Pressure cases retain forty SIMD and forty GPR values through calls
that overwrite every allocatable caller-saved bank, swap twenty vector pairs
through loop Phis, and verify fixed/dynamic guards at 16/4096-byte frame alignment.
Payload comparisons cover signed zero, infinities, NaN payloads and arbitrary
bits, with aligned/unaligned sources and destinations. Four profiles also run
both source/destination boundary placements and branch choices against protected
pages. Eight Mach-O fixtures execute the branch and pressure paths after linking.


## Complete vector constants

`builder/vector-constant!(graph, type, pointer-bytes, payload)` takes a complete
immutable byte payload whose length matches the encoded vector extent. The
builder copies those bytes into owned graph storage and interns by the complete
header and bytes. It preserves floating payload bits and never coerces a vector
through a scalar u64 value. Invalid types, pointer widths and lengths reject
without adding cells. Representable shapes currently span one through 512 bytes;
the upstream LONG_CONST storage limit is 65520 bytes.

LONG_CONST uses the upstream sixteen-byte cell layout: opcode 78, vector type,
auxiliary byte count, previous-header reference and cached 32-bit DJB2/header hash.
Payload cells follow the header in increasing signed-reference order. In the
owned reversed array, payload chunks are appended in reverse order, then the
header. A first sixteen-byte vector has header reference `-2` and payload at `-1`.
Existing references survive array growth; existing scalar encodings are unchanged.

A parallel constant-span array marks headers with their complete cell extent and
payload cells with zero. Payload references are not graph values. `contains?`,
`lookup`, checked construction and structural verification enforce that boundary.
`verify/constants` traverses complete extents, checking geometry, continuation
markers, payload hashes and earlier-header chains. The legacy `scalar-constants`
entry point delegates to that validation. Padding outside the declared byte
count is not part of the value; builders zero it, hashing/interning ignores it.
The diagnostic dump prints vector bytes and skips payload cells as separate nodes.

Native eight-/sixteen-byte constants materialize from aligned private image data
through ADRP/ADD and a complete D/Q register load. Phi literals use their actual
SIMD class and storage extent, including spill-slot destinations. Repeated uses
of one interned constant share a private data symbol. Images own their bytes after
the graph is released, retain alignment and relocation metadata, and feed both
JIT mapping and Mach-O writing. `compile/text` rejects unresolved image references.
Wider valid vector constants remain a target diagnostic when used natively.

Validation covers all thirteen bases/seven lane counts at both pointer widths,
full-byte hash collisions, mixed scalar/long hash chains, reference stability,
padding, malformed extents/hashes/links and rejected payload references. Native
coverage includes 61 graphs: direct stores and branch Phis over all 26 native
shapes, eight loop/call-pressure graphs and a 320-constant pool. Forty literal
Phis survive spills, register-clobbering calls and 16/4096-byte dynamic frames.
Pool checks prove alignment, private binding and per-reference deduplication.
Graph release precedes native mapping. Thirteen linked objects exercise the same
paths, including a 5120-byte pool crossing architectural 4 KB address pages.
Mixed string/vector data and malformed materialization inputs also have focused
checks. These correctness checks do not establish compilation or runtime speed.


## Short-vector call plumbing

Prototype storage accepts valid encoded vector types. The AArch64 ABI planner
restricts native values to eight- or sixteen-byte short vectors and assigns them
to the SIMD bank. Homogeneous groups retain the existing all-or-stack placement
rule. Each outgoing simultaneous copy now carries its own complete byte extent;
stack capture, incoming parameters, scalar vector results and explicit homogeneous
result roles use the same type width. Sixteen-byte homogeneous result storage is
aligned to sixteen bytes.

`tests/jit-hva-abi.coil` exercises a generated caller against an exported Coil C
callback with a two-member 128-bit homogeneous vector record. It checks every
64-bit word of the argument and the returned 32-byte result, including high halves,
and preserves a live scalar across the call. The generated-callee fixtures below
add one through four members, stack/bank boundaries and linked AOT coverage.
Outgoing vector calls and variadic placement have the dedicated checks below.
Existing scalar and aggregate fixtures remain regression checks.

`tests/jit-hva-incoming.coil` generates sixteen C ABI callees, covering one through
four homogeneous members at each 64/128-bit width, with zero or seven preceding
SIMD arguments. The latter places a single member in v7, or exhausts the bank
and sends the entire larger group to the stack. A following vector verifies the
bank remains exhausted. Independent GP pointer/seed arguments exercise bank
independence. Each function writes the prefix, trailing vector and seed to an
output buffer, returns rotated aggregate members, and checks every payload word
and untouched output word. All sixteen cases execute natively and generate
separate Mach-O objects.

`tests/aot-hva-incoming-link.coil` repeats the sixteen checks against those linked
objects. It resolves their C symbols with `coil.os/dlsym`, checks each lookup,
and calls through complete typed C record signatures. Coil currently rejects
vectors nested in records in an `extern` declaration before target ABI
classification, although its C function-pointer path supports them; this
inconsistency is recorded in the Coil bug pad. The producer and linked consumer
pass with debug checks.


`tests/jit-hva-outgoing.coil` generates 32 callers: the same sixteen width/member/
bank-boundary cases, each using either volatile vector loads or complete vector
constants. Exported Coil C callbacks check prefix and trailing vectors by writing
them to caller buffers, rotate the aggregate members and XOR every returned lane
with a seed. Three seeds include zero and all-one bits. Checks cover every result
word, a live scalar across the call, unchanged inputs and untouched buffer words.
Result buffers begin eight bytes into u64 arrays and carry no promised
sixteen-byte alignment.
`tests/aot-hva-outgoing-link.coil` repeats all 96 executions against 32 separately
linked objects. Callback addresses use explicit C function-pointer types.

`tests/jit-hva-varargs.coil` checks all four homogeneous group sizes in one unnamed
argument sequence, with scalar separators before/between/after groups. Both widths
and loaded/constant forms execute through JIT and generate four Mach-O objects.
A seven-instruction entry-SP capture probe copies exactly the supplied number of
stack words into a buffer. Its instruction words were independently checked with
LLVM MC; it has no prologue, changes only caller-saved registers and returns 99.
The probe is implemented as encoded instruction words in Coil and serialized by
the library, with no external implementation language or vendored object.

`tests/aot-hva-varargs-link.coil` calls that same linked probe from ordinary Coil
LLVM C variadic calls and from the four linked stogir callers. Each stack word
must match the independently constructed expected sequence, and buffer/input
boundaries are checked. This confirms eight-byte packing, including 128-bit HVA
members beginning at stack offsets that are not multiples of sixteen. Larger
homogeneous records remain direct packed values, rather than indirect ARGVAL
pointers, in these checked Darwin variadic cases.

Remaining vector ABI coverage includes omitted PARAM projections, recursive and
named vector calls, mixed vector widths within one argument-copy group, and high
register pressure around vector arguments/results. Vector arithmetic and complete
backend integration are separate unfinished work.

The complete HVA-call checkpoint passes all 189 standalone tests and all 53
linked consumers with debug checks, exact test-set equality and regenerated
objects. Linked output contains no warnings. All shipped implementation/test
sources remain Coil. Correctness coverage does not establish code generation
speed, runtime performance or readiness of the unfinished Coil backend.


## Vector local objects and views

VAR, VADDR and both ordinary/volatile VLOAD/VSTORE families accept valid vector
storage types. Type size and natural alignment are derived with the explicit
target pointer width. Explicit power-of-two alignment may override the natural
alignment, including weaker alignment for unaligned views. The local validator
checks the complete access extent and rejects storage identities used as data.
The vector validator delegates these operations to the same local contracts.

AArch64 uses full D/Q register accesses for eight-/sixteen-byte values. Constants
materialize through the shared image before the store. Vector objects wider than
a register remain storage: narrower fitting scalar/vector views and VADDR are
supported, while unsupported wide register-valued accesses reject explicitly.
A VAR with default alignment now contributes its resolved natural alignment to
the function's frame requirement. This is necessary for naturally aligned objects
wider than sixteen bytes, even when every actual access is narrower.

`tests/vector-locals.coil` checks all 91 vector encodings at both pointer widths,
each with natural, one-byte, exact-size and doubled alignment. It checks both local
and vector validators, invalid types/control/extent, narrower views and rejected
native wide accesses. `tests/jit-vector-locals.coil` runs 280 native graphs:

- all 26 native shapes, four local/addressed/volatile combinations and both loaded
  and complete literal values;
- floating vector views of integer vector storage, naturally aligned 32–512-byte
  objects accessed through 128-bit views, and explicitly weakly aligned objects;
- eight loop-pressure graphs with forty vector locals, forty independent scalar
  values live across calls, forty simultaneously live vector reloads across a
  callback that clobbers all allocatable caller-saved banks, pair swaps, disjoint
  spill/local ownership, fixed guards and live dynamic storage.

Pressure cases use both 16-byte and 4096-byte frames, five loop counts and three
payload seeds. Basic cases also use three seeds and compare every output byte,
untouched buffer padding, guard values and unchanged input. The fixed-object
address mask is checked against the selected alignment, including 512-byte natural
alignment. `tests/aot-vector-locals-link.coil` repeats representative paths through
27 separate Mach-O objects, including all eight pressure cases and wider objects.

The vector-local checkpoint passes all 191 standalone tests and all 54 linked
consumers with debug checks, exact source/pass-set equality, regenerated objects
and no linked warnings. The 344 implementation/test source files remain Coil.
Formatting and diff checks pass. Vector arithmetic, remaining semantics and ABI
cases, full optimization/scaling, compiler integration and LLVM/TPDE runtime and
compile-time comparisons remain unfinished.


## Vector binary arithmetic

`builder/vector-binary!(graph, opcode, type, left, right, guard)` validates before
appending. The left input must match the vector result type and both inputs must
denote values, rather than VAR/ARGVAL storage. Non-shift binary operations require
the same vector type on the right; SHL/SHR/SAR and ROL/ROR also accept an integer
scalar count. Current families are integer ADD/SUB/MUL/DIV/MOD and AND/OR/XOR,
and floating ADD/SUB/MUL/DIV, plus integer SHL/SHR/SAR and ROL/ROR. Integer ADD/SUB/MUL wrap independently at each lane's
width; BOOL lanes support only the logical families. Address lanes use the target
pointer width. Logical operations preserve every raw payload bit. FP operations
use ordinary IEEE instructions without fast-math, contraction or scalar coercion.
Only DIV/MOD accept a nonzero guard, which must be an existing block start or guard.
Their explicit guard operand is retained in the ordinary three-operand IR form.

Semantic verification covers these operations separately from scalar integer and
floating validators. The target uses SIMD register constraints for both operands
and the result. Native AArch64 supports eight-/sixteen-byte vectors, using the
correct Q bit and lane-size fields. A single 64-bit integer lane uses scalar SIMD
ADD/SUB; a single f64 lane uses scalar FP instructions. Wider arrangements use
AdvSIMD forms. Other valid vector widths remain representable but reject during
target allocation/emission. Unary operations and shifts are described below.
Extrema, comparisons, lane extraction/replacement, shuffles and vector
conversions remain unfinished. Unsupported vector uses still reject, including dead invalid uses.

Operand constants load complete aligned private image payloads into reserved
v30/v31, independently of the allocated input/result registers. Emission appends
temporary code and pending image references atomically only after validation and
encoding succeed. Existing per-parent spill shapes and sized edge/Phi copies
preserve complete arithmetic results and original operand values.

`tests/vector-arithmetic.coil` checks construction/validation failures without
partial graph mutation and 254 single-instruction words obtained independently with
LLVM MC, including D/Q arrangements, register boundaries and source/result
alias cases, plus 1,905 expanded-sequence/lane words.
`tests/jit-vector-arithmetic.coil` runs 1,030 matrix graphs:
all supported native type/opcode combinations, register/register, constant-left,
constant-right, both-constant and identical-input forms. Integer MUL/DIV/MOD add
minimum-signed/all-one and zero-divisor literal cases. Eleven input patterns
include lane overflow, distinct high halves, signed zeros, subnormals, finite
extrema, infinities and quiet/signaling NaNs. Integer lanes use an independent
u128 masked arithmetic oracle with i128 signed quotient/remainder calculations;
FP lanes use scalar operations. NaN results are
compared by IEEE classification rather than assuming one payload-selection rule.
Original operand bytes, input immutability and untouched output bytes are checked.

Forty-four more graphs force forty arithmetic results and forty original vector
operands live across a callback that overwrites every allocatable caller-saved
bank. Volatile local stores keep the computations before the call. Output checks
cover every result lane and original byte, private constant data, separate local
and spill storage, fixed guards and live dynamic allocations in 16/4096-byte
frames. `tests/aot-vector-arithmetic-link.coil` repeats representative matrix and
all pressure cases through 241 separately linked objects. Both paths pass with
debug checks.

The vector-binary checkpoint passes all 193 standalone tests and all 55 linked
consumers with debug checks, exact source/pass-set equality, regenerated objects
and no linked warnings. All 349 implementation/test source files remain Coil.
Formatting and diff checks pass. Remaining vector/scalar semantics, full
optimization/verification/scaling, additional targets and object features, actual
Coil backend integration and LLVM/TPDE compile/runtime benchmarks remain open.


Integer byte/halfword/word MUL uses one AdvSIMD instruction. The target expands
64-bit MUL and all integer DIV/MOD into per-lane native operations. Signed narrow
lanes use SMOV to W registers; word lanes retain their W bit patterns, and 64-bit
lanes use X registers. DIV truncates signed quotients toward zero. MOD is computed
as dividend minus quotient times divisor, with the dividend's sign. Only reserved
x16/x17 are used: MOD re-extracts the original dividend after quotient
multiplication. It does not consume x30 or require a hidden runtime helper.
Each lane is inserted only after its needed sources have been read, preserving
all source/destination alias combinations and upper lanes awaiting computation.

For unguarded exceptional divisions, these native AArch64 paths retain the scalar
target policy: a zero divisor produces quotient zero and remainder equal to the
dividend; minimum signed divided by minus one wraps at the lane width, with zero
remainder. These are checked target behaviors, not a portable LLVM promise for
IR operations outside their defined arithmetic domain. Semantic guards are kept
as explicit graph dependencies; callers must supply their language's required
checks. Integer boundary oracles use wider arithmetic, avoiding host signed
integer overflow or zero-division behavior. Both ordinary and 4096-byte pressure
frames are exercised for signed/unsigned expanded results and original operands.

`integer-sequence!` stages all instruction bytes before appending. Unsupported
shapes/registers leave the destination untouched. Independent LLVM MC checks
cover lane extraction/insertion across every legal index and narrow signedness,
as well as complete expanded sequences with distinct registers, each result/source
alias, identical inputs and all three registers identical.

The integer-vector extension passes the complete 193-test standalone suite and
all 55 linked consumers with debug checks, exact source/pass-set equality,
regenerated objects and no linked warnings. All 349 implementation/test files
remain Coil. Formatting and diff checks pass. This completes the supported D/Q
MUL/DIV/MOD paths, while remaining vector/scalar semantics, optimization/scaling,
compiler integration and equivalent LLVM/TPDE performance measurements remain open.


## Vector unary operations

`builder/vector-unary!(graph, opcode, type, input)` checks one matching vector
value before appending. It supports NEG (31), ABS (32), NOT (45), BSWAP (54),
CTLZ (55), CTTZ (56) and CTPOP (57). Integer element restrictions match the scalar
families: NEG excludes BOOL/ADDR, ABS requires a signed element, NOT accepts raw
integer payloads, and byte swap requires a multi-byte integer element. Counts
exclude BOOL. Floating elements support NEG/ABS only. The binary builder rejects
unary opcodes explicitly. VAR storage is not an operand value.

Integer NEG and ABS use wrapping lane-width arithmetic, including the minimum
signed bit pattern. Vector NOT inverts every stored integer bit, including BOOL
mask bytes. Floating NEG/ABS change only the sign bit: signed zero and signaling/
quiet NaN payloads are preserved exactly. BSWAP reverses bytes independently in
each element. Counts return the bit count in each original element width; signed
counts inspect the raw bit pattern. Native zero-input CTLZ/CTTZ return the element
bit width, matching scalar AArch64 behavior; this target result is not a portable
promise for source operations whose zero input is undefined.

AArch64 D/Q NEG/ABS/NOT/BSWAP and byte/halfword/word CLZ use direct instructions;
a single 64-bit lane uses scalar SIMD/FP where required. CTPOP applies CNT to the
bytes and widens with UADDLP until each result has the original lane width, without
mixing adjacent elements. CTTZ reverses bits within bytes, reverses byte order
within each wider element, then counts leading zeros. For 64-bit CLZ/CTTZ, the
emitter extracts each lane through reserved x16, applies native GPR operations,
and inserts it after all required reads. Neither allocated GPRs nor x30 are used.
All source/result aliases are supported, and output staging is transactional.

The existing binary capture path now dispatches typed unary operations and gives
them exactly one SIMD use constraint. Shared `a64.simd-lanes` primitives retain the
binary module's previous public wrappers, so integer MUL/DIV/MOD encoding checks
and the full binary matrix continue to pass. Unsupported vector widths still
produce explicit target diagnostics.

`tests/vector-unary.coil` checks generic representation contracts, rejected
construction without partial mutation, and 528 register cases containing 940
instruction words independently obtained from LLVM MC. Native coverage in
`tests/jit-vector-unary.coil` comprises 396 matrix graphs and 24 pressure graphs.
The matrix covers every supported D/Q type/opcode combination with loaded,
complete-literal and dying-source forms, using eleven bit patterns and exact
integer/FP payload oracles. Output padding, source preservation and input
immutability are checked. Pressure keeps forty results plus forty original
operands live across a callback that clobbers every allocatable caller-saved bank,
with volatile locals, fixed guards and dynamic storage in 16/4096-byte frames.
`tests/aot-vector-unary-link.coil` repeats all type/opcode pairs, representative
literal paths and every pressure case through 168 separate Mach-O objects.

The pinned upstream AArch64 `ir_emit_vector_op` explicitly asserts NIY for vector
ABS. Coil's native ABS/count families use independently checked instruction
selection and extend that reference's implemented unary target coverage. The gap
is recorded in the project pad; no upstream or Coil compiler source is changed.

The unary checkpoint passes all 195 standalone tests and 56 linked consumers
with debug checks, exact source/pass-set equality, regenerated objects and no
linked warnings. A final literal-corpus improvement is separately rerun through
the unary producer and linked consumer: D-width literals include signaling NaNs,
and Q-width literals include quiet/signaling NaNs and signed zeros. Exact payload
checks pass. All 354 implementation/test sources remain Coil; formatting/diff
checks pass. Remaining vector families, standalone semantics/optimization/scaling,
actual compiler integration and LLVM/TPDE runtime/compile-time benchmarks remain
unfinished.


## Vector shifts and count classes

`builder/vector-binary!` supports SHL (49), SHR (50) and SAR (51) for non-BOOL
integer vectors. The right input may be the exact vector type, for independent
lane counts, or any integer scalar type, for a broadcast count. Scalar BOOL counts
are canonical zero/one values. Floating counts and differently typed vectors are
rejected before graph mutation. Counts do not consume a guard operand.

Counts are masked by `element_bits - 1`, consistently with this library's scalar
shift policy. A scalar count first has its declared integer representation, then
is masked to the data element width. SHL wraps each element, SHR zero-fills, and
SAR fills from the element's high bit regardless of its declared signedness.
Counts at/beyond the element width, high-bit-contaminated counts and negative
signed count patterns therefore have deterministic masked behavior. Valid-range
counts agree with the pinned upstream operations. Its AArch64 vector emitter uses
signed-low-byte hardware counts without this normalization, while its LLVM path
emits ordinary LLVM shifts. No cross-target parity is claimed for source inputs
outside the reference's defined shift domain; frontends retain language checks.

The AArch64 emitter normalizes all count lanes together by left-shifting away
unwanted high bits and unsigned-right-shifting back. It negates normalized counts
for SHR/SAR, then uses USHL or SSHL. Scalar counts first use DUP, or FMOV for a
single 64-bit lane. The register sequence has three through five instructions,
independent of lane count, excluding operand materialization. It uses reserved
v31 as the count workspace; data literals use v30. The data source cannot occupy
v31, while a private count literal may already be there. Allocated data/count
operands remain untouched. Scalar counts retain their GPR class instead of being
misclassified as SIMD values. Output bytes/references are staged transactionally.

`tests/vector-shifts.coil` checks type/role and reserved-register failures without
partial mutation, and 540 register cases containing 2,160 independently assembled
LLVM MC words. Native coverage comprises 2,940 matrix graphs and 60 call-pressure
graphs in `tests/jit-vector-shifts.coil`. The matrix covers all twenty supported
integer D/Q shapes, three operations, vector counts and all eleven integer scalar
count types. It includes loaded operands, either/both constants and identical
vector inputs. Twenty-two patterns exercise every width boundary, high count bits
and negative count representations. Scalar literals are explicitly truncated to
their declared type before construction. Independent u128/i128 oracles compare
every result lane, original data/count bytes, input immutability and output padding.

Pressure keeps forty results and forty original data values live across a fully
clobbering callback, with vector/scalar count literals, private image data,
volatile locals, fixed guards and dynamic allocations in 16/4096-byte frames.
`tests/aot-vector-shifts-link.coil` repeats representative matrix and all pressure
cases through 276 separately linked objects. The existing binary and unary
matrices continue to pass after extending typed operand capture.

Remaining vector families include extrema/comparisons, lane extraction/
replacement, shuffles and conversions. Full standalone semantics/verification/
optimization/scaling, further ABI/target/object work, actual Coil compiler
integration and LLVM/TPDE compile-time/runtime comparisons remain open.

The vector-shift checkpoint passes all 197 standalone tests and all 57 linked
consumers with debug checks, exact source/pass-set equality, regenerated objects
and no linked warnings. All 358 implementation/test source files remain Coil.
Formatting and diff checks pass; these correctness checks do not establish
compilation speed, runtime performance or completion of the full backend goal.


## Vector rotations

ROL (52) and ROR (53) share the shift family's checked scalar/vector count forms
and `element_bits - 1` mask. They wrap bits within each integer element, including
negative signed representations and counts at or beyond the width. BOOL data
and floating operands remain unsupported for these operations. No guard operand
is accepted. Zero counts return the original element without a special runtime
branch or an out-of-range shift in the oracle.

The general D/Q sequence forms two complementary logical shifts and ORs their
results. The second count is derived modulo element width, so zero remains zero.
Counts are first captured in private v31. If result and data share a register,
the emitter then saves the complete original data in v30 before the first partial
result overwrites it. The order matters when a private count was in v30. Rotates
therefore exclude v30/v31 as low-level result registers; ordinary allocated
results already satisfy this rule. Original allocated data/count operands remain
unchanged whenever they are distinct from the result.

A single 64-bit lane uses UMOV/RORV/INS through reserved x16/x17 instead of the
longer SIMD sequence. Scalar counts are copied before extracting data, including
when a low-level caller placed the count in x16; a count already in x17 needs no
copy. ROL negates the count before RORV. These single-lane register sequences use
three through five instructions. Other arrangements use eight through eleven,
including optional scalar broadcast and alias preservation, without per-lane
emission loops or hidden helpers. Operand materialization is counted separately.
All paths stage bytes before appending and leave x30 untouched.

The combined native shift/rotate matrix now checks 4,900 graphs, 100 pressure
graphs and 176 forced-alias leaf harnesses. The harnesses choose physical
registers directly, rather than relying on allocator reuse, and check result/data
aliases, result/count aliases, identical inputs, all roles identical, private
v30/v31 operands and scalar counts in scratch x16/x17. Independent u128 rotate
oracles compare every output lane and unchanged input memory. The two-input
matrix also verifies original operand bytes and buffer padding.

`tests/vector-shifts.coil` adds 480 rotate register cases containing 4,086 LLVM MC
words to the prior 540 shift cases/2,160 words. It checks reserved-role failures
without partial mutation. `tests/aot-vector-shifts-link.coil` repeats the combined
matrix's representative forms and every pressure case through 460 separate
Mach-O objects. Forced-register leaf harnesses execute through JIT. Remaining
vector extrema/comparisons, lane/shuffle/conversion families, wider standalone
semantics/ABI/optimization/scaling, compiler integration and LLVM/TPDE performance
comparisons remain open.

The rotate checkpoint passes all 197 standalone tests and all 57 linked
consumers with debug checks, exact source/pass-set equality, regenerated objects
and no linked warnings. All 358 implementation/test source files remain Coil.
Formatting and diff checks pass. Correctness and bounded instruction counts do
not establish runtime/compile-time benchmark results or full backend completion.

## System V x86-64 call shapes

The x86-64 backend (`docs/X86_PORT.md`) places arguments by the System V
rules, which need three prototype shapes AArch64 has no use for. All three are
valid only when the library is compiled for x86-64
(`stogir.call-results/system-v?`): on AArch64 every validator rejects them
exactly as before, serialized prototypes that do not use them are byte for
byte unchanged, and `a64/abi-arguments` rejects them independently.

**Mixed argument pairs.** A `call-groups/Group` of count 2 may have members of
different types, each from {U64 5, I64 11, DOUBLE 12, FLOAT 13}
(`call-groups/pair-members?`, alignment 8 or 16). Each member is one
eightbyte: it takes a register of its own class, or both members go to the
stack. Homogeneous groups keep their rules; on x86-64 a group has at most two
members. `call-groups/member-types?` is the one predicate construction,
`calls/validate-call` and prototype validation share.

**Result pairs.** `(call-results/pair first second)` is a `Spec` of kind 1
with `count` 2 and the new field `second` set: two one-eightbyte pieces of
types `first` and `second` (same type set), stored at offsets 0 and 8 of the
result place. Integer pieces are returned in rax then rdx and floating pieces
in xmm0 then xmm1, in order per class, so `(pair 12 11)` is xmm0 + rax.
`second` = 0 is every existing shape (`pieces`, `indirect`, `ordinary`).
`call-results/piece-type`, `piece-offset` and `size` describe both shapes.
Serialized, the second type is the high four bits of the piece-count byte,
which were always zero. Because a pair is still kind 1, the optimizer's
private-result reasoning (`call-effects`, `call-inline`, `private-object`)
applies unchanged; those passes use `call-results/size` for the extent.

**MEMORY parameters.** `(calls/memory-parameter! prototype ordinal size
alignment)` declares fixed ADDR parameter `ordinal` a by-value aggregate of
memory class (`call-groups/Memory {ordinal size alignment}`). In the callee
that PARAM is the address of the caller's copy in the incoming stack
arguments; it takes no register and occupies `size` rounded up to 8 bytes,
starting at a multiple of 16 when `alignment` is 16. A caller passes it as an
ARGVAL of exactly `size` bytes (checked at construction and by
`calls/validate-call`). Records are added in ascending ordinal order and may
not name a group member. Serialized, a record shares the group array, sorted
by ordinal: `{u16 ordinal, u8 1, u8 alignment, u8 1, u24 size}` (a group
record has zero in its last four bytes). `call-groups/memory? bytes index` and
`call-groups/memory-at bytes index` read it; `call-groups/at` still returns the
record's ordinal, count 1 and alignment.

**ARGVAL** on x86-64 is upstream's `pass_struct_by_val`: the bytes are copied
into the outgoing stack arguments (8-byte alignment, 16 when the node asks for
more than 8), with or without a prototype record. It is not a private copy
passed by pointer, which remains the AArch64 rule.

**Placement** (`x64/abi-arguments.coil`): six integer registers (rdi rsi rdx
rcx r8 r9) and eight vector registers (xmm0..xmm7), independent; a group that
does not fit goes to the stack whole and leaves its registers to later
arguments; stack slots are 8 bytes; group alignment 16 affects stack placement
only. An indirect result's hidden pointer is the first integer argument and
is returned in rax. Unnamed arguments of a variadic call are placed like named
ones, an unnamed FLOAT is promoted to DOUBLE, and al carries the number of
vector registers used. The caller extends narrow integers to 32 bits; a callee
never relies on it. Convention numbers 0 and 8 are accepted. Vector-typed
arguments and results are rejected with a clear error (vector family).

Evidence, all on the Linux host against C compiled by the system compiler
(`tools/x86/call-tests.sh`): `tests/x64-call-abi.coil` (both directions:
scalars beyond the banks, narrow integers, pairs of every class mix, groups on
the stack, register-pair and indirect results, MEMORY aggregates of 8- and
16-byte alignment and a 200-byte one, variadic calls checked through
`snprintf` and a `va_arg` callee, al), `tests/x64-call-flow.coil` (a `qsort`
callback, recursion, register pressure, indirect and tail calls, private
leaves and module publication), `tests/x64-call-stress.coil` (3000 random
signatures, argument images compared location by location) and
`tests/x64-abi-arguments.coil` (placement tables and serialized forms).
Reading variadic arguments (VA_START, VA_ARG) has no lowering on either
target.
