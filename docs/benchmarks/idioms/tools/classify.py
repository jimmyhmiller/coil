"""classify.py OPCODES SPILLTXT TRACEDIR [MINM] : class each hot spill slot of every traced function.
classes: call   - the value moves to its slot at a CALL inside a loop (no preserved register for it there)
         loopv  - the value is defined in a loop and moved to its slot inside that loop away from a call
         outer  - defined outside, register-used in a loop, evicted there (reload per iteration or per entry)
         soft   - no register use in any loop after eviction: read from the slot by soft uses / Phi copies"""
import sys, re, collections, bisect, os
opc, sptxt, tdir = sys.argv[1:4]; minm = float(sys.argv[4]) if len(sys.argv) > 4 else 2.0
names = {int(m.group(1)): m.group(2) for m in re.finditer(r'\((\d+) "([A-Z_0-9a-z]+)"\)', open(opc).read())}
allslots = collections.defaultdict(dict); fn = None
for line in open(sptxt):
    if not line.startswith(' '): fn = line.split()[0]; continue
    m = re.match(r'\s+\[sp,#0x([0-9a-f]+)\] loopL\s+([\d.]+)M loopS\s+([\d.]+)M', line)
    if m and fn: allslots[fn][int(m.group(1), 16)] = (float(m.group(2)), float(m.group(3)))
T = collections.Counter(); EX = collections.defaultdict(list); covered = 0.0
for f in sorted(os.listdir(tdir)):
    if not f.endswith('.trace'): continue
    fn = f[:-6]; nodes = []; alias = {}; parts = {}; cur = None; blocks = []
    for line in open(os.path.join(tdir, f), errors='replace'):
        w = line.split()
        if len(w) < 2 or w[0] != 'ra-snapshot': continue
        k = w[1]
        if k == 'node': nodes.append([int(x) for x in w[2:]])
        elif k == 'alias': alias[int(w[2])] = int(w[3])
        elif k == 'block': blocks.append([int(x) for x in w[2:]])
        elif k == 'parts': cur = w[2]; parts[cur] = {}
        elif k == 'part': parts[cur][int(w[2])] = dict(parent=int(w[3]), reg=int(w[5]), slot=int(w[6]), ranges=[], uses=[])
        elif k == 'range': parts[cur][int(w[2])]['ranges'].append((int(w[3]), int(w[4])))
        elif k == 'use': parts[cur][int(w[2])]['uses'].append((int(w[3]), int(w[4])))
    if 'output' not in parts: continue
    starts = [b[0] for b in blocks]
    def depth(pos):
        i = bisect.bisect_right(starts, pos) - 1
        return blocks[i][2] if i >= 0 else 0
    def bat(pos):
        i = bisect.bisect_right(starts, pos) - 1
        return i if i >= 0 and pos < blocks[i][1] else -1
    def outer(h):
        d = blocks[h][2]; c = blocks[h][4]; left = len(blocks)
        while left > 0 and blocks[c][2] >= d: c = blocks[blocks[c][3]][4]; left -= 1
        return -1 if left == 0 or blocks[c][2] == 0 else blocks[c][3]
    def shared(a, b):
        x = bat(a); y = bat(b)
        if x < 0 or y < 0: return 0
        la = blocks[x][3] if blocks[x][2] > 0 else -1; lb = blocks[y][3] if blocks[y][2] > 0 else -1
        while la >= 0 and lb >= 0 and la != lb:
            da = blocks[la][2]; db = blocks[lb][2]
            if da >= db: la = outer(la)
            if db >= da: lb = outer(lb)
        return blocks[la][2] if la >= 0 and la == lb else 0
    opat = {n[0]: names.get(n[2] & 0xff, '?') for n in nodes}
    defpos = {n[1]: n[0] for n in nodes}
    out = parts['output']; inp = parts['input']
    byslot = collections.defaultdict(set)
    for p in out.values():
        if p['slot'] >= 0 and p['parent'] >= 0 and p['reg'] < 0 and p['ranges']: byslot[p['slot']].add(p['parent'])
    for off, (ll, ls) in allslots.get(fn, {}).items():
        if ll + ls < minm: continue
        owners = byslot.get(off, set())
        if not owners: T['unknown'] += ll + ls; continue
        covered += ll + ls
        best = None
        for parent in owners:
            sl = sorted(p['ranges'][0][0] for p in out.values() if p['parent'] == parent and p['reg'] < 0 and p['ranges'])
            uses = sorted(set(u for p in inp.values() if p['parent'] == parent for u in p['uses']))
            dp = defpos.get(parent, 0)
            hot = [x for x in sl if depth(x) > 0]
            if not hot: c = 'soft'
            else:
                x = max(hot, key=depth)
                anchor = max([shared(dp, x)] + [shared(u, x) for u, k in uses if k >= 1])
                call = x % 2 == 1 and opat.get(x - 1) in ('CALL', 'TAILCALL')
                if anchor < depth(x): c = 'inside-unused'
                elif call: c = 'call'
                elif shared(dp, x) == depth(x): c = 'loopv'
                else: c = 'outer'
            best = c if best is None else best
        T[best] += ll + ls; EX[best].append((ll + ls, fn, off))
print('classified %.0fM of loop spill traffic in traced functions' % covered)
for c, v in T.most_common():
    print('%-8s %8.1fM   e.g. %s' % (c, v, '; '.join('%s [sp,#0x%x] %.0fM' % (f.split('.')[-1], o, m) for m, f, o in sorted(EX[c], reverse=True)[:3])))
