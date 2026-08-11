# Coil Scheme: R5RS compliance ledger

This is the working definition of “done” for Coil's native Scheme dialect.  A
feature is **verified** only when it passes through a module importing
`coil.scheme`; implementation-unit coverage alone is not enough.

The deliberate deferrals are `call-with-current-continuation` / `call/cc` and
full `dynamic-wind`.  Everything else in R5RS remains in scope.  Historical
deferral cases live in `tests/scheme/out-of-scope/` so they cannot quietly
disappear; proper tail recursion has now graduated into the bounded gate.

## Continuously runnable gates

    python3 scripts/dev.py test scheme --compiler <candidate>
    python3 scripts/scheme-progress.py
    python3 scripts/scheme-progress.py --bench --compiler <candidate>
    python3 scripts/scheme-progress.py --corpus --compiler <candidate>
    python3 scripts/scheme-progress.py --lox-corpus --compiler <candidate>
    python3 scripts/scheme-progress.py --all --compiler build/bin/coil

The `dev.py test scheme` command is the normal compiler-workflow entry point and
is part of both self-host rebootstrap gates. `scheme-progress.py` is the direct
entry point; its default mode is the bounded inner loop: all implementation suites plus
native dialect programs that use only the public Scheme surface, compared
byte-for-byte with oracle-blessed R5RS output. Cases 01, 05, 06, 07, and 09 plus the
focused closure/recursion, exact-integer/rational, and mixed-flonum programs are gated now; none has an
`scm-*` runtime escape hatch. The same gate also builds and runs the larger
metacircular evaluator and Lox interpreter applications. As of 2026-08-10 this is
10 implementation suites (173 tests), 22 public oracle programs, 39 negative
cases (module visibility; malformed ordinary and peculiar identifier tokens, bare-dot, dotted-vector, and
incomplete-abbreviation reader diagnostics; unmatched runtime syntax; and
general/integer zero-divisor diagnostics; malformed, duplicate-variable, and
unbound-template-ellipsis `syntax-rules`; and direct/first-class comparison
arity diagnostics; direct/first-class `max` arity diagnostics; and a generated
18-case matrix covering every structural datum-reader failure family and
malformed exactness combinations), and 2
applications.
`--corpus` additionally downloads the pinned, GPL-licensed Jaffer
R4RS/R5RS suite into a temporary directory and drives all 644 top-level forms
through Coil's runtime reader and evaluator. The current audit passes with six
continuation-dependent forms skipped. It explicitly removes the suite's
nonstandard `ash` checks and deep tail-recursive floating-printer stress test;
ordinary inexact arithmetic, exact bignums, mixed exact/inexact comparisons,
ports, reader behavior, and report procedures remain covered. The corpus is an
optional network gate and is not vendored or part of the bounded offline loop.
`--lox-corpus` builds one file-driven Scheme Lox executable and runs the locally
vendored Crafting Interpreters clox fixtures. The runner pins all 246 fixture
paths and bytes by SHA-256, so an upstream snapshot change cannot silently alter
the denominator. The current checkpoint proves 238 fixtures: 125 successful
programs match stdout byte-for-byte, and 113 diagnostic programs match every
portable semantic error in source order, including independent multi-errors,
the semantic error category, scanner/parser/resolver/runtime phase, output
before failure, and standard process status (65 or 70). Diagnostic comparison
normalizes source positions and payload-specific names/counts; it does not claim
byte-for-byte clox stderr compatibility. C-only and Java-only cascade
annotations are excluded because reproducing implementation-specific recovery
bugs would make the portable tree walker less correct. Eight cases are
explicitly deferred:
the `clock` native function, IEEE-754 NaN-producing zero division, five
bytecode-VM resource limits that do not apply to this tree walker, and an
explicit recursion-depth guard. No fixture is unclassified.
The gate also generates an executable section-6 inventory: all 198 implemented
R5RS procedures must be exported and usable in first-class position. Its only
excluded procedures are the explicitly deferred continuation/dynamic-wind set;
there are currently no unclassified in-scope procedure omissions.
`--bench` compares native programs with Chez and Petite. `--lox-bench` runs the
same portable Scheme Lox interpreter and five allocation/compute workloads on
Coil and Chez, rejecting output mismatches before reporting timings. `--all`
additionally runs the compiler's bounded
`modernize-fast` gate; it does not perform the final `build full` release step.

Latest min-of-5 benchmark check (2026-08-10, identical answers): Coil/Chez was
1.25x for the compute-dominant exact-bignum `bigfact` workload,
0.98x for `bintree`, 0.25x for `fib`, 0.48x for `gcchurn`, 0.72x for `listrev`,
and 0.65x for `listsum` (lower is faster). The arithmetic surface emits its
guarded fixnum path at the call site and retains the complete numeric tower as a
cold fallback; this moved the previously lagging bintree case ahead of Chez.
`bigfact` exposed a mixed bignum×fixnum path that copied every growing limb list
several times; a canonical one-digit multiply path cut that workload by roughly
fourfold on the initial short probe. Bignums now retain their canonical limb
count, and the small-digit path performs one GC check before allocating,
filling, and linking the entire traced result chain in a single pass with
aggregate heap accounting. That reduced the measured deficit from 1.95x to
1.27x in the latest run; packed limb storage is the next structural optimization target.
These are workflow checkpoints, not
portable performance claims; rerun them on the target machine before quoting.

## Language status

| R5RS area | status | evidence / remaining work |
|---|---|---|
| literals, variables, quote | verified core | dialect tests include recursively materialized quoted strings/lists, decimal flonums, radix/exactness-prefixed and complex numbers, source `#(...)` vectors, case-insensitive identifiers (including exports and calls across Scheme modules), booleans, and named ASCII characters; runtime `read` case-folds identifiers and multi-character character names while preserving the case of single-character literals such as `#\A`, gates every R5RS special-initial and special-subsequent character plus all three peculiar identifiers, and rejects malformed numeric-looking and peculiar-prefixed tokens; a generated matrix gates deterministic diagnostics for malformed lists/dotted lists, strings/escapes, characters, booleans, prefixed numbers, sharp syntax, and datum abbreviations; a forced-threshold test proves partial reader structures survive collection |
| procedure calls and evaluation | verified core | native calls; fixed and variadic top-level Scheme procedures—including exported procedures imported with `:use *`—reified in value position while direct calls retain the typed fast path; a negative oracle proves private imported definitions remain inaccessible; lexical shadowing of user and standard procedure names; variadic call-site lowering; fixed-arity primitive values including zero-argument procedures; variadic `+`/`*` reducers; and general argument-list procedure values for arithmetic/comparisons, collections, higher-order operations, optional constructors/conversions, `atan`, and optional-port I/O; direct, first-class, and eval comparison arity agree, calls of non-procedure values fail deterministically instead of dereferencing tagged data, and zero-argument `max`/`min` are rejected rather than returning unspecified; the generated 198-procedure first-class inventory is complete and continuously gated |
| `eval` and environments | broad R5RS surface verified | fresh R5RS report/null environments and a persistent interaction environment are public-oracle gated and forced-collection tested; runtime evaluation covers core syntax, lexical/variadic closures, recursion, mutation, `and`, `or`, `let`, named `let`, `let*`, `letrec`, `cond` including `=>`, `case`, `do`, `delay`/`force`, nested/splicing/vector quasiquote, and hygienic datum-level `define-syntax`, `let-syntax`, and mutually recursive `letrec-syntax`; runtime `syntax-rules` gates ordered rules, literals with use-site shadowing, `_`, ellipsis, vectors, introduced-binder hygiene, and definition-site free identifiers; its report environment exposes the major numeric, list, higher-order, string, vector, character, conversion, and port procedure families, including `char-ready?`; `load` sequentially evaluates definitions and syntax definitions in one persistent environment |
| `lambda` and lexical closures | arbitrary fixed and variadic formals verified | dotted and symbol-only formals, mutable/shared captures, recursive `letrec`, direct and computed calls, internal definition regions, and arbitrary-length `apply`; arities 0–6 retain typed fast dispatch while higher fixed arities use the GC-safe argument-list ABI; immediately applied simple lambdas remain allocation-free while literals whose bodies introduce closures take the full closure path |
| `if`, `begin`, `define`, `set!` | verified core | globals; R5RS internal variable and procedure definitions lowered to one letrec scope, including mutual recursion, lexical shadowing, and immediate-lambda bodies; ordinary lexical mutation, mutable parameters, and shared mutation of captured bindings across sibling closures are gated; only bindings proven mutable are cell-boxed, leaving immutable `let` allocation-free |
| `let`, including named `let` | verified | empty and nonempty parallel binding lists, plus recursive multi-body named binding through a hygienic `syntax-rules` self-application expansion; mixed-case binders and recursive calls are public-oracle gated |
| `and`, `or`, `let*`, `cond`, `case` | verified through `syntax-rules` | R5RS-derived definitions in `dialect.coil`; expanded-source audit proves old hand macros are bypassed; closure conversion preserves `let*`'s sequential initializer scope and treats `case` datum heads as data even when surrounding code contains closures; a focused oracle proves quoted use-site expressions substituted into a `cond` test are lowered as runtime data rather than leaking compile-time `Code`, while the eval oracle proves nested quoted `let` data remains opaque to every later pass |
| `letrec` | verified through `syntax-rules` | the report-style two-phase expansion computes all initial values before assigning recursive bindings; source forms and letrec generated from internal definition regions pass through the same macro path |
| `do` | verified through `syntax-rules` | recursive binding normalization supports mixed bindings with and without steps; named-let expansion preserves parallel stepping and empty-result behavior |
| `delay` / `force` | verified | expression-position closure thunks and memoization are public-oracle gated |
| quasiquote | verified syntax and semantics | public oracle uses R5RS backquote, comma, `,@`, and `#(...)` directly and covers nesting, splicing, dotted tails, and vector results |
| `define-syntax` / `syntax-rules`, `let-syntax`, `letrec-syntax` | implemented in compiled and runtime-evaluated Scheme with lexical keyword shadowing and recursive local groups | compiled and runtime paths gate rule order, literals, `_`, list and vector patterns/templates, arbitrary cumulative ellipsis depth, repeated binding templates, fixed tails, recursion, binder-capture hygiene, and definition-site free references; compiled literal matching compares definition/use binding identities across `let`, lambda, and local-syntax scopes rather than names; declarations reject structurally malformed rules and duplicate pattern variables, while template expansion rejects ellipses without a repeated pattern variable; runtime eval/load additionally gates mutually recursive local syntax |
| proper tail recursion | verified across the compiled procedure surface | direct mutual calls with differing arities run 10 million steps through the native `swifttailcc` ABI; computed/first-class closures run 10 million steps through a traced request trampoline whose loop is native `musttail`; focused public oracles additionally cover tail calls through `apply`, `call-with-values`, fixed and variadic closures, conditionals, and sequencing. The historical `02-tail-calls.scm` deferral is retained as provenance, not current status |
| continuations | implementation in progress | immutable traced continuation frames and a portable continuation-aware evaluator now pass escape, post-return multi-shot re-entry, repeated invocation, and forced-GC retention tests; the public compiled Scheme surface remains deferred until the continuation machine covers every core evaluation context and the dialect can route continuation-using regions through it; explicit end-to-end cases remain `03-callcc.scm` and `04-dynamic-wind.scm` |

## Procedure status

Verified or substantially covered today:

- booleans and equality: `not`, `boolean?`, `eq?`, `eqv?`, `equal?`
- pairs/lists: `cons`, `car`, `cdr`, mutation, all 28 R5RS `c[ad]{2,4}r`
  compositions, `list`, `list?`, `length`,
  `append`, `reverse`, `list-tail`, `list-ref`, `memq`, `memv`, `member`,
  `assq`, `assv`, `assoc`, and the `c[ad]+r` family
- procedure operations: `procedure?`, `apply` with arbitrary leading arguments,
  `map` and `for-each` over arbitrary list counts, `values`, `call-with-values`
- symbols: `symbol?`, `symbol->string`, `string->symbol`
- characters: ASCII classification predicates, integer conversion, case
  conversion, variadic ordinary and case-insensitive ordering
- strings: predicate, length, indexing, variadic ordinary and ASCII case-insensitive
  comparison, append, substring, and
  list conversion; construction, mutation, copying, and fill
- vectors: predicate, variadic `vector` construction, sized construction, length, indexing, mutation, and list
  conversion, including optional construction fill and `vector-fill!`
- output: `display`, `write`, `newline`, `write-char`, output-file ports
- input ports: `current-input-port`, `open-input-file`, `input-port?`,
  `close-input-port`, `read`, `read-char`, `peek-char`, `char-ready?`,
  `eof-object?`; `char-ready?` uses a nonblocking descriptor probe and preserves
  successful input in the port lookahead cell; datum
  coverage includes sequential reads, comments, booleans, characters, strings,
  proper/improper lists, vectors, symbols, arbitrary exact integers/rationals,
  decimal inexact numbers, numeric radix/exactness prefixes, and quote prefixes
- file combinators: `call-with-input-file`, `call-with-output-file`,
  `with-input-from-file`, `with-output-to-file` (ordinary-return restoration;
  non-local restoration awaits the deferred continuation work)
- system interface: `load` reads and evaluates every datum in a shared explicit
  environment or, by default, the persistent interaction environment; direct,
  rebound first-class, and `apply` invocation are public-oracle gated
- session interface: `transcript-on` and `transcript-off` record output sent to
  the current output port and input consumed from the current input port; unit
  coverage verifies both directions and a public oracle verifies first-class use
- overflow-promoting exact integer `+`, `-`, `*`, comparison, predicates,
  division (`quotient`, `remainder`, `modulo`), `gcd`, `lcm`, printing, and
  `expt` use traced base-10^9 bignums while retaining a dedicated
  allocation-free fixnum path; arbitrary-size integer syntax round-trips through
  source, quote/quasiquote, `read`, `string->number`, and decimal `number->string`;
  the signed fixnum boundary for `abs`, quotient, remainder, and modulo is
  public-oracle gated and promotes instead of wrapping or trapping; exact,
  inexact signed-zero, and complex zero divisors produce deterministic Scheme
  diagnostics rather than unspecified values or hardware traps;
  `#b`, `#o`, `#d`, `#x`, `#e`, and `#i` prefixes work in either permitted
  radix/exactness order through source, quote, `read`, and `string->number`;
  explicitly exact decimal fractions and exponents are constructed directly as
  base-10 integers/rationals rather than exactifying a rounded binary64 value,
  including rectangular complex components and representable zero-angle polar
  forms; source, runtime `read`, and `string->number` are oracle-gated together;
  explicit `string->number` radix arguments reject conflicting prefixes;
  normalized exact rationals have arbitrary-size integer components and are
  produced by `/`, retained through `+`, `-`, `*`, comparisons, equality, and
  decimal printing;
  rectangular complex numbers retain exact/inexact components and support mixed
  `+`, `-`, `*`, `/`, numeric equality, source/quoted literals, `string->number`,
  `number->string`, printing, `make-rectangular`, `make-polar`, `real-part`,
  `imag-part`, `complex?`, `real?`, `rational?`, `magnitude`, `angle`, and
  negative-real `sqrt`; rectangular `a+bi` and polar `r@theta` input are accepted;
  complex `exp`, `log`, `sin`, `cos`, `tan`, `asin`, `acos`, `atan`, and `expt`
  use principal branches; signed-zero source literals retain their IEEE-754 sign
  through expansion, and `angle`, `sqrt`, and `log` distinguish the two sides of
  the negative-real branch cut in agreement with Chez; explicit complex signed
  zero likewise selects the Chez-compatible lips of the `asin`/`acos` cuts and
  the real side of the `atan` imaginary-axis cut, while complex printing emits
  `a-0.0i` rather than the non-readable `a+-0.0i`; their traced
  representation is forced-GC tested;
  `numerator`, `denominator`, and `rationalize` cover the real tower; inexact external
  representations use 17 significant digits and retain a decimal marker even
  for integral values and signed zero, so
  printing and reading preserve both value and exactness;
  mixed fixnum/flonum/rational arithmetic promotes only when an operand is
  inexact; mixed exact/inexact comparisons compare against the exact IEEE-754
  value rather than rounding an arbitrary-size exact operand first, so adjacent
  bignums do not become spuriously equal; normalized rational syntax is accepted in source, quote/quasiquote,
  `read`, `string->number`, and `number->string`; decimal literal reading, printing, quoting,
  `number?`, `integer?`, `exact?`, `inexact?`, `zero?`, `positive?`, and
  `negative?`; exact-rational to binary64 conversion computes and rounds the
  quotient directly (including nearest-even normal, subnormal, underflow, and
  operands individually beyond binary64 range) rather than dividing two already
  rounded operands; `floor`, `ceiling`, `truncate`, `round` (including ties-to-even),
  `exact->inexact`, and finite `inexact->exact` by direct IEEE-754 decomposition
  into arbitrary-size integers/rationals; decimal/exponent strings parse through the same reader as source,
  and flonum `number->string` output is round-trip-safe; real `exp`, `log`, `sin`,
  `cos`, `tan`, `asin`, `acos`, one/two-argument `atan`, and mixed exact/inexact
  `expt` are implemented without a host libm dependency; `sqrt` preserves exact
  perfect-square integers and rationals with arbitrary-size components; both atomic flonum and traced rational payloads are
  forced-GC tested
- `abs`, `quotient`, `remainder`, `modulo`, `gcd`, `lcm`, `expt`,
  `number->string`, and `string->number`

Known in-scope gaps, ordered roughly by application leverage (the exhaustive
first-class procedure inventory is complete and continuously gated):

1. remaining reader work: recover from malformed input once the language has an
   exception mechanism; the complete R5RS identifier grammar, core datum/port
   surface, and structural diagnostic families are implemented and gated
2. Unicode-aware character classification and case mapping (the complete R5RS
   character surface is implemented over the current ASCII representation)
3. numeric tower: continue hardening remaining complex branch cases and
   infinity/NaN behavior against a broader R5RS oracle. Bignum algorithms
   are currently portable quadratic implementations, not yet production-speed
   limb division.
Representation invariant: every `tag-string` object uses stdproc.coil's traced
character-chain layout. Numeric conversion formerly used a second boxed-slice
layout under the same tag; that made cross-module string operations dereference
tagged lengths as pointers. Numeric construction and parsing now use the
canonical representation and have dialect-level interoperability tests.

## Application milestone

The first integration application is now continuously gated:
`tests/scheme/apps/evalcore.coil` is a portable first-order metacircular Scheme
evaluator derived directly from `src/apps/mini-scheme/meta/evalcore.scm`. It uses
Scheme association-list environments, represents interpreted closures and
primitives as Scheme data, mutates its global environment, evaluates a quoted
recursive Fibonacci program, and produces `6765`. Its quoted target also guards
the important invariant that closure conversion never rewrites a target-language
`lambda` inside Scheme data. This is a meaningful interpreter integration test,
but it is not the final Lox-sized acceptance application.

The second application is `tests/scheme/apps/lox.coil`, a portable Scheme
tree-walking interpreter over real Lox source text. Its current acceptance slice
implements a character scanner, line comments, keyword/identifier/integer and
decimal tokenization,
recursive-descent expression parsing, tagged-list AST construction, a lexical
resolver, mutable
association-list environments, variable declaration and assignment, blocks,
block-local lexical scope, `while`, desugared `for`, `if`/`else`, unary `!` and
`-`, the four ordering relations and both equality relations, Lox truthiness,
arithmetic including floating division, strings and concatenation, short-circuit logical
operators, functions, calls, explicit return propagation, lexical closure
capture, classes, mutable instance fields, constructors, methods and `this`,
inheritance, overriding and `super` dispatch, and `print`. The gated program computes the sum 1 through 5, calls
two- and six-argument functions, takes both conditional paths under test, and
creates a nested `makeAdder` closure and a closure escaping a block whose local
capture survives scope restoration. Early return also restores intervening block
scope. Its class slice constructs and mutates a counter, inherits its initializer,
overrides a method, calls the parent implementation through `super`, and adds an
instance field dynamically. Integer and decimal source literals share Lox's
single binary64 representation, so `1 == 1.0` is true, and the output boundary
uses Lox's `true`/`false`/`nil` spellings while removing a redundant numeric
`.0`; these cases prevent Scheme's representation and printer from leaking into
corpus results. The resolver tracks scopes plus function/class context before
execution: it gates lexical closure binding around later shadowing declarations
and rejects duplicate locals, self-initialization, top-level returns, value
returns from initializers, invalid `this`/`super`, and self-inheritance. Runtime
class checks additionally reject non-class superclasses and missing parent
methods without destructuring arbitrary Scheme values. This establishes the full
source→tokens→AST→resolution→execution path. `lox_cli.coil` is a minimal host
`argc`/`argv` adapter; path reading and the entire interpreter remain R5RS
Scheme. The same acceptance binary now runs twenty-three
failing programs through a shared, explicit diagnostic channel and verifies
phase-tagged scanner, parser, resolver, and runtime failures: unexpected characters,
unterminated strings, missing delimiters and terminators, undefined variables,
wrong call arity, calls of non-callable values, invalid operand types, division
by zero, property
access on non-instances, and missing properties. Evaluation stops safely after
the first runtime diagnostic, while parser and resolver recovery can retain
independent static errors, without depending on the deferred continuation
surface.

Overall pinned corpus coverage is 238/246, with all eight remaining cases
explicitly classified rather than unknown. The useful non-bytecode follow-ups
are a recursion-depth guard and, if desired, host extensions for `clock` and
IEEE-754 NaN-producing division.

Candidate audit (2026-08-10): the Crafting Interpreters implementation index
lists [`harryposner/schlox`](https://github.com/harryposner/schlox), an MIT-licensed
Chicken Scheme tree-walker reported to pass almost all of the jlox suite.  It is
not portable R5RS as-is: it depends on COOPS multimethods, SRFI-69 hash tables,
Chicken 5, and continuations for parser errors and Lox `return`.  That makes it a
useful **porting target and requirements generator**, not a drop-in acceptance
test.  The port should replace multimethod dispatch with explicit tagged AST
dispatch, use a portable association-table layer initially, and represent
non-local `return` explicitly rather than requiring Coil's deferred `call/cc`.

This application milestone does not replace the language matrix: it catches
integration failures, while the focused cases identify which contract broke.
