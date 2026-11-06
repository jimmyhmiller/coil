# Direct callee GP results: first compiler checkpoint

Librarybd70222, compiler575c03d4; test-only correctionf3b1d7ca. Candidate build,
quick34.8s and extended emission smoke with25linked C pair-return inputs pass.
Full FAST not run, no push/global installation. SDK digest
5252807a876132f303ec271c758ffa94762d2e347f182a16532b9f93740ea3be.

Four rotating generation/sixteen child-CPU samples after warmups, same current
source, serial O3/no debug, caches/library-state off, common LLVM O3 opaque caller.
Caller repeats verifier4096times/preparation1024times; raw totals are not directly
comparable with previous128/32call tables. No task build/test overlapped timing.
Runtime-round process snapshots and raw sources/hashes/samples are archived.

| Workload | Backend | IR generation ms | Child CPU ms | Object bytes |
|---|---|---:|---:|---:|
| verify4096 | before36b5cff6 | 83.7935 | 676.4710 | 83275 |
| verify4096 | direct575c03d4 | 83.4525 | 678.1840 | 83259 |
| verify4096 | LLVM O3 | 329.8580 | 225.7755 | 39880 |
| prepare1024 | before36b5cff6 | 93.4240 | 594.1270 | 93167 |
| prepare1024 | direct575c03d4 | 94.5040 | 595.3235 | 92991 |
| prepare1024 | LLVM O3 | 335.6975 | 230.1180 | 56032 |

Runtime is neutral (+0.25%/+0.20%); no speedup established. No new full bootstrap.
The actual Graph.operand loses all SP traffic but shrinks only64→60instructions,
versus LLVM24. Its final payload/tag registers are reversed, adding a three-move
parallel swap on every return. Correct SSA lowering reached the real helper;
missing result-register preferences partly offset the memory-traffic reduction.
Next refinement is advisory GP result hints through the existing legal allocator
preference mechanism, with duplicate/shared values handled without hard conflicts.
This observation is not a quantified bootstrap-performance claim.
