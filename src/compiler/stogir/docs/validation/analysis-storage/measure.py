from pathlib import Path
import subprocess,os,hashlib,json,resource,statistics
W=Path.cwd();D=W/'build/analysis-init-comparison';old=W.parent/'inline-site-priority'
compiler=Path('/Users/jimmyhmiller/Documents/Code/projects/coil/.worktrees/stogir-iterator-results/build/bin/coil-analysis-fixed-cd81b35b')
sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
fixtures={'before':old/'build/analysis-init-fixtures/prepare-graph.coil','after':W/'benchmarks/compiler-gaps/prepare-graph.coil'}
assert sha(fixtures['before'])==sha(fixtures['after'])
runner=W/'build/prepare-smoke/runner.o'
env={k:v for k,v in os.environ.items() if not k.startswith('COIL_')};env.update(COIL_LIBRARY_STATE='0',COIL_TPDE_SERIAL='1',COIL_CODEGEN_TIMINGS='1')
def run(args,cwd=W):
 p=subprocess.run([str(a) for a in args],cwd=cwd,env=env,capture_output=True,text=True);assert p.returncode==0,(args,p.returncode,p.stdout[-1500:],p.stderr[-2000:]);return p
version=run([compiler,'--version']).stdout.strip();assert 'cd81b35b' in version
def fingerprint(root):return hashlib.sha256(b''.join(str(p.relative_to(root)).encode()+b'\0'+p.read_bytes()+b'\0' for p in sorted((root/'src').rglob('*.coil')))).hexdigest()
roots={'before':old,'after':W};fingerprints={k:fingerprint(r) for k,r in roots.items()}
rows=[dict(backend=b,variant=v,generation_s=[],cpu_s=[]) for b in ['stogir','llvm','tpde'] for v in ['before','after']]
host=[]
def snap(phase):host.append(dict(phase=phase,load=os.getloadavg(),processes=run(['ps','-Ao','pid=,ppid=,pcpu=,comm=']).stdout))
snap('start')
for turn in range(9):
 for row in rows if turn%2==0 else list(reversed(rows)):
  v=row['variant'];b=row['backend'];name=v+'-'+b;assert fingerprint(roots[v])==fingerprints[v];obj=D/(name+'.o')
  p=run([compiler,'emit-obj',fixtures[v],'--backend',b,'-O3','--no-debug','-o',obj],roots[v]);(D/f'{name}-compile-{turn}.log').write_text(p.stdout+p.stderr)
  values=[int(l.split('\t')[3]) for l in p.stderr.splitlines() if l.startswith('coil-codegen\t') and l.split('\t')[2]=='ir-codegen'];assert values
  if turn:row['generation_s'].append(sum(values)/1e9)
  h=sha(obj)
  if 'object_sha256' in row:assert row['object_sha256']==h
  row.update(object_sha256=h,object_bytes=obj.stat().st_size)
print('generation done',flush=True)
for row in rows:
 name=row['variant']+'-'+row['backend'];run(['cc',runner,D/(name+'.o'),'-o',D/name]);run([D/name]);(D/(name+'.asm')).write_text(run(['llvm-objdump','-dr','--no-show-raw-insn',D/(name+'.o')]).stdout)
snap('runtime')
for turn in range(17):
 for row in rows if turn%2==0 else list(reversed(rows)):
  a=resource.getrusage(resource.RUSAGE_CHILDREN);run([D/(row['variant']+'-'+row['backend'])]);b=resource.getrusage(resource.RUSAGE_CHILDREN)
  if turn:row['cpu_s'].append(b.ru_utime+b.ru_stime-a.ru_utime-a.ru_stime)
for r in rows:r.update(generation_median_s=statistics.median(r['generation_s']),cpu_median_s=statistics.median(r['cpu_s']))
snap('end')
(D/'results.json').write_text(json.dumps(dict(compiler=str(compiler),compiler_version=version,compiler_sha256=sha(compiler),source_tree_sha256=fingerprints,project_context={k:str(r) for k,r in roots.items()},fixture_sha256=sha(fixtures['after']),runner_source_sha256=sha(W/'benchmarks/compiler-gaps/prepare-graph-runner.coil'),runner_sha256=sha(runner),rows=rows,host=host,qualification='Fixed LLVM-built driver; same opaque graph caller byte-for-byte. Correct before/after project cwd, source fingerprints checked each compile.8 rotating IR-to-code and16 process CPU samples after warmup; all materialized schedule references summed and independently checked, plus malformed layout/reference/root rejection.32 prepares per timed process. Source-algorithm comparison, not compiler bootstrap acceptance.'),indent=2)+'\n')
print([(r['backend'],r['variant'],r['generation_median_s'],r['cpu_median_s']) for r in rows],flush=True)
