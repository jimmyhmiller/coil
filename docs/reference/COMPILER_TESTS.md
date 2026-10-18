# Testing the Coil compiler

Coil's own tests come in two tiers. Both run their steps one after another and
report each step's time and memory. Neither ever fails a step: they are there to
show where the tiers stand, so the steps can be adjusted.

| Tier | Command | When | Target |
|---|---|---|---|
| FAST | `python3 scripts/dev.py test fast --compiler <coil>` | before every push | 5 minutes serial |
| quick | `python3 scripts/dev.py test fast --compiler <coil> --quick` | while iterating | 60 s |
| COMPREHENSIVE | `python3 scripts/dev.py test comprehensive` | before a release or a risky merge | about 25 min, plus the x64 host |

The tiers test end-to-end behaviour a user can see: programs that run, packages
that build, diagnostics a user reads, commands and their exit codes. They do not
pin internal representations, and they do not grow a test per fixed bug. When a
fix needs a test, extend the end-to-end program or golden file that covers that
area; when it needs a new kind of check, add a step.

## The loop

```sh
python3 scripts/dev.py build candidate                  # build/bin/coil-candidate, once per compiler edit
python3 scripts/dev.py test fast --compiler build/bin/coil-candidate --quick   # while iterating
python3 scripts/dev.py test fast --compiler build/bin/coil-candidate           # before pushing
python3 scripts/dev.py test comprehensive               # before a release: builds, installs privately, runs all
python3 scripts/dev.py build full                       # the release: fixpoint, then install
```

Neither `build full` nor `test comprehensive` belongs in the inner loop. A change
to the standard library alone needs no candidate: a compiler under this checkout
reads `src/stdlib` live.

Options after the tier go to its harness:

| Option | Meaning |
|---|---|
| `--list` | print the steps |
| `--only NAME` | run the step NAME, or every step under `NAME/` (repeatable) |
| `--verbose` | print each step's output, not only a failing step's |
| `--no-x64` | COMPREHENSIVE only: leave out the x86-64 Linux host |

## How a step is judged

`scripts/tests/harness.py` runs each step as a process group and prints one line:

```text
ok   #12 diag/compile                  4.1s  peak 0.41GB  cum   88.3s
```

A step fails when:

- it exits non-zero, or is killed as hung: after 10 minutes in FAST, an hour in
  COMPREHENSIVE;
- in FAST, it names or starts a whole-compiler build (`src/compiler/main*.coil`,
  `jit_api.coil`, `allns`, `dev.py build`/`install`). FAST refuses such a step
  before running anything and kills a process that tries one.

Time and memory are measured, never judged: on a shared machine both are noise
to a pass/fail gate. `peak` is the step's largest process, from polling and from
the reaped children's `ru_maxrss`; a step whose largest process passes the tier's
memory line (1.5 GB in FAST, 6 GB in COMPREHENSIVE, 16 GB for the steps that
compile the whole compiler) gets a warning. At the end the tier reports its ten
slowest steps, its ten largest, and its serial total, with a warning when the
total passes the tier's target. Those are the numbers to read when a step needs
splitting, trimming or moving to the other tier.

Every step gets `$COIL`, the compiler under test, with `coil` first on `PATH`
as a symlink to it (a nested `coil`, or a coil.jit session, resolves the same
toolchain), and `$COIL_TEST_SCRATCH`, a directory the harness removes afterwards.

## FAST

| Steps | What they run | Where |
|---|---|---|
| `examples/*` | the ten example packages: build, run six on their data, `coil test` each, arm64 tests for two, huffman under `coil.safety`, `fmt --check` | `scripts/tests/fast/examples.py`, `examples/` |
| `corpus/*` | eight self-checking programs on arm64, LLVM and the interpreter, two under `coil.safety`, three with the interpreted metaprogram engine | `scripts/oracle.py corpus`, `tests/corpus/` |
| `diag/*` | compile errors (many per file), link errors, compiles that must stop and say so, byte-exact | `scripts/oracle.py diag`, `tests/diag/` |
| `cli/*` | the command-line contract, one step per area | `scripts/tests/fast/cli.sh`, `tests/cli/` |
| `projects` | one package using every `Coil.toml` feature, a workspace, a hermetic profile, prebuilt units | `scripts/tests/fast/projects.sh`, `tests/projects/` |
| `c-abi` | aggregates across the C ABI both ways, five build configurations, extern aliases | `scripts/tests/c-abi.py`, `tests/cabi/` |
| `wasm` | wasm32 and wasm64 programs under node, validated | `scripts/tests/fast/wasm.py`, `tests/wasm/` |
| `memory/*` | generated units and the namespace index stay within their memory bounds | `scripts/tests/generated-unit-memory.py`, `project-scan-memory.py` |
| `readers` | reader-provider projects and provider artifacts | `scripts/tests/fast/readers.sh`, `tests/readers/` |
| `meta` | code->code programs, hygiene both ways, lint suggestions, staged entries, transforms | `scripts/tests/fast/meta.sh`, `tests/meta/` |
| `simd` | the SIMD differential on both backends and the vectorized codegen check | `scripts/tests/simd.py fast`, `tests/simd/` |
| `stdlib/*` | six deftest suites over the standard library | `tests/stdlib/` |

The quick tier is the corpus on arm64 and LLVM, the compile diagnostics and the
compiles that must stop, `coil run` and `coil fmt`, the tests of two example
packages, the C ABI and one wasm program.

### The corpus

`tests/corpus/corpus.txt` lists the programs and their lanes. Each program prints
a line per section and returns its count of failed checks, so exit 0 means every
check held. Its reference is `tests/corpus/reference/<name>.{stdout,exit}`:

```sh
python3 scripts/oracle.py corpus arm64 --compiler <coil> [--only types_traits]
python3 scripts/oracle.py corpus bless --compiler <coil> [--only types_traits]
```

`bless` writes a reference from the LLVM build only after checking that the
arm64 build agrees with it. The lanes are `arm64`, `llvm`, `x64`, `interp`,
`safety`, `meta-interp` and `opt3`; `--all` puts every program in the `safety`
and `meta-interp` lanes. The `meta-interp` lane always includes the programs
marked `meta-interp-refused=`: only the interpreted engine refuses them, so the
refusal proves `COIL_META_INTERP=1` selected it and the lane is not silently
running the native engine. The LLVM-free and x64 bootstraps run the corpus on
their own backend.

### Diagnostics

`tests/diag/{compile,link,no-hang}/*.coil` each have a golden in `reference/`
holding the normalized output and then `exit: N`. `compile` and `no-hang` run
`coil check`; `link` runs `coil build -o …`. A first line `; args: …` replaces
the default arguments.

```sh
python3 scripts/oracle.py diag gate all --compiler <coil>
python3 scripts/oracle.py diag bless compile --compiler <coil>   # then read every changed golden
```

## COMPREHENSIVE

Without `--compiler` it runs `dev.py build full --no-install`, installs that
compiler into a private prefix (which warms its coil.jit unit), and runs every
step against that one install. Your installed `coil` is not touched. Run it when
nothing else heavy is running: the build steps peak near 10 GB.

| Step | What it checks |
|---|---|
| `build/full`, `build/install` | the self-host fixpoint, and an install that warms the coil.jit unit |
| `fast` | all of FAST, against the installed compiler |
| `compile-errors` | `coil.test.compile` suites (they link the in-process compiler) |
| `installed/*` | the prefix layout and PATH resolution, every stdlib namespace from the install, the coil.jit SDK in a user program, the REPL |
| `jit/*`, `generated/modules`, `memory/*` | coil.jit sessions, generated units, and their memory bounds at full size |
| `extern-prototypes`, `aggregates`, `memory/self-build` | whole-compiler checks: C prototypes, no first-class aggregates over 64 bytes in IR, self-build expansion memory |
| `wasm/self-host`, `bootstrap-imports`, `install-pairing` | the wasm-hosted compiler, the wasm32 bootstrap runtime, install pairing |
| `corpus/*-all`, `corpus/opt3` | every corpus program under `coil.safety`, `-O3` and the interpreted engine |
| `guide-demos` | every `src/examples` demo builds and exits as `tests/demos.txt` says |
| `regex-reference`, `prop`, `fuzz`, `simd` | breadth: regex conformance, property tests, the fuzz engine, SIMD in full |
| `freestanding` | every `src/examples/freestanding` program links bare-metal (aarch64, riscv32, ESP32-C3) with `ld.lld --gc-sections` and no undefined symbols, then boots under QEMU; needs `brew install lld qemu` |
| `x64/host` | on the x86-64 Linux host over ssh: the Linux bootstrap, the corpus, the x64 backend's fixpoint and gates |

The x64 step uses `COIL_X64_HOST` (default `computer.jimmyhmiller.com`). That
host may be unreachable; the step then fails and says so, rather than passing
having run nothing. `--no-x64` leaves it out deliberately.

With `--compiler`, nothing is built. The JIT steps need an installed compiler
whose prefix holds the warmed unit; `dev.py install --source build/bin/coil
--dest <dir>/bin/coil` makes one.

## CI

The `full` job builds the compiler with `build full`, then runs FAST against it
and two COMPREHENSIVE slices with `--only`: the
JIT and generated units (after a private install), and SIMD. The
`linux` job runs the SIMD slice; the `llvm-free` job's bootstrap runs the corpus
on arm64. The rest of COMPREHENSIVE runs locally.

## Manual tools

- `scripts/tests/pipeline-differential.py REFERENCE CANDIDATE` compares
  `dump-checked` and `dump-mono` over the compiler, the examples, the corpus,
  the diagnostic inputs and the stdlib suites. Use it when a change to expansion,
  resolution or checking must not change meaning; anything but `0 differ` is a
  behaviour change to explain.
- `scripts/tests/fuzz_targets.py` runs fuzz campaigns (`tests/fuzz`); they are
  local only.
