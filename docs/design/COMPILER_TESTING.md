# Compiler testing: a small trust core, deftest for everything else

**Status:** plan. Written after the trait-method hygiene work
(`TRAIT_METHOD_HYGIENE.md`), which demonstrated both sides of this design: the
gates caught two bugs the author's tests missed, and deftest itself was the
*victim* of the bug under test — 125 tests reported green while asserting
nothing.

**Goal.** Two tiers with an explicit trust ordering:

1. A **trust core** — the smallest set of non-deftest checks that establishes
   "this compiler binary is sane enough that its deftest results mean
   something."
2. **Everything else is deftest** — including tests *of the compiler itself*,
   written as ordinary Coil test modules with `coil.assert`, run by the
   candidate compiler only after the trust core is green.

The bootstrap (`rebootstrap*.sh`) stays as it is.

---

## 1. Why a trust core must exist (and why it can be small)

deftest runs code compiled by the compiler under test, asserted by a framework
compiled by the compiler under test. When the compiler is wrong, deftest does
not fail — it lies. `(assert-eq 1 999)` passed for months in any module that
bound `=`. So some layer must not depend on the compiler being correct:

| trust-core check | what it anchors | depends on compiler correctness? |
|---|---|---|
| bootstrap fixpoint (stage2.o ≡ stage3.o) | self-consistency, determinism | no — byte compare |
| stage snapshot gates (`oracle.py gate`) | no unreviewed drift in any stage | no — byte compare vs blessed refs |
| runtime corpus gate (58 programs, stdout+exit) | compiled code behaves; shared refs make LLVM and native backends agree | no — output compare |
| **canaries** (new, see §2) | the assert machinery itself can fail | no — checked from outside |
| a thin process harness (§5) | exit codes, filesystem effects, linking | no — observed from outside |

Everything NOT in this table should eventually be a deftest.

**Trust ordering is the whole design:** build candidate → trust core → then
deftest suites. A deftest failure after a green trust core is a real failure;
a deftest *pass* before the trust core has run proves nothing. The runner
(§6) enforces the order.

## 2. Canaries: tests that must fail

The hygiene bug was invisible because nothing ever checked that a failing
assertion *fails*. The trust core gains a canary suite, checked from outside
the language:

- `tests/compiler/canary/must_fail_test.coil` — deliberately failing
  assertions (`(assert-eq 1 2)`, a failing `deftest`, an `assert-fail-cmp`
  path). The harness runs `coil test` on it and requires **nonzero exit and
  the exact failure count**.
- `tests/compiler/canary/capture_probe_test.coil` — the vacuous-assertion
  probe from the hygiene saga: a module that binds `=`/`<`/`+` as macros and
  asserts a falsehood. Must fail. This is the regression test for the entire
  bug class, kept forever.

Cheap, fast, and they convert "the suite is green" from a hope into evidence.

## 3. Compiler deftests — verified feasible today

Three enablers, all confirmed working in this tree:

1. **Compiler modules are importable by name.** A test file anywhere (even
   outside the repo) can `(import "resolve" :use *)` and call
   `find-coloncolon` directly — the namespace scan finds `src/compiler/`.
   Nothing to build.
2. **`coil.subprocess`** has `spawn`, `run` with captured stdout/stderr,
   exit statuses, timeouts. deftests can drive the compiler *binary* for
   CLI-level checks.
3. **deftest/`coil test`** already produce counted, exit-coded results.

So compiler tests come in three flavors, cheapest first:

- **Unit** — import a compiler module, call the function.
  Every bug from the hygiene saga maps to one:
  `(deftest sug-layout (assert-eq (sug-head-display qualified-cond-node) "cond"))`,
  scope-to-definition-module resolution finding `coil.core.=`, scoped binder
  lowering, `sig-arity-ok?` on variadics.
- **Library-level integration** — feed source *strings* through parse →
  expand → check in-process and assert on the result or the diagnostics.
  Needs the testkit (§4). This is where most of `gate-cli`'s "this bad
  program is rejected with message X" checks belong: today they are bash
  stanzas with here-docs; as deftests they get real assertions and names.
- **CLI-level** — `coil.subprocess` runs the candidate binary; assert on exit
  code, captured output, files created or (importantly) *not* created. For
  the checks that are genuinely about the process: `--fix` atomic rollback,
  "check writes no object file", crash-signal semantics.

**Cost note:** importing `check` pulls a large dependency cone. Prefer a few
aggregate test binaries (one `unit_test.coil` importing many small test
modules) over per-file binaries, and keep the pure-unit tier importing narrow
modules (`resolve`, `diag`, `parser`) where possible.

## 4. The testkit

One new module, `tests/compiler/testkit.coil`, so compiler tests read like
tests instead of plumbing:

- `tk-parse (src) -> Result forms Diag` — string in, forms out.
- `tk-expand (src) -> Result Code Diag` — through the expander, for hygiene
  and macro tests (`assert-eq (tk-expand-head …) "coil.core.="`).
- `tk-check (src) -> (diags …)` — full frontend, diagnostics as data:
  `(assert (tk-has-diag? diags "expects 3 args"))`.
- `tk-compile-run (src) -> {stdout exit}` — subprocess against the candidate
  binary (`COIL_UNDER_TEST` env var, set by the runner).
- `tk-must-not-compile (src expected-msg)` — the negative-test idiom
  (user13's "must FAIL with this message" as one assertion).

The existing repro style stays valid: `tests/compiler/hygiene/*.coil` files
become *fixtures*, and a `hygiene_test.coil` runs each via `tk-compile-run`
and asserts the expected output from the README table — wiring the orphan
suite into the runner without rewriting it.

## 5. What stays non-deftest, permanently

- `rebootstrap*.sh` — unchanged, per decision.
- `oracle.py` snapshot gates + coverage — byte-exact golden files are the
  point; deftest adds nothing.
- A **thin** process harness (the shrunken `gate-cli.sh`): builds the
  candidate, runs the canaries, and keeps only checks that cannot observe
  themselves from inside a test process (sanitizer symbol presence via `nm`,
  SIGABRT exit semantics, linker-failure text). Target: under ~200 lines,
  from ~2300 today.
- `dev.py` as the entry point.

## 6. The runner

`python3 scripts/dev.py test compiler --compiler <candidate>`:

1. trust core: canaries → snapshot gates → runtime gate (fixpoint is NOT in
   the inner loop; it stays in rebootstrap for release verification),
2. compiler deftests: unit → library-level → CLI-level,
3. everything-else deftests: stdlib, apps, scheme dialect suites,
4. scheme differential harness (when oracles or frozen refs are present).

Same command, same result, both platforms. The bounded inner loop
(`modernize-fast`'s role) becomes a tagged subset: canaries + unit tests +
a handful of fast integration tests, still under 30 seconds.

**Platform parity rule:** a check either runs identically on macOS and Linux,
or it is *listed* as platform-specific in one place (the runner), with its
Linux/macOS twin tracked. No more discovering that `modernize-fast` hardcodes
`--backend arm64` by watching it fail on Linux. (`ir`/`diag` stay
macOS-only until they get Linux references — but the runner *says so* instead
of silently passing over them.)

## 7. Migration phases

Each phase lands with the usual bootstrap green; nothing is deleted until its
replacement has caught at least one real diff (run both in parallel for one
phase).

- **Phase 0 — enablers.** Testkit module; `COIL_UNDER_TEST` convention;
  aggregate-test-binary layout under `tests/compiler/unit/`; runner skeleton
  in `dev.py`; the two canary files.
- **Phase 1 — seed unit tests from the hygiene saga.** `sug-head-display`,
  definition-module resolution (+ core tier), scoped binder positions
  (impl/deftrait/inherent/`:requires`), `sig-arity-ok?`,
  `method-arity-matches?`, `head-was-implicit?` defaults, `after-last-dot` /
  `find-coloncolon` edge cases. These prove the ergonomics and pin last
  week's fixes at the unit level (today they are pinned only end-to-end).
- **Phase 2 — wire the orphan suites.** `hygiene_test.coil` over the repro
  fixtures (including the must-fail ones); the scheme dialect `*_test.coil`
  modules registered in the runner instead of run by hand.
- **Phase 3 — migrate `gate-cli`'s in-language checks.** Diagnostics-text
  checks move to `tk-check` deftests; behavior checks to `tk-compile-run`;
  process checks to subprocess deftests. gate-cli shrinks to the §5 stub.
  This is the bulk of the work and can proceed check-by-check.
- **Phase 4 — migrate `dev.py`'s ad-hoc suites** (`modernize-fast` bodies,
  metaprogramming run.sh where expressible) and fix their platform
  hardcoding in the process.
- **Phase 5 (optional) — cheap differential oracles for the compiler:**
  runtime-corpus programs required to agree `-O0` vs `-O3`, and LLVM vs
  native backend on the same host. Both are output-compares the runtime gate
  already knows how to do; they catch miscompile classes snapshots cannot.

## 8. Success criteria

- One command runs everything; its summary lists tier results and any
  platform-skipped checks by name.
- The trust core is enumerable — this doc's §1 table IS the list, and it
  fits on a screen.
- A new compiler bug gets a *unit* deftest in minutes. The measure: had this
  system existed, the sug-layout bug would have been a 5-line deftest instead
  of a gate-cli fmt-clean stanza plus an afternoon of archaeology.
- The canaries fail when they should: mutate `assert-eq` to always-true and
  the trust core must go red.
