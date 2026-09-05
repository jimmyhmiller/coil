// coil-worker.js — the Coil compiler, running as wasm, in a Web Worker.
//
// A browser port of src/tooling/wasm-host/run-coil-wasm.mjs. Same 64 `env.*` imports,
// same reclaiming allocator; node's `fs` becomes the in-memory Vfs and node's streams
// become captured output. Everything runs off the main thread because a compile is
// synchronous from wasm's point of view and would otherwise freeze the page.
//
// The module is COMPILED ONCE and INSTANTIATED PER RUN. `main` ends by calling exit(),
// and it has mutated the module's static data and heap by then, so reusing an instance
// would compile the second program against the first one's debris. Instantiating from
// an already-compiled Module is cheap; recompiling 3.4 MB is not.

import { Vfs, unpack, normalize } from './vfs.js';

const PAGE = 65536;
const enc = new TextEncoder();
const dec = new TextDecoder();

const ROOT = '/coil/bin/coil';     // argv[0]: stdlib discovery walks up from here
const CWD = '/work';

class ExitSignal extends Error { constructor(code) { super('exit'); this.code = code; } }
class MetaHalt extends Error { constructor() { super('meta-halt'); } }

let compiledModule = null;
let baseFiles = null;

// ---------------------------------------------------------------------------

class Run {
  constructor(vfs) {
    this.vfs = vfs;
    this.instance = null;
    this.exports = null;
    this.heap = 0n;
    this.freeBins = new Map();
    this.errnoPtr = 0n;
    this.out = [];                 // [stream, bytes] in emission order
    this.env = { COIL_NAMESPACE_ROOTS: CWD };
    this.envPtrs = new Map();
  }

  mem() { return this.exports.memory; }
  u8() { return new Uint8Array(this.mem().buffer); }
  dv() { return new DataView(this.mem().buffer); }

  // ---- allocator ----------------------------------------------------------
  // A plain bump allocator leaks catastrophically: the bytecode interpreter mallocs a
  // 1 MiB frame per vm-exec and frees it on return, so thousands of macro expansions
  // exhaust memory if free() is a no-op. Bin by 16-byte-rounded size so those
  // fixed-size frames get reused and memory tracks the live set, not the churn.
  alignUp(v, a) { return (v + (a - 1n)) & ~(a - 1n); }

  ensure(end) {
    const have = BigInt(this.mem().buffer.byteLength);
    if (end <= have) return;
    const need = (end - have + BigInt(PAGE) - 1n) / BigInt(PAGE);
    this.mem().grow(need);         // memory64: grow takes a BigInt page count
  }

  malloc(size) {
    size = BigInt(size);
    if (size <= 0n) size = 1n;
    size = this.alignUp(size, 16n);
    const bin = this.freeBins.get(size.toString());
    if (bin && bin.length) {
      const p = bin.pop();
      this.dv().setBigUint64(Number(p - 8n), size, true);
      return p;
    }
    // Size header sits immediately before the aligned user pointer; a JS Map entry per
    // allocation blows V8's limit when compiling anything substantial.
    const p = this.alignUp(this.heap, 16n) + 16n;
    this.heap = p + size;
    this.ensure(this.heap);
    this.dv().setBigUint64(Number(p - 8n), size, true);
    return p;
  }

  free(ptr) {
    ptr = BigInt(ptr);
    if (ptr < 16n || ptr >= this.heap) return;
    const s = this.dv().getBigUint64(Number(ptr - 8n), true);
    if (s === 0n || ptr + s > this.heap) return;   // unknown / double free
    this.dv().setBigUint64(Number(ptr - 8n), 0n, true);
    const k = s.toString();
    let bin = this.freeBins.get(k);
    if (!bin) { bin = []; this.freeBins.set(k, bin); }
    bin.push(ptr);
  }

  realloc(ptr, size) {
    ptr = BigInt(ptr); size = BigInt(size);
    if (ptr === 0n) return this.malloc(size);
    const old = ptr >= 16n && ptr < this.heap ? this.dv().getBigUint64(Number(ptr - 8n), true) : 0n;
    if (old >= this.alignUp(size <= 0n ? 1n : size, 16n)) return ptr;
    const np = this.malloc(size);
    const n = Number(old < size ? old : size);
    this.u8().copyWithin(Number(np), Number(ptr), Number(ptr) + n);
    this.free(ptr);
    return np;
  }

  // ---- strings ------------------------------------------------------------
  cstr(ptr) {
    const m = this.u8();
    let e = Number(ptr);
    while (m[e] !== 0) e++;
    return dec.decode(m.subarray(Number(ptr), e));
  }

  writeBytes(ptr, data) { this.u8().set(data, Number(ptr)); }

  cstrOut(s) {                     // copy a JS string into wasm memory, NUL-terminated
    const b = enc.encode(s + '\0');
    const p = this.malloc(BigInt(b.length));
    this.writeBytes(p, b);
    return p;
  }

  // ---- output -------------------------------------------------------------
  emit(stream, bytes) { this.out.push([stream, bytes]); }

  text(stream) {
    const parts = this.out.filter(([s]) => s === stream).map(([, b]) => b);
    const total = parts.reduce((n, b) => n + b.length, 0);
    const all = new Uint8Array(total);
    let o = 0;
    for (const b of parts) { all.set(b, o); o += b.length; }
    return dec.decode(all);
  }
}

// ---------------------------------------------------------------------------
// `system` — the ONE host command the compiler shells out for.
//
// loader.coil builds its namespace index by running `find` and reading the listing.
// There is no shell here, so emulate exactly that command against the Vfs and refuse
// anything else loudly rather than returning a success status we did not earn.
function emulateSystem(run, cmd) {
  const m = cmd.match(
    /^find\s+(.*?)\s+-name\s+'\.\?\*'\s+-prune\s+-o\s+-type\s+f\s+-name\s+'\*\.coil'\s+-print\s+>\s+'([^']*)'\s*$/);
  if (!m) {
    throw new Error(
      `env.system: the browser host emulates only loader.coil's namespace-index \`find\`; ` +
      `refusing to fake a result for: ${cmd}`);
  }
  const roots = [...m[1].matchAll(/'([^']*)'/g)].map((x) => x[1]);
  const dest = m[2];
  const lines = [];
  for (const root of roots) {                    // duplicate roots list twice, as find does
    const prefix = root.endsWith('/') ? root : root + '/';
    for (const p of run.vfs.paths()) {
      if (!p.startsWith(prefix) || !p.endsWith('.coil')) continue;
      const rest = p.slice(prefix.length);
      if (rest.split('/').some((part) => part.startsWith('.'))) continue;  // -name '.?*' -prune
      lines.push(p);
    }
  }
  run.vfs.writeFile(dest, lines.length ? lines.join('\n') + '\n' : '');
  return 0;
}

// ---------------------------------------------------------------------------

function makeEnv(run) {
  const vfs = run.vfs;
  const trap = (name) => () => {
    throw new Error(`WALL1: env.${name} — native execution (JIT/dlopen/subprocess) is not available in the browser`);
  };

  const doOpen = (pathPtr, flags) => {
    const path = normalize(run.cstr(pathPtr), CWD);
    const acc = Number(flags) & 3;
    if (acc === 0) return vfs.open(path);
    return vfs.open(path, { write: true, truncate: acc === 1 });
  };

  const doRead = (fd, ptr, len) => {
    len = Number(len);
    const b = vfs.readFd(Number(fd), len);
    if (b === null) return -1n;
    run.writeBytes(ptr, b);
    return BigInt(b.length);
  };

  const doWrite = (fd, ptr, len) => {
    len = Number(len);
    const b = run.u8().slice(Number(ptr), Number(ptr) + len);
    fd = Number(fd);
    if (fd === 1 || fd === 2) { run.emit(fd, b); return BigInt(len); }
    const n = vfs.writeFd(fd, b);
    return BigInt(n);
  };

  const writeText = (fd, s) => { run.emit(Number(fd), enc.encode(s)); return s.length; };

  // printf-family over a BigInt argument list.
  const fmtc = (fmt, args) => {
    let i = 0;
    return fmt.replace(/%l?l?[dioux%csfgpX]/g, (mm) => {
      if (mm === '%%') return '%';
      const a = args[i++] ?? 0n;
      const c = mm[mm.length - 1];
      if (c === 'd' || c === 'i') return String(BigInt.asIntN(64, BigInt(a)));
      if (c === 'u' || c === 'o') return String(BigInt.asUintN(64, BigInt(a)));
      if (c === 'x') return BigInt.asUintN(64, BigInt(a)).toString(16);
      if (c === 'X') return BigInt.asUintN(64, BigInt(a)).toString(16).toUpperCase();
      if (c === 'p') return '0x' + BigInt.asUintN(64, BigInt(a)).toString(16);
      if (c === 'c') return String.fromCharCode(Number(a) & 0xff);
      if (c === 's') return run.cstr(a);
      if (c === 'f' || c === 'g') {
        const d = new DataView(new ArrayBuffer(8));
        d.setBigUint64(0, BigInt.asUintN(64, BigInt(a)), true);
        return String(d.getFloat64(0, true));
      }
      return mm;
    });
  };

  // ---- metaprogram side-modules -------------------------------------------
  // main_wasm.coil runs comptime through the in-process bytecode interpreter, so
  // these are imported but unreached on the ordinary path. They are ported anyway:
  // a compiler built with the side-module meta path would otherwise fail silently.
  const sideDataSize = (bytes) => {
    let p = 8, max = 0;
    const uleb = () => { let x = 0n, s = 0n, b; do { b = bytes[p++]; x |= BigInt(b & 0x7f) << s; s += 7n; } while (b & 0x80); return Number(x); };
    while (p < bytes.length) {
      const id = bytes[p++]; const size = uleb(); const end = p + size;
      if (id === 11) {
        const count = uleb();
        for (let i = 0; i < count; i++) {
          const flags = uleb();
          if ((flags & 1) === 0) { if (flags & 2) uleb(); while (bytes[p++] !== 0x0b); }
          const n = uleb(); p += n;
          if (n > max) max = n;
        }
      }
      p = end;
    }
    return max;
  };

  const instantiateSide = (bytesPtr, len) => {
    const modBytes = run.u8().slice(Number(bytesPtr), Number(bytesPtr) + Number(len));
    const mod = new WebAssembly.Module(modBytes);
    const memBase = run.malloc(BigInt(Math.max(sideDataSize(modBytes), 64)));
    const STACK = 1n << 23n;
    const stackTop = run.malloc(STACK) + STACK;
    const sideEnv = {
      memory: run.mem(),
      __memory_base: new WebAssembly.Global({ value: 'i64', mutable: false }, memBase),
      __stack_pointer: new WebAssembly.Global({ value: 'i64', mutable: true }, stackTop),
    };
    for (const imp of WebAssembly.Module.imports(mod)) {
      if (imp.module !== 'env' || imp.name in sideEnv) continue;
      if (imp.name.startsWith('mh_')) {
        const f = run.exports[imp.name];
        if (typeof f !== 'function') throw new Error(`side-module: compiler does not export ${imp.name}`);
        sideEnv[imp.name] = f;
      } else if (imp.name in env) {
        sideEnv[imp.name] = env[imp.name];
      } else {
        sideEnv[imp.name] = trap(`side:${imp.name}`);
      }
    }
    return new WebAssembly.Instance(mod, { env: sideEnv });
  };

  const env = {
    // allocation
    malloc: (n) => run.malloc(n),
    realloc: (p, n) => run.realloc(p, n),
    calloc: (n, sz) => {
      const total = BigInt(n) * BigInt(sz);
      const p = run.malloc(total === 0n ? 1n : total);
      run.u8().fill(0, Number(p), Number(p) + Number(total));
      return p;
    },
    free: (p) => { run.free(p); return 0n; },
    memset: (s, c, n) => { run.u8().fill(Number(c) & 0xff, Number(s), Number(s) + Number(n)); return s; },
    memcmp: (a, b, n) => {
      const m = run.u8(); a = Number(a); b = Number(b); n = Number(n);
      for (let i = 0; i < n; i++) { const d = m[a + i] - m[b + i]; if (d) return BigInt(Math.sign(d)); }
      return 0n;
    },

    // file io
    open: doOpen,
    read: doRead,
    write: doWrite,
    close: (fd) => { if (Number(fd) > 2) vfs.close(Number(fd)); return 0; },
    creat: (p, _mode) => BigInt(vfs.open(normalize(run.cstr(p), CWD), { write: true, truncate: true })),
    // access(2) answers for DIRECTORIES too. Stdlib discovery walks up from argv[0]
    // probing for `lib/coil/stdlib`, and a file-only existence check fails every
    // candidate -- the compiler then reports that it cannot find its own library.
    access: (p) => { const path = normalize(run.cstr(p), CWD); return (vfs.exists(path) || vfs.isDir(path)) ? 0 : -1; },
    unlink: (p) => vfs.unlink(normalize(run.cstr(p), CWD)),
    rename: (a, b) => {
      const from = normalize(run.cstr(a), CWD), to = normalize(run.cstr(b), CWD);
      const d = vfs.read(from);
      if (d === null) return -1;
      vfs.writeFile(to, d); vfs.unlink(from); return 0;
    },
    realpath: (p, outPtr) => {
      const path = normalize(run.cstr(p), CWD);
      if (!vfs.exists(path) && !vfs.isDir(path)) return 0n;
      run.writeBytes(outPtr, enc.encode(path + '\0'));
      return outPtr;
    },
    // The node host fakes FILE* as the fd number; keep that so fwrite/fclose match.
    fopen: (p, mode) => {
      const path = normalize(run.cstr(p), CWD);
      const m = run.cstr(mode);
      const fd = m.includes('w') ? vfs.open(path, { write: true, truncate: true }) : vfs.open(path);
      return fd < 0 ? 0n : BigInt(fd);
    },
    fclose: (f) => { if (Number(f) > 2) vfs.close(Number(f)); return 0; },
    fwrite: (ptr, sz, nm, f) => { doWrite(Number(f), ptr, BigInt(Number(sz) * Number(nm))); return BigInt(nm); },
    opendir: () => 0n,
    closedir: () => 0,
    getcwd: (b) => { run.writeBytes(b, enc.encode(CWD + '\0')); return b; },
    isatty: () => 0,
    atexit: () => 0,
    getpid: () => 1,
    __error: () => { if (run.errnoPtr === 0n) run.errnoPtr = run.malloc(4n); return run.errnoPtr; },

    // environment
    getenv: (namePtr) => {
      const name = run.cstr(namePtr);
      if (!(name in run.env)) return 0n;
      let p = run.envPtrs.get(name);
      if (p === undefined) { p = run.cstrOut(run.env[name]); run.envPtrs.set(name, p); }
      return p;
    },
    setenv: (namePtr, valuePtr, overwrite) => {
      const name = run.cstr(namePtr);
      if (!name || name.includes('=')) return -1;
      if (!overwrite && name in run.env) return 0;
      run.env[name] = run.cstr(valuePtr);
      run.envPtrs.delete(name);
      return 0;
    },
    unsetenv: (namePtr) => {
      const name = run.cstr(namePtr);
      if (!name || name.includes('=')) return -1;
      delete run.env[name];
      run.envPtrs.delete(name);
      return 0;
    },

    // Coil's wasm64 Timespec is two i64 fields. Wall-clock rather than monotonic, but
    // it preserves the libc ABI and is only used for compiler timing.
    clock_gettime: (_clockId, out) => {
      const ms = Date.now(), sec = Math.floor(ms / 1000), nsec = (ms % 1000) * 1000000;
      run.dv().setBigInt64(Number(out), BigInt(sec), true);
      run.dv().setBigInt64(Number(out) + 8, BigInt(nsec), true);
      return 0;
    },

    // string / math
    strlen: (p) => { const m = run.u8(); let e = Number(p); while (m[e] !== 0) e++; return BigInt(e - Number(p)); },
    strcmp: (a, b) => { const sa = run.cstr(a), sb = run.cstr(b); return sa < sb ? -1 : (sa > sb ? 1 : 0); },
    atoi: (p) => { const v = parseInt(run.cstr(p), 10); return isNaN(v) ? 0 : (v | 0); },
    strtol: (p, _endptr, base) => { const v = parseInt(run.cstr(p), Number(base) || 10); return BigInt(isNaN(v) ? 0 : Math.trunc(v)); },
    // strtod MUST set *endptr: the reader takes (*endptr - nptr) as the consumed
    // length and rejects the token as a symbol if it is not the whole number, so
    // leaving endptr alone makes every float literal an unbound variable.
    strtod: (nptr, endptr) => {
      const s = run.cstr(nptr);
      const m = s.match(/^[ \t\n\r]*[+-]?(?:\d+\.?\d*(?:[eE][+-]?\d+)?|\.\d+(?:[eE][+-]?\d+)?|inf(?:inity)?|nan)/i);
      let v = 0, consumed = 0;
      if (m) { const f = parseFloat(m[0]); if (!isNaN(f)) v = f; consumed = enc.encode(m[0]).length; }
      if (endptr && Number(endptr) !== 0) run.dv().setBigUint64(Number(endptr), BigInt(Number(nptr) + consumed), true);
      return v;
    },
    snprintf: (bufPtr, size, fmtPtr, arg) => {
      const out = fmtc(run.cstr(fmtPtr), [arg]);
      const b = enc.encode(out + '\0');
      const n = Math.min(b.length, Number(size));
      run.writeBytes(bufPtr, b.subarray(0, n));
      return b.length - 1;
    },
    sqrt: (x) => Math.sqrt(x), pow: (x, y) => Math.pow(x, y),
    fmod: (x, y) => x % y, fmodf: (x, y) => Math.fround(Math.fround(x) % Math.fround(y)),

    // stdio used by the interpreter's FFI table — real implementations so an
    // interpreted program that prints behaves correctly.
    putchar: (c) => { run.emit(1, new Uint8Array([Number(c) & 0xff])); return Number(c) & 0xff; },
    putc: (c) => { run.emit(1, new Uint8Array([Number(c) & 0xff])); return Number(c) & 0xff; },
    puts: (p) => writeText(1, run.cstr(p) + '\n'),
    printf: (fmtPtr, ...a) => writeText(1, fmtc(run.cstr(fmtPtr), a)),
    dprintf: (fd, fmtPtr, ...a) => writeText(Number(fd), fmtc(run.cstr(fmtPtr), a)),

    // process
    abort: () => { throw new Error('env.abort() called'); },
    exit: (c) => { throw new ExitSignal(Number(c)); },

    // threads — single-threaded, so init/lock are no-ops and create is a hard trap
    pthread_mutex_init: () => 0, pthread_mutex_lock: () => 0, pthread_mutex_unlock: () => 0,
    pthread_cond_init: () => 0, pthread_cond_signal: () => 0, pthread_cond_wait: () => 0,
    pthread_attr_init: () => 0, pthread_attr_destroy: () => 0,
    pthread_attr_setstacksize: () => 0, pthread_attr_setguardsize: () => 0, pthread_join: () => 0,
    // metahost's mh-halt records the metaprogram diagnostic then pthread_exits to end
    // the (native) metaprogram thread. There is no thread here, so throw: the
    // exception unwinds out of the side-module back to meta_run_wasm's catch, which
    // returns null, and the compiler reports the recorded Diag.
    pthread_exit: () => { throw new MetaHalt(); },
    pthread_create: trap('pthread_create'),

    meta_run_wasm: (bytesPtr, len, symPtr, argc, ...args) => {
      const sym = run.cstr(symPtr);
      const side = instantiateSide(bytesPtr, len);
      const init = side.exports.coil_mp_init;
      if (typeof init !== 'function') throw new Error('meta_run_wasm: side-module has no export coil_mp_init');
      init(0n);
      const entry = side.exports[sym];
      if (typeof entry !== 'function') throw new Error(`meta_run_wasm: side-module has no export ${sym}`);
      try {
        return BigInt(entry(...args.slice(0, Number(argc)).map((x) => BigInt(x))));
      } catch (e) {
        if (e instanceof MetaHalt) return 0n;
        throw e;
      }
    },
    meta_run_ct: (bytesPtr, len, thunkSymPtr, statusSymPtr, kind, cell) => {
      const side = instantiateSide(bytesPtr, len);
      const thunk = side.exports[run.cstr(thunkSymPtr)];
      if (typeof thunk !== 'function') throw new Error('meta_run_ct: side-module has no thunk export');
      kind = Number(kind);
      if (kind === 0) thunk(BigInt(cell));
      else if (kind === 3 || kind === 4) run.dv().setFloat64(Number(cell), Number(thunk()), true);
      else run.dv().setBigInt64(Number(cell), BigInt(thunk()), true);
      const statusSym = statusSymPtr && Number(statusSymPtr) !== 0 ? run.cstr(statusSymPtr) : null;
      if (statusSym) { const s = side.exports[statusSym]; if (typeof s === 'function') return BigInt(s()); }
      return 0n;
    },

    // Wall 1 stays a hard trap in the browser: there is no JIT, no dylib, no shell.
    mmap: trap('mmap'), munmap: trap('munmap'), mprotect: trap('mprotect'),
    dlopen: trap('dlopen'), dlsym: trap('dlsym'), dlerror: trap('dlerror'),
    system: (cmdPtr) => emulateSystem(run, run.cstr(cmdPtr)),
  };

  return env;
}

// ---------------------------------------------------------------------------

function invoke(args, files) {
  const vfs = new Vfs(baseFiles, CWD);
  for (const [path, content] of Object.entries(files ?? {})) vfs.writeFile(path, content);

  const run = new Run(vfs);
  const env = makeEnv(run);
  run.instance = new WebAssembly.Instance(compiledModule, { env });
  run.exports = run.instance.exports;
  run.heap = BigInt(run.exports.__heap_base.value);

  // argv[0] must be the compiler's real location: discovery walks up from it to find
  // lib/coil/stdlib. A bare name would resolve somewhere else entirely.
  const argvStrings = [ROOT, ...args];
  const ptrs = argvStrings.map((s) => run.cstrOut(s));
  const argvPtr = run.malloc(BigInt(ptrs.length * 8));
  for (let i = 0; i < ptrs.length; i++) run.dv().setBigUint64(Number(argvPtr) + i * 8, ptrs[i], true);

  let code, trapped = null;
  const started = performance.now();
  try {
    code = Number(run.exports.main(argvStrings.length, argvPtr)) & 0xff;
  } catch (e) {
    if (e instanceof ExitSignal) code = e.code & 0xff;
    else { code = 70; trapped = e.message; }
  }
  const ms = performance.now() - started;

  const emitted = {};
  for (const [path, data] of vfs.emitted()) {
    if (path.startsWith('/tmp/')) continue;                 // the namespace index
    if (files && path in files) continue;                   // the input we just wrote
    emitted[path] = data;
  }
  return { code, ms, trapped, stdout: run.text(1), stderr: run.text(2), emitted };
}

// ---------------------------------------------------------------------------

self.onmessage = async (ev) => {
  const msg = ev.data;
  try {
    if (msg.type === 'init') {
      const t0 = performance.now();
      const [mod, packBuf] = await Promise.all([
        WebAssembly.compileStreaming(fetch(msg.wasmUrl)),
        fetch(msg.fsUrl).then((r) => r.arrayBuffer()),
      ]);
      compiledModule = mod;
      baseFiles = unpack(packBuf);
      self.postMessage({ type: 'ready', ms: performance.now() - t0, fileCount: baseFiles.size });
      return;
    }

    if (msg.type === 'run') {
      const src = msg.source;
      const path = '/work/main.coil';
      const result = invoke(msg.args, { [path]: src });

      // `build --backend wasm` emits a standalone module with no imports. Instantiate
      // it here and call main so the page shows what the program actually returns.
      let program = null;
      const outPath = msg.outPath;
      if (outPath && result.emitted[outPath]) {
        const bytes = result.emitted[outPath];
        try {
          const { instance } = await WebAssembly.instantiate(bytes.buffer.slice(bytes.byteOffset, bytes.byteOffset + bytes.byteLength), {});
          const value = typeof instance.exports.main === 'function' ? instance.exports.main() : null;
          program = { bytes, value: value === null ? null : String(value), error: null };
        } catch (e) {
          program = { bytes, value: null, error: e.message };
        }
      }
      self.postMessage({
        type: 'result', id: msg.id, code: result.code, ms: result.ms, trapped: result.trapped,
        stdout: result.stdout, stderr: result.stderr,
        program: program && { value: program.value, error: program.error, size: program.bytes.length, bytes: program.bytes },
      });
      return;
    }

    throw new Error(`unknown message type ${msg.type}`);
  } catch (e) {
    self.postMessage({ type: 'error', id: msg.id, message: e.message, stack: e.stack });
  }
};
