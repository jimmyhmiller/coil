# Inline policy exploration (November 8, 2026)

Coil source for every host: `stogir/branch-fusion` d1efe960 (the workload is
each host emitting that compiler with default Stogir O3). One candidate
(`stogir/inline-policy`) builds every host; `COIL_STOGIR_INLINE` selects the
policy (see `inline-settings` in `codegen_stogir.coil`). With it unset the
candidate emits the same object as before (9d775276). In both A/B runs every
host emitted the identical compiler object.

Host load was 20–180 during these runs. Differences under ~2% are noise.

## Runtime (matched hosts, `ab.py`, min cycles)

Round 1 (3 rounds), `results/ab-round1.log`:

| policy | settings | min cycles | vs default | instructions |
|---|---|---:|---:|---:|
| default | | 61.81B | | 221.7B |
| small40loop | small=40 | 59.56B | -3.6% | 217.7B |
| small40any | small=40,small-scope=any | 59.51B | -3.7% | 217.0B |
| small80any | small=80,small-scope=any | 58.89B | -4.7% | 215.5B |
| small128any | small=128,small-scope=any | 59.37B | -3.9% | 215.7B |
| indirect | indirect=1 | 62.08B | +0.4% | 221.0B |
| pair | pair=1 | 65.61B | +6.1% | 226.4B |
| indpair | indirect=1,pair=1 | 66.92B | +8.3% | 227.2B |
| budget1024 | budget=1024 | 60.82B | -1.6% | 219.3B |
| budget2048 | budget=2048 | 61.81B | 0.0% | 219.9B |
| tpl1024 | template=1024,budget=1024 | 60.12B | -2.7% | 219.4B |
| combo80 | small=80,any,indirect,pair | 62.14B | +0.5% | 224.0B |
| wide | budget=2048,template=1024,small=128,any,indirect,pair | 65.03B | +5.2% | 228.8B |

Round 2 (5 rounds), `results/ab-round2.log`:

| policy | min cycles | vs default | median | instructions |
|---|---:|---:|---:|---:|
| default | 60.73B | | 62.23B | 221.2B |
| s80always (small=80,any,always=1) | 58.24B | -4.1% | 62.19B | 215.3B |
| small80any | 58.57B | -3.6% | 61.16B | 215.1B |
| s80tpl (small=80,any,template=1024) | 59.08B | -2.7% | 59.59B | 214.9B |
| s64any | 59.58B | -1.9% | 60.32B | 215.5B |
| small40loop | 59.59B | -1.9% | 59.95B | 217.3B |
| always | 59.80B | -1.5% | 60.33B | 219.7B |
| s80indirect | 60.85B | +0.2% | 62.10B | 214.6B |

## Generation (`tools/genpolicy.py`, 3 rounds, min; load 20–145)

default 7.11 s; always 7.27 s (+2%); small40loop 7.68 s (+8%); small80any
8.13 s (+14%); s80tpl 8.22 s (+16%); s80always 8.26 s (+16%); pair 9.24 s (+30%).

## What was learned

- Uncharged small callees (about 80 cells, any site) are the best single
  setting: about 3–4% fewer cycles and 2.8% fewer instructions.
- `pair` (callees whose nested calls return two registers, which unblocks
  `alloc`, `reserve!` and the scratch allocator's slow paths) is 6% slower.
  Allocation counts, bytes and peak RSS are identical, so the loss is code
  shape: cold slow paths get inlined into small hot functions.
  `coil.scratch.bump` goes from saving 2 callee-saved registers to all 10 on
  every call, and returns its result through memory, because its new-segment
  path was inlined. Stogir builds the whole frame on entry (no
  shrink-wrapping) and does not split around cold code, so every call pays.
  `resolve.primitive-providers-in` takes 3.6x the samples.
- Stack-load classification of the small80any host (frame-map audit): stack
  objects fall from 4.5% to 3.7% of samples and frame-record reloads from
  2.3% to 1.4%, but spill reloads rise from 3.9% to 4.4% and callee-saved
  restores from 1.4% to 1.7%. Inlining removes call and struct traffic and
  hands it back as register pressure.
- Inlining more is limited by the allocator and frame code. Shrink-wrapping
  and splitting around cold calls are what would let the larger policies
  (pair, always, bigger templates) pay off; they stay available as settings
  to re-measure afterwards.

## Layered options (later rounds)

New settings: `small-leaf=1` (the small-callee exemption only for callees
without calls), `always=1` (honor `:inline (Always)`), and
`COIL_STOGIR_SHRINK_WRAP=1` (a64.shrink-wrap: build the frame only on paths
that leave the frameless entry region; the allocator is re-run with late
preserved-register assignment only for functions where x19..x28 alone block
the region). Every A/B host emitted the identical compiler object; every
shrink-wrapped host passes `tools/framecheck.py` (no frame-state fault in any
Stogir-compiled function) and reproduces the default object when it compiles
the compiler.

Runtime, min cycles vs the same round's default (5 rounds each;
`results/ab-hp3.log`, `ab-hp9.log`, `ab-hp10.log`). Generation from
`tools/genenv.py` (3 rounds, min, load about 10). Noise about 2%.

| setting | runtime | generation |
|---|---:|---:|
| always=1 | -1.5%, 0.0% | +0.5% |
| shrink-wrap | -2.3%, -1.1% | +4.5% |
| always + shrink-wrap | -0.7% | +6.1% |
| leaf40 (small=40,any,leaf) | -4.1% | +2.5% |
| **leaf80 (small=80,any,leaf)** | **-4.0%, -5.2%** | **+3.9%** |
| leaf80 + always | -5.9% | +8.5% |
| leaf40 + always + shrink-wrap | -5.0% | +9.5% |
| leaf256 | -5.0%, -4.8% | +9.4% |
| leaf256 + shrink-wrap | -4.4% | +15.9% |
| small80any + shrink-wrap | -4.6% | +17.0% |
| leaf256 + always + shrink-wrap | -5.0% | +24.9% |
| pair + shrink-wrap | +5.4% | |

- Leaf-only beats the plain exemption: the callees that hurt were those that
  bring calls (and a frame) into their callers.
- Shrink-wrapping helps alone (about 800 more functions skip the entry frame,
  e.g. coil.scratch.bump's early exit) but does not add to inlining, and it
  does not rescue `pair`: inlined slow paths still raise register pressure
  inside hot loops, not only at entry.
- Sweet spot: leaf80, about 4-5% fewer cycles for about 4% generation. That
  is inside the current 5x margin (5.09-5.31x) only just.

## Function-level comparison and the next round

Comparing actual output (scratchpad tools, see the pad): on the 2,486 functions
whose boundaries and callee sets are identical in both hosts, Stogir takes
0.85x LLVM's samples at 1.06x the code. The gap is in code that inlining
changes. Where the pair host inlines exactly what LLVM inlines (353
functions), Stogir's code was 2x larger and 2.85x slower. ArrayList push!
showed three systemic defects: inlined callees' frame objects in dynamic stack
scopes (anchored frames, runtime SP changes, no mem2ssa); two-register results
through memory; exhaustive enum matches with an extra compare and a dead brk.

New settings: `COIL_STOGIR_INLINE=...,hoist=1` (inlined frame objects join the
caller's static frame; dynamic-SP functions 1,384 -> 22) and
`COIL_STOGIR_PRUNE_DEFAULT=1` (9,112 -> 143 two-way match sites; instructions
-0.45%, cycles unchanged).

Rounds `results/ab-hp11.log` and `ab-hp12.log` (min cycles vs that round's
default): hoist -0.5%; leaf80 + hoist -2.1%; small80any + hoist -2.1% to
-2.7%; with prune -3.0%; pair + hoist +4.6% (still worse: in
primitive-providers-in the outer loop counter and six or seven loop-invariant
values are reloaded from the stack on every inner iteration). Generation
(min / median): hoist +5.9% / +2.2%, leaf80 + hoist +5.9% / +0.3%,
small80any + hoist +18.7% / +11.9%.

## Loop-aware allocation (round hp14/hp15)

Allocation dump of resolve.primitive-providers-in (default host): in its
innermost loop (depth 4, two calls) three preserved registers held values
with no use in the loop for the whole loop, while four values the loop uses
moved between caller-saved registers, preserved registers and the stack around
each call and back on every back edge. Linear scan gives registers in start
order, so early long-lived values keep the preserved registers.

New settings: `COIL_STOGIR_LOOP_EVICT=1` (allocation.cold-owner: a value used
in a loop that no free register can carry through it takes a preserved
register from a holder unused in the rest of that loop, which is spilled
around the loop; spill-weight eviction after LLVM's greedy allocator) and
`COIL_STOGIR_LOOP_RELOAD=1` (reload-cut: a spilled value used inside a loop
the spill is not in reloads at the loop entry). Loop eviction alone: register
moves -6.1% (13.7K), instructions -1.5%.

Against the goals (baseline about 1.31x LLVM runtime, 5.09-5.31x generation;
runtime from min cycles vs the same round's default, noise about 2%):

| setting | runtime | generation |
|---|---:|---:|
| evict + reload | ~1.28x | -1.6% (~5.2-5.4x) |
| pair + hoist + evict | ~1.26-1.29x (was 1.37x without evict) | high |
| leaf80 + hoist + evict | ~1.25x | +5.9% (~4.8-5.0x) |
| small80 + hoist + evict + reload | ~1.24-1.26x | +18% (~4.3-4.5x) |
| everything (incl. pair, always, shrink-wrap, prune) | ~1.25-1.29x | high |

## Exact instruction comparison and the 10% push (hp16-hp18)

New measurement: exact dynamic instruction counts for both hosts. Stogir
hosts use COIL_STOGIR_BBCOUNT (scratch worktree stogir-ra-audit); the LLVM
host is rebuilt from `coil emit-ir` with `opt -passes='default<O3>'` + llc
(reproduces the real LLVM host: 139.8B vs 139.9B instructions, same output)
with the same six-instruction counter inserted per IR block as inline asm.
Tools in stogir-ra-audit `build/bbcount/` (mixdump, fold, annot, taken,
checks, stackcls, predeval).

Counted code, base config (small80+hoist+evict+reload) vs LLVM O3:

| | Stogir | LLVM |
|---|---:|---:|
| instructions (counted) | 191.0B | 118.1B |
| basic blocks executed | 43.2B | 25.0B |
| taken branches (lower bound) | 20.0B | 8.8B |
| loads incl. stack (accesses) | 41.7B | 28.5B |
| stack loads: spill reloads / cs restores / locals | 8.3 / 5.2 / 3.4B | ~7B total |
| branches to a trap (bounds checks) | 3.19B | 0.10B |

- In functions both binaries define, Stogir executes 119.5B vs LLVM 114.8B
  (LLVM's figure includes what it inlined). The gap is the 71.5B Stogir runs
  in callees LLVM inlined away; per function (folded) everything is
  1.3-2.9x, no single hot spot.
- primitive-providers-in alone holds 2.4B of the 8.3B spill reloads: values
  evicted for a rarely entered inner loop are reloaded at its exit on every
  outer iteration. LLVM keeps them in registers and spills the inner values.

Results (min cycles vs that round's base; noise ~1%, load was high):

| setting | runtime | generation |
|---|---:|---:|
| profile-guided layout (diagnostic bound, not an option) | -3.5% to -3.9% | |
| COIL_STOGIR_PREDICT=1 (static branch prediction) | -0.5% to -0.9% | +0.5% |
| COIL_STOGIR_CALL_HOLES=1 | worse (+0.7B/+1.3B instructions) | |
| COIL_STOGIR_ROTATE=1 (IR loop rotation) | -0.7% / +0.9% (neutral) | +31% |
| rotate + call-holes | +2% to +4% | |

Taken branches: base 20.0B, predict 17.9B, profile layout 14.1B, LLVM >= 8.8B.
Rotation is correct (identical self-compiled object) but does not fix the
primitive-providers-in reloads: linear scan still evicts at the inner values'
start, which is before the new guard. That needs region splitting with
frequencies (LLVM greedy), not a split-position tweak.
