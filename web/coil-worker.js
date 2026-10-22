// coil-worker.js — the Coil compiler, running as wasm, in a Web Worker.
//
// A browser port of src/tooling/wasm-host/run-coil-wasm.mjs. The same `env.*` imports,
// same reclaiming allocator; node's `fs` becomes the in-memory Vfs and node's streams
// become captured output. Everything runs off the main thread because a compile is
// synchronous from wasm's point of view and would otherwise freeze the page.
//
// The module is COMPILED ONCE and INSTANTIATED PER RUN. `main` ends by calling exit(),
// and it has mutated the module's static data and heap by then, so reusing an instance
// would compile the second program against the first one's debris. Instantiating from
// an already-compiled Module is cheap; recompiling 3.4 MB is not.

import { Vfs, unpack, normalize } from './vfs.js';
import { formatC, fusedMultiplyAdd, vaReader, wasmOpenFlags } from './hostlib.js';

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

  // posix_memalign: 0 with the block's address at OUT, or EINVAL. A block aligned
  // past the allocator's 16 bytes is carved fresh from the heap, with its size
  // header before it like any other, so free() bins it as usual.
  memalign(out, alignment, size) {
    alignment = BigInt(alignment); size = BigInt(size);
    if (alignment < 8n || (alignment & (alignment - 1n)) !== 0n) return 22;
    let p;
    if (alignment <= 16n) {
      p = this.malloc(size);
    } else {
      size = this.alignUp(size <= 0n ? 1n : size, 16n);
      p = this.alignUp(this.heap + 16n, alignment);
      this.heap = p + size;
      this.ensure(this.heap);
      this.dv().setBigUint64(Number(p - 8n), size, true);
    }
    this.dv().setBigUint64(Number(out), p, true);
    return 0;
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

function makeEnv(run) {
  const vfs = run.vfs;
  const trap = (name) => () => {
    throw new Error(`WALL1: env.${name} — native execution (JIT/dlopen/subprocess) is not available in the browser`);
  };

  // A path the guest passed, made absolute against the working directory.
  const pathAt = (ptr) => normalize(run.cstr(ptr), vfs.cwd);
  // Fail a call with errno CODE (the guest libc's numbering: Darwin's).
  const fail = (code, result = -1) => {
    if (run.errnoPtr === 0n) run.errnoPtr = run.malloc(4n);
    run.dv().setInt32(Number(run.errnoPtr), code, true);
    return result;
  };
  const fdOrFail = (fd) => (fd < 0 ? fail(-fd) : fd);

  // open(2); its mode, the variadic argument, means nothing to the VFS.
  const doOpen = (pathPtr, flags, _va) => {
    const f = wasmOpenFlags(flags);
    if (f === null) return fail(22);                               // EINVAL
    if (f.access === 'readwrite') throw new Error('vfs: open(O_RDWR) is not supported');
    const path = pathAt(pathPtr);
    if (f.directory && !vfs.isDir(path)) return fail(vfs.exists(path) ? 20 : 2);
    if (f.access === 'read') return fdOrFail(vfs.open(path));
    return fdOrFail(vfs.open(path, { write: true, truncate: f.truncate, create: f.create, exclusive: f.exclusive }));
  };

  // Directory streams over the VFS, each entry in the Darwin dirent layout the
  // wasm64 loader reads: d_type at byte 20, the NUL-terminated name at 21.
  const dirs = new Map();
  let nextDir = 1n;
  const opendir = (p) => {
    const path = pathAt(p);
    if (!vfs.isDir(path)) return fail(vfs.exists(path) ? 20 : 2, 0n);
    const entries = [{ name: '.', dir: true }, { name: '..', dir: true }, ...vfs.list(path)];
    const handle = nextDir++;
    dirs.set(handle, { entries, next: 0, buf: 0n });
    return handle;
  };
  const readdir = (handle) => {
    const d = dirs.get(BigInt(handle));
    if (!d) return fail(9, 0n);                                    // EBADF
    if (d.next >= d.entries.length) return 0n;
    const entry = d.entries[d.next++];
    const name = enc.encode(entry.name + '\0');
    if (d.buf !== 0n) run.free(d.buf);
    d.buf = run.malloc(BigInt(21 + name.length));
    run.u8().fill(0, Number(d.buf), Number(d.buf) + 21);
    run.u8()[Number(d.buf) + 20] = entry.dir ? 4 : 8;              // DT_DIR, DT_REG
    run.writeBytes(d.buf + 21n, name);
    return d.buf;
  };
  const closedir = (handle) => {
    const d = dirs.get(BigInt(handle));
    if (!d) return fail(9);
    if (d.buf !== 0n) run.free(d.buf);
    dirs.delete(BigInt(handle));
    return 0;
  };
  let tempCounter = 0;
  const mkdtemp = (templatePtr) => {
    const template = run.cstr(templatePtr);
    if (!template.endsWith('XXXXXX')) return fail(22, 0n);
    for (;;) {
      const suffix = (tempCounter++).toString(36).padStart(6, '0').slice(-6);
      const made = template.slice(0, -6) + suffix;
      const code = vfs.mkdir(normalize(made, vfs.cwd));
      if (code === 17) continue;
      if (code !== 0) return fail(code, 0n);
      run.writeBytes(templatePtr, enc.encode(made + '\0'));
      return templatePtr;
    }
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

  // The printf family, over the guest's va_list buffer at VA (web/hostlib.js).
  // Text is bytes here: the format and %s arguments are read as bytes and the
  // result is written as bytes, as libc's printf does.
  const byteString = (ptr) => {
    const m = run.u8();
    let e = Number(ptr), text = '';
    while (m[e] !== 0) e++;
    for (let i = Number(ptr); i < e; i++) text += String.fromCharCode(m[i]);
    return text;
  };
  const fmtc = (fmtPtr, va) => {
    const text = formatC(byteString(fmtPtr), vaReader(() => run.dv(), va), byteString);
    return Uint8Array.from(text, (c) => c.charCodeAt(0));
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
    posix_memalign: (out, alignment, size) => run.memalign(out, alignment, size),
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
      for (let i = 0; i < n; i++) { const d = m[a + i] - m[b + i]; if (d) return Math.sign(d); }
      return 0;
    },

    // file io
    open: doOpen,
    read: doRead,
    write: doWrite,
    close: (fd) => { if (Number(fd) > 2) vfs.close(Number(fd)); return 0; },
    creat: (p, _mode) => fdOrFail(vfs.open(pathAt(p), { write: true, truncate: true })),
    // access(2) answers for DIRECTORIES too. Stdlib discovery walks up from argv[0]
    // probing for `lib/coil/stdlib`, and a file-only existence check fails every
    // candidate -- the compiler then reports that it cannot find its own library.
    access: (p) => { const path = pathAt(p); return (vfs.exists(path) || vfs.isDir(path)) ? 0 : fail(2); },
    unlink: (p) => (vfs.unlink(pathAt(p)) === 0 ? 0 : fail(2)),
    rename: (a, b) => {
      const from = pathAt(a), to = pathAt(b);
      const d = vfs.read(from);
      if (d === null) return fail(2);
      vfs.writeFile(to, d); vfs.unlink(from); return 0;
    },
    realpath: (p, outPtr) => {
      const path = pathAt(p);
      if (!vfs.exists(path) && !vfs.isDir(path)) return fail(2, 0n);
      run.writeBytes(outPtr, enc.encode(path + '\0'));
      return outPtr;
    },
    // The node host fakes FILE* as the fd number; keep that so fwrite/fclose match.
    fopen: (p, mode) => {
      const path = pathAt(p);
      const m = run.cstr(mode);
      const fd = m.includes('w') ? vfs.open(path, { write: true, truncate: true }) : vfs.open(path);
      return fd < 0 ? fail(-fd, 0n) : BigInt(fd);
    },
    fclose: (f) => { if (Number(f) > 2) vfs.close(Number(f)); return 0; },
    fwrite: (ptr, sz, nm, f) => { doWrite(Number(f), ptr, BigInt(Number(sz) * Number(nm))); return BigInt(nm); },
    opendir, readdir, closedir, mkdtemp,
    mkdir: (p, _mode) => { const code = vfs.mkdir(pathAt(p)); return code ? fail(code) : 0; },
    rmdir: (p) => { const code = vfs.rmdir(pathAt(p)); return code ? fail(code) : 0; },
    chdir: (p) => {
      const path = pathAt(p);
      if (!vfs.isDir(path)) return fail(vfs.exists(path) ? 20 : 2);
      vfs.cwd = path;
      return 0;
    },
    getcwd: (b, size) => {
      const bytes = enc.encode(vfs.cwd + '\0');
      if (bytes.length > Number(size)) return fail(34, 0n);         // ERANGE
      run.writeBytes(b, bytes);
      return b;
    },
    isatty: () => 0,
    atexit: () => 0,
    getpid: () => 1,
    __error: () => { if (run.errnoPtr === 0n) run.errnoPtr = run.malloc(4n); return run.errnoPtr; },
    // coil.temp: one user, and no process but this one (pid 1), so kill(pid, 0)
    // answers ESRCH for every other pid.
    getuid: () => 0,
    fchmod: () => 0,
    kill: (pid) => {
      if (Number(pid) === 1) return 0;
      if (run.errnoPtr === 0n) run.errnoPtr = run.malloc(4n);
      run.dv().setInt32(Number(run.errnoPtr), 3, true);
      return -1;
    },

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
    snprintf: (bufPtr, size, fmtPtr, va) => {
      const out = fmtc(fmtPtr, va);
      const n = Number(size);
      if (n > 0) {
        const w = Math.min(out.length, n - 1);
        run.writeBytes(bufPtr, out.subarray(0, w));
        run.u8()[Number(bufPtr) + w] = 0;
      }
      return out.length;
    },
    sqrt: (x) => Math.sqrt(x), pow: (x, y) => Math.pow(x, y),
    fmod: (x, y) => x % y, fmodf: (x, y) => Math.fround(Math.fround(x) % Math.fround(y)),
    // coil.math's libm functions (interp.coil's host externs). JS has no f32
    // transcendentals, so the f32 forms round the f64 result.
    round:(x)=>(x<0?-Math.round(-x):Math.round(x)),
    nearbyint:(x)=>{ const r=Math.round(x); return (Math.abs(x%1)===0.5&&r%2!==0)?r-1:r; },
    copysign:(x,y)=>{ const d=new DataView(new ArrayBuffer(8)); d.setFloat64(0,y); return (d.getUint8(0)&0x80)?-Math.abs(x):Math.abs(x); },
    roundf:(x)=>Math.fround(x<0?-Math.round(-x):Math.round(x)),
    nearbyintf:(x)=>{ const r=Math.round(x); return Math.fround((Math.abs(x%1)===0.5&&r%2!==0)?r-1:r); },
    copysignf:(x,y)=>{ const d=new DataView(new ArrayBuffer(4)); d.setFloat32(0,y); return Math.fround((d.getUint8(0)&0x80)?-Math.abs(x):Math.abs(x)); },
    fabsf:(x)=>Math.fround(Math.abs(x)),
    sqrtf:(x)=>Math.fround(Math.sqrt(x)), floorf:(x)=>Math.fround(Math.floor(x)),
    ceilf:(x)=>Math.fround(Math.ceil(x)), truncf:(x)=>Math.fround(Math.trunc(x)),
    fma:(a,b,c)=>fusedMultiplyAdd(a,b,c,53,-1074),
    fmaf:(a,b,c)=>Math.fround(fusedMultiplyAdd(a,b,c,24,-149)),
    sin:Math.sin, cos:Math.cos, tan:Math.tan, asin:Math.asin, acos:Math.acos, atan:Math.atan,
    atan2:Math.atan2, sinh:Math.sinh, cosh:Math.cosh, tanh:Math.tanh, exp:Math.exp,
    exp2:(x)=>Math.pow(2,x), log:Math.log, log2:Math.log2, log10:Math.log10,
    sinf:(x)=>Math.fround(Math.sin(x)), cosf:(x)=>Math.fround(Math.cos(x)),
    tanf:(x)=>Math.fround(Math.tan(x)), asinf:(x)=>Math.fround(Math.asin(x)),
    acosf:(x)=>Math.fround(Math.acos(x)), atanf:(x)=>Math.fround(Math.atan(x)),
    atan2f:(y,x)=>Math.fround(Math.atan2(y,x)), sinhf:(x)=>Math.fround(Math.sinh(x)),
    coshf:(x)=>Math.fround(Math.cosh(x)), tanhf:(x)=>Math.fround(Math.tanh(x)),
    expf:(x)=>Math.fround(Math.exp(x)), exp2f:(x)=>Math.fround(Math.pow(2,x)),
    logf:(x)=>Math.fround(Math.log(x)), log2f:(x)=>Math.fround(Math.log2(x)),
    log10f:(x)=>Math.fround(Math.log10(x)), powf:(x,y)=>Math.fround(Math.pow(x,y)),

    // stdio used by the interpreter's FFI table — real implementations so an
    // interpreted program that prints behaves correctly.
    putchar: (c) => { run.emit(1, new Uint8Array([Number(c) & 0xff])); return Number(c) & 0xff; },
    putc: (c) => { run.emit(1, new Uint8Array([Number(c) & 0xff])); return Number(c) & 0xff; },
    puts: (p) => writeText(1, run.cstr(p) + '\n'),
    printf: (fmtPtr, va) => { const out = fmtc(fmtPtr, va); run.emit(1, out); return out.length; },
    dprintf: (fd, fmtPtr, va) => { const out = fmtc(fmtPtr, va); run.emit(Number(fd), out); return out.length; },

    // process
    abort: () => { throw new Error('env.abort() called'); },
    exit: (c) => { throw new ExitSignal(Number(c)); },

    // threads — single-threaded, so init/lock are no-ops and create is a hard trap
    pthread_self: () => 1,  // the only thread there is
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
    // only the interpreter's native thread wrapper asks, and it never runs here
    pthread_attr_getstacksize: trap('pthread_attr_getstacksize'),

    meta_run_wasm: (bytesPtr, len, symPtr, argc, ...args) => {
      const sym = run.cstr(symPtr);
      const side = instantiateSide(bytesPtr, len);
      const init = side.exports.coil_mp_init;
      if (typeof init !== 'function') throw new Error('meta_run_wasm: side-module has no export coil_mp_init');
      init(0n, 0n);
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
    dladdr: trap('dladdr'), dlclose: trap('dlclose'),
    posix_spawnp: trap('posix_spawnp'), waitpid: trap('waitpid'),
    system: trap('system'),
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
