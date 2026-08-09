# GC probes

Instrumented runs that print the real collector counters (`gc-total`,
`gc-collections`, `gc-peak`, `gc-live`). They exist because a benchmark's timing
cannot tell you whether the collector ran at all.

⚠ These are NOT dialect modules — they do not import `coil.scheme`, so the
whole-tree lowering pass leaves their string literals alone. A dialect module
cannot print diagnostics through `coil.io`, because `"total="` would be lowered to
a Val. The Scheme program under test is built against the runtime API directly.

| probe | what it establishes |
|---|---|
| `gcstat.coil` | the bintree shape, with counters — this is what showed `collections=0` |
| `slabs.coil` | flat churn and a rooted live tree both survive many collections |

## What they found

`gcstat.coil` showed the GC benchmarks were allocating 491,490 objects against a
500,000 threshold — `collections=0`. They measured the allocation path and never
ran the collector, while being presented as GC benchmarks.

Scaling them past the threshold then exposed a real defect: bintree SIGSEGVs on
the SECOND collection (survives ~30 rounds, dies by ~70; collections trigger at
~30 and ~61 rounds).

`slabs.coil` localises it. Three million allocations of flat garbage survive 5
collections. A deep tree held through an explicit `gc-root` survives 6 and walks
back correctly (32767 nodes). So the collector, the sweeper and the tracer are all
sound — **when a root exists**.

The failure is that **nothing roots Scheme values**. `heap.coil` documents a
shadow stack and says "the GC transform emits `gc-root`/`gc-sp`/`gc-sp-set!`", but
no such transform was ever written: `gc-root` appears only in heap.coil itself and
in tests. A value living in a Scheme function's frame — `make-tree`'s partially
built subtree — is invisible to the collector and is freed underneath the program.

That is the GC pillar, unfinished. It is not a bug in the collector.
