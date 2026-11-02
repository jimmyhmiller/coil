# Guarded O3 vectorization: provisional compiler measurement

Executable Coil source dca3fff2, standalone library b88da1a. The unchanged
native-stencil workload, 200000 iterations, seed 12345, O3 and no debug, was run
through the existing native benchmark driver. All checksums passed. Five measured
samples follow warmup, with rotated backend order. All optimizer/vectorizer work
is inside the unchanged IR-ready-to-relocatable-object interval.

| Backend | IR to object median ms | Whole compile median ms | Runtime median ms |
| --- | ---: | ---: | ---: |
| LLVM O3 | 25.797 | 216.919 | 363.520 |
| TPDE | 0.127 | 184.528 | 4032.471 |
| stogir O3 | 16.918 | 195.980 | 527.088 |

The active target is at least 5x faster IR-to-machine-code and runtime within
10% of LLVM O3. This run achieves neither (1.52x codegen, 1.45x runtime).
This is provisional: all 17 monitor samples had external CPU activity including
WindowServer, and some included Turbopack or xprotectd. It does not supersede the
accepted frozen baseline. Source/toolchain and workload hashes, samples and load
observations accompany this report as stogir-vector-o3-provisional.*.

Disassembly confirms the stencil vector prefix is present in real compiler
output. It also shows explicit pointer offset additions, vector multiply by two,
and a hot-loop scalar spill. Causality and optimizations require further work;
these observations do not establish which change will close the remaining gap.
Automatic selection currently repeats structural preparation per candidate;
compile-time overhead must be reduced without moving work outside the boundary.

## Repaired selector and shared analysis

Executable Coil source 522f0e5a, library ce54ce6 fixes raw packed-cell traversal
and shares immutable structural facts across rejected candidates. Every successful
edit ends that analysis epoch and rebuilds facts. The emitted object text is
byte-identical to the initial vectorization implementation (7116 bytes,
SHA-256 af45b46f22fe4161d23b1a49e866411bccbf2cc916a96fe3a148845e0a2eba87).

| Backend | IR to object median ms | Whole compile median ms | Runtime median ms |
| --- | ---: | ---: | ---: |
| LLVM O3 | 26.136 | 210.895 | 352.993 |
| TPDE | 0.129 | 184.452 | 4092.043 |
| stogir O3 | 7.939 | 191.774 | 526.162 |

Five measured samples follow warmup with the same fixed workload and timing
boundary. This remains provisional: all 17 load samples had external activity,
including Turbopack and macOS background work. It is not an accepted baseline.
The 3.29x codegen speed and 1.49x runtime both miss the active goal. Exact raw
samples, source/toolchain hashes and load records are in
stogir-vector-fixed-o3-provisional.*.

The repaired candidate passed full FAST 49/49 in 296.2 seconds (cli/objects
1.60 GB warning), restores the existing stogir corpus 6/9 result, and is installed
globally with a matching 132-module SDK. Off-checkout object/link/run smoke tests
pass for LLVM, TPDE and stogir. The initial 0/9 selector regression was caught
before push and fixed in the standalone library; continuation-cell arity metadata
now controls node discovery. See ../validation/stogir-vector-pipeline-installed.json.

Next work: profile remaining codegen overhead and port upstream address fusion
at matching time, updating machine uses before liveness. Scalar fallback, tails,
observable roots and shared addresses must remain correct. No backend fallback
or workload-specific transformation is permitted.
