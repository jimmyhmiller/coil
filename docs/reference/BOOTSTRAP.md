# Bootstrapping Coil

The Coil compiler is self-hosted (`src/compiler/*.coil`) and bootstraps from committed
seeds, so a fresh checkout rebuilds a fully verified compiler with nothing but a C
compiler (and, for the LLVM backend, libLLVM) — in three flavors:

| Path | Command | Needs | Compiler it builds |
|------|---------|-------|--------------------|
| **LLVM-free** | `python3 scripts/dev.py build nollvm` | just `cc` | Native backend for the host |
| Full | `python3 scripts/dev.py build full` | `cc` + LLVM 21 | LLVM + native backends |

Both commands select the host implementation automatically: macOS/ARM64 uses the
Mach-O bootstrap and Linux/x86-64 uses the ELF bootstrap. The explicit `linux` and
`nollvm-linux` variants remain available for automation but are not required for
ordinary use.

Stage zero is selected in one order everywhere: an explicit `STAGE0`, the matching
committed native seed, a compatible installed `coil`, then the portable WASM seed
translated with `wasm2c` and the host C compiler. Native compilers are the fast
path; WASM is the portable recovery path when none is available or new enough to
compile the checkout. Set `COIL_FORCE_WASM_STAGE0=1` to exercise that fallback
deliberately.

## Fast inner loop

Do not use a full rebootstrap to diagnose ordinary compiler-source or core-operation
changes. Build one candidate after editing compiler sources, then run the bounded
gate against that candidate as often as needed:

```sh
python3 scripts/dev.py build candidate --output /tmp/coil-candidate
python3 scripts/dev.py test modernize-fast --compiler /tmp/coil-candidate
```

The candidate command stages the active compiler against this checkout's compiler
modules, performs one build, and obtains the platform's LLVM link line from
`scripts/compiler/llvm-link-flags.sh`. It does not run a fixpoint or install
anything.

It tests clean comparisons at every integer width and in `static-assert`, then verifies
qualified/transitive namespace re-exports, the `coil.process` facade, and the
legacy-operation autofixer and its idempotence. The gate reports elapsed time for
visibility but does not fail based on wall-clock duration.

Run `python3 scripts/dev.py build full` once, after the fast gate is green. The full
gate remains authoritative for fixpoint reproduction, snapshots, the behavioral and
CLI corpora, metaprogram-engine parity, and WebAssembly.

## LLVM-free: zero external dependencies

```sh
python3 scripts/dev.py build nollvm   # builds + verifies + installs build/bin/coil-nollvm
```

Uses the committed seed `bootstrap/seeds/native/coil-seed-nollvm` (a ~2.1 MB self-host
compiler that links **only libSystem** — no libLLVM). The whole toolchain a fresh
machine needs is a C compiler. The produced compiler is built from
`src/compiler/main_a64.coil`, which omits the LLVM backend: it compiles programs via
the native **arm64** backend (`build --backend arm64`, the default for this binary)
and emits Mach-O objects directly. Commands that require the LLVM backend
(`emit-ir`, `dump-ir`, `__normalize` — textual LLVM IR) fail loudly with a clear
diagnostic instead of doing nothing.

## Full: LLVM + arm64 backends

```sh
python3 scripts/dev.py build full          # verifies, then installs locally and globally
```

On macOS this prefers `bootstrap/seeds/native/coil-seed`; on Linux it prefers
`bootstrap/seeds/native/coil-seed-linux-x86_64`. This is the complete compiler
(both backends, plus `emit-ir`/`dump-ir`), so its binary links `libLLVM` even when
the arm64 backend does the codegen — the compiler *embeds* an LLVM backend
(`codegen.coil` FFIs into the LLVM-C API). **Requirements:** `libLLVM.dylib`
(`brew install llvm`) + `cc`. Force a specific stage0 with `STAGE0=/path/to/coil`.
After every gate succeeds, the bootstrap installs the same verified artifact at
`build/bin/coil` and as the user-level `coil` command. It updates an existing
user-owned `coil` on `PATH` (for example `~/.cargo/bin/coil`), otherwise it uses
`~/.local/bin/coil`. A failed bootstrap does not update either destination.

## Install globally

To reinstall an existing compiler artifact without rerunning the full bootstrap,
install `build/bin/coil` as the user-level `coil` command with:

```sh
python3 scripts/dev.py install
```

The command updates the existing user-level `coil` found on `PATH` (such as
`~/.cargo/bin/coil`), or installs to `~/.local/bin/coil`. Use `--dest PATH` for an
explicit location. Installation is intentionally fast and does not rerun the
bootstrap gates; use `python3 scripts/dev.py install --build` when rebuilding and
verification are part of the requested operation.

## How the two builds share one codebase

The CLI dispatch and the whole compile pipeline live in the backend-agnostic
`src/compiler/driver.coil`, which never imports the LLVM backend. The two LLVM entry
points (`build` via LLVM, `emit-ir`) and `__normalize` are injected into
`driver-main` as **function pointers**. The two top files differ only in what they
inject:

- `src/compiler/main.coil` imports `codegen.coil`/`normalize.coil` and injects the
  real LLVM entry points → full compiler, links libLLVM.
- `src/compiler/main_a64.coil` imports neither and injects hard-error stubs → no
  reference to any LLVM symbol → links no libLLVM.

There is no code duplication between them, and the gate-full corpus includes both
top files so the snapshot oracle keeps them from drifting apart.

## The seeds

The repository carries optimized native seeds for both supported hosts plus one
portable fallback:

- `bootstrap/seeds/native/coil-seed` — full (LLVM + arm64), ~2.4 MB, links libLLVM.
  Provenance in `bootstrap/seeds/native/SEED_VERSION`.
- `bootstrap/seeds/native/coil-seed-nollvm` — LLVM-free (arm64 only), ~2.1 MB, links only
  libSystem. Provenance in `bootstrap/seeds/native/SEED_VERSION_NOLLVM`.
- `bootstrap/seeds/native/coil-seed-linux-x86_64` — full Linux/x86-64 compiler.
- `bootstrap/seeds/native/coil-seed-nollvm-linux-x86_64` — LLVM-free Linux/x86-64 compiler.
- `bootstrap/seeds/wasm/coilc.wasm` — portable wasm64 compiler containing both native
  object backends. It is translated to a host executable only when the matching
  native seed cannot be used. Provenance is in `bootstrap/seeds/wasm/SEED_VERSION`.

Neither seed is **trusted blindly.** Each rebootstrap re-derives the compiler from
source on every run and proves the result faithful independently, so a stale or
tampered seed cannot slip through:

1. **Fixpoint** — `stage0 → stage1 → stage2 → stage3`, then `stage2.o` must be
   byte-identical to `stage3.o`. The native arm64 backend is fully deterministic, so
   a faithful compiler reproduces its own object exactly. (stage1 is lowered by
   stage0's default backend; stage2/stage3 use `--backend arm64`. Only the
   stage2==stage3 fixpoint is required.)
2. **Gates** — the LLVM-free path runs `python3 scripts/oracle.py runtime gate arm64` (built programs
   produce identical stdout + exit code vs the LLVM reference) and asserts the binary
   links no libLLVM; the full path additionally runs `python3 scripts/oracle.py gate full` (emitted
   IR byte-exact vs the reference snapshot across the corpus). The LLVM-free build has
   no `emit-ir`, so gate-full does not apply to it.

This is the standard trusting-trust mitigation: the binary blob is validated against
source on every use, and you can always re-anchor to a different stage0 with
`STAGE0=/path/to/coil python3 scripts/dev.py build nollvm` (or the `full` variant).

## Refreshing the seeds

When you change `src/compiler` in a way that touches the language the **compiler
itself** is written in (new syntax/semantics the current seed can't parse), the old
seed may no longer compile the new source. Refresh it in the same commit:

```sh
scripts/compiler/refresh-seed.sh              # refresh BOTH seeds (rebuild + verify each)
# or: scripts/compiler/refresh-seed.sh nollvm   /   scripts/compiler/refresh-seed.sh full
git add bootstrap/seeds/native/ && git commit -m 'refresh self-host seeds'
```

`refresh-seed.sh` refuses to update a seed unless its fixpoint + gates pass, so a
broken seed can never be committed.

If a native seed predates a language or standard-library change, selection now falls
back to the WASM seed instead of stranding the bootstrap. Language changes must still
refresh the native seeds and the WASM seed together so ordinary builds retain the fast
path and the portable recovery path remains current.

```sh
build/bin/coil build src/compiler/main_a64.coil -o /tmp/nl --backend arm64
STAGE0=/tmp/nl ./scripts/compiler/refresh-seed.sh nollvm    # re-verifies, then updates the seed
python3 scripts/dev.py build nollvm                      # confirm it self-sustains with no override
```

The rebootstrap commands create ignored binaries under `build/bin/`. Before the
first rebuild, invoke a committed seed under `bootstrap/seeds/native/` directly.

The committed artifact is the arm64 fixpoint stage2, not the bridged stage1, so the
bridge washes out (the arm64 backend is deterministic). Whenever you change the
language the compiler itself is written in, run `refresh-seed.sh` for **both** seeds.

## Relationship to the other bootstrap scripts

- `python3 scripts/dev.py build full` — full LLVM + arm64 fixpoints and all compiler gates.
- `python3 scripts/dev.py build nollvm` — LLVM-free native arm64 fixpoint and runtime gates.
