import { readFile } from "node:fs/promises";

const wasm = await readFile(process.argv[2]);
let instance;
let heapTop = 0;

function ensureMemory(end) {
  const memory = instance.exports.memory;
  if (end > memory.buffer.byteLength) {
    memory.grow(Math.ceil((end - memory.buffer.byteLength) / 65536));
  }
}

function malloc(size) {
  size = Number(size);
  const pointer = (heapTop + 15) & ~15;
  heapTop = pointer + size;
  ensureMemory(heapTop);
  return pointer;
}

({ instance } = await WebAssembly.instantiate(wasm, {
  env: {
    malloc,
    realloc: (_pointer, size) => malloc(size),
    free: () => {},
    posix_memalign: (out, alignment, size) => {
      alignment = Number(alignment);
      const raw = malloc(Number(size) + alignment);
      const aligned = (raw + alignment - 1) & ~(alignment - 1);
      new DataView(instance.exports.memory.buffer).setUint32(Number(out), aligned, true);
      return 0;
    },
    abort: () => { throw new Error("Coil wasm32 dyn aggregate-return regression fixture aborted"); },
  },
}));
heapTop = Number(instance.exports.__heap_base.value);

const actual = instance.exports.wasm32_dyn_aggregate_return();
if (actual !== 42n) {
  throw new Error(`wasm32 dyn aggregate return produced ${actual}, expected 42`);
}
