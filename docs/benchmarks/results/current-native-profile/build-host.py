from pathlib import Path
import subprocess,os,json,hashlib,sys
r=Path.cwd();d=r/'build/reuse-native-profile';c=r/'build/bin/coil-candidate';e={k:v for k,v in os.environ.items() if not k.startswith('COIL_')};e.update(COIL_LIBRARY_STATE='0',COIL_TPDE_SERIAL='1',COIL_CODEGEN_TIMINGS='1')
sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
def fingerprint():return hashlib.sha256(b''.join(str(p.relative_to(r)).encode()+b'\0'+p.read_bytes()+b'\0' for p in sorted((r/'src').rglob('*.coil')))).hexdigest()
target_commit=subprocess.check_output(['git','rev-parse','HEAD'],text=True).strip()
sys.path.insert(0,str(r/'scripts/compiler'))
import toolchain_stamp
stamp=toolchain_stamp.stamp_text();library_digest=toolchain_stamp.stamp_digest(stamp)
f=fingerprint();version=subprocess.check_output([c,'--version'],text=True);assert '088de286' in version
with (d/'host-build.stdout').open('w') as out,(d/'host-build.stderr').open('w') as err:
 subprocess.run([c,'emit-obj',r/'src/compiler/main.coil','--backend','stogir','-O3','--no-debug','-o',d/'host.o'],cwd=r,env=e,stdout=out,stderr=err,check=True)
cmd=['cc',str(d/'host.o'),'-L/opt/homebrew/Cellar/llvm/23.1.4/lib','-lLLVM','-lm']
for lib in ['curl','mbedtls','mbedx509','mbedcrypto']:cmd.append(str(r/('build/bin/native/curl/arm64-macos/lib'+lib+'.a')))
cmd+=['-framework','CoreFoundation','-framework','SystemConfiguration','-lz','-Wl,-dead_strip','-o',str(d/'compiler-stogir')]
p=subprocess.run(cmd,cwd=r,env=e,capture_output=True,text=True);(d/'link.log').write_text(p.stdout+p.stderr);assert p.returncode==0,p.stderr
assert library_digest==toolchain_stamp.digest()
toolchain_stamp.stamp_path(d/'compiler-stogir').write_text(stamp)
native_version=subprocess.check_output([d/'compiler-stogir','--version'],env=e,text=True);assert target_commit[:12] in native_version;assert f==fingerprint()
(d/'build-metadata.json').write_text(json.dumps(dict(qualification='Profile host only; not a timing comparison.',source_tree_sha256=f,checkout_commit=target_commit,library_digest=library_digest,toolchain_stamp=stamp,driver_version=version.strip(),driver_sha256=sha(c),native_version=native_version.strip(),object_sha256=sha(d/'host.o'),native_sha256=sha(d/'compiler-stogir'),link_command=cmd),indent=2))
print(native_version.strip(),flush=True)
