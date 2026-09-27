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

## Before you build: two things that bite on a fresh box

**Use a clang that matches your libLLVM.** The IR contains `captures(none)`, which
older clang front ends do not parse. Rather than editing the artifact, link with the
clang beside the libLLVM you are linking against (`/usr/lib/llvm-21/bin/clang` on a
Debian-ish box), which keeps parser and library on one version. A
`-Woverride-module` warning on the `-c` step is expected and harmless.

**Run `scripts/native/build-curl.sh` first.** stage1 otherwise stops with
`http_client.coil needs Coil's bundled libcurl`. It builds `libcurl.a` + mbedtls into
`build/bin/native/curl/<arch>/`. The error names its own fix, but it lands between
"no stage0" and "build linux", which is exactly the stretch this file is walking you
through.

## Provenance

Regenerate with `scripts/compiler/emit-linux-ir.sh` from a clean, committed tree.
It builds a compiler linked against the Linux CI's LLVM major (LLVM 21, via
`LLVM_CONFIG`; Homebrew's `llvm@21` on macOS), emits
`coil emit-ir src/compiler/main.coil --target x86_64-unknown-linux-gnu` with it,
and refuses to write the artifact unless that same LLVM's `llvm-as` parses the text
and its clang compiles it for x86_64-linux. The printing LLVM must match the parsing
one: an IR written by LLVM 22 carries `nocreateundeforpoison` on intrinsic
declarations, which LLVM 21 rejects as an "unterminated attribute group", and that is
exactly how the Linux CI job's IR fallback broke after the seeds went stale.

Current artifact: emitted at commit `8d003d7` (2026-09-27) by a compiler built from
that commit and linked against LLVM 21.1.8; parsed by LLVM 21 `llvm-as` and compiled
by LLVM 21 clang for x86_64-unknown-linux-gnu. It has not been linked and run on a
Linux host from this machine; the Linux CI job does that when its ELF seeds are stale.

## Rebuilding a stage0 from this IR

```sh
xz -dk coil-linux.ll.xz
# LLVM 20's parser: first  sed -i 's/captures(none)/nocapture/g' coil-linux.ll
clang -c coil-linux.ll -o coil.o
clang coil.o -o coil-stage0 \
    -L"$(llvm-config --libdir)" -Wl,-rpath,"$(llvm-config --libdir)" -lLLVM \
    build/bin/native/curl/x86_64-linux/libcurl.a \
    build/bin/native/curl/x86_64-linux/libmbedtls.a \
    build/bin/native/curl/x86_64-linux/libmbedx509.a \
    build/bin/native/curl/x86_64-linux/libmbedcrypto.a \
    -lz -lstdc++ -lm -lpthread -ldl

# smoke-test the toolchain before the big one:
xz -dk fib-linux.ll.xz && clang -c fib-linux.ll -o fib.o && clang fib.o -o fib
./fib; echo "exit=$? (expect 55)"

# then: STAGE0=build/bin/coil-stage0 python3 scripts/dev.py build linux
```

The `captures(none)` token (twice, on the `llvm.memcpy` declaration) is the LLVM-21
spelling; pre-21 parsers want `nocapture`. The sed is semantically inert.

## External link surface

libLLVM (C API), bundled libcurl/mbedTLS, and libc/libm/libpthread/libdl. **No Darwin symbols** — the historical
`dispatch_semaphore_*` (now pthread mutex+condvar in `metaengine.coil`) and
`sys_icache_invalidate` (now resolved via `dlsym` at runtime in `jit.coil`, null and
skipped on ELF hosts) are gone from the link surface.

Re-checked on this emission: 330 unique `declare`s, including 214 LLVM C-API symbols.
The non-LLVM surface is bundled curl plus libc/libm/pthread/dl — `_exit abort access
atexit atoi calloc ceil ceilf chdir clock_gettime close
closedir creat dlerror dlopen dlsym dprintf dup2 execvp exit fabs fclose fcntl floor
floorf fma fmaf fmod fmodf fopen fork free fwrite getcwd getenv getpid getppid isatty
kill malloc memchr memcmp memcpy memmove memset mkdir mkdtemp mkstemp mmap mprotect
munmap nanosleep open opendir pipe poll posix_memalign posix_spawnp pow printf pthread_*
putchar puts read readdir realloc realpath remove rename rmdir setenv setpgid snprintf
sqrt sqrtf strcmp strlen strtod strtol system trunc truncf unlink unsetenv waitpid write`,
plus the `curl_easy_*`, `curl_multi_*`, and `curl_slist_*` API used by `coil update`.
Worth re-running that scan after any
cross-emission, since a Darwin-only extern creeping back in is invisible on the emitting
host and only shows up as a link failure on the target.
