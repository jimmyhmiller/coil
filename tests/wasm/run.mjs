// Runs a Coil wasm32 module and checks its exports:
//   node run.mjs module.wasm name=expected ...
// The host supplies a bump allocator, write, strlen, and the imports
// tests/wasm/wasm32.coil declares.
import fs from "node:fs";

const [file, ...checks] = process.argv.slice(2);
let instance;
let heapTop = 0;
let sunk = 0;
let errno = 0;
function errnoCell() { if (!errno) errno = malloc(4); return errno; }

function memory() { return instance.exports.memory; }
function ensureMemory(end) {
  if (end > memory().buffer.byteLength) {
    memory().grow(Math.ceil((end - memory().buffer.byteLength) / 65536));
  }
}
function malloc(size) {
  const pointer = (heapTop + 15) & ~15;
  heapTop = pointer + Number(size);
  ensureMemory(heapTop);
  return pointer;
}

const env = {
  malloc,
  realloc: (_pointer, size) => malloc(size),
  free: () => {},
  posix_memalign: (out, alignment, size) => {
    alignment = Number(alignment);
    const raw = malloc(Number(size) + alignment);
    const aligned = (raw + alignment - 1) & ~(alignment - 1);
    new DataView(memory().buffer).setUint32(Number(out), aligned, true);
    return 0;
  },
  write: (_fd, pointer, length) => {
    process.stdout.write(Buffer.from(memory().buffer, Number(pointer), Number(length)));
    return length;
  },
  strlen: (pointer) => {
    const bytes = new Uint8Array(memory().buffer);
    let end = Number(pointer);
    while (bytes[end] !== 0) end++;
    return end - Number(pointer);
  },
  // The errno accessor: os.coil names __error or __errno_location by target os.
  __error: () => errnoCell(),
  __errno_location: () => errnoCell(),
  abort: () => { throw new Error(`${file} aborted`); },
  js_get: () => ({ tag: 7 }),
  js_use: (reference) => reference.tag,
  sink: (pointer) => { sunk = Number(pointer); },
  "host.function$1": (n) => n + 1n,
};

({ instance } = await WebAssembly.instantiate(fs.readFileSync(file), { env }));
if (instance.exports.__heap_base) heapTop = Number(instance.exports.__heap_base.value);

let failed = 0;
for (const check of checks) {
  const [name, expected] = check.split("=");
  const actual = instance.exports[name]?.(...(name === "use_stack" ? [5n] : []));
  if (actual !== BigInt(expected)) {
    console.error(`FAIL ${name}: returned ${actual}, expected ${expected}`);
    failed++;
  }
}
if (checks.includes("use_stack=5") && sunk === 0) {
  console.error("FAIL use_stack: the host never received the stack address");
  failed++;
}
process.exit(failed ? 1 : 0);
