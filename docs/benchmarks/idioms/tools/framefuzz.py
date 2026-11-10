"""framefuzz.py SEED COUNT OUT.coil : write a self-checking Coil program of COUNT random functions.

Each function mixes arithmetic, conditionals that rejoin or return early, counted loops and calls
to a machine-code callee that returns its argument plus 7 while destroying every call-clobbered
general and floating register and the flags. Values therefore live across calls on some paths
only, in every arrangement the generator reaches. The expected checksum of every function over a
fixed set of inputs is computed here and written into the program, which exits with the number
of functions whose checksum differs. A hand-written part adds floating values, recursion 20000
deep and many simultaneously live values.

Run the output with `coil run OUT.coil --backend stogir -O3` (and with --backend llvm to check the
generator against a second implementation)."""
import random, struct, sys

MASK = 0xFFFFF
INPUTS = [(0, 0, 0, 0), (1, 2, 3, 4), (7, 7, 7, 7), (100, 3, 250, 9), (99, 100, 101, 102),
          (5, 1000, 2, 77777), (-1, -2, -3, -4), (123456, 654321, 8, 16), (64, 32, 16, 8),
          (3, 0, 9, 1), (1 << 40, 5, 1 << 20, 6), (15, 240, 3855, 61680)]


class Return(Exception):
    def __init__(self, value): self.value = value


class Gen:
    def __init__(self, rng):
        self.rng = rng; self.fresh = 0

    def name(self, prefix):
        self.fresh += 1; return '%s%d' % (prefix, self.fresh)

    def atom(self, env):
        if self.rng.random() < 0.75: return ('var', self.rng.choice(env))
        return ('const', self.rng.choice([0, 1, 2, 3, 5, 7, 8, 100, 255, 4096, 99999]))

    def cond(self, env, depth):
        k = self.rng.random()
        if k < 0.4: return ('lt', self.expr(env, depth + 2), self.expr(env, depth + 2))
        if k < 0.8: return ('eqz', self.expr(env, depth + 2), self.rng.choice([1, 3, 7, 15, 63]))
        return ('ne', self.expr(env, depth + 2), self.atom(env))

    def expr(self, env, depth, mutable=()):
        r = self.rng.random()
        if depth >= 5 or r < 0.18: return self.atom(env)
        if r < 0.42:
            return ('bin', self.rng.choice(['+', '-', '^']), self.expr(env, depth + 1), self.expr(env, depth + 1))
        if r < 0.54: return ('clob', self.expr(env, depth + 1))
        if r < 0.74: return ('if', self.cond(env, depth), self.expr(env, depth + 1), self.expr(env, depth + 1))
        if r < 0.88:
            v = self.name('v')
            return ('let', v, self.expr(env, depth + 1), self.expr(env + [v], depth + 1))
        if r < 0.95 and depth <= 3:
            acc = self.name('s'); i = self.name('i')
            return ('loop', acc, self.expr(env, depth + 2), i, self.rng.choice([0, 1, 2, 3, 5]),
                    self.expr(env + [acc, i], depth + 2))
        return ('early', self.cond(env, depth), self.expr(env, depth + 2), self.expr(env, depth + 1))

    def pressure(self, env):
        """Many values live across a call made on one arm only."""
        names = [self.name('p') for _ in range(self.rng.choice([10, 16, 24]))]
        body = ('if', self.cond(env, 3), ('clob', self.atom(env)), self.atom(env))
        total = ('var', names[0])
        for n in names[1:]: total = ('bin', '+', total, ('var', n))
        total = ('bin', '+', total, body) if self.rng.random() < 0.5 else ('bin', '+', body, total)
        for n in reversed(names):
            total = ('let', n, ('bin', self.rng.choice(['+', '-', '^']), self.atom(env), self.atom(env)), total)
        return total

    def function(self):
        env = ['a', 'b', 'c', 'd']
        k = self.rng.random()
        if k < 0.15: return self.pressure(env)
        if k < 0.35:  # a guard that returns early, then the rest
            return ('early', self.cond(env, 2), self.atom(env), self.expr(env, 0))
        if k < 0.55:  # a rare call that rejoins, with everything live after it
            v = self.name('v')
            return ('let', v, ('if', self.cond(env, 2), ('clob', self.expr(env, 3)), self.atom(env)),
                    ('bin', '+', ('var', v), ('bin', '+', ('bin', '^', ('var', 'a'), ('var', 'b')),
                                              ('bin', '-', ('var', 'c'), ('var', 'd')))))
        return self.expr(env, 0)


def evaluate(node, env):
    kind = node[0]
    if kind == 'var': return env[node[1]]
    if kind == 'const': return node[1]
    if kind == 'bin':
        l = evaluate(node[2], env); r = evaluate(node[3], env)
        return {'+': l + r, '-': l - r, '^': l ^ r}[node[1]] & MASK
    if kind == 'clob': return (evaluate(node[1], env) + 7) & MASK
    if kind == 'if': return evaluate(node[2], env) if test(node[1], env) else evaluate(node[3], env)
    if kind == 'let':
        inner = dict(env); inner[node[1]] = evaluate(node[2], env); return evaluate(node[3], inner)
    if kind == 'loop':
        inner = dict(env); inner[node[1]] = evaluate(node[2], env)
        for i in range(node[4]):
            inner[node[3]] = i; inner[node[1]] = evaluate(node[5], inner)
        return inner[node[1]]
    if kind == 'early':
        if test(node[1], env): raise Return(evaluate(node[2], env))
        return evaluate(node[3], env)
    raise ValueError(kind)


def test(cond, env):
    if cond[0] == 'lt': return evaluate(cond[1], env) < evaluate(cond[2], env)
    if cond[0] == 'eqz': return (evaluate(cond[1], env) & cond[2]) == 0
    return evaluate(cond[1], env) != evaluate(cond[2], env)


def render(node):
    kind = node[0]
    if kind == 'var': return node[1]
    if kind == 'const': return str(node[1])
    if kind == 'bin': return '(& (%s %s %s) %d)' % (node[1], render(node[2]), render(node[3]), MASK)
    if kind == 'clob': return '(& (clob %s) %d)' % (render(node[1]), MASK)
    if kind == 'if': return '(if %s %s %s)' % (render_cond(node[1]), render(node[2]), render(node[3]))
    if kind == 'let': return '(let [%s %s] %s)' % (node[1], render(node[2]), render(node[3]))
    if kind == 'loop':
        return '(let [(mut %s) %s] (for [%s 0 %d] (set! %s %s)) %s)' % (
            node[1], render(node[2]), node[3], node[4], node[1], render(node[5]), node[1])
    if kind == 'early':
        return '(do (when %s (return-from :fn %s)) %s)' % (render_cond(node[1]), render(node[2]), render(node[3]))
    raise ValueError(kind)


def render_cond(cond):
    if cond[0] == 'lt': return '(< %s %s)' % (render(cond[1]), render(cond[2]))
    if cond[0] == 'eqz': return '(= (& %s %d) 0)' % (render(cond[1]), cond[2])
    return '(!= %s %s)' % (render(cond[1]), render(cond[2]))


def signed(v): return v - (1 << 64) if v >= 1 << 63 else v


def checksum(body):
    total = 0
    for a, b, c, d in INPUTS:
        try: value = evaluate(body, dict(a=a, b=b, c=c, d=d))
        except Return as r: value = r.value
        total = (total * 31 + value) & 0xFFFFFFFFFFFF
    return total


def clobber_bytes():
    words = [0x91001C00]                                            # add x0, x0, #7
    words += [0xD2800000 | ((0xBAD0 + r) << 5) | r for r in range(1, 18)]  # movz xN, #0xBADN
    words += [0x9E670020 | d for d in list(range(0, 8)) + list(range(16, 32))]  # fmov dN, x1
    words += [0xF100043F, 0xD65F03C0]                               # cmp x1, #1 ; ret
    return ' '.join('0x%02x' % b for w in words for b in struct.pack('<I', w))


HAND = r'''
;; Floating values (whole numbers, so every sum is exact) live across a call
;; made on one arm only, rejoining at a floating merge.
(defn floats :inline (Never) [(x i64) (p f64) (q f64)] (-> i64)
  (let [s (+ p q)
        t (- p q)
        v (if (< x 100) s (+ (cast f64 (clob x)) s))]
    (cast i64 (+ (+ v t) p))))

;; Recursion on one arm, rejoining a merge: the frame is built and released
;; once per level.
(defn deep :inline (Never) [(x i64) (y i64) (n i64)] (-> i64)
  (let [v (if (> n 0) (deep (+ x 1) y (- n 1)) x)]
    (+ v n y)))

;; A value crossing a call on every path and another call on one arm only.
(defn both :inline (Never) [(x i64) (y i64)] (-> i64)
  (let [h (clob y)
        v (if (< x 100) h (+ (clob x) h))]
    (+ v x y)))

;; The call arm ends in a trap; the other returns.
(defn trapping :inline (Never) [(x i64) (y i64)] (-> i64)
  (if (= x 123456789)
      (do (clob x) (panic "unreachable arm"))
      (+ x y)))

(defn hand [] (-> i64)
  (let [(mut bad) (: 0 i64)]
    (for x [(: 0 i64) 99 100 101 5000 -7]
      (let [got (floats x 1024.0 -3.0)
            want (+ (if (< x 100) 1021 (+ x 7 1021)) 1027 1024)]
        (unless (= got want) (println "floats {}: got {} want {}" x got want) (set! bad (+ bad 1))))
      (let [got (both x 5) want (+ (if (< x 100) 12 (+ x 7 12)) x 5)]
        (unless (= got want) (println "both {}: got {} want {}" x got want) (set! bad (+ bad 1))))
      (let [got (trapping x 9)]
        (unless (= got (+ x 9)) (println "trapping {}: got {}" x got) (set! bad (+ bad 1)))))
    (for n [(: 0 i64) 1 3 20000]
      (let [got (deep 5 2 n)
            (mut want) (+ 5 n 2)]
        (for [k 1 (+ n 1)] (set! want (+ want k 2)))
        (unless (= got want) (println "deep {}: got {} want {}" n got want) (set! bad (+ bad 1)))))
    bad))
'''


def main():
    seed = int(sys.argv[1]); count = int(sys.argv[2]); out = sys.argv[3]
    rng = random.Random(seed); gen = Gen(rng)
    bodies = [gen.function() for _ in range(count)]
    lines = [';;; Generated by docs/benchmarks/idioms/tools/framefuzz.py %d %d; do not edit.' % (seed, count),
             ';;; Random functions whose values cross calls on some paths only, checked against',
             ';;; checksums computed by the generator. The callee destroys every call-clobbered',
             ';;; register and the flags. Exits with the number of failures.',
             '(module backend.stogir-frame-split)',
             '(import "coil.primitive" :as primitive)',
             '(import "coil.cc" :as cc)',
             '(extern exit :cc (cc/C) [i32] (-> never))',
             '',
             ';; add x0, x0, #7; movz x1..x17; fmov d0..d7, d16..d31 from x1; cmp x1, #1; ret',
             '(defn clob :cc (cc/C) [(x i64)] (-> i64)',
             '  (primitive/machine-code (Aarch64) %s))' % clobber_bytes(), '']
    for k, body in enumerate(bodies):
        lines.append('(defn f%d :inline (Never) [(a i64) (b i64) (c i64) (d i64)] (-> i64)' % k)
        lines.append('  (block :fn %s))' % render(body))
    lines.append(HAND)
    lines.append('(defn fold [(total i64) (value i64)] (-> i64)')
    lines.append('  (& (+ (* total 31) value) 0xFFFFFFFFFFFF))')
    lines.append('')
    lines.append('(defn main [] (-> i64)')
    lines.append('  (let [(mut failures) (hand)')
    lines.append('        (mut total) (: 0 i64)]')
    for k, body in enumerate(bodies):
        calls = ' '.join('(set! total (fold total (f%d %d %d %d %d)))' % ((k,) + t) for t in INPUTS)
        lines.append('    (set! total 0) %s' % calls)
        lines.append('    (unless (= total %d) (println "f%d: got {} want %d" total) (set! failures (+ failures 1)))'
                     % (checksum(body), k, checksum(body)))
    lines.append('    (println "stogir-frame-split: {} failures" failures)')
    lines.append('    (exit (cast i32 (if (> failures 255) 255 failures)))))')
    open(out, 'w').write('\n'.join(lines) + '\n')


main()
