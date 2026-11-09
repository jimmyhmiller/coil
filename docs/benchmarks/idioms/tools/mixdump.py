"""Per-function, per-opcode dynamic instruction counts from block counters.

usage: mixdump.py DIS COUNTS OUT.json
A block runs from one counter sequence to the next. Its instructions execute
count[index] / copies times, where copies is how many counter sequences carry
that index (llc tail duplication copies a counter with its block). Code after
an unconditional terminator (b, br, ret) up to the next counter has no counter
of its own and is not charged; udf and undecodable words are data (inline jump
tables) and are never charged. '#blocks' is the block executions, '#static' the
function's instruction count.
"""
import re, sys, struct, json, collections

dis, counts_path, outp = sys.argv[1:4]
data = open(counts_path, 'rb').read(); n = struct.unpack('<Q', data[:8])[0]
counts = struct.unpack('<%dQ' % n, data[8:8 + 8 * n])

CS = re.compile(r'^(x(19|2[0-8])|d(8|9|1[0-5]))$')
def role(op, a):
    stack = bool(re.search(r'\[(sp|x29)', a))
    regs = [r.strip() for r in a.split('[')[0].split(',') if r.strip()]
    if stack and 'x29' in regs and 'x30' in regs: return 'frame-record'
    if op in ('stp', 'str') and stack and regs and all(CS.match(r) for r in regs): return 'cs-save'
    if op in ('ldp', 'ldr') and stack and regs and all(CS.match(r) for r in regs): return 'cs-restore'
    if op in ('sub', 'add') and a.startswith('sp, sp'): return 'sp-adjust'
    if op in ('bl', 'blr'): return 'call'
    if op == 'ret': return 'ret'
    if op.startswith('ld'): return 'load-stack' if stack else 'load'
    if op.startswith('st'): return 'store-stack' if stack else 'store'
    if op == 'b': return 'b'
    if op in ('cbz', 'cbnz', 'tbz', 'tbnz') or op.startswith('b.'): return 'condbr'
    if (op == 'mov' and re.match(r'[xw]\d+, [xw]\d+$', a)) or (op == 'orr' and a.endswith('zr')): return 'regmove'
    if op in ('sxtw', 'uxtw', 'sxtb', 'uxtb', 'sxth', 'uxth', 'ubfx', 'sbfx'): return 'ext'
    if op in ('cmp', 'cmn', 'tst', 'ccmp', 'ccmn'): return 'cmp'
    if op == 'cset': return 'cset'
    if op in ('csel', 'csinc', 'csinv', 'csneg', 'cinc', 'cneg'): return 'csel'
    if op in ('mov', 'movz', 'movk', 'movn'): return 'const'
    if op == 'nop': return 'nop'
    if ', lsl #' in a or ', lsr #' in a or ', asr #' in a or ', uxt' in a or ', sxt' in a: return 'alu:' + op + '-shifted'
    return 'alu:' + op

def counter_at(ins, i):
    op, a = ins[i]
    if (op in ('mov', 'movz') and a.startswith('x16, #') and i + 5 < len(ins)
            and ins[i + 1][0] == 'movk' and ins[i + 2][0] == 'movk' and ins[i + 2][1].startswith('x16, #0x5000, lsl #32')
            and ins[i + 3] == ('ldr', 'x17, [x16]')):
        lo = int(a.split('#')[1].split()[0], 0); mid = int(ins[i + 1][1].split('#')[1].split(',')[0], 0)
        return (lo | (mid << 16)) // 8
    return None

functions = []; fn = None; ins = []
for line in open(dis):
    m = re.match(r'^[0-9a-f]+ <(.+)>:$', line.strip())
    if m:
        if fn: functions.append((fn, ins))
        fn = m.group(1).lstrip('_'); ins = []; continue
    m = re.match(r'\s*[0-9a-f]+:\s+(\S+)\s*(.*)', line)
    if m: ins.append((m.group(1), m.group(2).split(';')[0].strip()))
if fn: functions.append((fn, ins))

copies = collections.Counter()
for _, ins in functions:
    for i in range(len(ins)):
        k = counter_at(ins, i)
        if k is not None: copies[k] += 1

per = {}
for fn, ins in functions:
    c = collections.Counter(); c['#static'] = len(ins)
    i = 0; current = 0.0
    while i < len(ins):
        k = counter_at(ins, i)
        if k is not None:
            current = (counts[k] if k < len(counts) else 0) / copies[k]
            c['#blocks'] += current; c['#static'] -= 6
            i += 6; continue
        op, a = ins[i]
        if op in ('udf', '<unknown>') or op.startswith('.'): i += 1; continue
        if current: c[role(op, a)] += current
        if op in ('b', 'br', 'ret'): current = 0.0
        i += 1
    if sum(v for k, v in c.items() if not k.startswith('#')): per[fn] = dict(c)
json.dump(per, open(outp, 'w'))
