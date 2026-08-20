# web — the Coil compiler, running in a browser tab

The compiler is self-hosted and already builds to a single static WebAssembly module
(`src/compiler/main_wasm.coil`, comptime via the in-process bytecode interpreter, no
side-modules and no host callbacks beyond libc). This directory serves that module to
a page and gives it enough of a POSIX environment to do its job. Source goes in,
diagnostics and a runnable wasm module come out; nothing reaches a server.

```
python3 web/build.py          # stage web/dist/ (also writes .br/.gz)
python3 web/serve.py          # http://127.0.0.1:8000/
node web/selftest.mjs         # gate: the host logic, under Node
node web/browsertest.mjs      # gate: the real thing, in headless Chrome
```

## What it costs

`build.py` prints this; as of the current seed:

| | raw | gzip | brotli |
|---|---|---|---|
| `coilc.wasm` | 3.21 MiB | 986 KiB | **628 KiB** |
| `coil-fs.bin` (84 Coil sources) | 1.51 MiB | 305 KiB | **235 KiB** |
| page + host JS | 35 KiB | 12 KiB | **11 KiB** |
| | | | **874 KiB** |

For comparison, roc-lang.org's in-browser compiler is 6.9 MB raw / 2.32 MB brotli.

Serve the precompressed files — that is what `serve.py` does and what any static host
should be configured to do. Compressing 3.4 MB per request is the difference between a
fast first load and a slow one.

## How it fits together

`coil-worker.js` is a browser port of `src/tooling/wasm-host/run-coil-wasm.mjs`: the
same 64 `env.*` imports and the same reclaiming allocator (a plain bump allocator
leaks catastrophically — the interpreter mallocs a 1 MiB frame per `vm-exec` and frees
it on return). Node's `fs` becomes `vfs.js`; node's streams become captured output.

The module is **compiled once and instantiated per run**. `main` ends by calling
`exit()`, having dirtied the module's static data and heap, so a reused instance would
compile the next program against the last one's debris.

`vfs.js` mirrors an installed toolchain exactly, because that is what stdlib discovery
walks (`scripts/dev.py::install_library`):

```
/coil/bin/coil            argv[0] — never read, only realpath'd
/coil/lib/coil/prelude.coil
/coil/lib/coil/stdlib/*.coil
/work/main.coil           the user's source; emitted files land here too
```

Two things about that filesystem are load-bearing and easy to get wrong:

- **`open(dir, O_RDONLY)` must succeed.** `loader.coil`'s `path-readable?` probes for
  `lib/coil/stdlib` by opening it, so a file-only VFS makes the compiler report that
  it cannot find its own standard library.
- **`access(2)` must answer for directories too**, for the same walk.

## `env.system`

`loader.coil` builds its namespace index by shelling out to `find` and reading the
listing. There is no shell in a tab, so the worker emulates *that one command* against
the VFS and throws on anything else rather than returning a success status it did not
earn. `COIL_NAMESPACE_ROOTS` is pinned to `/work`, so the index covers the user's file
and nothing else.

Everything else behind Wall 1 — `mmap`, `mprotect`, `dlopen`, `dlsym`,
`pthread_create` — stays a loud trap. `check` and `interp` never reach them.

## The two ways to run a program

- **Run** → `coil interp`. The compiler's own bytecode VM executes the mono'd program.
  Target-independent and handles the whole language; this is the general path.
- **Compile to wasm** → `coil build --backend wasm`. The LLVM-free native wasm backend
  emits a final module with no imports, which the page instantiates and calls. Faster
  and gives the user a downloadable artifact, but `codegen_wasm.coil` still has 14
  unimplemented cases — floats, C string literals, trait objects, bit-structs,
  `static-ref` — so it only covers a subset today.

## Limits

- **memory64.** The compiler and its output are wasm64, which needs Chrome 133+ or
  Firefox 134+. **Safari has no memory64 support at all**, so it cannot run this. The
  page detects that and says so instead of failing obscurely. A wasm32 build is the fix;
  it needs a handful of `ssize_t`/`size_t` declarations that are currently hardcoded
  as `i64`, and a wasm32 variant of the host (pointers become Numbers, not BigInts).
- **No native linking.** `coil build` to a native executable calls out to `cc`; that
  is not something a tab can do, and `system` refuses it loudly.
- The whole stdlib ships eagerly. A hello-world only reads about 17 of the 84 files,
  but `read(2)` is synchronous from wasm's side, so they cannot be fetched on demand.
