from pathlib import Path
import os,subprocess,hashlib,json,statistics
r=Path.cwd();d=r/'build/wide-record-scan'
old=Path('/Users/jimmyhmiller/Documents/Code/projects/coil/.worktrees/stogir-return-merge/build/bin/coil-candidate')
new=Path('/Users/jimmyhmiller/Documents/Code/projects/coil/.worktrees/stogir-constant-multiply/build/bin/coil-candidate')
e=dict(os.environ,COIL_LIBRARY_STATE='0',COIL_TPDE_SERIAL='1',COIL_CODEGEN_TIMINGS='1')
def run(args):return subprocess.run(list(map(str,args)),cwd=r,env=e,text=True,capture_output=True,check=True)
sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
assert '75d34878' in run([new,'--version']).stdout
rows=[dict(name=n,compiler=str(c),backend=b,compiler_sha256=sha(c),generation_s=[],kernel_cpu_ns=[]) for n,c,b in [('before',old,'stogir'),('candidate',new,'stogir'),('llvm',new,'llvm')]]
sources={str(p):sha(p) for p in [r/'benchmarks/compiler-gaps/wide-record-scan.coil',r/'benchmarks/compiler-gaps/wide-record-scan-runner.coil',r/'benchmarks/compiler-gaps/wide-record-scan-reference.c']}
for turn in range(5):
 for row in rows[turn%3:]+rows[:turn%3]:
  obj=d/(row['name']+'.o');out=run([row['compiler'],'emit-obj','benchmarks/compiler-gaps/wide-record-scan.coil','--backend',row['backend'],'-O3','--no-debug','-o',obj])
  records=[x.split('\t') for x in out.stderr.splitlines() if x.startswith('coil-codegen\t')]
  assert records and all(x[1]==row['backend'] and x[2]=='ir-codegen' for x in records)
  digest=sha(obj)
  if 'object_sha256' in row:assert digest==row['object_sha256']
  row.update(object_sha256=digest,object_bytes=obj.stat().st_size)
  if turn:row['generation_s'].append(sum(int(x[3]) for x in records)/1e9)
run([old,'emit-obj','benchmarks/compiler-gaps/wide-record-scan-runner.coil','--backend','llvm','-O3','--no-debug','-o',d/'runner.o'])
run(['cc','-O3','-c','benchmarks/compiler-gaps/wide-record-scan-reference.c','-o',d/'reference.o'])
for row in rows:
 n=row['name'];run(['cc',d/'runner.o',d/'reference.o',d/(n+'.o'),'-lm','-o',d/n]);(d/(n+'.asm')).write_text(run(['llvm-objdump','-dr','--no-show-raw-insn',d/(n+'.o')]).stdout)
for turn in range(17):
 for row in rows[turn%3:]+rows[:turn%3]:
  ns=int(run([d/row['name']]).stdout.strip());assert ns>0
  if turn:row['kernel_cpu_ns'].append(ns)
for row in rows:
 row['median_generation_s']=statistics.median(row['generation_s']);row['median_kernel_cpu_ns']=statistics.median(row['kernel_cpu_ns']);print(row['name'],row['median_generation_s'],row['median_kernel_cpu_ns'],row['object_bytes'],flush=True)
assert sources=={p:sha(Path(p)) for p in sources}
(d/'results.json').write_text(json.dumps(dict(qualification='Small 32-byte record scan; four alternating IR-codegen samples and16 rotating timed kernel-loop CPU samples after warmups. Clock encloses1024 opaque calls over4096records; independent C reference and signed/count/wrap correctness checks occur outside timer. Same LLVM-built Coil ArrayList caller and C timing/reference object. Serial/O3/no-debug/caches off. Not whole-bootstrap acceptance.',sources=sources,caller_sha256=sha(d/'runner.o'),reference_sha256=sha(d/'reference.o'),rows=rows),indent=2)+'\n')
