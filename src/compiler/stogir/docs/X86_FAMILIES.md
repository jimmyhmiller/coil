# x86-64 operation families

How to add an operation family to the x86-64 backend without touching the
core or another family's files. Read `docs/X86_PORT.md` first for the design
decisions; this document is the map of extension points.

## What exists

The core (`src/stogir/x64/`) compiles integer functions end to end: PARAM,
constants, COPY, ADD SUB MUL DIV MOD, AND OR XOR NOT NEG, shifts and rotates,
integer comparisons, IF, COND, SEXT ZEXT TRUNC and integer BITCAST, PHI, loops,
MERGE, RETURN, TRAP and UNREACHABLE, with spilling, preserved registers and a
fixed frame. Everything else belongs to a family, and each family is a module
whose entry points return a clear `Err` until it is implemented. Implemented
so far: `CHECKED`, `BITS`, the reciprocal rule hook, and on the core's side
address-form arithmetic (`x64/lea.coil`) and view coalescing
(`x64/coalesce.coil`).

| Family constant | Module(s) | Operations |
|---|---|---|
| `MEMORY` | `x64/memory.coil`, `x64/address.coil` | LOAD, STORE (integer values; RLOAD, RSTORE, TLS_ADDR report an error); address modes, fused loads, read-modify-write stores |
| `LOCALS` | `x64/locals.coil` | VAR, VADDR, VLOAD, VSTORE |
| `STACK` | `x64/stack.coil` | ALLOCA, AFREE, BLOCK_BEGIN, BLOCK_END, FRAME_ADDR |
| `CALL` | `x64/call.coil`, `x64/call-abi.coil` | CALL, TAILCALL, ARGVAL, PROTO, EXITCALL, VA_* |
| `FLOATING` | `x64/floating.coil`, `x64/fcompare.coil`, `x64/float-memory.coil`, `x64/pool.coil` | every node of FLOAT/DOUBLE type or reading one (implemented, except FMA) |
| `VECTOR` | `x64/vector.coil`, `x64/vector-*.coil`, `x64/simd-lanes.coil` | every node of an 8- or 16-byte vector type or reading one (implemented, SSE2; `docs/X86_PORT.md`, "Vectors") |
| `ATOMIC` | `x64/atomic.coil` | ATOMIC_LOAD/STORE/RMW/CMPXCHG/FENCE |
| `CHECKED` | `x64/checked.coil` | ADD_OV, SUB_OV, MUL_OV, OVERFLOW |
| `SWITCH` | `x64/switch.coil` | SWITCH (the CASE_* projections are block starts); implemented |
| `BITS` | `x64/bits.coil` | integer ABS, BSWAP, CTPOP, CTLZ, CTTZ, MIN, MAX |
| (rule hook) | `x64/reciprocal.coil` | DIV/MOD by a constant without `div` |
| (rule hook) | `x64/lea.coil` | sums and small multiplications as `lea` (RULE-LEA), with fusion of single-use producers |

Each placeholder module's header lists its operations, the interface it must
implement and the notes specific to it. The floating family is implemented
and is the worked example of a family: selection of a tile another stage
fuses (`fcompare/tile`), constraints, emitters with operand folding, and the
places it meets the core (listed under "Families with a different shape").

## Where the dispatch is

`x64/families.coil` is the only module that names the families.

- `families/of graph reference` classifies a scheduled node (by opcode, by its
  type, and by the types of its data operands: a comparison of two doubles
  is `FLOATING` although its own type is BOOL). A named constant (FUNC, SYM,
  STR) is an ordinary integer operand and does not change a node's family.
  The matcher calls it once per node and stores the answer in
  `Plan.families`; later stages read `plan/family`.
- `families/select!`, `families/constrain!`, `families/emit!` forward to the
  family's module.
- `families/fuse!` and `families/inputs!` are the memory family's
  whole-function selection (address modes, fused loads, read-modify-write
  stores); the matcher calls them once, after its own comparison fusion.
- `families/constrain-recipe!` is called for a scheduled node that defines no
  register and is rebuilt at each use (a static frame object): it requests
  the object's frame slot.

The three stages call into it at exactly one place each:

| Stage | File | Call |
|---|---|---|
| matching | `x64/match.coil`, `build-fusing`, "Tiles, and the families' own selection" | `families/select!` (and `switch/select!`) |
| constraints | `x64/constraints.coil`, `build-matched` | `families/constrain!` (and `switch/constrain!`) |
| emission | `x64/function.coil`, `body-ordered`, the node `cond` | `families/emit!` (and `switch/emit!`, `reciprocal/emit!`) |

To move an opcode into a family, or to make a family claim a new shape,
change `families/of` only.

A family that makes a load disappear into its own instruction (a call result
projection, a floating operand) must do so in `select!`, by setting
`omitted[load]`: the memory family's `fuse!` runs afterwards and never
touches an omitted access. A load it leaves alone may be fused by the memory
family into a core tile (`select/memory-operand tile` names it); a family
that reads core tiles of its operands must look at the tile's register
operand, not at an omitted load.

## The three entry points

```lisp
(defn select! [(state (mut plan/Matching)) (graph g/Graph) (reference i32)]
  (-> (Result i32 (slice u8))))
(defn constrain! [(set (mut uses/Set)) (graph g/Graph) (matched plan/Plan)
                  (reference i32) (position i64)] (-> (Result i32 (slice u8))))
(defn emit! [(out (mut code/Buffer)) (cx context/Context) (reference i32) (position i64)]
  (-> (Result i32 (slice u8))))
```

### `select!` — matching (before liveness)

Called once per scheduled node of the family, in schedule order, with the
tables of `plan/Matching` (`x64/plan.coil`) complete for `blocks`, `counts`
and `protected`, and `tiles` filled for the nodes scheduled before it.

- Record what the emitter will need: a `select/Tile` in `tiles[reference]`
  (add rule constants to `x64/select.coil`; rule numbers 100..119 are
  reserved for the reciprocal family, take a fresh range for yours), or
  entries in the family's side tables (`addresses`, `offsets`, `indices`,
  `index-shifts` for memory; add a table to `plan/Plan` and `plan/Matching`
  when yours needs one).
- To absorb a producer (fold a load into an operand, a shift into an address):
  set `omitted[producer]` and lower `counts`. An omitted node emits nothing
  and defines no register; its consumer must then read the producer's inputs.
  The neutral `stogir.matched-uses` builds the machine inputs: the core
  passes `comparisons` as its redirect table (a consumer takes its redirect's
  inputs); `match.coil` patches input ranges after the build for anything the
  redirect cannot express (see how a fused COND gets its arms back). Do the
  same for your node.
- Return `Ok` for nodes that need no selection.

### `constrain!` — register requirements

Called once per scheduled node of the family that is neither omitted nor
rematerialized. `position` is `2 * schedule index`: operands are read at
`position`, the result is defined at `position + 1`. Everything goes through
`x64/uses.coil`:

| Need | Call |
|---|---|
| operand in a register | `uses/use!` |
| operand anywhere (register or spill slot) | `uses/use-anywhere!` |
| result in a register | `uses/define!` |
| result in one fixed register (a call result in rax) | `uses/define-fixed!` |
| an instruction overwrites a register | `uses/clobber! set register start end` |
| result would like operand 1's register (two-address) | `uses/hint!` |
| value would like one register | `uses/prefer!` |
| a frame object | push a `uses/Local` on `(.locals set)` |
| outgoing call area | raise `(.outgoing-size set)` (multiple of 16) |
| a fixed register that is the instruction's own result | `uses/define-fixed!` plus `uses/clobber-unless-live!` (the clobber applies only when the result is dead) |
| the function executes a call instruction | set `(.calls set)` (forces a frame so rsp is aligned) |
| allocator transfers at a definition position that the emitter lowers itself | push `position + 1` on `(.definition-moves set)` |

Do **not** use `uses/use-fixed!` for an operand that may live on after the
instruction (see "Fixed registers" in `docs/X86_PORT.md`): clobber the
register over `[position, position + 1)` and copy the operand in. A clobber
that starts at `position` keeps operands and live values out of the
register; one that starts at `position + 1` keeps live values and the result
out.

`x64/allocate.coil` consumes the whole `Set`; a family never edits it.

### `emit!` — machine code

Appends the node's code to `out`. `cx` (`x64/context.coil`) gives the graph,
the location view, the frame base, the plan, the frame and the frame size.

- Operands: `emit/operand! out cx reference position scratch` returns the
  register holding an integer operand (a constant or spilled value is moved
  into `scratch` with `mov`); `emit/into!` copies it into a chosen register;
  `emit/destination cx reference position` is the result's register.
  `value/register-of` peeks without emitting.
- Scratch registers: r10, r11, xmm14, xmm15 are free inside one node and hold
  nothing between nodes.
- Encoders: `x64/encode.coil`; feed each result through `code/accept!`.
- Flags: nothing is live on entry or exit. Inside the node only `mov`, `lea`
  and SSE moves may sit between a flag producer and its consumer. When the
  node's last instruction sets ZF and SF by the result it wrote (an ALU
  instruction, not `mov`, `lea` or `imul`), call `code/note-flags!` with the
  register, width and kind: a compare of that register with zero directly
  behind it is then dropped. Never call it for anything else.
  `emit/flags!` (integer compare tile) and `truth/flags!` (value is nonzero)
  load every operand first and return the condition code.
- Narrow integers: bits above the type's width are unspecified
  (`x64/value.coil`, header). Extend before any instruction that reads them.
- Frame objects: `(get (.locals (.frame cx)) owner)` is the index of the
  owner's slot in `(.slots (.frame cx))`; `frame-address/slot (.base cx)
  offset` is the memory operand of a logical offset, whatever the frame base
  (`locals/slot cx variable` does both for a VAR).
- The frame base may be rbp (`frame-address/anchored?`: dynamic stack,
  FRAME_ADDR or over-alignment; the header of `x64/frame-address.coil` has
  the picture). Two things are then not at `slot`: the outgoing call area,
  which is always `frame-address/outgoing offset` (`[rsp + offset]`; its
  size, rounded to the frame alignment, is `(.outgoing-size cx)`), and stack
  parameters, which are `frame-address/parameter! text base frame-size offset
  scratch` (it loads the anchor into `scratch` in an over-aligned frame).
  Never write `[rsp + frame-size + 8 + offset]` by hand.
- Memory operands: `address/operand! out cx access position` is the
  `encode/Mem` of LOAD/STORE `access` with the address mode selection chose
  (base, index, scale, displacement, a frame object folded into the
  displacement), for values of any class; `address/plain!` is `[value]` for
  a node that takes an address operand. Both emit only `mov`/`lea`, may
  write r10 and r11, and return an operand that names at most r10, so r11 is
  free afterwards. A LOAD/STORE of another value class is routed to its
  family in `families/of` (floating: `float-memory/claims?`); the accesses'
  address tables and machine inputs are built for every value class, so the
  family constrains the selected base and index (`address/parts`) and emits
  its move on `address/operand!`, as `x64/float-memory.coil` does. It must
  not read the node's own address operand, which may have been absorbed.
- A constraints builder that reads the condition tile of an IF or COND uses
  `address/tile-operands`, never the tile's `left`/`right`: the comparison
  may read a fused load.
- References to named symbols: an integer operand that is a FUNC, SYM or STR
  needs nothing: `emit/operand!` and `value/constant!` rebuild it
  (`code/reference-address!`). For anything else use the helpers in
  `x64/code.coil`: `direct-call!` / `direct-jump!` (PLT32),
  `long-address!`, and `rip-reference!` after any instruction encoded with
  an `encode/mem-rip` operand. `x64/image.coil` `finish!` resolves them.
- Builtin block operations: `block-move/emit! text size` (memmove, rdi and
  rsi in, rax out) and `block-compare/emit! text count` (memcmp, rdi and rsi
  in, eax out) replace the `call` of a builtin move or compare with a
  literal size; see their headers for the ranges and the registers written.

### Families with a different shape

- **SWITCH** (`x64/switch.coil`, implemented): `emit!` also receives the
  control-flow state, because it branches: `edges/Flow`,
  `(mut edges/Control)`, the fall-through successor `next`. It is the model
  for anything else that branches: `edges/stub-or-target!` gives the label
  of an edge (the block, or a new edge stub when the edge has moves),
  `fixups/jump!` records a jump, `fixups/address!` a `lea` of a label, and a
  table is pushed on `(.tables control)` for the driver to place.
- **Reciprocal division** (`x64/reciprocal.coil`): not a node family but a
  rule hook. `reciprocal/select` may replace the `RULE-DIVIDE` tile of a DIV
  or MOD, by one of its own rules (100..119, constrained and emitted by
  `reciprocal/constrain!` and `reciprocal/emit!`) or by a core rule (an
  unsigned division by a power of two is `RULE-SHIFT-RI`).
- **Address forms** (`x64/lea.coil`): the same kind of hook for the other
  arithmetic tiles. `lea/strength` rewrites a tile when it is selected,
  `lea/fuse!` runs in the matcher's fusion pass and marks absorbed producers
  `omitted`, the matcher rebuilds a RULE-LEA node's machine inputs from its
  tile, and the driver calls `lea/emit!`. The core's constraints already fit
  the tile (`left` and `right` are its register operands, 0 when absent).
- **Checked arithmetic** (`x64/checked.coil`) is the one place where a flag
  value crosses a node boundary: from a producer to the OVERFLOW scheduled
  directly behind it. Do not emit flag-writing code for a node of another
  family between the two; allocator transfers are moves.
- **Calls** (`x64/call.coil`, implemented): placement is
  `x64/abi-arguments.coil` (shared with `x64/incoming.coil`) and
  `x64/call-abi.coil` (one call's layout). The matcher asks
  `call/select-tails!` once per function for the tail-call plan
  (`plan/tail-mode`). `call/constrain!` announces `position + 1` in
  `(.definition-moves set)`; the driver then does not emit the allocator's
  transfers at that position but hands them to `call/emit-call!`
  (`function.coil`, `call-node!`), which also covers TAILCALL. PROTO and
  ARGVAL go through the ordinary `emit!`. Private-leaf contexts reach the
  family through `(.private set)`.
- **Registers an emitter may write**: its allocated destination, the
  scratches, and registers it declared with `uses/clobber!`. The driver
  records exactly those as the function's write set for private-leaf callers;
  an emitter that writes anything else must call `code/wrote!`, and one that
  emits a call or jump out of the function `code/called!`.
- **Stack** sets `(.anchored set)` and raises `(.alignment set)`;
  `allocate.coil` then builds the rbp base and `function.coil`'s
  `prologue!`/`epilogue!` establish and release it. A frame object or VAR
  raises the alignment through its `uses/Local`.
- **Floating** (`x64/floating.coil`) meets the core in these places, each a
  few delimited lines:
  - `families/of` sends floating LOAD/STORE and floating locals to it
    (`float-memory/claims?`) ahead of the memory and locals families;
  - the matcher lets its comparison tile (`select/RULE-FCOMPARE`) fuse into
    IF, integer COND and floating COND like an integer comparison;
  - `emit/flags!` and `truth/flags!` return an *extended condition* for a
    floating comparison or value (`x64/fcompare.coil`: a condition code,
    possibly combined with the parity flag). Every flag consumer must accept
    one: `edges/branch-edge-parity!` for branches, `fcompare/boolean!` for a
    BOOL, `conditional/parity!` for `cmovcc`, `fcompare/jump-if!` for a short
    jump inside a node;
  - the driver emits floating PARAM (`incoming.coil`), RETURN (xmm0) and IF
    itself, because they need its state; the family only constrains them;
  - edges build floating PHI constants (`edges.coil`), and
    `typed-transfers.coil` holds an XMM cycle in xmm15;
  - `function.coil` ends with `pool/finish!`, which appends the function's
    floating constant pool and patches its loads.
  Floating operands: `value/float-register!`, `float-into!`,
  `float-destination`, `float-constant!`, and `float-apply!` (an SSE
  instruction with its second operand in a register, a spill slot or the
  constant pool). Short jumps inside one node: `x64/local.coil`.
- **Vector** (`x64/vector.coil`) meets the core in these places, each a few
  delimited lines:
  - `families/of` gives a node to it when its type or any data operand is a
    vector (a vector operand wins over a floating type: EXTRACT of a FLOAT
    lane, BITCAST of a vector to a DOUBLE), and sends vector LOAD/STORE and
    VLOAD/VSTORE to it (`vector-memory/claims?`) ahead of the floating,
    locals and memory families;
  - the driver emits vector PARAM and RETURN itself (xmm0..xmm7, xmm0), as
    it does the floating ones; `abi-arguments/plan-result`,
    `call/result-register` and `call/load!` place and move a short vector
    like a floating eightbyte;
  - edges build vector PHI constants (`edges.coil`; one bound for a spill
    slot goes through xmm14).
  Its building blocks are reusable by another family that needs an XMM
  sequence: `x64/simd-lanes.coil` (instruction wrappers, two-address
  lowering, lane transfers to and from general registers, masks built
  without memory) and `x64/vector-value.coil` (operands, constants, the
  scratch frame object). A node that needs XMM temporaries clobbers xmm13,
  xmm12, xmm11 over `[position, position + 2)`; `tests/x64-vector-emit.coil`
  shows how to check such a promise.

## Tests

Tests are `tests/x64-NAME.coil`, run on the Linux host with
`tools/x86/remote-test.sh tests/x64-NAME.coil`. `src/stogir/x64/testing.coil`
is the shared support: graph shorthands, an independent reference evaluator
for integer operations, `compiled` / `expect!` / `invoke` (every function is
called through one twelve-argument signature), `dirty` (garbage above a
narrow argument) and a tally. For floating values it has a bit-exact
reference evaluator with the x86-64 NaN rules (`float-binary`, `float-unary`,
`float-compare`, the conversions), `float-specials`, and `invoke-mixed` /
`invoke-floating` (twelve floating arguments, then twelve integers; the
result in rax or xmm0). The floating family's tests (`tests/x64-float-*.coil`)
follow the pattern below.

`src/stogir/x64/vector-testing.coil` is the same for vectors: a lane-wise
reference evaluator (`lane-binary`, `lane-unary`, with `lane-defined?` and
`lane-ambiguous?` for what the machine or the IR leaves open), edge lane
values for every lane type (`special`), every supported vector type
(`vector-type`), compile-as-image and call helpers (a vector constant is
image data, so vector tests map images), and byte-buffer lane access. The
vector family's tests are `tests/x64-vector-*.coil`: one matrix per
operation group, `-transport` (spills, PHIs, locals, constants, by-value
passing and calls), `-emit` (every aliasing of result and operand registers,
and that only the declared temporaries are written) and `-stress` (seeded
random functions against the reference). A test that has to call generated
code in a way Coil cannot express (a 16-byte vector by value) uses a probe
in x86-64 machine code whose bytes come from `tools/x86/asm-bytes.sh`.

For a new family, follow the core's pattern:

- a matrix test over types, operand forms (register, constant, repeated) and
  edge values (`tests/x64-core-arithmetic.coil`);
- an emitter test under hand-made register assignments for every aliasing
  and fixed-register case (`tests/x64-core-emit.coil`);
- the operation under register pressure and across loops
  (`tests/x64-core-pressure.coil`);
- extend the generator of `tests/x64-core-stress.coil` with the family's
  nodes once they can be evaluated by the test's interpreter: it found the
  allocator limitation behind the fixed-register rule within 60 000 cases
  when the hand-written tests had not;
- flip the family's case in `tests/x64-core-entry.coil` from "reports not
  implemented" to a real check.

A change to anything outside `src/stogir/x64/` is re-tested on the Mac
(`docs/X86_PORT.md`, "Testing").
