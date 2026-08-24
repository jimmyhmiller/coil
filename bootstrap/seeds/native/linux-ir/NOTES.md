# Linux x86-64 bootstrap IR

LLVM IR of the Coil self-hosted compiler (and two smoke-test programs) for
**x86_64-unknown-linux-gnu**. This is the version-mismatch **escape hatch** for the
Linux toolchain: the normal path is the committed ELF seed
(`bootstrap/seeds/native/coil-seed-linux-x86_64`) via `python3 scripts/dev.py build linux`; if that
seed's libLLVM (21) doesn't match your system, rebuild a stage0 from this IR against
whatever libLLVM you have (the C-API surface used — 149 `LLVMxxx` symbols, newest is
`LLVMArrayType2`, LLVM 17 — is stable across 20/21).

## Artifacts (xz-compressed textual IR)

| file | program | notes |
|------|---------|-------|
| `coil-linux.ll.xz` | the compiler (`src/compiler/main.coil`) | links with NO extra shims |
| `fib-linux.ll.xz`  | `src/examples/fib.coil` (exit code 55) | libc-only smoke test |
| `io-linux.ll.xz`   | `src/examples/io.coil` (prints `answer=42`) | strings + write(2) smoke test |

The two smoke tests are deliberately **not** refreshed alongside the compiler IR. They
are the control: they are known to link and run on a real Linux box, so if `fib` still
exits 55 and the compiler IR then fails, the toolchain is exonerated and the fault is in
the new IR. Refreshing all three together destroys that distinction — you would not be
able to tell a broken emission from a broken clang.

## Provenance

**This revision was cross-emitted from macOS (arm64) and has never been RUN.** It is an
UNVERIFIED stage0 in the only sense that matters — nothing on the emitting host can
execute an ELF binary — so treat it as a bootstrap of last resort, smoke-test the
toolchain first, and use it only to drive a real `rebootstrap-linux.sh` whose fixpoint
and gates are what actually vouch for the seed you commit.

    coil emit-ir src/compiler/main.coil \
        --target x86_64-unknown-linux-gnu > coil-linux.ll

Emitted at commit `62680c6` ("Give the linker child this process's environment") from a
clean tree, by a compiler built from that same source (3-stage self-host, LLVM fixpoint
stage2.o == stage3.o). Note that `emit-ir --help` does not advertise `--target`, but it
honours it — the help text is wrong, not the flag.

Unlike previous revisions this one was checked as far as macOS permits, which is
further than "emitted and hoped":

  - `llvm-as` parses it (24.9 MB of IR -> 6.5 MB bitcode, 8118 defines);
  - `llc -mtriple=x86_64-unknown-linux-gnu -filetype=obj` produces a real
    `ELF 64-bit LSB relocatable, x86-64` object, so codegen does not hit an
    unimplemented ABI path;
  - the undefined-symbol scan finds **176** distinct `LLVMxxx` C-API symbols, newest
    `LLVMArrayType2` / `LLVMConstArray2` (LLVM 17), so LLVM 20/21/22 all satisfy it.

What that does NOT establish is that the binary works. Only running it does, and only a
Linux host can. Emitted from `main` rather than a side branch this time: the `(_ …)`
catch-all syntax that motivated pinning `596c66f` has long since landed, so there is no
longer a reason to prefer an older revision.

Why this revision exists: the committed ELF seed `coil-seed-linux-x86_64` went
internally inconsistent — its own embedded stdlib calls
`coil.primitive.fresh-identifier`, which its compiler does not have, so it cannot
compile anything and no checkout-side change can fix it. The portable WASM seed is
stale too. That leaves no viable stage0 on a Linux box, which is exactly the
circularity these files exist to break.

An earlier revision of these files was emitted natively on Linux, after the port fixes
landed in `src/compiler` (portable pthread semaphores replacing Darwin GCD, dlsym'd
i-cache flush, host-aware dylib link lines, layout-aware SysV classification). The
revision before *that* was cross-emitted from macOS and needed a 4-symbol Darwin shim;
that is still unnecessary — the external symbol scan below was re-run on this emission
and found no Darwin-only extern. (History has the old NOTES if you need the original
cross-emission story, including the x86 `musttail` aggregate-return downgrade in
`codegen.coil::emit-tail`.)

## Rebuilding a stage0 from this IR

```sh
xz -dk coil-linux.ll.xz
# LLVM 20's parser: first  sed -i 's/captures(none)/nocapture/g' coil-linux.ll
clang -c coil-linux.ll -o coil.o
clang coil.o -o coil-stage0 \
    -L"$(llvm-config --libdir)" -Wl,-rpath,"$(llvm-config --libdir)" -lLLVM \
    -lstdc++ -lm -lpthread -ldl

# smoke-test the toolchain before the big one:
xz -dk fib-linux.ll.xz && clang -c fib-linux.ll -o fib.o && clang fib.o -o fib
./fib; echo "exit=$? (expect 55)"

# then: STAGE0=build/bin/coil-stage0 python3 scripts/dev.py build linux
```

The `captures(none)` token (twice, on the `llvm.memcpy` declaration) is the LLVM-21
spelling; pre-21 parsers want `nocapture`. The sed is semantically inert.

## External link surface

libLLVM (C API), libc/libm/libpthread/libdl. **No Darwin symbols** — the historical
`dispatch_semaphore_*` (now pthread mutex+condvar in `metaengine.coil`) and
`sys_icache_invalidate` (now resolved via `dlsym` at runtime in `jit.coil`, null and
skipped on ELF hosts) are gone from the link surface.

Re-checked on this emission: 229 `declare`s, of which the non-LLVM surface is exactly
libc/libm/pthread/dl — `_exit abort access atoi calloc ceil chdir clock_gettime close
closedir creat dlerror dlopen dlsym dprintf dup2 execvp exit fabs fclose fcntl floor
fmod fmodf fopen fork free fwrite getcwd getenv getpid getppid kill malloc memcmp memcpy
memmove memset mmap mprotect munmap nanosleep open opendir pipe pow printf pthread_*
putchar puts read realloc realpath rename setenv setpgid snprintf sqrt strcmp strlen
strtod strtol system unlink unsetenv waitpid write`. Worth re-running that scan after any
cross-emission, since a Darwin-only extern creeping back in is invisible on the emitting
host and only shows up as a link failure on the target.
