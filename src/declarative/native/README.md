# Native infrastructure sources

These library passes supply the `native.*` modules to both the standalone
backend and Coil's compiler. `src/compiler/native/generated/` is their build
artifact, written by `scripts/compiler/gen-declarative.py` and checked by FAST.
The source project's manifest excludes that generated directory and reads the
passes themselves. There is one implementation for both uses.

- `cir.pass`: CIR records, instruction builders, sealed-block SSA construction,
  definition-table generations, function reuse, debug positions and snapshots.
- `cir-copies.pass`: aggregate copy analysis, dominators, address escape and
  liveness checks, argument summaries, and module forwarding phases.
- `asm.pass`: sections, relocations, symbols and their stable chunked storage.
  The symbol lock still protects insertion after `share!`; readers' symbol
  addresses remain stable as later chunks are added.
- `buf.pass`: the byte-buffer schema: growth capacity, little-endian integer
  widths and LEB128. Appends, reads and patches are generated from the same
  encoding declaration and accept unaligned offsets. Native and LLVM builds
  use a width-specific memory operation with alignment 1; the portable wasm
  backend uses byte operations selected at expansion, without a runtime branch.

Library mode in `.pass` has explicit function parameters instead of an implicit
graph state. `record` declares storage. List fields default to empty owned
lists; other fields default to zero unless given an initial value. `capacity` on a list field declares its initial reservation; the assembler
uses that to keep its symbol-chunk table stable. `construct`
generates a constructor from those declarations, and `release` frees the
record's list fields. A release can name its parameter, for example
`release Func as func-free!(f);`, preserving named-argument callers. It does not own references or borrowed spans. `drop` and `drop-each` declare
ownership of nested resources; mutex lifecycle is declared separately. `fill`, `append-list` and `truncate`
keep list representation and allocation out of algorithms. The buffer storage
generator is the layer that calls allocation and byte-memory primitives.

All four native sources use `library declarative`. This mode rejects procedural
function bodies and hidden control or assignment forms. Function definitions are
pure equations or single effect aliases; storage, graph solvers, row queries,
guarded rewrites and schedules express the algorithms. The standalone gate
requires this strict mode for every native infrastructure source.

The declarations already used by the native sources are:

- `follow`: terminal and next-node equations, optionally with an accumulated
  fold. These compile to a single loop even at O0, without recursive stack use.
- `tally`: dense cardinalities derived from pure key rows.
- `reduce`: an ordered fold over pure rows with an explicit empty identity.
- `worklist`: append-discovered rows in FIFO order, or a consuming LIFO stack.
  The effect declares discovery; the language derives the traversal cursor.
  FIFO effects may append but cannot remove or reorder queue entries.
- `intern`: dense bounded-domain or ordered keyed interning. The constructor
  runs once on a miss; hits preserve object identity.
- `mutex` and `stable-index`: a resource lifecycle and a bounded chunked index.
  The outer reservation derives from the record, chunk addresses remain stable,
  and insertion can declare paired acquisition/release hooks.
- `sweep`, `count-rewrites` and `saturate`: ordered rule application, application
  counts, or convergence. `materialize` derives grouped output and order;
  `pipeline` declares the stage sequence.
- `prune`: use, root and operand relations plus eligibility. The language derives
  reference counts, the reverse sweep and cascading deletion.
- `compact` and `retain`: stable filtering with group metadata and optional
  forward anchors, or in-place ID retention with updated ordinals.
- `insert`: one logical row across declared columns, returning its ordinal.
  Values observe the pre-insertion state; the language derives column appends.
  CIR values, operands, variables and blocks use this declaration.
- `relation`: ordered rows and output columns. The language derives a compressed
  inverse index, including counts, prefix sums and placement. A query can bind
  ordinary ranges, linked chains or ragged segments without client cursors.
- `sealed-ssa`: definitions, predecessor constraints, deferred merge storage and
  merge-building hooks. The solver publishes a cyclic merge before reading its
  predecessors and discharges deferred merges when a block seals.
- `gather`: column-major ragged rows with a declared resolver. The language
  reserves and publishes the row before resolving its inputs, so recursive
  construction can append more rows without invalidating the reserved offsets.
- `dominators`: graph adjacency and immediate-dominator equations. The language
  derives reverse postorder, sparse predecessor intersection and convergence;
  unreachable nodes retain the declared absent value.
- `epoch-map`: key/value storage, a hash equation, initial capacity and load
  policy. The language derives probing, growth, rehashing and epoch-wrap clearing.
- `consensus`: agreement over a pure row query, with an explicit empty identity.
  Trivial-PHI removal uses this aggregate and a typed guarded rewrite.
- `meet`: descending bit facts constrained by the indexed dependency relation.
  A change schedules dependent rows; recursive components converge without a
  client worklist. Unknown callees have an explicit boundary fact.
- `region`: stopped reachability over ordered graph segments. Bounds, partition
  and adjacency are declared; the language derives directional scanning,
  generation stamps and block scheduling.
- `predicate` and `rewrite`: named bindings, requirements, derived row views and
  path queries. All constraints precede effects. Typed rewrites specify a rejection value and result; `create`
  bindings execute only after constraints succeed. `resource` binds mutable
  temporary storage and its release action; generated defers release nested
  resources in reverse acquisition order when their scopes exit. Rejected rules apply no rewrite
  effects; analysis scratch can change while checking a constraint.
- `scatter`: row queries with declared array cells or record fields to update.
  Writes execute in row order. Query domains and predicate inputs must remain
  stable during the scatter. There is no imperative body or arbitrary callback.
- `snapshot` and `recycle`: deep list copies and reset policy derived from record
  fields. `snapshot fresh` omits scratch contents; `reset keep` retains scratch
  capacity and contents; `reset fill` refills without reallocating. `drop` and
  `drop-each` declare ownership of fields and list elements. Release and reset
  invoke those destructors; snapshots reject opaque ownership without a fresh
  policy.

For example, operand redirection names the relation and destination cells:

```text
scatter redirect-root-uses!(st: ref[State], old: u32, new: u32) {
  from u in range(cir::i64-of(st.use-start[cir::i64-of(old)]),
                  cir::i64-of(st.use-start[cir::i64-of(old) + 1]));
  let user = st.use-user[u];
  let x = cir::val(st.f, user);
  write st.f.operands at cir::i64-of(x.opb + st.use-index[u]) = new;
}
```

Pure equations support `let`, `all`, `any`, `count` and `tabulate`; generated `all` and `any`
short-circuit. Expressions in rows and constraints reject explicit mutation,
imperative control flow and effectful `!` calls. Called functions must follow
the language's naming convention for effects.

The native public types and entry points retain their ABI. The compiler and
standalone backend both consume these sources; generated Coil is an artifact.
Tests and measurements must cover both uses before claiming completion or
performance parity. Source-size accounting includes the declaration compilers.
The standalone suite runs the independent clients under LLVM O1 and native O0.

After editing:

    python3 scripts/compiler/gen-declarative.py
    python3 scripts/tests/declarative.py /absolute/path/to/coil

The second client in `toy/storage.pass`, called by `tests/toy.coil`, exercises
the same declarations with noncompiler data: recursive and unknown-boundary
facts, cyclic stopped paths, rejected and accepted rewrites, cell updates,
snapshot isolation, retained scratch, ownership, dominator diamonds and cycles,
epoch-map collisions/growth/wrap, agreement, cyclic/deferred SSA merges, reserved
rows across nested appends, pruning cascades, segment-local anchors, stable
retention, scheduling, lazy scoped fallbacks, long path folds, and unaligned
buffer encodings.
