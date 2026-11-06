from pathlib import Path
import sys
src=Path(sys.argv[1]) if len(sys.argv)>1 else Path('/Users/jimmyhmiller/Documents/Code/projects/coil/.worktrees/stogir-return-allocation-bootstrap/build/frame-origin-audit/structure.snapshot.txt')
rows=[s.split()[1:] for s in src.read_text().splitlines() if s.startswith('stogir-snapshot ')]
assert sum(r[0]=='begin' for r in rows)==1
out=['(module inspect.call-results)']
for mod,alias in [('graph','g'),('node','n'),('strings','strings'),('pipeline','pipeline'),('uses','uses'),('opcode','op'),('sccp','sccp'),('sccp-rewrite','rewrite'),('a64.match','matching'),('a64.result-projections','projection'),('matched-uses','machine')]:
 out.append(f'(import "stogir.{mod}" :as {alias})')
out+=['(import "coil.arraylist" :use [ArrayList])','(import "coil.alloc" :use [malloc-allocator])','(import "coil.result" :use [Ok Err Some None])']
for mod,alias in [('register-live','live'),('live-ranges','ranges'),('a64.constraints','constraints'),('a64.allocate','allocate'),('a64.function','function'),('a64.code','code')]:
 out.append(f'(import "stogir.{mod}" :as {alias})')
out.append(Path('build/frame-origin-audit/inspect-tail.coil.in').read_text())
out+=['(defn main [] (-> i64)',' (let [a (malloc-allocator) (mut graph) (g/create a) (mut roots) (ArrayList::new [i32] a)]','  (clear! (mut (.instructions graph))) (clear! (mut (.arities graph)))']
for r in rows:
 kind=r[0];v=list(map(int,r[1:])) if kind!='end' else []
 if kind=='begin':entry,proto=v
 elif kind=='root':out.append(f'  (push! (mut roots) (: {v[0]} i32))')
 elif kind=='string':
  sid,count,*data=v;assert len(data)==count
  values=' '.join(f'(: {x} u8)' for x in data)
  out.append(f'  (match (strings/intern! (mut (.strings graph)) [{values}]) (Some [id] (assert (= id {sid}))) (None [] (panic "string failure")))')
 elif kind in ('constant','instruction'):
  arity,header,o1,o2,o3=v;field='constants' if kind=='constant' else 'instructions';meta='constant-spans' if kind=='constant' else 'arities'
  out.append(f'  (push! (mut (.{field} graph)) (n/Node :header (: {header} u32) :op1 (: {o1} i32) :op2 (: {o2} i32) :op3 (: {o3} i32)))')
  out.append(f'  (push! (mut (.{meta} graph)) (: {arity} i32))')
out+= ['  (match (g/rebuild-constant-index! (mut graph) 8) (Ok [_] 0) (Err [e] (panic "{}" e)))',f'  (set! (.function-prototype graph) {proto})',f'  (match (sccp/optimize-memory graph 8 (slice roots) true a)','   (Err [e] (panic "{}" e))','   (Ok [owned] (let [(mut optimized) owned]',f'     (inspect (.graph optimized) {entry} (slice (.roots optimized)))','     (rewrite/release! (mut optimized)))))','  (free! (mut roots)) (g/release! (mut graph)) 0))']
Path('build/frame-origin-audit/replay.coil').write_text('\n'.join(out)+'\n')
print('snapshot rows',len(rows))
