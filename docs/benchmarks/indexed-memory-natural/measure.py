from pathlib import Path
import subprocess,os,json,time,statistics,hashlib
r=Path.cwd();out=r/'build/indexed-natural-comparison';new=r/'build/bin/coil-candidate'
oldroot=Path('/Users/jimmyhmiller/Documents/Code/projects/coil/.worktrees/stogir-inline-benefit-density');old=oldroot/'build/bin/coil-candidate'
caller=Path('/Users/jimmyhmiller/Documents/Code/projects/coil/.worktrees/stogir-call-result-projections/build/bin/coil-candidate')
lib=Path('/Users/jimmyhmiller/Documents/Code/projects/coil-stogir/.worktrees/indexed-memory')
e={k:v for k,v in os.environ.items() if not k.startswith('COIL_')};e.update(COIL_LIBRARY_STATE='0',COIL_TPDE_SERIAL='1',COIL_CODEGEN_TIMINGS='1')
sha=lambda p:hashlib.sha256(Path(p).read_bytes()).hexdigest()
def run(args,cwd=r):
 p=subprocess.run([str(a) for a in args],cwd=cwd,env=e,capture_output=True,text=True)
 if p.returncode:(out/'failure.txt').write_text(p.stdout+p.stderr);p.check_returncode()
 return p
def manifest(root):
 names=run(['git','ls-files','-z'],cwd=root).stdout.split('\0');files={}
 for name in names:
  if name.endswith('.coil') or name.endswith('Coil.toml'):
   p=root/name
   if p.is_file():files[name]=dict(sha256=sha(p),mtime_ns=p.stat().st_mtime_ns)
 return dict(head=run(['git','rev-parse','HEAD'],cwd=root).stdout.strip(),status=run(['git','status','--porcelain'],cwd=root).stdout,files=files,sdk=run(['python3','scripts/compiler/toolchain_stamp.py','digest'],cwd=root).stdout.strip())
inputs={str(root):manifest(root) for root in (oldroot,r)}
for root in (oldroot,r):assert inputs[str(root)]['sdk']==(root/'build/bin/coil-candidate.toolchain').read_text().splitlines()[0]
assert 'bb21d63f' in run([new,'--version']).stdout;assert '55d4a5ff' in run([old,'--version']).stdout
results=[]
for fixture in ('avec-get','verify-control','emitter'):
 d=out/fixture;d.mkdir(exist_ok=True)
 is_emit=fixture.startswith('emitter')
 kernel=(r/'docs/benchmarks/emission-workload/kernel.coil').read_text() if is_emit else (lib/'benchmarks/compiler-gaps/verify-graph.coil').read_text()
 runner=(r/'docs/benchmarks/fixed-limit-summary/runner.coil').read_text() if is_emit else (lib/'benchmarks/compiler-gaps/verify-graph-runner.coil').read_text().replace('(for [i 0 128]','(for [i 0 4096]').replace('(* expected 128)','(* expected 4096)')
 if fixture=='avec-get':
  kernel=(lib/'benchmarks/compiler-gaps/avec-get.coil').read_text()
  runner=(lib/'benchmarks/compiler-gaps/avec-get-runner.coil').read_text()
 (d/'kernel.coil').write_text(kernel);(d/'runner.coil').write_text(runner)
 olddir=oldroot/'build/indexed-natural-comparison'/fixture;olddir.mkdir(parents=True,exist_ok=True)
 (olddir/'kernel.coil').write_text(kernel)
 rows=[dict(name=n,compiler=str(c),backend=b,source_root=str(root),generation=[],cpu=[],wall=[]) for n,c,b,root in [('before',old,'stogir',oldroot),('indexed',new,'stogir',r),('llvm',new,'llvm',r)]]
 for turn in range(1 if is_emit else 5):
  for row in rows[turn%3:]+rows[:turn%3]:
   root=Path(row['source_root']);entry=root/'build/indexed-natural-comparison'/fixture/'kernel.coil'
   p=run([row['compiler'],'emit-obj',entry,'--backend',row['backend'],'-O3','--no-debug','-o',d/(row['name']+'.o')],cwd=root)
   (d/(row['name']+'-generation-'+str(turn)+'.txt')).write_text(p.stdout+p.stderr)
   rec=[l.split('\t') for l in p.stderr.splitlines() if l.startswith('coil-codegen\t')];assert rec and all(x[1]==row['backend'] and x[2]=='ir-codegen' for x in rec)
   digest=sha(d/(row['name']+'.o'))
   if 'object_sha256' in row:assert row['object_sha256']==digest
   row.update(object_sha256=digest,object_bytes=(d/(row['name']+'.o')).stat().st_size)
   if turn:row['generation'].append(sum(int(x[3]) for x in rec)/1e9)
 run([caller,'emit-obj',d/'runner.coil','--backend','llvm','-O3','--no-debug','-o',d/'runner.o'])
 for row in rows:run(['cc',d/'runner.o',d/(row['name']+'.o'),'-lm','-o',d/row['name']])
 expected=None
 for turn in range(9):
  for row in rows[turn%3:]+rows[:turn%3]:
   t=time.perf_counter();p=subprocess.Popen([str(d/row['name'])],stdout=subprocess.PIPE,stderr=subprocess.PIPE,env={k:v for k,v in e.items() if k!='COIL_CODEGEN_TIMINGS'})
   _,status,u=os.wait4(p.pid,0);p.returncode=os.waitstatus_to_exitcode(status);stdout,stderr=p.communicate();wall=time.perf_counter()-t
   assert p.returncode==0,(fixture,row['name'],stdout,stderr)
   if expected is None:expected=stdout
   assert expected==stdout,(fixture,row['name'],stdout,expected)
   (d/(row['name']+'-answers.txt')).write_bytes(stdout+stderr)
   if turn:row['cpu'].append(u.ru_utime+u.ru_stime);row['wall'].append(wall)
 for row in rows:
  row['median_cpu']=statistics.median(row['cpu']);row['median_wall']=statistics.median(row['wall'])
  if row['generation']:row['median_generation']=statistics.median(row['generation'])
  print(fixture,row['name'],row.get('median_generation'),row['median_cpu'],row['median_wall'],row['object_bytes'],flush=True)
 result=dict(fixture=fixture,rows=rows,kernel_sha256=sha(d/'kernel.coil'),runner_sha256=sha(d/'runner.coil'),caller_sha256=sha(d/'runner.o'))
 (d/'results.json').write_text(json.dumps(result,indent=2)+'\n');results.append(result)
assert inputs=={str(root):manifest(root) for root in (oldroot,r)}
(out/'results.json').write_text(json.dumps(dict(qualification='Register-offset memory target selection. Six library source files changed, same public fixture ABI. AVec and arithmetic verifier unchanged; plain original actual CIR emitter. Before source and compiler inline-benefit-density55d4a5ff; afterbb21d63f. Public ABI/fixture/caller identical per workload, before/new source roots and compiler+tracked project+SDK identities recorded. All inherited COIL variables cleared; recorded compile environment, runtime uses same clean environment with codegen timings disabled. Original AVec, verifier and arithmetic emitter fixtures retained. Four rotating verifier generation samples/eight rotating CPU/wall after warmups; emitter objects built once, eight rotating CPU/wall samples. No task builds/tests overlap timed runs. Not whole-bootstrap acceptance.',environment={k:v for k,v in e.items() if k.startswith('COIL_')},inputs=inputs,compiler_sha256=sha(new),before_compiler_sha256=sha(old),results=results),indent=2)+'\n')
