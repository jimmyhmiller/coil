from pathlib import Path
import os,subprocess,resource,statistics,hashlib,json
W=Path.cwd();old=W.parent/'uses-build-inputs';D=W/'build/metadata-comparison'
compiler=Path('/Users/jimmyhmiller/Documents/Code/projects/coil/.worktrees/stogir-iterator-results/build/bin/coil-before-uses-86648db1')
sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
def fingerprint(root):return hashlib.sha256(b''.join(str(p.relative_to(root)).encode()+b'\0'+p.read_bytes()+b'\0' for p in sorted((root/'src').rglob('*.coil')))).hexdigest()
fingerprints={'before':fingerprint(old),'after':fingerprint(W)}
env={k:v for k,v in os.environ.items() if not k.startswith('COIL_')};env.update(COIL_LIBRARY_STATE='0',COIL_TPDE_SERIAL='1',COIL_CODEGEN_TIMINGS='1')
def run(args,cwd=W):
 p=subprocess.run([str(x) for x in args],cwd=cwd,env=env,capture_output=True,text=True);assert p.returncode==0,(args,p.stdout[-1000:],p.stderr[-2000:]);return p
version=run([compiler,'--version']).stdout.strip();assert '86648db1' in version
prior=json.loads((old/'build/uses-after/results.json').read_text());assert prior['compiler_sha256']==sha(compiler)
prior_hashes={r['backend']:r['object_sha256'] for r in prior['rows']}
fixture=Path('benchmarks/compiler-gaps/uses-graph.coil');assert sha(old/fixture)==sha(W/fixture)
runner=old/'build/uses-after/runner.o'
rows=[dict(backend=b,variant=v,generation_s=[],cpu_s=[]) for b in ['stogir','llvm','tpde'] for v in ['before','after']]
host=[]
def snapshot(phase):host.append(dict(phase=phase,load=os.getloadavg(),processes=run(['ps','-Ao','pid=,ppid=,pcpu=,comm=']).stdout))
snapshot('start')
for turn in range(9):
 for row in rows if turn%2==0 else list(reversed(rows)):
  name=row['variant']+'-'+row['backend'];cwd=old if row['variant']=='before' else W;obj=D/(name+'.o')
  assert fingerprint(cwd)==fingerprints[row['variant']]
  p=run([compiler,'emit-obj',cwd/fixture,'--backend',row['backend'],'-O3','--no-debug','-o',obj],cwd)
  (D/f'{name}-compile-{turn}.log').write_text(p.stdout+p.stderr)
  values=[int(l.split('\t')[3]) for l in p.stderr.splitlines() if l.startswith('coil-codegen\t') and l.split('\t')[2]=='ir-codegen'];assert values
  if turn:row['generation_s'].append(sum(values)/1e9)
  h=sha(obj)
  if row['variant']=='before':assert h==prior_hashes[row['backend']]
  if 'object_sha256' in row:assert row['object_sha256']==h
  row.update(object_sha256=h,object_bytes=obj.stat().st_size)
for row in rows:
 name=row['variant']+'-'+row['backend'];run(['cc',runner,D/(name+'.o'),'-o',D/name]);run([D/name]);(D/(name+'.asm')).write_text(run(['llvm-objdump','-dr','--no-show-raw-insn',D/(name+'.o')]).stdout)
snapshot('runtime')
for turn in range(17):
 for row in rows if turn%2==0 else list(reversed(rows)):
  a=resource.getrusage(resource.RUSAGE_CHILDREN);run([D/(row['variant']+'-'+row['backend'])]);b=resource.getrusage(resource.RUSAGE_CHILDREN)
  if turn:row['cpu_s'].append(b.ru_utime+b.ru_stime-a.ru_utime-a.ru_stime)
for row in rows:row.update(generation_median_s=statistics.median(row['generation_s']),cpu_median_s=statistics.median(row['cpu_s']))
snapshot('end')
(D/'results.json').write_text(json.dumps(dict(compiler=str(compiler),compiler_sha256=sha(compiler),compiler_version=version,fixture_sha256=sha(W/fixture),source_tree_sha256=fingerprints,runner_sha256=sha(runner),rows=rows,host=host,qualification='Fixed LLVM-built driver, same fixture and byte-identical opaque LLVM caller. Rotating six variant/backend rows;8 generation and16 process CPU samples after warmup. Before builder f34be99, after2572096. Native triple checksum independently checked on every invocation. Small diagnostic, not full compiler.'),indent=2)+'\n')
print([(r['backend'],r['variant'],r['generation_median_s'],r['cpu_median_s']) for r in rows],flush=True)
