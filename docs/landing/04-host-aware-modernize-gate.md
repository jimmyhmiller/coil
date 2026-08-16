# Porting dossier: host-aware bounded modernization gate

## Goal

Make `python3 scripts/dev.py test modernize-fast --compiler <candidate>` select a
backend the current host can link and execute.

The gate historically forced `--backend arm64` for several runtime fixtures.
That is appropriate only on Apple Silicon. On Linux/x86-64 it produces an object
for a different platform and then asks the host linker to build and execute it,
creating a gate failure unrelated to modernization.

## Branch provenance

- `89242d4` — one-file change in `scripts/dev.py`.

## Intended behavior

```python
backend_flags = (
    ("--backend", "arm64")
    if sys.platform == "darwin" and platform.machine() == "arm64"
    else ()
)
```

Runtime fixtures that specifically benefit from exercising the native arm64
backend receive `*backend_flags`. Other hosts omit the override and use the
candidate compiler's ordinary backend.

This is not generic cross-compilation support. The gate's purpose is to execute
its outputs on the host, so it must choose a host-runnable backend.

## Affected fixtures

Audit every explicit `--backend arm64` in `test_modernize_fast`, including:

- integer width operations;
- ambient core operations;
- qualified re-exports;
- control/process facade examples;
- hosted system tests;
- static-assert/bitfield examples.

Compile-only tests may intentionally target another backend, but build-and-run
helpers may not do so without an emulator. Keep that distinction explicit.

## Extraction strategy

1. Port the `platform` import and one `backend_flags` calculation.
2. Replace only forced arm64 arguments in host-executed tasks.
3. Do not copy unrelated changes from later versions of `scripts/dev.py`.
4. Run the gate on the extraction host and inspect that it remains under the
   documented 30-second bound.

## Known gaps and questions

- Normalize `platform.machine()` values if CI reports variants such as `aarch64`.
  The current branch deliberately recognizes the known Darwin value only.
- On Darwin/x86-64, default LLVM output should remain host-runnable.
- If the native x86 backend becomes a desired part of this gate, add it as a
  separate explicit backend test rather than changing the fallback silently.
- Do not hide genuine backend failures by broadly removing backend coverage; this
  change only fixes host selection for tests whose asserted behavior is not
  backend-specific.

## Acceptance

- The bounded gate passes on Linux/x86-64 using the supplied compiler.
- Apple Silicon still exercises `--backend arm64` for the selected fixtures.
- No build-and-run task attempts to execute a foreign object.
- The gate remains below 30 seconds.
- A focused unit test or logged command construction makes backend selection
  inspectable without requiring every supported CI host locally.

