// browsertest.mjs — drive web/dist in a real headless Chrome over the DevTools
// Protocol. selftest.mjs proves the host logic under Node; this proves the thing that
// actually matters -- that a browser fetches, streams-compiles, and runs it.
//
//   python3 web/build.py && node web/browsertest.mjs
//
// Needs Chrome (memory64: Chrome 133+ / Firefox 134+; Safari has none).
import { spawn } from 'node:child_process';
import { mkdtempSync, rmSync, writeFileSync } from 'node:fs';
import { tmpdir } from 'node:os';
import { dirname, join } from 'node:path';
import { fileURLToPath } from 'node:url';

const here = dirname(fileURLToPath(import.meta.url));
const PORT = Number(process.env.COIL_WEB_PORT ?? 8732);
const CDP_PORT = Number(process.env.COIL_CDP_PORT ?? 9333);

const CHROME = process.env.CHROME ?? '/Applications/Google Chrome.app/Contents/MacOS/Google Chrome';

const sleep = (ms) => new Promise((r) => setTimeout(r, ms));

const SHOWCASE = `(module shapes)
(import "coil.primitive" :as primitive)
(import "coil.io" :use *)

(defsum Shape
  (Square [(side i64)])
  (Rect   [(w i64) (h i64)]))

(defn area [(s Shape)] (-> i64)
  (match s
    (Square [side] (primitive/imul side side))
    (Rect [w h]    (primitive/imul w h))))

(defn main [] (-> i64)
  (print-str (stdout) "area of a 6x7 rectangle: ")
  (print-int (stdout) (area (Rect 6 7)))
  (write-byte (stdout) (primitive/cast u8 10))
  0)`;

async function waitFor(fn, what, timeoutMs = 20000) {
  const deadline = Date.now() + timeoutMs;
  for (;;) {
    try { const v = await fn(); if (v) return v; } catch { /* not up yet */ }
    if (Date.now() > deadline) throw new Error(`timed out waiting for ${what}`);
    await sleep(150);
  }
}

const server = spawn('python3', [join(here, 'serve.py'), '--port', String(PORT)],
                     { stdio: 'ignore', env: { ...process.env, COIL_WEB_QUIET: '1' } });
const profile = mkdtempSync(join(tmpdir(), 'coil-web-'));
const chrome = spawn(CHROME, [
  '--headless=new', `--remote-debugging-port=${CDP_PORT}`, `--user-data-dir=${profile}`,
  '--no-first-run', '--no-default-browser-check', '--disable-gpu', 'about:blank',
], { stdio: 'ignore' });

let ws = null, seq = 0;
const waiters = new Map();

function cdp(method, params = {}, sessionId) {
  const id = ++seq;
  return new Promise((resolve, reject) => {
    waiters.set(id, { resolve, reject });
    ws.send(JSON.stringify({ id, method, params, sessionId }));
  });
}

async function evaluate(sessionId, expression) {
  const r = await cdp('Runtime.evaluate',
                      { expression, awaitPromise: true, returnByValue: true }, sessionId);
  if (r.exceptionDetails) throw new Error(r.exceptionDetails.exception?.description ?? 'page threw');
  return r.result.value;
}

const results = [];
function check(name, ok, detail = '') {
  results.push(ok);
  console.log(`${ok ? 'PASS' : 'FAIL'}  ${name}${detail ? `  — ${detail}` : ''}`);
}

try {
  const targets = await waitFor(
    () => fetch(`http://127.0.0.1:${CDP_PORT}/json/list`).then((r) => r.json()),
    'chrome devtools');
  await waitFor(() => fetch(`http://127.0.0.1:${PORT}/index.html`).then((r) => r.ok), 'dev server');

  const version = await fetch(`http://127.0.0.1:${CDP_PORT}/json/version`).then((r) => r.json());
  console.log(`browser: ${version.Browser}\n`);

  const page = targets.find((t) => t.type === 'page') ?? targets[0];
  const wsUrl = page.webSocketDebuggerUrl;
  ws = new WebSocket(wsUrl);
  await new Promise((res, rej) => { ws.onopen = res; ws.onerror = () => rej(new Error('cdp connect failed')); });
  ws.onmessage = (ev) => {
    const msg = JSON.parse(ev.data);
    const w = waiters.get(msg.id);
    if (!w) return;
    waiters.delete(msg.id);
    msg.error ? w.reject(new Error(msg.error.message)) : w.resolve(msg.result);
  };

  await cdp('Target.setDiscoverTargets', { discover: true });
  const { sessionId } = await cdp('Target.attachToTarget', { targetId: page.id, flatten: true });
  await cdp('Page.enable', {}, sessionId);
  await cdp('Runtime.enable', {}, sessionId);
  await cdp('Page.navigate', { url: `http://127.0.0.1:${PORT}/index.html` }, sessionId);

  const ready = await waitFor(
    () => evaluate(sessionId, `document.getElementById('status')?.textContent ?? ''`)
            .then((t) => (/ready|no wasm memory64/.test(t) ? t : null)),
    'the compiler to load', 60000);
  check('compiler loads in the browser', /ready/.test(ready), ready);
  if (!/ready/.test(ready)) throw new Error('compiler did not become ready');

  // Helper installed in the page: click, then resolve when the run finishes.
  const driver = `
    window.__runOnce = (buttonId, source) => new Promise((resolve) => {
      const out = document.getElementById('output');
      const status = document.getElementById('status');
      if (source !== null) document.getElementById('editor').value = source;
      document.getElementById(buttonId).click();
      const t0 = Date.now();
      const tick = setInterval(() => {
        if (!document.getElementById('run').disabled) {
          clearInterval(tick);
          resolve({ output: out.textContent, status: status.textContent });
        } else if (Date.now() - t0 > 60000) {
          clearInterval(tick);
          resolve({ output: out.textContent, status: 'TIMEOUT' });
        }
      }, 50);
    }); true`;
  await evaluate(sessionId, driver);

  const hello = await evaluate(sessionId, `window.__runOnce('run', null)`);
  check('Run interprets the program', /hello from a compiler that is itself wasm/.test(hello.output),
        hello.status);

  const answer = `(module answer)\n(import "coil.primitive" :as primitive)\n(defn main [] (-> i64) (primitive/iadd 40 2))`;
  const built = await evaluate(sessionId, `window.__runOnce('compile', ${JSON.stringify(answer)})`);
  check('Compile to wasm emits a module the page runs', /main\(\) returned 42/.test(built.output),
        built.output.trim().split('\n').pop());

  const broken = `(module broken)\n(import "coil.primitive" :as primitive)\n(defn main [] (-> i64) (if true 1 "nope"))`;
  const diag = await evaluate(sessionId, `window.__runOnce('run', ${JSON.stringify(broken)})`);
  check('a type error renders as a located diagnostic',
        /if branch has type/.test(diag.output) && /main\.coil:/.test(diag.output),
        diag.output.trim().split('\n')[0]);

  // `--screenshot PATH` grabs the page mid-session, after a real run, which is the
  // only moment worth looking at. Chrome's --virtual-time-budget fires before the
  // worker has fetched anything and only ever captures the loading state.
  const shotIdx = process.argv.indexOf('--screenshot');
  if (shotIdx !== -1 && process.argv[shotIdx + 1]) {
    await evaluate(sessionId, `window.__runOnce('run', ${JSON.stringify(SHOWCASE)})`);
    const { data } = await cdp('Page.captureScreenshot', { format: 'png' }, sessionId);
    writeFileSync(process.argv[shotIdx + 1], Buffer.from(data, 'base64'));
    console.log(`screenshot: ${process.argv[shotIdx + 1]}`);
  }
} catch (e) {
  check('browser run', false, e.message);
} finally {
  ws?.close();
  chrome.kill();
  server.kill();
  rmSync(profile, { recursive: true, force: true });
}

const passed = results.filter(Boolean).length;
console.log(`\n${passed}/${results.length} passed`);
process.exit(passed === results.length && results.length ? 0 : 1);
