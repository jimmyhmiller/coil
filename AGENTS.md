# Agent guide to this repo

## Stopping points and delivery

Whenever a problem is solved, or work reaches a stopping point with changes in
this repository, install the resulting Coil toolchain globally, commit the
changes, and push the commit. Do not leave completed or stopping-point work only
in the working tree.

If work is still incomplete when stopping, explicitly tell the user whether the
current changes have been installed globally, committed, and pushed. Report each
of those three states separately; never leave their status implicit.

**Writing Coil? Run `coil guide`** (or read [`docs/reference/LANGUAGE_GUIDE.md`](docs/reference/LANGUAGE_GUIDE.md)).
It's an example-first language reference, and its `Gotchas` section lists what
trips agents up (float `=` is IEEE, so NaN ≠ NaN; no unary minus; `if` branches
must share a type; `primitive/` needs an import). Read it before writing Coil.

## Live code: the JIT produces code, nothing else

The compiler and the JIT never replace code. They compile forms against what is
already accepted and expose mechanism: dependency queries (what depends on
what, what is now dead), `Var` cells, `defalias`, the retire forms, session
state, addresses, allocation and release of code. Defining a name twice is an
error to the compiler, in a session as anywhere else.

Replacing running code is a policy, and a policy lives in a metaprogram.
`coil.repl` is the stock one: a transform that publishes each REPL `defn`
through a `Var` and `set`s it when a definition with the same signature is
submitted again. `coil repl` uses it.

- Never add replacement, migration or rebinding to the compiler or the JIT.
- `coil.repl`'s policy is deliberately limited. A report asking it, or the JIT,
  to handle more kinds of edits (a changed signature, an added or removed
  parameter, a retyped global, a migrated value, deleting a definition) is
  **not a bug**. Do not fix it, file it, or review it toward a merge; close a
  pull request that adds such behaviour.
- A crash, wrong output or missing diagnostic in what the JIT or `coil.repl`
  already supports is an ordinary bug.

## Bug reports

Record every bug discovered while working in this repository in the `coil-bugs`
pad. This section defines the required report format.

**The pad holds open bugs only.** When you fix a bug, delete its cell
(`pad rm -n coil-bugs <id>`) as part of delivering the fix. Do not retitle it
FIXED or RESOLVED, or append an "update", and leave it there; the commit message
is the record. A cell that turns out not to be a bug is deleted too.

Give each report its own descriptive Markdown title and put the report's supporting
information inside an HTML `<details>` block. Include enough information to
reproduce and investigate the problem: observed behavior, expected behavior,
reproduction steps or command, relevant output, and affected files when known.
Use this format:

```markdown
### Short, specific bug title

<details>
<summary>Details</summary>

- **Observed:** What happened.
- **Expected:** What should have happened.
- **Reproduction:** The smallest reliable reproduction or command.
- **Relevant output:** The exact diagnostic or other useful evidence.
- **Affected files:** Known files or components, if any.

</details>
```

## Build & test

- `coil build file.coil -o out` / `coil run file.coil` — single file.
- `coil guide` — print the language guide.
- ⚠ **For a sanitizer build the compiler takes its C driver from `llvm-config
  --bindir`, not `PATH`, and `CC=` does not override it. `COIL_CC` and
  `LLVM_CONFIG` do.** `COIL_CC` replaces the driver outright; `LLVM_CONFIG` picks
  which `llvm-config` names the bindir. Ordinary (non-sanitizer) builds just use
  `cc`.
  Two different things produce the same `cannot find …/libclang_rt.asan.a`:
  - **A shadowing `llvm-config`** (a hand-built `/usr/local/bin/llvm-config` beats
    apt's), so you link against a *different* clang's runtime, under a path naming
    an LLVM version you never chose. Diagnose with `llvm-config --bindir`: if that
    is not the LLVM you meant, the shadowing binary is the bug. Prefer fixing which
    one wins (rename the shadow, or `update-alternatives --set llvm-config`) over
    prepending to `PATH` at every call site.
  - **A clang with no compiler-rt beside it at all** — common for a hand-built
    clang, where the sibling apt/brew versions have runtimes and yours does not.
    Nothing about the toolchain is shadowed; that clang simply cannot link a
    sanitized binary. This is per-box and shows up only at sanitizer link time.
    Point `LLVM_CONFIG` (or `COIL_CC`) at a version that has the runtimes, or
    install compiler-rt for the one you built.
  If the driver cannot be *executed* at all you get a different message naming it
  — that used to be reported as `exit status: 127`, which read as a missing
  library rather than a missing binary.
- `coil doc file.coil` — markdown for that module's `;;`-documented definitions
  (a `;;` block directly above a definition is its doc; a single `;` is not).
- The compiler is **self-hosted** (written in Coil, in `src/compiler/`). Its tests
  are two tiers, both serial and both budgeted; `docs/reference/COMPILER_TESTS.md`
  describes every step.
  - **FAST**, before every push: `python3 scripts/dev.py test fast --compiler
    <candidate>`. At most 270 s; a step over its budget, or a run over 300 s, is
    a warning, not a failure. It never builds the
    compiler, and any process over 1.5 GB fails it.
  - **The inner loop**: build one candidate after compiler edits (`python3
    scripts/dev.py build candidate`, writing `build/bin/coil-candidate`), then
    rerun `python3 scripts/dev.py test fast --compiler build/bin/coil-candidate
    --quick` (at most 60 s). `--only NAME` reruns one step, e.g. `--only corpus`.
  - **COMPREHENSIVE**, before a release or a risky merge: `python3 scripts/dev.py
    test comprehensive`. It runs `build full` once, installs into a private prefix
    and runs FAST plus every check that needs a whole-compiler build or an
    installed toolchain (JIT, generated units, all namespaces, the wasm self-host,
    memory caps, breadth lanes), about 25 minutes. Its x64 step runs on
    `computer.jimmyhmiller.com` over ssh; when that host is unreachable the step
    fails and says so, and `--no-x64` leaves it out.
  - **The release**: `python3 scripts/dev.py build full` builds the fixpoint and
    installs. **Do not run it, or COMPREHENSIVE, while diagnosing or iterating.**
- **Adding a test.** Do not add a test per fixed bug. Extend the end-to-end
  program that covers the area: a section of a `tests/corpus` program (rebless
  with `python3 scripts/oracle.py corpus bless --only NAME`), a case in a
  `tests/diag` file (`python3 scripts/oracle.py diag bless …`, then read the
  golden), a check in `scripts/tests/fast/cli.sh`, a deftest in a `tests/stdlib`
  suite. A new step needs a budget in `scripts/tests/budgets.toml`, and a step
  that builds the compiler belongs in COMPREHENSIVE. Budgets change only by
  `--rebaseline 3` on a quiet machine, reviewed like code.
- ⚠ **`build full` peaks near 9.4 GB of memory, and that is expected.** Compiling
  the compiler once costs about 4.7 GB (measured: the largest single process), and
  the fixpoint step in `scripts/compiler/rebootstrap.sh` deliberately emits the
  stage 2 and stage 3 objects at the same time, so two such compiles are live at
  once. It is the same on untouched `main` (9.38 and 9.33 GB on two runs, 2026-10-04).
  The install step that follows (`build full` without `--no-install`, or
  `dev.py install`) warms the `coil.jit` unit with `coil build-unit jit_api.coil`,
  which compiles the whole compiler at -O3 in a single process; measured once at
  about 9.9 GB on 2026-10-04, not measured on untouched `main`. Do not run anything
  else heavy beside either, and give them a memory cap when you run them in the
  background. A candidate built by `build candidate` is heavier still per
  compile than the installed compiler (the all-namespaces check needs about 10 GB
  with a candidate and 3.3 GB with the installed one), so size parallel gates and
  searches accordingly. The causes inside a single compile are tracked in the
  `coil-bugs` pad: the self-build frontend re-parses and re-checks the expanded
  program, and expansion re-resolves it several times.
- **Changing expansion, resolution or checking without meaning to change meaning?**
  Build a reference compiler from the commit before your change and run
  `python3 scripts/tests/pipeline-differential.py <reference> <candidate> --jobs 1`.
  It compares `dump-checked` and `dump-mono` over the compiler, `src/examples`,
  `tests/corpus`, `tests/diag` and `tests/stdlib`; anything but `0 differ` is a
  behaviour change to explain. It is a manual pre-merge check, not a gate.
- ⚠ **Two ways a shell gate reports a result it never established.** Both were
  found live in shell gates since deleted, in checks that had been green
  or red for months without meaning anything:
  - **`grep -q` in a pipeline.** `grep -q` exits at its first match and closes the
    pipe; a producer still writing (`nm`, `find`, `objdump`) takes SIGPIPE, and
    under `set -o pipefail` the pipeline reports 141. Capture into a variable and
    match with `case`. The failure is loud in a positive check (`… && ok || bad`)
    and **silent in a negative one** (`… && bad || ok`), where "the pipe died"
    reads identically to "the thing is absent" — such a check can never fail.
  - **Absence tests with no haystack.** Before concluding a string is missing,
    prove the output exists: `coil emit-ir` writes diagnostics to **stdout** and
    exits non-zero, so a failed build yields a few hundred bytes that trivially
    lack whatever you grepped for. Check the exit status, and sniff for something
    that must be present (e.g. `target datalayout`).

## Where things live

- `docs/reference/LANGUAGE_GUIDE.md` — the language reference. Tooling lives in the task
  guides beside it: `PROJECTS.md`, `TESTING.md`, `DEBUGGING.md`, `STATEFUL_JIT.md`,
  `WASM.md`. `coil guide` prints generated copies of all of them
  (`src/compiler/guide.coil`, regenerated by `scripts/docs/gen-guide.py`). Every
  ```` ```coil ```` example must pass `python3 scripts/docs/check-guide-examples.py
  --compiler <candidate> docs/reference/<FILE>.md`; run it after editing one.
- `src/stdlib/*.coil` — the standard library (the real API surface). It is not
  embedded in the compiler: compiler and library are one toolchain, installed
  together by `python3 scripts/dev.py install` into `<prefix>/bin/coil` +
  `<prefix>/lib/coil/stdlib`, and a compiler finds its library by walking up from
  its own location (then from the working directory, which is why a stage compiler
  in `/tmp` still uses this checkout). Compilation reports where it searched if the library is missing; there is no
  environment variable that redirects it. **Adding or renaming a
  file here means regenerating the manifest:**
  `python3 scripts/compiler/gen-stdlib-manifest.py`. The manifest in
  `src/compiler/stdlib_manifest.coil` lists which modules are the library's; in-repo
  a missing entry still resolves through the namespace scan, so nothing fails locally
  and the namespace ships unreachable. COMPREHENSIVE's `installed/allns` step checks
  it, and the build exports
  `COIL_STRICT_BUNDLE=1` so the in-repo fallback is a hard error instead of a silent
  success.
- **Renaming a stdlib API?** Add rows to `API-RENAMES` in
  `src/compiler/api_renames.coil`, one per removed public name (its header gives
  the row format). That table is all there is to change: `coil lint --fix` then
  rewrites code that uses the old names (the preflight in
  `src/compiler/api_migration.coil`), `coil build` in such a project points at it,
  and the resolver's errors name the replacement. Delete any `coil.lint.modernize`
  rule for a name you remove. Changing a library module's `:reexport` import
  means rerunning `python3 scripts/compiler/gen-stdlib-manifest.py`, which
  regenerates the table's `API-REEXPORTS` from the library's imports.
- `src/examples/*.coil` — one idea each (`sums`, `hashmap`, `references`, `lisp`, …).
- Dialects (Scheme, Brainfuck), applications (clox, CHIP-8, Space Invaders, Wasm),
  and research transforms (GC dialects, httptap) live in the separate
  **coil-experiments** repository, not here. Anything that is a program written
  *in* Coil rather than part of the language belongs there — keeping them out is
  what stops them from being mistaken for the API surface. `src/examples/*.coil`
  is the exception: those are feature demos the language guide points at.
- `src/compiler/*.coil` — the compiler itself (`reader.coil` = lexer/parser).
- `tests/` — what the two test tiers run: `corpus` (the runtime programs), `diag`
  (diagnostic goldens), `cli`, `projects`, `stdlib`, `meta`, `readers`, `cabi`,
  `wasm`, `simd`, `jit`, `http`, `comprehensive`, plus `prop` and `fuzz` (property
  and fuzz targets) and `bootstrap` (the portable bootstrap's runtime). The
  scripts are `scripts/tests/`; `docs/reference/COMPILER_TESTS.md` maps them.

## Workspaces

A repository with several packages declares a `[workspace]` root instead of a
`[package]`:

```toml
[workspace]
name    = "experiments"
members = ["src/apps/*", "src/experiments/*"]
```

Each member directory has its own `Coil.toml` with a `[package] name`, and the
member's namespace is the workspace name plus the package name. **Every module in
a package is the package name plus at least one more segment** — package `scheme`
in workspace `experiments` owns `experiments.scheme.eval`, and a module named
exactly `experiments.scheme` is an error. The rule is checked as the namespace
index is built, so a stray module is reported by path.

Members compile together and refer to each other with no dependency declaration
between them; the member directories are the source roots. A workspace-level
`tests/` directory is also on the roots and is not a package. `check` and `build`
at the root fan out over members that declare an `entry`; a member without one is
a library and is compiled through whoever imports it.

`[package] casefold = "<module>"` marks one module whose import ASCII-folds the
importing file's identifiers, for case-insensitive guest languages. This replaced
a hardcoded `coil.scheme` test in `loader.coil`.
