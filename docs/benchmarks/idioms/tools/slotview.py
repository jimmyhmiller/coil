"""slotview.py TRACE OPCODES SPILLTXT FUNCTION [MINM] : join per-slot dynamic counts with the allocation trace.
For each hot slot of FUNCTION print the owning value, where it is defined/used (position@depth) and its parts."""
import sys, re, collections, bisect
trace, opc, sptxt, fn = sys.argv[1:5]; minm = float(sys.argv[5]) if len(sys.argv) > 5 else 5.0
names = {int(m.group(1)): m.group(2) for m in re.finditer(r'\((\d+) "([A-Z_0-9a-z]+)"\)', open(opc).read())}
nodes = []; alias = {}; parts = {}; cur = None; blocks = []
for line in open(trace, errors='replace'):
    f = line.split()
    if len(f) < 2 or f[0] != 'ra-snapshot': continue
    k = f[1]
    if k == 'node': nodes.append([int(x) for x in f[2:]])
    elif k == 'alias': alias[int(f[2])] = int(f[3])
    elif k == 'block': blocks.append([int(x) for x in f[2:]])
    elif k == 'parts': cur = f[2]; parts[cur] = {}
    elif k == 'part': parts[cur][int(f[2])] = dict(parent=int(f[3]), reg=int(f[5]), slot=int(f[6]), ranges=[], uses=[])
    elif k == 'range': parts[cur][int(f[2])]['ranges'].append((int(f[3]), int(f[4])))
    elif k == 'use': parts[cur][int(f[2])]['uses'].append((int(f[3]), int(f[4]), int(f[5])))
starts = [b[0] for b in blocks]
def depth(pos):
    i = bisect.bisect_right(starts, pos) - 1
    return blocks[i][2] if i >= 0 else -1
defpos = {}; 
for pos, ref, header, a, b, c in nodes: defpos[ref] = (pos, names.get(header & 0xff, header & 0xff))
members = collections.defaultdict(list)
for r, o in alias.items(): members[o].append(r)
slots = {}
on = False
for line in open(sptxt):
    if not line.startswith(' '): on = line.split()[0] == fn; continue
    m = re.match(r'\s+\[sp,#0x([0-9a-f]+)\] loopL\s+([\d.]+)M loopS\s+([\d.]+)M allL\s+([\d.]+)M allS\s+([\d.]+)M', line)
    if on and m: slots[int(m.group(1), 16)] = tuple(float(x) for x in m.groups()[1:])
out = parts['output']; inp = parts['input']
def loc(p): return ('x%d' % p['reg'] if p['reg'] < 32 else 'v%d' % (p['reg'] - 32)) if p['reg'] >= 0 else 'slot%d' % p['slot']
byslot = collections.defaultdict(set)
for i, p in out.items():
    if p['slot'] >= 0 and p['parent'] >= 0: byslot[p['slot']].add(p['parent'])
for off, (ll, ls, al, as_) in sorted(slots.items(), key=lambda kv: -(kv[1][0] + kv[1][1])):
    if ll + ls < minm: continue
    print('[sp,#0x%x]=slot%d loopL %.1fM loopS %.1fM allL %.1fM allS %.1fM' % (off, off, ll, ls, al, as_))
    for parent in sorted(byslot.get(off, [])):
        refs = [parent] + members.get(parent, [])
        print('   value r%d %s' % (parent, ' '.join('r%d:%s@%d/d%d' % (r, defpos[r][1], defpos[r][0], depth(defpos[r][0])) for r in refs if r in defpos)))
        uses = sorted(set(u for p in inp.values() if p['parent'] == parent for u in p['uses']))
        print('     uses ' + ' '.join('%d%s/d%d' % (u[0], '' if u[1] == 1 else ('s' if u[1] == 0 else 'f%d' % u[2]), depth(u[0])) for u in uses))
        ps = sorted((p['ranges'][0][0], i, p) for i, p in out.items() if p['parent'] == parent and p['ranges'])
        print('     parts ' + ' | '.join('%s%s' % (loc(p), ''.join('[%d,%d)' % r for r in p['ranges'][:5]) + ('..' if len(p['ranges']) > 5 else '')) for _, i, p in ps))
        for _, i, p in ps:
            if p['reg'] < 0:
                s = p['ranges'][0][0]
                print('     -> slot at %d (depth %d)' % (s, depth(s)))
