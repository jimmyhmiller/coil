from pathlib import Path
import subprocess,os,time,json,hashlib
D=Path(__file__).resolve().parent;R=D.parents[1]
import sys
sys.path.insert(0,str(R/'scripts/compiler'))
import toolchain_stamp
current=R/'build/bin/coil-candidate';source=R/'src/compiler/main.coil'
sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
env={k:v for k,v in os.environ.items() if not k.startswith('COIL_')};env.update(COIL_LIBRARY_STATE='0',COIL_TPDE_SERIAL='1',COIL_CODEGEN_TIMINGS='1')
assert 'e3295675' in subprocess.check_output([str(current),'--version'],text=True)
def digest():return toolchain_stamp.digest(R)
def binary(name):return D/('host-'+name)/'bin/coil'
def stage_host(name):
 prefix=D/('host-'+name);(prefix/'bin').mkdir(parents=True,exist_ok=True)
 lib=prefix/'lib/coil';lib.mkdir(parents=True,exist_ok=True)
 for leaf,target in [('stdlib',R/'src/stdlib'),('compiler',R/'src/compiler'),('prelude.coil',R/'src/compiler/prelude.coil')]:
  dest=lib/leaf
  if not dest.exists():dest.symlink_to(target,target_is_directory=target.is_dir())
 native=prefix/'bin/native'
 if not native.exists():native.symlink_to(R/'build/bin/native',target_is_directory=True)
 toolchain_stamp.stamp_path(binary(name)).write_text(toolchain_stamp.stamp_path(current).read_text())
fingerprint=digest();assert toolchain_stamp.stamp_digest(toolchain_stamp.stamp_path(current).read_text())==fingerprint;rows=[]
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
# Controlled previous-backend comparison against the SAME frozen source.
baseline=Path('/Users/jimmyhmiller/Documents/Code/projects/coil/.worktrees/stogir-snapshot-copy-fusion/build/bin/coil-candidate')
assert '7944bdfa' in subprocess.check_output([str(baseline),'--version'],text=True)
prior=json.loads((D/'results.json').read_text())
assert prior['source_tree_sha256']==fingerprint
emit('before-stogir-0',baseline,'stogir')
seed_rows=list(rows);rows=[]
name='before-stogir';stage_host(name)
cmd=['cc',str(D/'before-stogir-0.o'),'-L/opt/homebrew/Cellar/llvm/23.1.4/lib','-lLLVM','-lm']
for lib in ['curl','mbedtls','mbedx509','mbedcrypto']:cmd.append(str(R/('build/bin/native/curl/arm64-macos/lib'+lib+'.a')))
cmd+=['-framework','CoreFoundation','-framework','SystemConfiguration','-lz','-Wl,-dead_strip','-o',str(binary(name))]
(D/'before-stogir-link-command.json').write_text(json.dumps(cmd,indent=2)+'\n')
p=subprocess.run(cmd,cwd=R,env=env,capture_output=True,text=True);(D/'before-stogir-link.log').write_text(p.stdout+p.stderr);assert p.returncode==0,p.stderr
emit('native-before-stogir-0',binary(name),'stogir')
expected=next(r['object_sha256'] for r in prior['host_rows'] if r['name']=='stogir-0')
assert rows[0]['object_sha256']==expected,'previous-backend host emits a different current-backend object'
(D/'before-results.json').write_text(json.dumps(dict(source_tree_sha256=fingerprint,host_rows=seed_rows,native_rows=rows,qualification='Single controlled diagnostic of prior7944bdfa backend emitting the same frozene3295675 source. Generated host uses the same current SDK and emits the exact current Stogir object. No acceptance or repetition claim.'),indent=2)+'\n')
