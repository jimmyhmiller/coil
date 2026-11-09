"""Print one function's disassembly with exact per-instruction execution counts.
usage: annot.py DIS COUNTS FUNCTION [MIN]  (MIN: hide blocks below this count)"""
import re, sys, struct, collections
dis, cp, want = sys.argv[1:4]; mn = float(sys.argv[4]) if len(sys.argv) > 4 else 0
data = open(cp, 'rb').read(); n = struct.unpack('<Q', data[:8])[0]; counts = struct.unpack('<%dQ' % n, data[8:8 + 8 * n])
ins = []; on = False
for line in open(dis):
    m = re.match(r'^[0-9a-f]+ <(.+)>:$', line.strip())
    if m: on = m.group(1).lstrip('_') == want; continue
    if on:
        m = re.match(r'\s*([0-9a-f]+):\s+(\S+)\s*(.*)', line)
        if m: ins.append((m.group(1), m.group(2), m.group(3).split(';')[0].strip()))
i = 0; cur = 0; shown = 0; total = 0
while i < len(ins):
    a, op, args = ins[i]
    if op in ('mov', 'movz') and args.startswith('x16, #') and i + 5 < len(ins) and ins[i + 2][2].startswith('x16, #0x5000'):
        lo = int(args.split('#')[1].split()[0], 0); mid = int(ins[i + 1][2].split('#')[1].split(',')[0], 0)
        cur = counts[(lo | (mid << 16)) // 8] if (lo | (mid << 16)) // 8 < n else 0
        if cur >= mn: print('---- block x%d' % cur)
        i += 6; continue
    if cur >= mn: print('%12d  %s  %-6s %s' % (cur, a[-5:], op, args[:70]))
    total += cur
    if op in ('b', 'br', 'ret'): cur = 0
    i += 1
print('total %.3fB' % (total / 1e9))
