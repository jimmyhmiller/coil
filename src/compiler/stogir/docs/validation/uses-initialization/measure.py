from pathlib import Path
import os,subprocess,json,hashlib,resource,statistics
W=Path.cwd();D=W/'build/uses-after';compiler=Path('/Users/jimmyhmiller/Documents/Code/projects/coil/.worktrees/stogir-iterator-results/build/bin/coil-candidate')
sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
env={k:v for k,v in os.environ.items() if not k.startswith('COIL_')};env.update(COIL_LIBRARY_STATE='0',COIL_TPDE_SERIAL='1',COIL_CODEGEN_TIMINGS='1')
def run(args):
 p=subprocess.run([str(x) for x in args],cwd=W,env=env,capture_output=True,text=True)
 assert p.returncode==0,(args,p.returncode,p.stdout[-1000:],p.stderr[-2000:]);return p
version=run([compiler,'--version']).stdout.strip();assert '86648db1' in version
source=W/'benchmarks/compiler-gaps/uses-graph.coil';runner_source=W/'benchmarks/compiler-gaps/uses-graph-runner.coil'
fingerprint=hashlib.sha256(b''.join(str(p.relative_to(W)).encode()+b'\0'+p.read_bytes()+b'\0' for p in sorted((W/'src').rglob('*.coil')))).hexdigest()
run([compiler,'emit-obj',runner_source,'--backend','llvm','-O3','--no-debug','-o',D/'runner.o'])
rows=[dict(backend=b,generation_s=[],cpu_s=[]) for b in ['stogir','llvm','tpde']]
host=[]
def snapshot(phase):
 host.append(dict(phase=phase,load=os.getloadavg(),processes=run(['ps','-Ao','pid=,ppid=,pcpu=,comm=']).stdout))
snapshot('start')
for turn in range(9):
 for row in rows if turn%2==0 else list(reversed(rows)):
  b=row['backend'];obj=D/(b+'.o');p=run([compiler,'emit-obj',source,'--backend',b,'-O3','--no-debug','-o',obj]);(D/f'{b}-compile-{turn}.log').write_text(p.stdout+p.stderr)
  records=[int(l.split('\t')[3]) for l in p.stderr.splitlines() if l.startswith('coil-codegen\t') and l.split('\t')[2]=='ir-codegen'];assert records
  if turn:row['generation_s'].append(sum(records)/1e9)
  h=sha(obj)
  if 'object_sha256' in row:assert row['object_sha256']==h
  row.update(object_sha256=h,object_bytes=obj.stat().st_size)
for row in rows:
 b=row['backend'];run(['cc',D/'runner.o',D/(b+'.o'),'-o',D/b]);run([D/b]);(D/(b+'.asm')).write_text(run(['llvm-objdump','-dr','--no-show-raw-insn',D/(b+'.o')]).stdout)
snapshot('runtime')
for turn in range(17):
 for row in rows if turn%2==0 else list(reversed(rows)):
  u=resource.getrusage(resource.RUSAGE_CHILDREN);run([D/row['backend']]);v=resource.getrusage(resource.RUSAGE_CHILDREN)
  if turn:row['cpu_s'].append(v.ru_utime+v.ru_stime-u.ru_utime-u.ru_stime)
for row in rows:row.update(generation_median_s=statistics.median(row['generation_s']),cpu_median_s=statistics.median(row['cpu_s']))
snapshot('end')
x=dict(compiler=str(compiler),compiler_version=version,compiler_sha256=sha(compiler),source_tree_sha256=fingerprint,fixture_sha256=sha(source),runner_source_sha256=sha(runner_source),runner_object_sha256=sha(D/'runner.o'),rows=rows,host=host,qualification='Fixed LLVM-built compiler, same source; eight rotating IR-to-code generation and sixteen process CPU samples after warmup. Opaque graph runner independently accumulates expected edge triples at construction, checks kernel checksum then128 calls. No production optimization yet.')
(D/'results.json').write_text(json.dumps(x,indent=2)+'\n');print([(r['backend'],r['generation_median_s'],r['cpu_median_s']) for r in rows],flush=True)
