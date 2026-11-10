"""spill.py (derived from memclass.py) DIS COUNTS [OUT.json] : exact dynamic counts of executed loads and stores by class.

Classes (a pair instruction counts as two accesses):
  cs-save / cs-restore   callee-saved registers (x19-x30, d8-d15) stored/loaded sp-relative in a
                         prologue/epilogue run (run touches x29/x30, starts the function, or ends in ret/b/br)
  stack-agg              sp/x29-relative access to a slot inside an address-taken stack range of the function
                         (add xN, sp, #K seen with K <= offset < next boundary): locals, sret buffers, copies
  stack-spill            other sp/x29-relative accesses (spill stores, reloads, outgoing stack arguments)
  global                 access through an adrp-materialised page (previous instruction adrp of the base)
  x8-result              store through x8 (indirect struct result)
  ptr                    everything else: field/array access through a pointer
Sub-totals: zero = stores of wzr/xzr; vec = q/d/s register accesses (bulk copies, FP).
"""
import re, sys, struct, collections, json
dis, cp = sys.argv[1:3]
data = open(cp, 'rb').read(); n = struct.unpack('<Q', data[:8])[0]; counts = struct.unpack('<%dQ' % n, data[8:8 + 8 * n])
fns = []; fn = None; ins = []
for line in open(dis):
    s = line.strip()
    m = re.match(r'^[0-9a-f]+ <(.+)>:$', s)
    if m:
        if fn: fns.append((fn, ins))
        fn = m.group(1).lstrip('_'); ins = []; continue
    m = re.match(r'\s*[0-9a-f]+:\s+(\S+)\s*(.*)', line)
    if m: ins.append((m.group(1), m.group(2).split(';')[0].strip()))
if fn: fns.append((fn, ins))
def counter_at(ins, i):
    op, a = ins[i]
    if op in ('mov', 'movz') and a.startswith('x16, #') and i + 5 < len(ins) and ins[i + 1][0] == 'movk' and ins[i + 2][0] == 'movk' and ins[i + 2][1].startswith('x16, #0x5000, lsl #32') and ins[i + 3] == ('ldr', 'x17, [x16]'):
        lo = int(a.split('#')[1].split()[0], 0); mid = int(ins[i + 1][1].split('#')[1].split(',')[0], 0); return (lo | (mid << 16)) // 8
    return None
copies = collections.Counter()
for f, ins in fns:
    i = 0
    while i < len(ins):
        k = counter_at(ins, i)
        if k is not None: copies[k] += 1; i += 6
        else: i += 1
LOADS = {'ldr', 'ldp', 'ldrb', 'ldrh', 'ldrsw', 'ldrsb', 'ldrsh', 'ldur', 'ldurb', 'ldurh', 'ldursw', 'ldursb', 'ldursh', 'ldpsw'}
STORES = {'str', 'stp', 'strb', 'strh', 'stur', 'sturb', 'sturh'}
CS = set(['x%d' % i for i in range(19, 31)] + ['d%d' % i for i in range(8, 16)])
def parse(op, a):
    """-> (regs, base, offset or None, writeback)"""
    m = re.match(r'(.*?)\[([^\]]*)\](.*)', a)
    if not m: return None
    regs = [x.strip() for x in m.group(1).split(',') if x.strip()]
    inner = [x.strip() for x in m.group(2).split(',')]
    base = inner[0]; off = 0
    if len(inner) > 1:
        off = int(inner[1][1:], 0) if inner[1].startswith('#') else None
    wb = m.group(3).strip()
    return regs, base, off, wb != ''
G = [0.0] * 5; FN = []; INST = collections.defaultdict(list); T = collections.Counter(); PF = collections.defaultdict(collections.Counter); total = 0.0
for f, ins in fns:
    st = []; cur = None; i = 0; pend = []
    while i < len(ins):
        k = counter_at(ins, i)
        if k is not None:
            cur = (counts[k] if k < n else 0) / copies[k]
            for q in pend: st[q] = (st[q][0], st[q][1], cur)
            pend = []; i += 6; continue
        op, a = ins[i]
        if op != 'udf' and not op.startswith('.'):
            st.append((op, a, cur if cur is not None else 0.0))
            if cur is None: pend.append(len(st) - 1)
        if op in ('b', 'br', 'ret'): cur = 0.0
        i += 1
    # address-taken stack offsets
    taken = set()
    for op, a, c in st:
        m = re.match(r'[x]\d+, (sp|x29)(?:, #(0x[0-9a-f]+|\d+))?$', a)
        if op in ('add', 'mov') and m and not a.startswith('x29'):
            taken.add((m.group(1), int(m.group(2), 0) if m.group(2) else 0))
    # every sp-relative offset used as spill (for boundary finding): gather all offsets
    def is_frame(j, store):
        op, a, c = st[j]
        if op not in (STORES if store else LOADS): return False
        p = parse(op, a)
        return bool(p and p[1] == 'sp' and all(r in CS for r in p[0]))
    kind = {}
    j = 0
    while j < len(st):
        for store in (True, False):
            if is_frame(j, store):
                k = j; has_lr = False
                while k < len(st) and (is_frame(k, store) or st[k][0] in ('pacibsp', 'autibsp') or (st[k][0] in ('add', 'sub', 'mov') and (st[k][1].startswith('sp,') or st[k][1].startswith('x29,')))):
                    if is_frame(k, store) and any(r in ('x29', 'x30') for r in parse(*st[k][:2])[0]): has_lr = True
                    k += 1
                ok = has_lr or (store and all(st[q][0] in ('sub', 'pacibsp') for q in range(j))) or (not store and k < len(st) and st[k][0] in ('ret', 'b', 'br', 'retab'))
                if ok:
                    for q in range(j, k):
                        if is_frame(q, store): kind[q] = 'cs-save' if store else 'cs-restore'
                j = k - 1
                break
        j += 1
    tk = sorted(taken)
    # extent of the address-taken zone: highest taken offset, rounded to 16, extended over slots that are
    # accessed with sub-word or vector registers or as the second half of a pair starting inside the zone
    aggtop = {}
    for b, K in tk: aggtop[b] = max(aggtop.get(b, 0), (K + 8 + 15) & ~15)
    grown = True
    while grown:
        grown = False
        for op, a, c in st:
            if op in LOADS or op in STORES:
                p = parse(op, a)
                if p and p[1] in aggtop and p[2] is not None and not p[3] and not all(r in CS for r in p[0]):
                    width = 16 if p[0][0][0] == 'q' else (4 if p[0][0][0] in 'ws' else 8)
                    end = p[2] + width * len(p[0])
                    if p[2] < aggtop[p[1]] < end or (p[2] == aggtop[p[1]] and (p[0][0][0] in 'wq' or op not in ('ldr', 'str', 'ldp', 'stp'))):
                        aggtop[p[1]] = (end + 7) & ~7; grown = True
    entry = next((c for _, _, c in st if c > 0), 0.0)
    slots = collections.defaultdict(lambda: [0.0, 0.0, 0.0, 0.0])  # loop loads, loop stores, all loads, all stores
    for j, (op, a, c) in enumerate(st):
        if c <= 0: continue
        isl = op in LOADS; iss = op in STORES
        if not (isl or iss) or j in kind: continue
        p = parse(op, a)
        if not p: continue
        regs, base, off, wb = p
        if base != 'sp' or off is None or wb: continue
        if any(b == base and K <= off < aggtop.get(b, 0) for b, K in tk): continue
        if regs[0][0] not in 'xw': continue
        inloop = c > 1.5 * entry
        for q, r in enumerate(regs):
            s = slots[off + q * (8 if r[0] == 'x' else 4)]
            if isl:
                s[2] += c
                if inloop: s[0] += c
            else:
                s[3] += c
                if inloop: s[1] += c
    ll = sum(s[0] for s in slots.values()); ls = sum(s[1] for s in slots.values())
    un = sum(max(0.0, s[0] - s[3]) for s in slots.values())
    G[0] += ll; G[1] += ls; G[2] += un; G[3] += sum(s[2] for s in slots.values()); G[4] += sum(s[3] for s in slots.values())
    FN.append((ll + ls, f, entry, ll, ls, un, slots))
print('sp spill loads %.3fB (in loops %.3fB)  stores %.3fB (in loops %.3fB)  loop reloads beyond the slot stores %.3fB' % (G[3] / 1e9, G[0] / 1e9, G[4] / 1e9, G[1] / 1e9, G[2] / 1e9))
top = int(sys.argv[3]) if len(sys.argv) > 3 else 30
for t, f, entry, ll, ls, un, slots in sorted(FN, key=lambda x: -x[0])[:top]:
    print('%-70s entry %10d loopL %7.1fM loopS %7.1fM excess %7.1fM' % (f[:70], entry, ll / 1e6, ls / 1e6, un / 1e6))
    if len(sys.argv) > 4:
        for off, s in sorted(slots.items(), key=lambda kv: -(kv[1][0] + kv[1][1]))[:int(sys.argv[4])]:
            print('      [sp,#0x%x] loopL %7.1fM loopS %7.1fM allL %7.1fM allS %7.1fM' % (off, s[0] / 1e6, s[1] / 1e6, s[2] / 1e6, s[3] / 1e6))
