#!/usr/bin/env python3
"""copychains.py DIS COUNTS : dynamic count of inline copy traffic: runs of loads whose registers are stored again within
the same block without being otherwise used (load->store forwarding of memory to memory), by run length in bytes."""
import re, sys, struct, collections
dis, cp = sys.argv[1:3]
data = open(cp, 'rb').read(); n = struct.unpack('<Q', data[:8])[0]; counts = struct.unpack('<%dQ' % n, data[8:8 + 8 * n])
fns = []; cur = None
for line in open(dis):
    m = re.match(r'^[0-9a-f]+ <(.+)>:$', line.strip())
    if m: cur = (m.group(1).lstrip('_'), []); fns.append(cur); continue
    if cur is not None:
        m = re.match(r'\s*([0-9a-f]+):\s+(\S+)\s*(.*)', line)
        if m: cur[1].append((m.group(1), m.group(2), m.group(3).split(';')[0].strip()))
LOAD = {'ldr': 1, 'ldp': 2, 'ldur': 1}; STORE = {'str': 1, 'stp': 2, 'stur': 1}
def width(r): return 16 if r[0] == 'q' else (8 if r[0] == 'x' else 4)
tot = collections.Counter(); per = collections.Counter(); sizes = collections.Counter()
for name, ins in fns:
    i = 0; c = 0; pending = {}; run = 0; runins = 0
    def flush():
        global run, runins
    for a, op, args in ins + [('0', 'b', '')]:
        pass
    i = 0; blocks = []; cur_block = []
    while i < len(ins):
        a, op, args = ins[i]
        if op in ('mov', 'movz') and args.startswith('x16, #') and i + 5 < len(ins) and ins[i + 2][2].startswith('x16, #0x5000'):
            lo = int(args.split('#')[1].split()[0], 0); mid = int(ins[i + 1][2].split('#')[1].split(',')[0], 0)
            k = (lo | (mid << 16)) // 8
            if cur_block: blocks.append((c, cur_block))
            c = counts[k] if k < n else 0; cur_block = []; i += 6; continue
        cur_block.append((op, args))
        if op in ('b', 'br', 'ret'):
            blocks.append((c, cur_block)); cur_block = []; c = 0
        i += 1
    if cur_block: blocks.append((c, cur_block))
    for c, blk in blocks:
        if not c: continue
        held = {}; nbytes = 0; nins = 0
        for op, args in blk:
            regs = re.findall(r'\b([xwq]\d+)\b', args.split('[')[0])
            if op in LOAD and len(regs) == LOAD[op] and '[' in args:
                for r in regs: held[r[1:] if r[0] != 'q' else r] = (width(r), 1.0 / LOAD[op])
                continue
            if op in STORE and len(regs) == STORE[op] and '[' in args:
                keys = [r[1:] if r[0] != 'q' else r for r in regs]
                if all(k in held for k in keys):
                    for k in set(keys): nbytes += held[k][0]; nins += held[k][1] + 1.0 / STORE[op]; del held[k]
                continue
            # any other use or definition of a held register ends its candidacy
            for r in re.findall(r'\b([xwq]\d+)\b', args):
                held.pop(r[1:] if r[0] != 'q' else r, None)
            if op in ('bl', 'blr'): held.clear()
        if nbytes >= 16:
            tot['bytes'] += nbytes * c; tot['instructions'] += nins * c; per[name] += nins * c
            sizes[min(nbytes // 16 * 16, 256)] += nins * c
print('inline copy traffic: %.2fB load+store instructions, %.1f GB' % (tot['instructions'] / 1e9, tot['bytes'] / 1e9))
print('by block copy bytes (M instructions): ' + '  '.join('%d:%.0f' % (k, v / 1e6) for k, v in sorted(sizes.items())))
for k, v in per.most_common(15): print('  %8.1fM %s' % (v / 1e6, k))
