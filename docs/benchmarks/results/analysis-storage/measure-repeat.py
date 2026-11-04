from pathlib import Path
import os,subprocess,json,hashlib,statistics,resource
R=Path.cwd();D=R/'build/storage-integrated-repeat';W=Path('/Users/jimmyhmiller/Documents/Code/projects/coil-stogir/.worktrees/inline-switch-control')
old=R/'build/bin/coil-analysis-fixed-cd81b35b';new=R/'build/bin/coil-candidate'
sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
env={k:v for k,v in os.environ.items() if not k.startswith('COIL_')};env.update(COIL_LIBRARY_STATE='0',COIL_TPDE_SERIAL='1',COIL_CODEGEN_TIMINGS='1')
def run(args,cwd=R):
 p=subprocess.run([str(a) for a in args],cwd=cwd,env=env,capture_output=True,text=True)
 assert p.returncode==0,(args,p.returncode,p.stdout[-1000:],p.stderr[-2000:]);return p
assert 'cd81b35b' in run([old,'--version']).stdout
assert '55649d17' in run([new,'--version']).stdout
host=[]
def snapshot(phase):
 p=run(['ps','-Ao','pid=,ppid=,pcpu=,comm=']);rows=[]
 for line in p.stdout.splitlines():
  parts=line.split(None,3)
  if len(parts)==4:
   a,b,c,d=parts;rows.append(dict(pid=int(a),parent_pid=int(b),cpu_percent=float(c),name=Path(d).name))
 host.append(dict(phase=phase,load=os.getloadavg(),top_processes=sorted(rows,key=lambda x:x['cpu_percent'],reverse=True)[:12]))
snapshot('start');results=[]
worktrees=Path('/Users/jimmyhmiller/Documents/Code/projects/coil-stogir/.worktrees')
use_runner=worktrees/'uses-build-inputs/build/uses-after/runner.o'
for workload,fixture,runner in [('selector',D/'selector.coil',D/'runner.o'),('verifier',W/'benchmarks/compiler-gaps/verify-graph.coil',R/'build/checked-empty-verifier/runner.o')]:
 target=D/workload;target.mkdir(exist_ok=True);rows=[]
 context={'uses-shared':worktrees/'inline-site-priority','uses-split':worktrees/'uses-split-priority-probe'}.get(workload,R)
 def treehash():return hashlib.sha256(b''.join(str(p.relative_to(context)).encode()+b'\0'+p.read_bytes()+b'\0' for p in sorted((context/'src').rglob('*.coil')))).hexdigest()
 source_hash=treehash()
 for name,compiler,backend in [('before-stogir',old,'stogir'),('current-stogir',new,'stogir'),('llvm',new,'llvm'),('tpde',new,'tpde')]:
  rows.append(dict(name=name,compiler=str(compiler),compiler_sha256=sha(compiler),version=run([compiler,'--version']).stdout.strip(),backend=backend,generation_s=[],cpu_samples=[]))
 for turn in range(9):
  for row in rows if turn%2==0 else list(reversed(rows)):
   obj=target/(row['name']+'.o');p=run([row['compiler'],'emit-obj',fixture,'--backend',row['backend'],'-O3','--no-debug','-o',obj],context);assert treehash()==source_hash;(target/(row['name']+f'-compile-{turn}.log')).write_text(p.stdout+p.stderr)
   records=[int(x.split('\t')[3]) for x in p.stderr.splitlines() if x.startswith('coil-codegen\t') and x.split('\t')[2]=='ir-codegen'];assert records
   if turn:row['generation_s'].append(sum(records)/1e9)
   h=sha(obj)
   if 'object_sha256' in row:assert row['object_sha256']==h,'nondeterministic object'
   row.update(object_sha256=h,object_bytes=obj.stat().st_size)
 for row in rows:
  obj=target/(row['name']+'.o');run(['cc',runner,obj,'-o',target/row['name']]);run([target/row['name']]);(target/(row['name']+'.asm')).write_text(run(['llvm-objdump','-dr','--no-show-raw-insn',obj]).stdout)
 snapshot(workload+'-runtime-start')
 for turn in range(17):
  for row in rows if turn%2==0 else list(reversed(rows)):
   before=resource.getrusage(resource.RUSAGE_CHILDREN);run([target/row['name']]);after=resource.getrusage(resource.RUSAGE_CHILDREN)
   if turn:row['cpu_samples'].append(after.ru_utime+after.ru_stime-before.ru_utime-before.ru_stime)
 for row in rows:row.update(generation_median_s=statistics.median(row['generation_s']),cpu_median_s=statistics.median(row['cpu_samples']))
 results.append(dict(workload=workload,fixture=str(fixture),fixture_sha256=sha(fixture),runner_sha256=sha(runner),project_context=str(context),source_tree_sha256=source_hash,rows=rows))
 print(workload,[(r['name'],r['generation_median_s'],r['cpu_median_s'],r['object_bytes']) for r in rows],flush=True)
 snapshot(workload+'-end')
(D/'results.json').write_text(json.dumps(dict(host=host,results=results,qualification='Same-source integrated emitter comparison, caches off; eight rotating generation and sixteen process CPU samples exclude warmup. Selector runner checks ten tag answers and checksum; verifier runner checks checksum and malformed layout/reference/type. Exact opaque runner per workload. Not a full compiler measurement.'),indent=2)+'\n')
