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
It's a dense, practical language reference — types, operators, memory, control
flow, FFI, and the gotchas that trip agents up (f64 has no `Eq`; don't `alloc-stack`
in a loop; `call`/`block` are reserved; `if` branches must share a type). Read it
before writing Coil.

## Bug reports

Record every bug discovered while working in this repository in the `coil-bugs`
pad. This section defines the required report format.
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
- The compiler is **self-hosted** (written in Coil, in `src/compiler/`). During
  development, first run the focused inner-loop gate:
  Build one candidate after compiler-source edits, then repeatedly run
  `python3 scripts/dev.py test modernize-fast --compiler <candidate>`.
  The gate tests the supplied compiler and does not rebuild the compiler on every
  iteration. Its elapsed time is reported for visibility but is not a correctness
  condition. **Do not run
  `build full` while diagnosing or iterating.** Run
  `python3 scripts/dev.py build full` only once for final release verification
  after focused tests and the focused gate are green.
- ⚠ **Two ways a shell gate reports a result it never established.** Both were
  found live in `gate-cli.sh`/`gate-target-os.sh`, in checks that had been green
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
- The snapshot gates use small, stage-specific fixtures listed in
  `scripts/oracle.py::STAGE_INPUTS`, plus curated negative and diagnostic fixtures.
  Broad application and standard-library coverage belongs to the runtime and CLI gates.
  When a listed fixture or its compiler-stage output changes, re-bless that stage in the
  same commit: `python3 scripts/oracle.py snapshot <stage> --compiler build/bin/coil`
  (`<stage>` is `read`, `full`, `ast`, `load`, `resolved`, `checked`, `expand`,
  `mono`, `ir`, `diag`, `x86`, or `all`). Rebootstrap runs all of them and also
  verifies the larger behavioral corpus.
- **Never discover/re-bless cross-cutting snapshot changes one stage at a time.**
  `gate all` audits every stage and reports the complete failing-stage set. For an
  intentional compiler/prelude change that affects several stages, review the scope,
  then run `python3 scripts/dev.py refresh-snapshots --compiler <new-compiler> --verbose`.
  That command audits all stages without writes, refreshes every mismatched stage once,
  and performs one final all-stage audit. Do not loop through `snapshot <stage>` plus
  `gate all` to discover the next mismatch.

## Where things live

- `docs/reference/LANGUAGE_GUIDE.md` — the language reference (source of truth; `coil guide`
  prints a generated copy, `src/compiler/guide.coil`, regenerated by `scripts/docs/gen-guide.py`).
- `src/stdlib/*.coil` — the standard library (the real API surface). It is not
  embedded in the compiler: compiler and library are one toolchain, installed
  together by `python3 scripts/dev.py install` into `<prefix>/bin/coil` +
  `<prefix>/lib/coil/stdlib`, and a compiler finds its library by walking up from
  its own location (then from the working directory, which is why a stage compiler
  in `/tmp` still uses this checkout). `coil --version` prints which library it
  found; there is no environment variable that redirects it. **Adding or renaming a
  file here means regenerating the manifest:**
  `python3 scripts/compiler/gen-stdlib-manifest.py`. The manifest in
  `src/compiler/stdlib_manifest.coil` lists which modules are the library's; in-repo
  a missing entry still resolves through the namespace scan, so nothing fails locally
  and the namespace ships unreachable. `gate-cli` checks it, and the build exports
  `COIL_STRICT_BUNDLE=1` so the in-repo fallback is a hard error instead of a silent
  success.
- `src/examples/*.coil` — one idea each (`sums`, `hashmap`, `references`, `lisp`, …).
- Dialects (Scheme, Brainfuck), applications (clox, CHIP-8, Space Invaders, Wasm),
  and research transforms (GC dialects, httptap) live in the separate
  **coil-experiments** repository, not here. Anything that is a program written
  *in* Coil rather than part of the language belongs there — keeping them out is
  what stops them from being mistaken for the API surface. `src/examples/*.coil`
  is the exception: those are feature demos the language guide points at.
- `src/compiler/*.coil` — the compiler itself (`reader.coil` = lexer/parser).

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
