# The Linux x86-64 port

Coil self-hosts on Linux x86-64. From a clean checkout on an Ubuntu-ish box with
LLVM 21 (apt.llvm.org) and a C compiler:

    python3 scripts/dev.py build linux          # seed -> stage1 -> stage2 -> stage3
                                           # fixpoint, installs build/bin/coil

`build/bin/coil` and `build/bin/coil-nollvm` are ignored build outputs. The Linux
compiler installs under ignored `build/bin/`, and its seed is
`bootstrap/seeds/native/coil-seed-linux-x86_64` (ELF, dynamic libLLVM 21). If it is
missing, stale, or unusable with the installed libLLVM, bootstrap selection
automatically translates the portable seed in `bootstrap/seeds/wasm/coilc.wasm`
to a host executable. `COIL_FORCE_WASM_STAGE0=1` exercises that recovery path.

## How the port went in (July 2026)

One-shot IR cross-emission from macOS (`--target x86_64-unknown-linux-gnu`, the
driver's existing cross support + one `musttail` fix), linked on the Linux box, then
self-hosted natively and all remaining issues fixed in `.coil` source on Linux. The
port surface was small because the LLVM backend was already triple-parametric
(`arch 0 = x86_64` predates this) and x86_64-linux shares the SysV ABI with the
x86_64-apple lowering that already existed.

What changed in the compiler (all host-guarded; macOS emission byte-unchanged
except where noted):

- **`metaengine.coil`** — Darwin GCD semaphores (`dispatch_semaphore_*`) replaced by
  a portable pthread mutex+condvar counting semaphore (`me-sem-*`); this one is a
  behavior-neutral swap on macOS too. Host probe `me-host-linux?`
  (`access("/proc/self/maps")`) picks the dylib link line: `cc -shared` + `.so` on
  ELF vs `cc -dynamiclib` + `.dylib` + `-Wl,-undefined,dynamic_lookup` on Mach-O.
- **`comptime_eval.coil`** — same host-aware link line for compiled-comptime dylibs.
- **`jit.coil`** — `sys_icache_invalidate` is now `dlsym`'d at runtime (found on
  Darwin, absent-and-unneeded on x86 ELF) so the ELF link has no Darwin extern. The
  MObj JIT itself emits arm64 and never runs on this host (see gaps).
- **`main.coil`** — the in-memory MObj comptime fast path is registered only when
  the HOST is arm64 (`host-arm64?`); on Linux, comptime sites the interpreter can't
  fold take `comptime_eval`'s dylib route (`cc -shared` + `dlopen`), which handles
  aggregate, sum and string readbacks (`tests/corpus/comptime.coil`).
- **`driver.coil`** — `run`/`test` prepend `exec` to the `system()` command so a
  signal death reaches `wait-report` unmasked on shells that fork (Linux dash);
  `-arch` (a Mach-O toolchain flag) is not passed on ELF hosts; `dsymutil` is
  skipped on ELF (DWARF lives in the executable).
- **`codegen.coil`** — **real x86-64 bug fix**: the SysV classifier's `abi-flatten`
  re-derived field offsets by natural alignment, mis-placing every field of a
  `:layout (layout/Packed)`/`:layout (layout/Explicit)` struct (packed `{u8 i64}` put `b` at offset 8
  in a 9-byte struct and aborted the build). Flattening now walks the struct's REAL
  layout (`abi-flatten-cs`: `LLVMOffsetOfElement` for LC/packed bodies, declared
  `:at` offsets for explicit ones). Invisible on arm64 (AAPCS64 never flattens
  int-field structs); on x86 it unblocked by-value packed/explicit structs entirely.

## Verification on Linux

`rebootstrap-linux.sh` proves the fixpoint and runs no tests. The tests that run on
Linux:

- COMPREHENSIVE's `x64/host` step (`scripts/tests/x64-host.py`, run from a Mac over
  ssh) bootstraps on the Linux host, runs the runtime corpus on the LLVM backend
  (`python3 scripts/oracle.py corpus llvm`), then self-hosts through the x64 backend
  and runs its gates (see `X64_BACKEND.md`).
- CI's `linux` job builds with `dev.py build linux` and runs the SIMD slice of
  COMPREHENSIVE.
- `python3 scripts/dev.py test fast --compiler build/bin/coil` runs on Linux too;
  its arm64-only and Mach-O-only checks (the arm64 lanes, `-g` with dsymutil and
  lldb, Mach-O cross-links) are macOS-host checks.

## Known gaps (by design or deferred)

- `--backend arm64`, the nollvm build (`main_a64`, Mach-O writer), and the MObj
  in-memory JIT are macOS/arm64-only. `emit-obj --backend arm64` still works on
  Linux (codegen is host-independent); you just can't run the result here.
- Cross-LINKING from Linux (e.g. `--target` an Apple triple) is not orchestrated by
  the driver (no `-arch` on ELF; you'd need a cross toolchain).
- `-g` on Linux: DWARF is emitted into the object/executable but the lldb/dsymutil
  packaging checks are Darwin-only; Linux debugger UX is unverified.
- Forced LLVM tail calls require scalar-only signatures. Recursive calls carrying
  aggregate values, pointers, or references remain ordinary calls to preserve
  borrowed stack temporaries; their stack use depends on LLVM optimization.

- The link-diagnostic goldens (`tests/diag/link`) record macOS linker wording and
  the arm64-register diagnostic, so `oracle.py diag gate link` is a macOS check.
