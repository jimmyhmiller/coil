import fs from "node:fs";

const bytes = fs.readFileSync(process.argv[2]);
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

const imports = {
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
    write: () => 0,
    abort: () => { throw new Error("Coil wasm32 regression fixture aborted"); },
  },
};

({ instance } = await WebAssembly.instantiate(bytes, imports));
heapTop = Number(instance.exports.__heap_base.value);

const actual = instance.exports.wasm32_arraylist_record();
if (actual !== 6n) {
  throw new Error(`wasm32 ArrayList record round trip returned ${actual}, expected 6`);
}
