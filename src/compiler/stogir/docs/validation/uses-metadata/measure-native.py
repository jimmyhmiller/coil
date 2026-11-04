from pathlib import Path
import json,subprocess,resource,statistics,os
D=Path(__file__).resolve().parent
x=json.loads((D/'results.json').read_text());rows=[dict(backend=r['backend'],variant=r['variant'],cpu_s=[]) for r in x['rows']]
def host():return dict(load=os.getloadavg(),processes=subprocess.check_output(['ps','-Ao','pid=,ppid=,pcpu=,comm='],text=True))
h=host()
for turn in range(17):
 for row in rows if turn%2==0 else list(reversed(rows)):
  a=resource.getrusage(resource.RUSAGE_CHILDREN);p=subprocess.run([str(D/(row['variant']+'-'+row['backend']))],capture_output=True);b=resource.getrusage(resource.RUSAGE_CHILDREN);assert p.returncode==0
  if turn:row['cpu_s'].append(b.ru_utime+b.ru_stime-a.ru_utime-a.ru_stime)
for r in rows:r['cpu_median_s']=statistics.median(r['cpu_s'])
(D/'native-repeat.json').write_text(json.dumps(dict(rows=rows,host_before=h,host_after=host(),runner_sha256=x['runner_sha256'],qualification='Same six fixed-emitter binaries from results.json;16 rotating process CPU samples after warmup; same opaque LLVM caller/checksum on every invocation.'),indent=2)+'\n')
print([(r['backend'],r['variant'],r['cpu_median_s']) for r in rows])
