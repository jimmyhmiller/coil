from pathlib import Path
import subprocess,resource,statistics,json,hashlib,os
w=Path.cwd();d=w/'build/view-buffer';sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
def run(args):
 p=subprocess.run([str(x) for x in args],capture_output=True,text=True);assert p.returncode==0,(args,p.returncode,p.stderr);return p
run(['cc','-O3','-c',d/'caller.c','-o',d/'caller.o'])
rows=[]
for i in range(4):
 obj=d/('coil-stogir-view-buffer-'+str(i)+'.o');exe=d/('variant-'+str(i));run(['cc',d/'caller.o',obj,'-o',exe]);run([exe]);(d/('variant-'+str(i)+'.asm')).write_text(run(['llvm-objdump','-dr','--no-show-raw-insn',obj]).stdout)
 rows.append(dict(variant=i,label=['compact-only','expanded-only','expanded-then-compact','compact-then-expanded'][i],object_sha256=sha(obj),object_bytes=obj.stat().st_size,cpu_s=[]))
host=[]
def snapshot(phase):host.append(dict(phase=phase,load=os.getloadavg(),processes=run(['ps','-Ao','pid=,ppid=,pcpu=,comm=']).stdout))
snapshot('start')
for turn in range(16):
 for row in rows if turn%2==0 else list(reversed(rows)):
  before=resource.getrusage(resource.RUSAGE_CHILDREN);run([d/('variant-'+str(row['variant']))]);after=resource.getrusage(resource.RUSAGE_CHILDREN);row['cpu_s'].append(after.ru_utime+after.ru_stime-before.ru_utime-before.ru_stime)
snapshot('end')
for row in rows:row['median_cpu_s']=statistics.median(row['cpu_s']);print(row['label'],row['median_cpu_s'],row['object_bytes'],flush=True)
(d/'results.json').write_text(json.dumps(dict(qualification='Isolated callee-view buffer reduction; identical separately compiled C caller,128 oracle cases and8M timed opaque calls/process;16 rotating process CPU samples after excluded warmup. Not full bootstrap acceptance.',caller_sha256=sha(d/'caller.o'),caller_source_sha256=sha(d/'caller.c'),source_sha256={str(p.relative_to(w)):sha(p) for p in [w/'src/stogir/call-inline.coil',w/'tests/module-execution.coil']},host=host,rows=rows),indent=2))
