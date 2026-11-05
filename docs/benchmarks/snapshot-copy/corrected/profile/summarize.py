from pathlib import Path
import re,json,collections
r=Path(__file__).resolve().parent
rows=[]
for label in ['stogir','llvm']:
 text=(r/(label+'-sample.txt')).read_text().split('Call graph:',1)[1].split('Total number in stack',1)[0]
 roots=[];stack=[]
 for line in text.splitlines():
  m=re.match(r'^([^0-9]*)(\d+) (.+)$',line)
  if not m:continue
  prefix,count,rest=m.groups();depth=len(prefix);count=int(count)
  if 'Thread_' in rest:
   node=dict(name=rest,count=count,children=[],thread=True);roots.append(node);stack=[(depth,node)];continue
  f=re.match(r'(.+?)  \(in (.+?)\)',rest)
  if not f:continue
  name,image=f.groups();node=dict(name=name,count=count,children=[],image=image,thread=False)
  while stack and depth<=stack[-1][0]:stack.pop()
  assert stack,(label,line)
  stack[-1][1]['children'].append(node);stack.append((depth,node))
 def flatten(node,anc=()):
  children=sum(c['count'] for c in node['children']);assert children<=node['count'],(label,node['name'],node['count'],children)
  exclusive=node['count']-children
  yield node,anc,exclusive
  for child in node['children']:yield from flatten(child,anc+(node['name'],))
 workers=[]
 for thread in roots:
  entries=list(flatten(thread));counts=collections.Counter();inclusive=collections.Counter();families=collections.Counter()
  for node,anc,n in entries:
   if not n:continue
   counts[node['name']]+=n
   for name in set(anc+(node['name'],)):inclusive[name]+=n
   names=anc+(node['name'],)
   for family,predicate in [('stogir-verification',lambda s:s.startswith('stogir.verify.')),('snapshot-fusion',lambda s:s=='tpde.cir.fuse-snapshots!'),('live-emission-plan',lambda s:s=='coil.compiler.codegen_tpde.stogir-emission-plan'),('uses-build',lambda s:s=='stogir.uses.build'),('graph-operand',lambda s:s=='stogir.graph.operand'),('allocation-api',lambda s:s.startswith('coil.alloc.') or s.startswith('coil.scratch.')),('native-build',lambda s:s=='coil.compiler.driver.build-native-program'),('module-prepare',lambda s:s=='coil.compiler.codegen_stogir.module-prepare!'),('module-finalize',lambda s:s=='coil.compiler.codegen_stogir.module-finish!'),('native-function-emission',lambda s:s=='coil.compiler.codegen_stogir.compile-with-module!')]:
    if any(predicate(s) for s in names):families[family]+=n
  assert sum(counts.values())==thread['count']
  workers.append(dict(thread=thread['name'],samples=thread['count'],families=dict(families),top_exclusive=counts.most_common(35),top_inclusive=inclusive.most_common(35)))
 row=dict(backend=label,threads=workers);rows.append(row)
 print(label)
 for w in workers:
  if w['families'].get('native-build',0):
   print('worker',w['samples'],'families',w['families']);print('top leaves',w['top_exclusive'][:12])
(r/'summary.json').write_text(json.dumps(dict(qualification='Sampled worker stack shares; inclusive families overlap and may be affected by inlining. Main-thread join waits excluded from worker shares. Not acceptance timings.',rows=rows),indent=2))
