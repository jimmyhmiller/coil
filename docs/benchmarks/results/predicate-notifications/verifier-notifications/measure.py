from pathlib import Path
import subprocess,os,json,hashlib,resource,statistics
r=Path.cwd();d=r/'build/verifier-predicate-notifications';prod=r.parent/'stogir-iterator-results';old=r.parent/'stogir-complement-predicates/build/bin/coil-candidate';new=r/'build/bin/coil-candidate';targetroot=Path('/Users/jimmyhmiller/Documents/Code/projects/coil-stogir/.worktrees/bulk-expansion');fixture=targetroot/'benchmarks/compiler-gaps/verify-graph.coil';runner=prod/'build/checked-empty-verifier/runner.o'
env={k:v for k,v in os.environ.items() if not k.startswith('COIL_')};env.update(COIL_LIBRARY_STATE='0',COIL_TPDE_SERIAL='1',COIL_CODEGEN_TIMINGS='1')
sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
def run(args):
 p=subprocess.run([str(x) for x in args],cwd=targetroot,env=env,capture_output=True,text=True);assert p.returncode==0,(args,p.returncode,p.stderr[-5000:]);return p
assert 'b56a5ff6' in run([old,'--version']).stdout;assert '4921c53c' in run([new,'--version']).stdout
rows=[]
for name,c,b in [('core-stogir',old,'stogir'),('notify-stogir',new,'stogir'),('core-llvm',old,'llvm'),('notify-llvm',new,'llvm')]:rows.append(dict(name=name,compiler=str(c),compiler_sha256=sha(c),backend=b,generation_s=[],cpu_s=[]))
host=[]
def snapshot(phase):host.append(dict(phase=phase,load=os.getloadavg(),processes=run(['ps','-Ao','pid=,ppid=,pcpu=,comm=']).stdout))
snapshot('start')
for turn in range(9):
 for row in rows if turn%2==0 else list(reversed(rows)):
  obj=d/(row['name']+'.o');p=run([row['compiler'],'emit-obj',fixture,'--backend',row['backend'],'-O3','--no-debug','-o',obj]);(d/(row['name']+'-'+str(turn)+'.txt')).write_text(p.stdout+p.stderr)
  rec=[int(l.split('\t')[3]) for l in p.stderr.splitlines() if l.startswith('coil-codegen\t') and l.split('\t')[2]=='ir-codegen'];assert rec
  if turn:row['generation_s'].append(sum(rec)/1e9)
  h=sha(obj)
  if 'object_sha256' in row:assert row['object_sha256']==h
  row.update(object_sha256=h,object_bytes=obj.stat().st_size)
assert rows[2]['object_sha256']==rows[3]['object_sha256'],'LLVM input/codegen changed'
# Stogir code is allowed to change; the fixed LLVM target must remain identical.
for row in rows:
 name=row['name'];run(['cc',runner,d/(name+'.o'),'-o',d/name]);run([d/name]);(d/(name+'.asm')).write_text(run(['llvm-objdump','-dr','--no-show-raw-insn',d/(name+'.o')]).stdout)
snapshot('runtime-start')
for turn in range(25):
 for row in rows if turn%2==0 else list(reversed(rows)):
  before=resource.getrusage(resource.RUSAGE_CHILDREN);run([d/row['name']]);after=resource.getrusage(resource.RUSAGE_CHILDREN)
  if turn:row['cpu_s'].append(after.ru_utime+after.ru_stime-before.ru_utime-before.ru_stime)
snapshot('end')
for row in rows:row.update(generation_median_s=statistics.median(row['generation_s']),cpu_median_s=statistics.median(row['cpu_s']));print(row['name'],row['generation_median_s'],row['cpu_median_s'],row['object_bytes'],flush=True)
(d/'results.json').write_text(json.dumps(dict(qualification='Comparison-input IF notifications on the same integer complement and contained-load policy on unchanged opaque verifier. Same caller, exact LLVM object match across drivers,8 rotating generation and24 CPU samples after warmup. Not bootstrap acceptance.',fixture_sha256=sha(fixture),runner_sha256=sha(runner),host=host,rows=rows),indent=2))
