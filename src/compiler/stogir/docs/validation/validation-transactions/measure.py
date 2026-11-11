from pathlib import Path
import subprocess,resource,statistics,hashlib,json,os
D=Path(__file__).resolve().parent;R=D.parents[1];old=R.parent/'bulk-expansion'
sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
rows=[dict(name=n+'-'+b,cpu_s=[],source_sha256=sha(root/'src/stogir/verify.coil')) for n,root in [('before',old),('after',R)] for b in ['stogir','llvm']]
assert rows[0]['source_sha256']!=rows[2]['source_sha256']
for backend in ['stogir','llvm']:
 assert sha(D/('before-'+backend+'.o'))!=sha(D/('after-'+backend+'.o'))
host=dict(start_load=os.getloadavg())
for turn in range(33):
 for row in rows[turn%4:]+rows[:turn%4]:
  before=resource.getrusage(resource.RUSAGE_CHILDREN)
  subprocess.run([str(D/row['name'])],check=True,stdout=subprocess.DEVNULL,stderr=subprocess.PIPE)
  after=resource.getrusage(resource.RUSAGE_CHILDREN)
  if turn:row['cpu_s'].append(after.ru_utime+after.ru_stime-before.ru_utime-before.ru_stime)
for row in rows:
 row.update(median_s=statistics.median(row['cpu_s']),exe_sha256=sha(D/row['name']),object_sha256=sha(D/(row['name']+'.o')),object_bytes=(D/(row['name']+'.o')).stat().st_size)
 print(row['name'],row['median_s'],row['object_bytes'],flush=True)
host['end_load']=os.getloadavg()
(D/'results.json').write_text(json.dumps(dict(qualification='Checked graph preparation kernel, distinct source roots verified by source/object hashes. Same opaque caller compiled once with LLVM O3; every scheduled reference and malformed-input result checked independently.32 rotating CPU samples after excluded warmup.32 preparations per call. Not bootstrap acceptance.',host=host,rows=rows),indent=2))
