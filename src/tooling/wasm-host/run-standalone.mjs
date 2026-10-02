// run-standalone.mjs — run a standalone memory64 Coil module produced by the
// native wasm backend (--backend wasm) the way a native binary runs: the program's
// output goes to stdout/stderr and `main`'s result is the exit status. Node v26
// has memory64 on by default.
//
//   node run-standalone.mjs [--c-lib <lib.wasm>]... <file.wasm> [args...]
//
// The module's imports follow the C ABI of the LLVM wasm backend (memory64 ⇒
// pointers and 64-bit integers are BigInt; 32-bit integers, f32 and f64 are
// Number). This host provides a small libc/libm surface:
//   write/putchar/puts/exit/abort, malloc/calloc/realloc/posix_memalign/free (a
//   bump allocator over the module's memory, heap at 8 MiB), dlsym (always "not
//   found"), memcpy/memmove/memset/memcmp/strlen,
//   the libm functions coil.math and float `%` call, _exit, and two test callbacks
//   (host_add/host_sub). An import it does not provide is named before running.
//
// `--c-lib` adds a module of real C (clang --target=wasm64, linked with
// --import-memory --import-table) whose exports satisfy further imports — the
// way to exercise the C ABI against the compiler that defines it. It shares the
// program's memory and function table, so C can call back through a Coil
// function pointer.
import fs from 'node:fs';

const argv = process.argv.slice(2);
const clibPaths = [];
while (argv[0] === '--c-lib') { clibPaths.push(argv[1]); argv.splice(0, 2); }
const [path, ...args] = argv;
if (!path) { console.error('usage: node run-standalone.mjs [--c-lib <lib.wasm>]... <file.wasm> [args...]'); process.exit(2); }

let instance = null;
const mem = () => new Uint8Array(instance.exports.memory.buffer);
const dv = () => new DataView(instance.exports.memory.buffer);
class ExitSignal { constructor(code) { this.code = code; } }

let heap = 0x800000n;                 // 8 MiB — above data (1KiB+) and below the shadow stack (grows down from 16 MiB)
const blocks = new Map();             // address -> size, so realloc can copy
function malloc(n) {
  const size = BigInt(n);
  const p = heap;
  heap = (heap + size + 15n) & ~15n;
  if (heap > 0xC00000n) throw new Error('run-standalone: heap exhausted (8..12 MiB)');
  blocks.set(p, size);
  return p;
}
function strlen(p) { const m = mem(); let i = Number(p); while (m[i] !== 0) i++; return BigInt(i - Number(p)); }
let errnoPtr = 0n;
function errnoCell() {
  if (errnoPtr === 0n) errnoPtr = malloc(4n);
  return errnoPtr;
}

const libm = {};
for (const [name, f] of Object.entries({
  sqrt: Math.sqrt, fabs: Math.abs, floor: Math.floor, ceil: Math.ceil, trunc: Math.trunc,
  // C round: halfway cases away from zero (keeps the sign of zero)
  round: (x) => { const t = Math.trunc(x); return Math.abs(x - t) >= 0.5 ? t + Math.sign(x) : t; },
  // nearbyint in the default rounding mode: halfway cases to even
  nearbyint: (x) => { const f = Math.floor(x); const d = x - f; return d > 0.5 || (d === 0.5 && f % 2 !== 0) ? f + 1 : (d === 0 ? x : f); },
  // JS has no fused multiply-add: this rounds twice, so exact-rounding tests need a real libm
  fma: (x, y, z) => x * y + z,
  copysign: (x, y) => (Math.sign(y) < 0 || Object.is(y, -0) ? -Math.abs(x) : Math.abs(x)),
  sin: Math.sin, cos: Math.cos, tan: Math.tan, asin: Math.asin, acos: Math.acos, atan: Math.atan,
  atan2: Math.atan2, sinh: Math.sinh, cosh: Math.cosh, tanh: Math.tanh, exp: Math.exp,
  exp2: (x) => 2 ** x, log: Math.log, log2: Math.log2, log10: Math.log10,
  // C: pow(1, y) and pow(x, ±0) are 1 even for NaN (JS says NaN)
  pow: (x, y) => (x === 1 || y === 0 ? 1 : Math.pow(x, y)),
  fmod: (x, y) => x % y,
})) {
  libm[name] = f;
  libm[name + 'f'] = (...a) => Math.fround(f(...a));
}

const known = {
  ...libm,
  __error: errnoCell,
  host_add: (a, b) => a + b,
  host_sub: (a, b) => a - b,
  write: (fd, p, n) => {
    if (Number(fd) < 0) {
      dv().setInt32(Number(errnoCell()), 9, true); // EBADF, before Node's range validation.
      return -1n;
    }
    const bytes = mem().slice(Number(p), Number(p) + Number(n));
    try { return BigInt(fs.writeSync(Number(fd), bytes)); }
    catch (e) {
      dv().setInt32(Number(errnoCell()), Math.abs(e.errno) || 5, true);
      return -1n;
    }
  },
  putchar: (c) => { fs.writeSync(1, Uint8Array.of(Number(c) & 255)); return c; },
  puts: (p) => { fs.writeSync(1, mem().slice(Number(p), Number(p) + Number(strlen(p)))); fs.writeSync(1, '\n'); return 0; },
  exit: (c) => { throw new ExitSignal(Number(c)); },
  _exit: (c) => { throw new ExitSignal(Number(c)); },
  abort: () => { throw new ExitSignal(134); },
  malloc,
  calloc: (n, k) => { const p = malloc(BigInt(n) * BigInt(k)); mem().fill(0, Number(p), Number(p) + Number(BigInt(n) * BigInt(k))); return p; },
  realloc: (p, n) => {
    const q = malloc(n);
    if (p !== 0n) { const old = blocks.get(p) ?? 0n; const k = old < BigInt(n) ? old : BigInt(n); mem().copyWithin(Number(q), Number(p), Number(p + k)); }
    return q;
  },
  posix_memalign: (out, align, n) => {
    const al = BigInt(align);
    heap = (heap + al - 1n) / al * al;
    dv().setBigUint64(Number(out), malloc(n), true);
    return 0;
  },
  free: (_p) => {},                   // the bump allocator never reclaims
  dlsym: (_handle, _name) => 0n,      // nothing is loadable in this sandbox: "not found"
  memcpy: (d, s, n) => { mem().copyWithin(Number(d), Number(s), Number(s) + Number(n)); return d; },
  memmove: (d, s, n) => { mem().copyWithin(Number(d), Number(s), Number(s) + Number(n)); return d; },
  memset: (d, c, n) => { mem().fill(Number(c) & 255, Number(d), Number(d) + Number(n)); return d; },
  memcmp: (a, b, n) => {
    const m = mem();
    for (let i = 0; i < Number(n); i++) { const x = m[Number(a) + i], y = m[Number(b) + i]; if (x !== y) return x - y; }
    return 0;
  },
  strlen,
};

const module = new WebAssembly.Module(fs.readFileSync(path));
// C libraries are instantiated after the program (they import its memory and
// table), so the program's imports of their functions forward lazily.
const clibs = clibPaths.map((p) => new WebAssembly.Module(fs.readFileSync(p)));
const clibInstances = [];
for (const lib of clibs) {
  for (const e of WebAssembly.Module.exports(lib)) {
    if (e.kind === 'function' && !(e.name in known)) {
      known[e.name] = (...a) => {
        for (const inst of clibInstances) if (e.name in inst.exports) return inst.exports[e.name](...a);
        throw new Error(`c-lib export ${e.name} called before instantiation`);
      };
    }
  }
}
const missing = WebAssembly.Module.imports(module)
  .filter((i) => i.module === 'env' && i.kind === 'function' && !(i.name in known))
  .map((i) => i.name);
if (missing.length) {
  console.error(`run-standalone: the module imports env functions this host does not provide: ${missing.join(', ')}`);
  process.exit(2);
}
instance = new WebAssembly.Instance(module, { env: known });
for (const lib of clibs) {
  // a program with no function pointers has no table: give the library its own
  const table = instance.exports.__indirect_function_table
    ?? new WebAssembly.Table({ element: 'anyfunc', initial: 1n, address: 'i64' });
  const env = { memory: instance.exports.memory, __indirect_function_table: table };
  for (const i of WebAssembly.Module.imports(lib)) {
    if (i.module === 'env' && i.kind === 'function') env[i.name] = known[i.name] ?? instance.exports[i.name];
  }
  clibInstances.push(new WebAssembly.Instance(lib, { env }));
}
if (typeof instance.exports.main !== 'function') { console.error('module has no exported main'); process.exit(2); }

// main may take (argc, argv): lay argv out as C strings on the heap.
let mainArgs = [];
if (instance.exports.main.length === 2) {
  const all = [path, ...args];
  const argv = malloc(BigInt(8 * (all.length + 1)));
  all.forEach((a, i) => {
    const bytes = Buffer.from(a + '\0');
    const p = malloc(BigInt(bytes.length));
    mem().set(bytes, Number(p));
    dv().setBigUint64(Number(argv) + 8 * i, p, true);
  });
  dv().setBigUint64(Number(argv) + 8 * all.length, 0n, true);
  mainArgs = [all.length, argv];
}
try {
  process.exitCode = Number(BigInt.asUintN(8, BigInt(instance.exports.main(...mainArgs))));
} catch (e) {
  if (e instanceof ExitSignal) process.exitCode = e.code;
  else throw e;
}
