# Control flow

The graph retains the upstream Sea-of-Nodes control model. Block starts and
terminators are graph nodes; CFG analysis, placement, scheduling, allocation and
edge reconciliation run before target emission. JIT and AOT use the same lowering.

## Integer switches

`builder/switch!(graph, control, selector)` emits SWITCH and ends the current
control chain. The selector must be an integer/address scalar value, not a VAR
storage identity. Case blocks start with these checked builders:

- `case-value!(graph, switch, constant)` matches one value.
- `case-range!(graph, switch, low, high)` matches an inclusive interval.
- `case-default!(graph, switch)` handles values outside the explicit cases.

Endpoints must be numeric constants of exactly the selector type. Signed values
use the type's signed order, including CHAR's signed byte storage. BOOL endpoints
are zero or one. Ranges cannot wrap or reverse; a signed interval from -1 to zero
is valid, while one from the signed maximum to the signed minimum is not.

Builders check local shapes and types before mutation. Complete-dispatch
validation additionally requires exactly one explicit default and disjoint case
intervals. Duplicate values, intersecting ranges, non-case SWITCH successors and
malformed raw nodes are rejected. All case/default exits must participate in the
compilation's observable roots. Omitting a projection is diagnosed rather than
silently producing a branch to an unbound target.

Case blocks may have normal memory operations, calls and further control flow.
Use END nodes to feed a MERGE and PHI nodes for case results. The order of PHI
inputs follows MERGE predecessor order, independent of dispatch sorting. Loop
backedges use the existing LOOP_BEGIN/LOOP_END and loop-phi construction.

## Equality chains

`equality-chain/rewrite!` runs in the SCCP pipeline after the iterative cleanup
has settled (`sccp/finish-compacting!`), followed by one more cleanup when it
changed anything. It finds IF nodes that test `EQ(v, c)` or `NE(v, c)` for one
integer value `v` and a same-typed constant, where the projection taken when
`v != c` is used only by the next such IF. The head IF becomes the SWITCH, each
matching projection its CASE_VAL, the last non-matching projection the
CASE_DEFAULT; the links between them become NOPs. Nothing moves to a new
reference, so MERGE predecessors, PHI inputs and roots are unchanged, and a
projection or IF that is an observable root ends the chain instead of being
removed. A repeated constant ends the chain before the repetition.

Four or more tests always become a SWITCH. Three do when every match reaches
one MERGE through empty blocks and no PHI there needs a per-edge value (one
bit test); two do under the same condition when their constants are adjacent
(one range test). Other short chains, including two-way tag tests with separate
targets, stay IFs.

## Jump threading

`jump-thread/rewrite!` runs first in `sccp/finish-compacting!`, on exact use
lists, before boundary merging and the diamond rewrites. A candidate is a MERGE
whose only users are its PHIs and one IF or SWITCH, with a condition built from
those PHIs and constants by at most four levels of integer comparisons, wrapping
arithmetic, Boolean NOT and integer extensions or views. The block therefore
holds nothing but the choice of values and the test.

An input END that comes from another MERGE holding only PHIs, each read solely
by the candidate's PHIs at that input, is replaced by that MERGE's own inputs
(up to eight levels, 64 edges in all). Short-circuit `and`/`or` and flags set
on some arms of a loop body reach their test this way.

Each incoming edge is then classified:

- its PHI inputs fold the condition to a constant: the edge goes to the chosen
  projection (for a SWITCH, the matching CASE_VAL or the default);
- every PHI the condition reads carries itself along the edge, the condition
  reads nothing else, and an IF on the straight control chain above the END
  already decided it (`conditional/dominating-truth`): the edge goes the same
  way. A PHI that is the condition itself may instead carry any value such an
  IF decided;
- an IF edge whose input is a comparison (possibly extended) used nowhere else:
  the END becomes an IF on that comparison, and its two new ENDs go to the two
  projections;
- anything else stays at the MERGE.

A projection that gains edges becomes a block start: with undecided edges left,
a new MERGE of the projection's END and the threaded ENDs takes over its users;
otherwise the projection is rewritten in place as BEGIN or MERGE (a new MERGE
past three inputs). When no edge stays, the MERGE, its PHIs and the branch
become NOPs, and a projection nothing reaches becomes the transient BEGIN(0)
that `iter-control/prune!` removes together with its region.

Values are repaired from the definitions that reach each use. Walking control
upward from a pinned use (a control node, or a PHI's predecessor END) ends at a
projection of the branch, at the MERGE itself, or at a MERGE whose inputs
disagree; the answer is memoized per control node. A PHI of the candidate read
below a projection becomes a PHI at that projection's join (or the single
incoming value); where different joins meet it gets a PHI at the meeting MERGE.
Floating values computed from the PHIs are rewritten in place when all their
uses see one definition, and copied per definition otherwise. Below an IF's
projections the condition itself is the known constant.

Left alone: a MERGE with any other user (a block with loads, calls or stores
before the test), LOOP_BEGIN headers, CASE_RANGE dispatch, vector PHIs,
observed (root) MERGE, PHI, branch or projection nodes (an observed END that
disappears with a flattened MERGE is replaced in the roots by the edges it
stood for), a narrowed MERGE that would need more inputs than it has cells,
and candidates over the bounds at the top of the module (256 floating values,
1024 pinned uses, 4096 control nodes walked).

Loops stay reducible. One depth-first walk per pass marks the ENDs that close a
cycle. A MERGE with such an input is threaded only if exactly one projection
remains inside its natural loop: edges to other projections leave the loop,
edges to that one enter below the test. Entry edges may enter below the test
only when the MERGE keeps no entry edge or no back edge, so each cycle keeps
one entry; a constant entry test then leaves the loop bottom-tested.

## Loop rotation

`jump-thread/rotate-with!` runs in `sccp/finish-with-uses!` after the first
cleanup, which has already moved a header's invariant reads onto its entry
edge, and is followed by a second cleanup when it rotated anything. It reuses
the threading machinery with every incoming edge split: a candidate is a MERGE
whose block holds its PHIs, at most four plain scalar LOADs and one IF, at
most three incoming edges, and a condition built from the PHIs and the reads.
Each edge gets its own copy of the reads and of the test (at most twelve
floating values copied per edge), so the test runs once before the loop, as a
guard, and once on each back edge; the body projection becomes the loop
header and the exit projection the join of the guard's and the latches' exits.
Values are repaired exactly as for threading: PHIs at the two joins, a header
read being the PHI of its copies. A comparison equal or complementary to the
condition is decided on both sides, as the condition itself is.

A loop is rotated only when all of this holds:

- one projection stays in the loop and the other leaves it, at least one edge
  enters and one returns (decided by walks over control predecessors that stop
  at the MERGE and at the boundary of its cycle-bearing component; one
  iterative Tarjan pass over control operands per cleanup, built on first
  need);
- it pays, by one of two rules.
  - Inside another loop (the MERGE and all its inputs are on one component)
    with no back edge leaving an IF projection directly: the body needs
    something the guard can keep off the outer loop, namely a read in the
    header, a read heading the body, or a call in the body.
  - Inside no other loop (one input enters from outside the component), or
    with a back edge that leaves an IF projection directly (a loop rotated
    before, or one whose body ends in a test): the MERGE has one entry and one
    return, and one of the at most four plain reads heading the body already
    meets `entry-load`'s proofs as the graph stands, so the following cleanup
    moves it onto the guarded entry edge (`body-read-leaves?`: its address is
    computed from nothing defined in the header's or the body's leading block,
    and every path back from the return reaches it without a possible write).

Rotation cannot repeat without end: a loop whose return leaves a test is
rotated only for a read that then leaves the loop for good. A MERGE is tried
by a rotating pass only if the cycle facts can admit it; a function with a
single MERGE asks for them only when a plain read heads one side of that
MERGE's branch.

What it buys: reads heading the rotated body are header reads to
`entry-load`, which moves the invariant ones into the guard's true arm, where
they run only if the body will; and the allocator can spill a value around
the inner loop behind the guard (see `allocation/bypass-cut`: the value
resumes in its register at the start of the join, so the guard's edge moves
nothing and only the loop's own exit edge reloads). A guard whose condition
folds to a literal disappears in the following cleanup; one that follows from
a dominating test is folded by `fact-fold`.

Facts survive rotation: `fact-fold/joined` gives a query at a two-input MERGE
the union of what its two edges' tests establish about the values each edge
carries, and `induction` recognizes a counter whose back edge is guarded by
`next + 1 < other` (kind 3).

## AArch64 dispatch

Case intervals are heapsorted in O(n log n) time with bounded extra sorting
storage. Flipping the storage sign bit maps signed values to unsigned order keys
without overflow. Selection normalizes the selector into reserved x16; comparison
constants use x17. Balanced comparisons give O(log n) dispatch depth for sparse
cases and ranges. Default-only dispatch is supported too.

Dispatch branches to a separate stub for each case/default. Each stub reconciles
ordinary live values before entering its block. Comparisons finish before any
edge copy can overwrite a scratch register. The usual parallel-copy machinery
handles GPR/SIMD/spill values and subsequent merged-result phis. Fixed and dynamic
stack storage keep the same anchored-frame semantics as other branches.

Dense singleton switches use the pinned upstream density rule: more than two
cases and `(maximum-minimum) < case-count*8`. Ranges, sparse cases and smaller
switches retain balanced comparisons. The normalized selector subtracts the
minimum and uses one unsigned bounds check, which also rejects values below the
minimum. Holes in the table point to the default edge stub.

Before choosing a strategy, dispatch compares the code addresses behind its
edges: a case block that is forwarded to the default's address is the default
and gets no test. Singleton cases inside one 64-value window that reach at most
three addresses use a bounds check and one mask test per address (`mov x17, #1`,
`lsl x17, x17, key`, `and x16, x17, #mask`, `cbnz x16`), with LLVM's thresholds:
three cases for one address, five for two, six for three. One address that
covers its whole window needs the bounds check alone. This takes precedence
over a table. A closing jump to the default is omitted when the default block
follows the dispatch and no edge needs a stub.

Tables contain signed 32-bit displacements relative to the table base. ADR,
indexed LDRSW, ADD and BR form the destination without an absolute pointer or a
per-entry image relocation. Each table is adjacent to its dispatch sequence, so
ADR has a fixed, checked displacement independent of the function size. The same
patched text works in raw JIT mappings, shared images and linked Mach-O objects.
Signed relative fixups validate every record before writing any entries.

The shared image retains ordered data-in-code ranges. Mach-O serialization emits
LC_DATA_IN_CODE with JUMP_TABLE32 entries, splitting lengths above the u16 limit
at element boundaries. In MH_OBJECT these entries use section VM offsets,
matching LLVM MC, rather than text file offsets. Ordinary functions retain the
previous object layout without an extra command.

Dispatch-strategy measurements and general long-branch relaxation remain
unfinished. These implementation details are not performance claims. Full compiler
integration and LLVM/TPDE comparisons remain delivery gates.

## Trap and unreachable paths

`builder/trap!(graph, control)` emits a void, control-pinned debug breakpoint.
Its successor may continue the control chain. `builder/unreachable!(graph,
control, previous)` emits a void terminal; use zero for an unlinked exit or an
existing terminal reference to extend the optional exit list. Both builders
require an open control chain and reject malformed operands before mutation.

UNREACHABLE has three operand slots: control, a reserved zero word, and the
optional terminal link. The reserved word remains present even though it is not
a graph edge. START's first operand may hold the terminal-list head. Complete
validation checks head/link targets and rejects cycles in linear time, allowing
forward links. Zero-only chains need no color-array allocation. Root marking
follows these links, so either the exit head or a linked START can retain all
observable exits; the links do not create CFG edges or register values.

AArch64 TRAP emits BRK #0. The reference backend marks UNREACHABLE skipped; this
target uses BRK #0 followed by a branch back to that breakpoint. The extra branch
prevents ordinary debugger resumption from falling through into a neighboring
block. These non-returning paths do not run a function epilogue. Returning paths
continue to restore their fixed/dynamic stack frames normally. A caller must
include non-returning exits among its observable roots or retain them through
the terminal list, just as it retains returning exits.

Tests execute ordinary paths directly and isolate trap paths in child processes.
A SIGTRAP handler exits the child with a checked status, avoiding a crash report
or termination of the test runner. JIT and linked AOT checks cover IF paths,
dense/sparse exhaustive-match defaults, never-returning functions and aligned
dynamic frames. These policies do not establish the still-open compiler backend
integration or performance comparisons.

## Reads needed on one side of a branch

`load-sink/run!` is the last step of `sccp/finish-with-uses!`, after the
loop-entry moves, rotation and the equality chains, so that it never takes a
read out of their reach. A plain scalar LOAD moves directly under an IF_TRUE
or IF_FALSE when:

- only plain reads (at most six) are sequenced between it and the IF, so
  nothing can write between its old and its new place;
- no other LOAD or STORE names its address node, and the address is computed
  from a PHI, a read or a call (an address made of parameters, storage and
  constants alone stays where a loop-entry move can still serve it, here or
  after inlining);
- every use of its value happens under that projection: a sequenced user
  where it is sequenced, a PHI at the end of the matching join input, a
  floating comparison, arithmetic, conversion or COPY wherever its own users
  do (at most 24 uses), each proven by a backward walk on which every path
  reaches the projection before the read, the IF or the function entry (at
  most 16 joins per walk, 96 steps per read).

The read then runs on a subset of the paths that ran it before and is moved
again while the side it landed on branches (at most eight times). Observed
reads stay. `tests/load-sink.coil` covers the shapes natively, including a
write between the read and the branch, uses on both sides or after the join,
a read above the branch that uses the value, a loop whose location changes
between iterations and a pointer with no object behind it on the path that
never read it.
