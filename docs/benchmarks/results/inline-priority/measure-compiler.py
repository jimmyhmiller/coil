from pathlib import Path
import subprocess,os,time,json,hashlib
D=Path(__file__).resolve().parent;R=D.parents[1]
current=R/'build/bin/coil-candidate';before=R/'build/bin/coil-before-priority-4d21432d';source=R/'src/compiler/main.coil'
sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
env={k:v for k,v in os.environ.items() if not k.startswith('COIL_')};env.update(COIL_LIBRARY_STATE='0',COIL_TPDE_SERIAL='1',COIL_CODEGEN_TIMINGS='1')
assert 'cd81b35b' in subprocess.check_output([str(current),'--version'],text=True)
assert '4d21432d' in subprocess.check_output([str(before),'--version'],text=True)
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
for name,c,b in [('before-stogir',before,'stogir'),('current-stogir',current,'stogir'),('llvm',current,'llvm')]:emit(name,c,b)
host_rows=list(rows);rows=[]
for name in ['before-stogir','current-stogir','llvm']:
 cmd=['cc',str(D/(name+'.o')),'-L/opt/homebrew/Cellar/llvm/23.1.4/lib','-lLLVM','-lm']
 for lib in ['curl','mbedtls','mbedx509','mbedcrypto']:cmd.append(str(R/('build/bin/native/curl/arm64-macos/lib'+lib+'.a')))
 cmd+=['-framework','CoreFoundation','-framework','SystemConfiguration','-lz','-Wl,-dead_strip','-o',str(D/('compiler-'+name))]
 (D/(name+'-link-command.json')).write_text(json.dumps(cmd,indent=2)+'\n');p=subprocess.run(cmd,cwd=R,env=env,capture_output=True,text=True);(D/(name+'-link.log')).write_text(p.stdout+p.stderr);assert p.returncode==0,(name,p.stderr)
 assert subprocess.run([str(D/('compiler-'+name)),'--version'],env=env,capture_output=True).returncode==0
for name in ['before-stogir','current-stogir','llvm']:emit('native-'+name,D/('compiler-'+name),'stogir')
assert all(r['object_sha256']==host_rows[1]['object_sha256'] for r in rows),'cross-host object differs'
(D/'results.json').write_text(json.dumps(dict(source_tree_sha256=fingerprint,host_rows=host_rows,native_rows=rows,qualification='Single serial same-frozen-source full compiler diagnostic, caches off. LLVM-built driver generation compared on exact source; native runtimes execute compiler-to-stogir O3 from compilers linked from exact host-emitted objects. Native output hashes checked against each other and host output. Not repeated acceptance.'),indent=2)+'\n')
