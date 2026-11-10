#!/usr/bin/env python3
"""dyn.py DIS COUNTS [pattern-regex] : dynamic totals from an instrumented host (stores, loads, calls, divides, libc
calls, by-value argument copy loop iterations); with a regex, the hottest instructions whose 'op args' match it."""
import re, sys, struct, collections
dis, cp = sys.argv[1:3]; pat = re.compile(sys.argv[3]) if len(sys.argv) > 3 else None
data = open(cp, 'rb').read(); n = struct.unpack('<Q', data[:8])[0]; counts = struct.unpack('<%dQ' % n, data[8:8 + 8 * n])
fns = []; cur = None
for line in open(dis):
    s = line.strip()
    m = re.match(r'^[0-9a-f]+ <(.+)>:$', s)
    if m: cur = (m.group(1).lstrip('_'), []); fns.append(cur); continue
    if cur is not None:
        m = re.match(r'\s*([0-9a-f]+):\s+(\S+)\s*(.*)', line)
        if m: cur[1].append((m.group(1), m.group(2), m.group(3)))
tot = collections.Counter(); hot = []; perfn = collections.Counter()
STORE = ('str', 'strb', 'strh', 'stur', 'sturb', 'sturh', 'stp'); LOAD = ('ldr', 'ldrb', 'ldrh', 'ldrsb', 'ldrsh', 'ldrsw', 'ldur', 'ldurb', 'ldurh', 'ldursw', 'ldursb', 'ldursh', 'ldp')
for name, ins in fns:
    i = 0; c = 0
    while i < len(ins):
        a, op, args = ins[i]
        if op in ('mov', 'movz') and args.startswith('x16, #') and i + 5 < len(ins) and ins[i + 2][2].startswith('x16, #0x5000'):
            lo = int(args.split('#')[1].split()[0], 0); mid = int(ins[i + 1][2].split('#')[1].split(',')[0], 0)
            k = (lo | (mid << 16)) // 8; c = counts[k] if k < n else 0
            i += 6; continue
        tot['instructions'] += c
        if op in STORE:
            tot['stores'] += c
            if re.match(r'[wx]zr,', args): tot['store zero'] += c
            if re.match(r'q\d+', args): tot['vector stores'] += c
        if op in LOAD:
            tot['loads'] += c
            if re.match(r'q\d+', args): tot['vector loads'] += c
        if op in ('bl', 'blr'): tot['calls'] += c
        if op == 'bl':
            m = re.search(r'symbol stub for: _(\w+)', args)
            if m and m.group(1) in ('memmove', 'memcpy', 'memset', 'memcmp', 'bzero', 'memset_pattern16'): tot['bl ' + m.group(1)] += c
        if op in ('sdiv', 'udiv'): tot['divides'] += c
        if op in ('smulh', 'umulh', 'smull', 'umull'): tot['multiply-high/long'] += c
        if op.startswith('b.') or op in ('cbz', 'cbnz', 'tbz', 'tbnz'): tot['conditional branches'] += c
        if op == 'subs' and args.startswith('x30, x30, #0x1'): tot['argument copy loop iterations'] += c; perfn[name] += c
        if pat and pat.search(op + ' ' + args): hot.append((c, name, a, op, args))
        if op in ('b', 'br', 'ret'): c = 0
        i += 1
for k, v in sorted(tot.items()): print('%-34s %10.3fM' % (k, v / 1e6))
if perfn:
    print('argument copy loops by function:')
    for k, v in perfn.most_common(12): print('  %9.2fM %s' % (v / 1e6, k))
if pat:
    hot.sort(reverse=True); print('matching total %.3fM' % (sum(h[0] for h in hot) / 1e6))
    for c, name, a, op, args in hot[:40]: print('%12d %s %s  %s %s' % (c, name[:60], a[-6:], op, args[:50]))
