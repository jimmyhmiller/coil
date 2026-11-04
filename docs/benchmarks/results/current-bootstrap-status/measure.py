from pathlib import Path
import subprocess,os,time,json,hashlib
D=Path(__file__).resolve().parent;R=D.parents[1]
current=R/'build/bin/coil-candidate';source=R/'src/compiler/main.coil'
sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
env={k:v for k,v in os.environ.items() if not k.startswith('COIL_')};env.update(COIL_LIBRARY_STATE='0',COIL_TPDE_SERIAL='1',COIL_CODEGEN_TIMINGS='1')
assert '088de286' in subprocess.check_output([str(current),'--version'],text=True)
def digest():
 h=hashlib.sha256()
 for p in sorted((R/'src').rglob('*.coil')):h.update(str(p.relative_to(R)).encode()+b'\0'+p.read_bytes()+b'\0')
 return h.hexdigest()
fingerprint=digest();rows=[]
def host():
 p=subprocess.run(['ps','-Ao','pid=,ppid=,pcpu=,comm='],capture_output=True,text=True);out=[]
 for l in p.stdout.splitlines():
  s=l.split(None,3)
  if len(s)==4:out.append(dict(pid=int(s[0]),parent_pid=int(s[1]),cpu_percent=float(s[2]),name=Path(s[3]).name))
 return dict(load=os.getloadavg(),top_processes=sorted(out,key=lambda x:x['cpu_percent'],reverse=True)[:12])
def emit(name,compiler,backend):
 assert digest()==fingerprint;hb=host();cmd=[str(compiler),'emit-obj',str(source),'--backend',backend,'-O3','--no-debug','-o',str(D/(name+'.o'))]
 with (D/(name+'.stdout')).open('w') as out,(D/(name+'.stderr')).open('w') as err:
  t=time.monotonic();p=subprocess.Popen(cmd,cwd=R,env=env,stdout=out,stderr=err);_,status,u=os.wait4(p.pid,0);p.returncode=os.waitstatus_to_exitcode(status);wall=time.monotonic()-t
 assert p.returncode==0,(name,p.returncode)
 records=[l.split('\t') for l in (D/(name+'.stderr')).read_text().splitlines() if l.startswith('coil-codegen\t')];assert records and all(r[1]==backend and r[2]=='ir-codegen' for r in records)
 assert digest()==fingerprint
 row=dict(name=name,compiler=str(compiler),compiler_sha256=sha(compiler),backend=backend,generation_s=sum(int(r[3]) for r in records)/1e9,cpu_s=u.ru_utime+u.ru_stime,wall_s=wall,rss_bytes=u.ru_maxrss,object_sha256=sha(D/(name+'.o')),object_bytes=(D/(name+'.o')).stat().st_size,host_before=hb,host_after=host());rows.append(row)
 (D/'progress.json').write_text(json.dumps(rows,indent=2)+'\n');print(name,row['generation_s'],row['cpu_s'],row['rss_bytes'],flush=True)
# Warm each emitter, then rotate two complete generation samples. This is a
# current diagnostic checkpoint; two samples do not establish acceptance.
for name,backend in [('stogir','stogir'),('llvm','llvm')]:emit('warm-'+name,current,backend)
rows=[]
for turn in range(2):
 cases=[('stogir','stogir'),('llvm','llvm')]
 if turn%2:cases.reverse()
 for name,backend in cases:emit(name+'-'+str(turn),current,backend)
host_rows=list(rows);rows=[]
for name in ['stogir','llvm']:
 cmd=['cc',str(D/(name+'-0.o')),'-L/opt/homebrew/Cellar/llvm/23.1.4/lib','-lLLVM','-lm']
 for lib in ['curl','mbedtls','mbedx509','mbedcrypto']:cmd.append(str(R/('build/bin/native/curl/arm64-macos/lib'+lib+'.a')))
 cmd+=['-framework','CoreFoundation','-framework','SystemConfiguration','-lz','-Wl,-dead_strip','-o',str(D/('compiler-'+name))]
 (D/(name+'-link-command.json')).write_text(json.dumps(cmd,indent=2)+'\n');p=subprocess.run(cmd,cwd=R,env=env,capture_output=True,text=True);(D/(name+'-link.log')).write_text(p.stdout+p.stderr);assert p.returncode==0,(name,p.stderr)
 assert subprocess.run([str(D/('compiler-'+name)),'--version'],env=env,capture_output=True).returncode==0
# Warm both generated hosts, then rotate full runtime samples. Timings remain
# instrumented to preserve the existing comparison boundary.
for name in ['stogir','llvm']:emit('warm-native-'+name,D/('compiler-'+name),'stogir')
rows=[]
for turn in range(2):
 names=['stogir','llvm']
 if turn%2:names.reverse()
 for name in names:emit('native-'+name+'-'+str(turn),D/('compiler-'+name),'stogir')
expected=next(r['object_sha256'] for r in host_rows if r['name']=='stogir-0')
assert all(r['object_sha256']==expected for r in host_rows if r['backend']=='stogir')
assert all(r['object_sha256']==expected for r in rows),'cross-host object differs'
assert len({r['object_sha256'] for r in host_rows if r['backend']=='llvm'})==1
(D/'results.json').write_text(json.dumps(dict(source_tree_sha256=fingerprint,host_rows=host_rows,native_rows=rows,qualification='Current frozen-source bootstrap diagnostic. Matched caches off/serial/O3/no-debug and existing instrumented boundary. One excluded warmup and two alternating full samples for both generation and generated-host runtime. All native stogir outputs equal seed output; per-backend objects stable. Host snapshots qualify contention. Not acceptance with only two samples.'),indent=2)+'\n')
print('Current bootstrap checkpoint complete; all object checks passed',flush=True)
