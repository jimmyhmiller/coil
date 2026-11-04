from pathlib import Path
import os,subprocess,json,hashlib,resource,statistics,sys
w=Path.cwd();before=w.parent/'pressure-register-domain';d=w/'build/shared-index';r=Path('/Users/jimmyhmiller/Documents/Code/projects/coil/.worktrees/stogir-iterator-results');compiler=r/'build/bin/coil-pressure-fixed-55649d17';runner=w.parent/'analysis-zero-init/build/prepare-smoke/runner.o'
env={k:v for k,v in os.environ.items() if not k.startswith('COIL_')};env.update(COIL_LIBRARY_STATE='0',COIL_TPDE_SERIAL='1',COIL_CODEGEN_TIMINGS='1')
sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
def run(args,cwd=w):
 p=subprocess.run([str(x) for x in args],cwd=cwd,env=env,capture_output=True,text=True);assert p.returncode==0,(args,p.returncode,p.stderr[-3000:]);return p
rows=[]
for backend in ['stogir','llvm','tpde']:
 for variant,root in [('before',before),('after',w)]:
  obj=d/(variant+'-'+backend+'.o');exe=obj.with_suffix('');fixture=root/'benchmarks/compiler-gaps/prepare-graph.coil'
  row=dict(backend=backend,variant=variant,fixture_sha256=sha(fixture),source_sha256={name:sha(root/'src/stogir'/name) for name in ['placement.coil','schedule.coil','pipeline.coil']},cpu_s=[])
  if '--runtime-only' not in sys.argv:
   p=run([compiler,'emit-obj',fixture,'--backend',backend,'-O3','--no-debug','-o',obj],root);(d/(exe.name+'-build.log')).write_text(p.stdout+p.stderr);run(['cc',runner,obj,'-o',exe]);run([exe]);print('built',exe.name,flush=True)
  row['object_sha256']=sha(obj);row['object_bytes']=obj.stat().st_size;rows.append(row)
if '--build-only' in sys.argv:sys.exit(0)
host=[]
def snapshot(phase):host.append(dict(phase=phase,load=os.getloadavg(),processes=run(['ps','-Ao','pid=,ppid=,pcpu=,comm=']).stdout))
snapshot('start')
for turn in range(33):
 for row in rows if turn%2==0 else list(reversed(rows)):
  before_cpu=resource.getrusage(resource.RUSAGE_CHILDREN);run([d/(row['variant']+'-'+row['backend'])]);after_cpu=resource.getrusage(resource.RUSAGE_CHILDREN)
  if turn:row['cpu_s'].append(after_cpu.ru_utime+after_cpu.ru_stime-before_cpu.ru_utime-before_cpu.ru_stime)
snapshot('end')
for row in rows:row['median_cpu_s']=statistics.median(row['cpu_s']);print(row['backend'],row['variant'],row['median_cpu_s'],row['object_bytes'],flush=True)
(d/'results.json').write_text(json.dumps(dict(qualification='Same opaque2307-node linear SSA graph and checked caller;32 rotating process CPU samples after warmup. Whole preparation, not full compiler acceptance.',compiler_version=run([compiler,'--version']).stdout.strip(),compiler=str(compiler),compiler_sha256=sha(compiler),runner_sha256=sha(runner),host=host,rows=rows),indent=2))
