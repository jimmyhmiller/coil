#!/usr/bin/env python3
"""framecheck.py DISASSEMBLY : static frame-state check of shrink-wrapped code.

For every function whose first instruction does not build a frame, walk its
machine code tracking whether the frame exists (0 = entry state, 1 = built).
Reports a RET with the frame built, a frame-record reload or SP release
without a frame, a call without a frame, and joins with conflicting states.
Indirect jumps (BR) end a path; their targets are not followed.
"""
import re, sys, collections

funcs = collections.OrderedDict(); cur = None
for line in open(sys.argv[1]):
    m = re.match(r'^([0-9a-f]+) <(.+)>:$', line.strip())
    if m:
        cur = m.group(2); funcs[cur] = []; continue
    m = re.match(r'\s*([0-9a-f]+):\s+(\S+)\s*(.*)', line)
    if m and cur:
        funcs[cur].append((int(m.group(1), 16), m.group(2), m.group(3).split(';')[0].strip()))

def builds(op, args):
    return (op == 'sub' and args.startswith('sp, sp, ')) or \
           (op == 'stp' and args.startswith('x29, x30, [sp, #-') and args.endswith('!'))

def releases(op, args):
    return (op == 'add' and args.startswith('sp, sp, ')) or \
           (op == 'ldp' and args.startswith('x29, x30, [sp], #'))

problems = collections.Counter(); bad = {}
checked = 0
for name, code in funcs.items():
    # A large frame loads its size into x16 (one or two words) first.
    if not code or any(builds(op, args) for _, op, args in code[:3]):
        continue
    checked += 1
    index = {a: i for i, (a, _, _) in enumerate(code)}
    state = {}
    work = [(0, 0)]
    def report(kind, addr):
        problems[kind] += 1
        bad.setdefault(name, []).append('%s @%x' % (kind, addr))
    while work:
        i, s = work.pop()
        while i < len(code):
            addr, op, args = code[i]
            if i in state:
                if state[i] != s: report('join-conflict', addr)
                break
            state[i] = s
            if builds(op, args):
                if s == 1: report('double-build', addr)
                s = 1
            elif releases(op, args):
                if s == 0: report('release-without-frame', addr)
                s = 0
            elif op == 'ldp' and args.startswith('x29, x30') and s == 0:
                report('record-reload-without-frame', addr)
            elif op in ('bl', 'blr') and s == 0:
                report('call-without-frame', addr)
            if op == 'ret':
                if s == 1: report('ret-with-frame', addr)
                break
            if op in ('br', 'brk'):
                break
            target = None
            m = re.search(r'0x([0-9a-f]+) <', args)
            if op == 'b' or op.startswith('b.') or op in ('cbz', 'cbnz', 'tbz', 'tbnz'):
                if m:
                    t = int(m.group(1), 16)
                    if t in index: target = index[t]
                    elif op == 'b':  # tail jump out of the function
                        if s == 1: report('tail-jump-with-frame', addr)
                        break
                if op == 'b':
                    if target is not None: i = target; continue
                    break
                if target is not None: work.append((target, s))
            i += 1
print('functions checked', checked, 'with problems', len(bad))
for k, v in problems.most_common(): print('  %-30s %d' % (k, v))
for name in list(bad)[:int(sys.argv[2]) if len(sys.argv) > 2 else 15]:
    print(name, bad[name][:4])
