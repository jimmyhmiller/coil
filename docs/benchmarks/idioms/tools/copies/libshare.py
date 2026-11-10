#!/usr/bin/env python3
"""libshare.py NAME PREFIX... : from sampled runs PREFIX.sample.json + PREFIX.time, the share of self samples in the
libc memory routines and the cycles that share represents (median over runs)."""
import sys, json, re, statistics
name = sys.argv[1]; rows = []
for p in sys.argv[2:]:
    d = json.load(open(p + '.sample.json')); t = open(p + '.time').read()
    cyc = int(re.search(r'(\d+)\s+cycles elapsed', t).group(1)); ins = int(re.search(r'(\d+)\s+instructions retired', t).group(1))
    tot = d['total']; s = d['self_fn']
    def share(k): return s.get('lib:' + k, 0) / tot
    lib = sum(v for k, v in s.items() if k.startswith('lib:')) / tot
    rows.append((cyc, ins, share('_platform_memmove'), share('_platform_memcmp'), share('_platform_memset') + share('__bzero'), lib))
med = [statistics.median(r[i] for r in rows) for i in range(6)]
print('%-6s runs %d  cycles %.2fB  instr %.2fB | memmove %.2f%% (%.0fM cyc)  memcmp %.2f%% (%.0fM)  memset+bzero %.2f%% (%.0fM)  all library %.2f%% (%.2fB)' % (
    name, len(rows), med[0] / 1e9, med[1] / 1e9, med[2] * 100, med[2] * med[0] / 1e6, med[3] * 100, med[3] * med[0] / 1e6, med[4] * 100, med[4] * med[0] / 1e6, med[5] * 100, med[5] * med[0] / 1e9))
