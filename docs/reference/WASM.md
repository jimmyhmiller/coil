# WebAssembly

Coil writes browser-ready WebAssembly modules itself, with no separate linker
and no generated JavaScript glue. You declare the host functions you call,
export the Coil functions JavaScript calls, and load the `.wasm` file.

```sh
coil build page.coil --target wasm32-unknown-unknown -o page.wasm
```

Or set it once for a project:

```toml
[build]
target = "wasm32-unknown-unknown"
```

## A complete page

The Coil side:

```text
(module page)
(import "coil.slice" :use [slice-data slice-len])

;;; Host functions: declared but never defined, so each becomes an `env.*` import.
(extern js_log :cc c [(ptr u8) i32] (-> void))
(extern js_document :cc c [] (-> externref))
(extern js_set_title :cc c [externref (ptr u8) i32] (-> void))

(defn text-len [(s (slice u8))] (-> i32) (cast i32 (slice-len s)))

(defn log [(s (slice u8))] (-> void)
  (js_log (slice-data s) (text-len s)))

(defn add [(a i32) (b i32)] (-> i32) (+ a b))
(export-c [add :as "add"])

(defn main [] (-> i64)
  (log "hello from coil")
  (let [title "Coil page"]
    (js_set_title (js_document) (slice-data title) (text-len title)))
  0)
```

The JavaScript side:

```js
const memory = () => instance.exports.memory;
const text = (ptr, len) =>
  new TextDecoder().decode(new Uint8Array(memory().buffer, ptr, len));

const { instance } = await WebAssembly.instantiateStreaming(fetch("page.wasm"), {
  env: {
    js_log: (ptr, len) => console.log(text(ptr, len)),
    js_document: () => document,
    js_set_title: (doc, ptr, len) => { doc.title = text(ptr, len); },
  },
});

instance.exports.main();                 // returns 0n: an i64 arrives as a BigInt
console.log(instance.exports.add(2, 3)); // 5
```

In Node, read the file with `fs.readFile` and call `WebAssembly.instantiate`
instead of `instantiateStreaming`.

## Exports

`main` and the module's linear `memory` are always exported. Each function
listed in `(export-c [name :as "js_name"])` is exported under that name.
Arguments and results are WebAssembly scalars: `i32`, `i64`, `f32`, `f64`
and `externref`. An `i64` appears in JavaScript as a `BigInt`.

`main` is required, even for a module JavaScript only calls into.

## Calling JavaScript

An `extern … :cc c` that is declared but never defined becomes an import
named `env.<name>`. The module imports only the host functions it calls, so
unused declarations cost nothing.

Strings and byte buffers cross as a pointer and a length into linear memory.
Pass `(slice-data s)` and `(slice-len s)`, and decode on the JavaScript side
with `TextDecoder`, as above. String literals and `alloc-static` storage live
at fixed addresses in the module's memory and need no setup from JavaScript.

## Holding JavaScript values: `externref`

`externref` is an opaque reference to any JavaScript value: a DOM node, a
promise, a callback. Use it in `extern` signatures, as a parameter or result,
and in `let` bindings (including `(mut …)` locals). The engine's garbage
collector manages it, so you never free one.

You can't store an `externref` in linear memory, which rules out struct
fields, arrays, and anything behind a pointer. To keep one across calls, give it to a
host-side table and store the `i32` index the host returns:

```js
const handles = [];
const env = {
  js_retain: (ref) => handles.push(ref) - 1,   // Coil keeps the i32
  js_handle: (i) => handles[i],                // and turns it back into a ref
};
```

## Limits

- You can't link native libraries into a wasm module. Everything comes from
  Coil source or from host imports.
- There is no libc. Library code that calls a C function turns that call into
  a host import too: `println` imports `env.write` (and `env.dlsym`), and
  `malloc-allocator` imports `env.malloc`. Check what a module needs with
  `wasm-objdump -x -j Import page.wasm`, and supply each one from JavaScript,
  or keep such code out of the module.
