# Examples

Ten complete programs, each a package in one workspace. Each one solves a real
problem and is meant to be read as an example of idiomatic Coil.

| Example | What it does | What it shows |
|---|---|---|
| [`calc`](calc) | Integer calculator REPL with caret-pointed errors | Pratt parser, spans, arena per line, `Result`/`try`, checked arithmetic |
| [`config`](config) | Loads, validates and re-serializes a JSON server config | `coil.serde` derives, error sums, collecting every validation problem |
| [`wordfreq`](wordfreq) | Word frequencies across UTF-8 text files | `coil.args`, `coil.str` runes, `coil.unicode`, string-keyed `HashMap`, `Drop` |
| [`logscan`](logscan) | Access-log report: status classes, routes, bots, latency percentiles | Compile-time `coil.regex`, `coil.io`'s buffered line reader |
| [`lru`](lru) | Generic LRU cache in front of a slow store | Generics, trait bounds, index-linked lists, `defprop-stateful` |
| [`pathfind`](pathfind) | A* and Dijkstra through weighted grid mazes | Generic heap over `Ord`, typed parse errors, property tests |
| [`huffman`](huffman) | Huffman file compressor/decompressor | Exact-width integers, bit I/O, canonical codes, a binary format |
| [`mandelbrot`](mandelbrot) | Parallel Mandelbrot renderer to PPM | `coil.simd` lanes, threads with an atomic row counter, floats |
| [`statemachine`](statemachine) | `defmachine`: a state-machine DSL as a macro | Compile-time code generation and located macro errors |

Run one with `coil run examples/<name>`. To check and test one, go into its directory:

```sh
cd examples/calc && coil check && coil test
```
