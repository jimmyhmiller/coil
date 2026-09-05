# AOT regex benchmark

Measured 2026-09-05 on an Apple M2 Max. Each timed command allocates a 16 MiB
haystack, verifies the expression 32 times (512 MiB scanned), and prints the
same result (`0`). Hyperfine used three warmups and fifteen measured runs.

Toolchains: Coil 0.1.0 LLVM backend, Rust 1.96.0, `regex` 1.13.1. Run with:

```sh
scripts/benchmarks/regex.sh
```

| workload | Coil | Rust regex | result |
|---|---:|---:|---:|
| absent literal `Sherlock` in repeated `x` | 18.5 ms ± 0.8 ms | 23.3 ms ± 0.6 ms | Coil 1.26× faster |
| absent `[A-Za-z]+Z` in repeated `a` | 3.9 ms ± 0.4 ms | 367.6 ms ± 6.5 ms | Coil 94.94× faster |

The literal result uses the specialized `memchr` candidate scan added after the
baseline measurement. Before that specialization, the same generated scalar
loop took 165.9 ms ± 1.2 ms: the new tier is approximately 10× faster.

The NFA compiler proves that its singleton `Z` state dominates the accepting
state, then uses one `memchr` rejection pass before entering the state machine.
Before this required-byte prefilter, Coil took 677.3 ms ± 3.3 ms while Rust took
346.5 ms ± 2.1 ms. The optimized number measures this important absent-match
case specifically; it does not imply a 106× advantage for matching inputs or
expressions without a provably mandatory byte. Sub-5-ms process timing includes
more relative launch noise, as Hyperfine warns.

These are focused `is-match?` throughput probes, not a claim about whole regex
suites. Rebar integration follows once `find`/`count` expose the execution
models its runners require. Raw Hyperfine JSON defaults to
`/tmp/coil-regex-benchmark/{literal,nfa}.json`.
