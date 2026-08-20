// selftest.mjs — drive the BROWSER worker code path under Node, so the playground has
// a gate that does not need a headless browser. It stubs exactly what a Worker gives
// you (self.onmessage/postMessage, fetch) and nothing else: the compiler host, the
// virtual filesystem, and the emitted-module instantiation are the real ones.
//
//   node web/selftest.mjs [dist-dir]
import { readFileSync } from 'node:fs';
import { dirname, join, resolve } from 'node:path';
import { fileURLToPath, pathToFileURL } from 'node:url';

const here = dirname(fileURLToPath(import.meta.url));
const dist = resolve(process.argv[2] ?? join(here, 'dist'));

const TYPES = { '.wasm': 'application/wasm', '.bin': 'application/octet-stream' };
globalThis.fetch = async (url) => {
  const file = join(dist, String(url).replace(/^\.\//, ''));
  const ext = file.slice(file.lastIndexOf('.'));
  return new Response(readFileSync(file), { headers: { 'content-type': TYPES[ext] ?? 'application/octet-stream' } });
};

let onmessage = null;
const inbox = [];
globalThis.self = {
  set onmessage(fn) { onmessage = fn; },
  get onmessage() { return onmessage; },
  postMessage(msg) { inbox.push(msg); },
};

await import(pathToFileURL(join(here, 'coil-worker.js')).href);

async function call(msg) {
  inbox.length = 0;
  await onmessage({ data: msg });
  return inbox;
}

const results = [];
function check(name, ok, detail = '') {
  results.push({ name, ok, detail });
  console.log(`${ok ? 'PASS' : 'FAIL'}  ${name}${detail ? `  — ${detail}` : ''}`);
}

// ---- init ------------------------------------------------------------------
const [ready] = await call({ type: 'init', wasmUrl: './coilc.wasm', fsUrl: './coil-fs.bin' });
check('init', ready?.type === 'ready' && ready.fileCount > 50,
      ready?.type === 'ready' ? `${ready.fileCount} sources, ${Math.round(ready.ms)} ms` : JSON.stringify(ready));

const HELLO = `(module hello)
(import "coil.primitive" :as primitive)
(import "coil.io" :use *)
(defn main [] (-> i64)
  (print-str (stdout) "hello from wasm\\n")
  0)`;

const ANSWER = `(module answer)
(import "coil.primitive" :as primitive)
(defn main [] (-> i64) (primitive/iadd 40 2))`;

const BROKEN = `(module broken)
(import "coil.primitive" :as primitive)
(defn main [] (-> i64) (if true 1 "not an integer"))`;

// ---- interp: the bytecode VM runs the user's program ------------------------
{
  const [r] = await call({ type: 'run', id: 1, source: HELLO, args: ['interp', '/work/main.coil'] });
  check('interp prints program output', r?.type === 'result' && r.code === 0 && r.stdout.includes('hello from wasm'),
        `exit ${r?.code} ${Math.round(r?.ms ?? 0)} ms ${JSON.stringify((r?.stdout ?? '') + (r?.stderr ?? ''))}`);
}

// ---- build --backend wasm: emit a module and run it -------------------------
{
  const [r] = await call({
    type: 'run', id: 2, source: ANSWER,
    args: ['build', '/work/main.coil', '--backend', 'wasm', '-o', '/work/out.wasm'],
    outPath: '/work/out.wasm',
  });
  check('build emits an instantiable module', r?.type === 'result' && r.code === 0 && r.program && r.program.value === '42',
        r?.program ? `${r.program.size} bytes, main() = ${r.program.value}${r.program.error ? ' err=' + r.program.error : ''}`
                   : `exit ${r?.code} ${JSON.stringify((r?.stdout ?? '') + (r?.stderr ?? ''))}`);
}

// ---- diagnostics reach the page ---------------------------------------------
{
  const [r] = await call({ type: 'run', id: 3, source: BROKEN, args: ['check', '/work/main.coil'] });
  check('a type error is reported, not trapped',
        r?.type === 'result' && r.code !== 0 && !r.trapped && /error/i.test(r.stderr + r.stdout),
        `exit ${r?.code} ${JSON.stringify(((r?.stderr ?? '') + (r?.stdout ?? '')).slice(0, 120))}`);
}

// ---- instances are independent ----------------------------------------------
{
  const [r] = await call({ type: 'run', id: 4, source: HELLO, args: ['interp', '/work/main.coil'] });
  check('a second run reuses the compiled module cleanly',
        r?.type === 'result' && r.code === 0 && r.stdout.includes('hello from wasm'),
        `exit ${r?.code} ${Math.round(r?.ms ?? 0)} ms`);
}

const failed = results.filter((r) => !r.ok);
console.log(`\n${results.length - failed.length}/${results.length} passed`);
process.exit(failed.length ? 1 : 0);
