# Constant bulk expansion: full compiler checkpoint

Frozen source/candidate 979be2f9, standalone policy 0d6d545. Generic constant
copy/move/zero expansion budget is 128 bytes instead of 64; existing scalar
memory promotion and target pipeline remain. Central licenses/provenance remain.
Source SDK digest: 35de146795177f09d438a1e50e6cac17fcc5734c3a902da219418f438e7ed2c5.

The 96-byte read-only projection drops two copy loops and reaches LLVM-like
runtime. The eight-size sweep compares 64/128/512 budgets: 128 has unchanged
local generation cost, while 512 costs 19.84% more. Guarded-page, overlap,
calls/spills/dynamic-frame and memory-promotion oracles pass with debug checks
and AddressSanitizer. Expanded 512-byte pressure fixtures initially exceeded
their old storage bounds; the corrected fixtures pass. See raw sweep evidence
in results/bulk-expansion-sweep and standalone docs/BULK_EXPANSION.md.

Same complete compiler source for LLVM O3 and Stogir O3. State/cache off,
serial, no debug, established instrumented IR-codegen boundary. One excluded
warmup and two alternating full samples for generation and generated hosts.
Source SDK digest checked before/after every emission. Generated hosts have
matching library prefixes and official-format source stamps.

| Metric | Stogir O3 | LLVM O3 |
|---|---:|---:|
| Seed IR-to-machine generation s | 11.4776585 | 34.9241835 |
| Generated compiler wall s | 44.0902451 | 19.1392318 |
| Generated compiler CPU s | 43.7588650 | 18.5994145 |
| Generated-host reported IR-codegen wall s | 28.1126585 | 10.7807880 |
| Compiler object bytes | 14480992 | 8482288 |
| Seed compile peak process RSS bytes | 4818796544 | 4412456960 |

Generation is 3.0428x faster; generated compiler runtime is 2.3037x slower.
Targets on this workload are generation <=6.9848367 s and runtime <=21.0531549 s.
Both remain unmet. Two samples are a diagnostic checkpoint, not acceptance.
Peak RSS covers the complete compile, not a separately isolated backend phase.
The prior full comparison used different compiler source; do not claim a
controlled before/after percentage improvement from those absolute timings.

All seed Stogir and generated-host output objects match SHA256
fef9140aaa0f202bc56686547d1adfc80fc55e644e9827cb611fa608d9844145.
LLVM outputs are stable across repeated samples. Source/object identities,
commands, samples and host snapshots are archived in results/bulk-128-bootstrap.

At this checkpoint: source/evidence committed; FAST is being run. Not globally
installed or pushed yet. Production remains 088de286 until validation/delivery.
Full 5x generation and within 10% bootstrap runtime goal remains active/unmet.
