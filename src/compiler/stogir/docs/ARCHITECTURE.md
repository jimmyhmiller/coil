# Architecture contract

The reference is dstogov/ir commit
`92171d0a4a36b0acf707f2dea7998de615dd4acd`, specifically
`ir.h:ir_jit_compile` and `ir_main.c:ir_compile_func`. Attribution and license
terms are centralized in [PROVENANCE.md](PROVENANCE.md), [NOTICE](../NOTICE)
and [LICENSE](../LICENSE).

## Pipeline and current gaps

| Upstream optimized stage | Coil implementation and status |
| --- | --- |
| Construction folding/CSE, def-use lists | Compact graph, builder/fold modules and uses. Implemented coverage does not imply all upstream folds. |
| Optional mem2ssa, then reset CFG | Typed nonescaping ALLOCA partitions and demand-driven SSA across joins/loops before SCCP. Uninitialized paths retain storage. Analyses are rebuilt afterward. |
| SCCP at optimization levels above one | Rooted analysis, owned rewriting and incremental scalar fold/CSE/DCE run through explicit image/object options at levels 2/3. Fold/restart coverage, promotion and CFG/control/load cleanup remain incomplete. See `OPTIMIZATION_MODES.md`. |
| CFG, dominators, loops, GCM, scheduling | `pipeline.prepare` orchestrates CFG, dominance, loop depth, placement and scheduling. Full upstream algorithm parity remains unverified. |
| Target matching | `a64.compile.generate` builds a persistent `a64.match.Plan` before register analysis. Scalar logical immediates are persistent tiles with narrow normalization; broader fusion and reuse coverage remain incomplete. |
| Virtual registers, live ranges, coalescing, allocation | Matched operands feed register liveness, ranges and constraints, then split-interval allocation. Explicit upstream coalescing and full allocation-policy parity remain open. |
| Block scheduling and emission | Post-allocation block ordering and native emission. The scheduling core has a pinned-upstream differential; this does not establish whole-pipeline equivalence. |

Explicit library options now select the existing native path at level 1 and add
SCCP before it at levels 2/3, following the pinned positive-level gate. O0
explicitly rejects until the distinct de-SSA/fast-allocation path exists. This is
not complete upstream flag, optimizer or allocator parity. Legacy entry points
retain their existing behavior. Coil flag transport is committed separately and
must pass compiler delivery gates before being described as installed.

## Invariants for further work

- Keep the compact signed-reference graph as the semantic IR. Pass facts,
  schedules and machine constraints may index it; they must not become an
  independently maintained replacement IR.
- Put optimizer algorithms in the standalone library. The Coil adapter
  translates CIR and supplies policy; it must not recognize benchmark code.
- Perform matching before liveness. Fused operands and reuse requirements must
  reach allocation rather than being hidden in a late emission shortcut.
- A graph rewrite must preserve or explicitly remap observable roots, Phi
  predecessor correspondence and live references. Invalidate/rebuild affected
  uses, CFG, dominance, loop, placement, schedule and matching facts before use.
  Storage-level rewrite APIs alone do not satisfy this pass contract.
- Keep a working graph alive until pending graph references have been resolved
  into the owned image. Compilation must preserve the caller's graph when the
  API promises immutable input.
- JIT and AOT consume the same relocatable image. There is no alternate optimizer
  or LLVM/TPDE fallback behind either path.
- Keep all optimization, matching, allocation and image generation inside the
  measured IR-to-machine-code boundary.

## Extensions and sequencing

Automatic loop vectorization is an independent extension, not a ported feature
of the pinned upstream pipeline. The library O3 options API now selects guarded
integer vector prefixes after SCCP and before final matching/liveness. Coil
backend worktree delivery is in progress. See LOOP_VECTORIZATION.md.
It must not substitute for completing the missing upstream optimizer stages.

The rooted SCCP pipeline and explicit library mode API now have full standalone
compatibility coverage: 228 programs and 69 linked consumers at executable source
`799bba6`. That SCCP compiler integration is delivered; vector extension validation is in
progress, followed by the remaining
fold/restart, promotion, control cleanup, matching, coalescing and allocation gaps. Each stage needs semantic execution tests and,
where practical, differential checks against the pinned implementation.

Every vector transformation must operate on the same graph before final
matching/liveness, rebuild invalidated analysis, prove memory dependence safety
(or guard it at runtime), preserve scalar fallback and tails, and pass both JIT
and linked AOT execution tests. Analysis-only fixtures do not establish a safe
transformation or a performance improvement.

### Independent bounded graph-call expansion

`stogir.call-inline` is an extension beyond the pinned upstream pipeline. A module
provider may call `optimize-sites` before SCCP and structural analysis, supplying
borrowed immutable `Callee` graphs and an ordered set of distinct original CALL
references. One transaction owns a single caller copy; the total growth budget
covers cloned instruction cells and argument casts. `optimize` is the single-site
convenience API. Both return the ordinary owned `sccp-rewrite.Rewritten`, released
with `sccp-rewrite.release!`; inputs and all callee storage stay immutable.

Eligible definitions have one scalar/void return and closed returning control (including loops),
ordinary scalar or grouped scalar parameters, numeric/named constants, supported
pure operations and normal loads/stores. Flags, result and ABI grouping match;
same-width signed/unsigned integer arguments get explicit BITCAST nodes. Private
strings, frame operations, nested calls and variadic calls remain intact.
Aggregate results require the private-buffer proofs described below. Never policy is explicit. The module provider must retain symbol
identity, own all imported names and charge its preparation to backend time.

The pass preserves control/value observations of CALL roots, clones forward
references before patching them, and retains predecessor/PHI order. CFG, placement,
matching and liveness are rebuilt afterward; it never substitutes emitter bytes
or modifies source inlining annotations. Linked execution coverage lives in the
existing `tests/module-execution.coil` program, including policy/budget fallbacks,
ABI groups, branches/PHIs, dependent calls, memory effects and typed imports.


### Private merge/test splitting

The iterative control optimizer ports `ir_try_split_if` and
`ir_try_split_if_cmp` from pinned `ir_sccp.c`. A two-input MERGE with exactly
one private PHI and its exclusive IF can route constant predecessors directly
and move a remaining test into the other predecessor. Integer comparisons use
the existing typed fold oracle. Numeric literals are distinguished from named
relocation payloads. Protected IF, comparison, PHI, and MERGE identities decline
the transformation; the public observation contract is unchanged.

Mutations maintain exact use positions and enqueue affected users. Same-truth
constant inputs invalidate control reachability, using the existing control
prune/rebuild boundary. Native original/optimized comparisons cover signed and
unsigned 8/16/32/64-bit values, ten comparisons, reversed inputs, constant and
dynamic predecessors, protected identities, and branch-local loads. The load
cases pass null on the other path, checking that no access is speculated. The
existing iterative suite passes ASAN/debug checks across 10,560 graphs and
253,440 native answers, with independent exact-use-list comparisons.


### Immediate integer rotates

Persistent scalar selection follows pinned AArch64 `IR_SHIFT_CONST` for
32/64-bit ROL/ROR. Counts are normalized by the language width; ROL uses the
opposite right-rotate count. The tile has no count operand, so liveness and
allocation do not materialize a constant register. Emission uses the checked
EXTR/ROR-immediate encoder. Narrow and dynamic rotates retain their existing
width-specific paths. Encoder words match llvm-mc; the existing native shift
suite covers signed/unsigned widths, zero/wrapped/large counts and bit patterns,
and division/variable-rotate regressions pass ASAN/debug checks.


### Mask after zero extension

The incremental fold kernel implements pinned `ir_fold.h`
`AND(ZEXT, full-source-mask)`: source widths 8/16/32 and exactly the
corresponding all-one low mask. Operand order is accepted in either direction
without mutating predecessor/value associations. The ordinary replacement
mechanism preserves externally observed identities via typed COPY and updates
exact uses/worklists; shared extensions remain available. Named relocation
payloads never become masks. The existing ASAN/debug native fold suite adds
960 graph cases / 26,880 original and rewritten answers covering signed/unsigned
source and destination types, exact and adjacent masks, four observation modes,
both operand orders, and both supported pointer widths.


### Native tail calls (isolated development checkpoint)

TAILCALL follows pinned `ir.c:_ir_TAILCALL_N`: a typed CALL-like opcode80
followed by UNREACHABLE, with no usable result definition. Construction and
verification require a declared matching return ABI and a unique terminal
successor. Aggregate calls must forward the caller's result PARAM0 (the third
compact PARAM operand is its index; the second is a name string ID).

Persistent AArch64 matching proves whether to jump or use the upstream-style
call/return fallback. Argument installation reuses ordinary parallel transfers.
An indirect target moves from x30 to x15 after arguments are installed; x15 is
neither an argument nor a preserved register, and survives the x16/x17 epilogue
scratch work. Frame restoration is shared with ordinary returns. Direct B and
BL retain their own link bit under the same BRANCH26 relocation.

Stack/copy arguments retain call/return. Explicit private-frame addresses are
tracked through pointer and integer views; unknown escapes retain call/return.
Register-result capture buffers are caller-side writes, not callee arguments.
The synthetic function register-result PARAM0 is itself a private-frame origin.
No trusted escape flag is provided.

ASAN/debug scalar tests pass direct/indirect million-deep recursion, swapped
arguments, prefix calls and O1/O2/O3; frame tests check native/fallback proofs,
integer pointer views, and 16/64-byte alignment. Existing stack, call-pressure,
floating-call, aggregate-result and narrow-varargs suites pass unchanged.
Tail-specific mixed GP/FP, stack-argument fallback, GP-pair/HFA/x8 result
forwarding and linked AOT self-recursion also pass. Copied aggregate arguments
remain conservatively in the call/return fallback. Coil integration is pending;
this development branch is not delivered to the compiler.

Late CALL/RETURN recognition must follow upstream `ir_emit.c:ir_try_tailcall`
after module inlining. Eager conversion while preparing templates would make
otherwise useful templates fail the current inliner's legality checks.

Ordinary CALL/RETURN pairs are recognized by a persistent late machine plan,
following `ir_emit.c:ir_try_tailcall`. Only a sole matching RETURN may consume
the CALL, and an explicitly observed CALL root blocks absorption. Void callers
may ignore a scalar result. Matching suppresses the virtual result definition
and RETURN before liveness and constraints; the semantic graph stays unchanged.
Caller-clobber reservations use the resulting live ranges, so a selected CALL
with no virtual result does not leave x0/v0 unreserved. Native eligibility uses
the same declared ABI and frame lifetime proof as explicit tail calls.
