#!/usr/bin/env python3
"""Real frontend provider-closure operation, one identical opaque clang O3 caller."""
from pathlib import Path
import hashlib,json,os,resource,statistics,subprocess,time
ROOT=Path(__file__).resolve().parent
COMPILER=(ROOT/'../../../build/bin/coil-candidate').resolve()
OUT=(ROOT/'../../../build/frontend-providers').resolve(); OUT.mkdir(exist_ok=True)
ENV={k:v for k,v in os.environ.items() if not k.startswith('COIL_')}
ENV.update(COIL_LIBRARY_STATE='0',COIL_TPDE_SERIAL='1',COIL_CODEGEN_TIMINGS='1')

def run(command):
    before=resource.getrusage(resource.RUSAGE_CHILDREN); start=time.monotonic()
    r=subprocess.run(list(map(str,command)),cwd=ROOT,env=ENV,capture_output=True,text=True,timeout=180)
    wall=time.monotonic()-start; after=resource.getrusage(resource.RUSAGE_CHILDREN)
    assert r.returncode==0,(command,r.stdout,r.stderr)
    return r,wall,after.ru_utime+after.ru_stime-before.ru_utime-before.ru_stime

def sha(p): return hashlib.sha256(p.read_bytes()).hexdigest()

caller=OUT/'runner.o'
clang=Path(subprocess.check_output(['llvm-config','--bindir'],text=True).strip())/'clang'
r,_,_=run([clang,'-O3','-c','runner.c','-o',caller])
(OUT/'caller-generation.txt').write_text(r.stdout+r.stderr)
rows=[]; answers=None
for backend in ['stogir','llvm']:
    obj=OUT/(backend+'.o');exe=OUT/backend
    r,wall,cpu=run([COMPILER,'emit-obj','kernel.coil','--backend',backend,'-O3','--no-debug','-o',obj])
    (OUT/(backend+'-generation.txt')).write_text(r.stdout+r.stderr)
    phases=[l.split('\t') for l in r.stderr.splitlines() if l.startswith('coil-codegen\t')]
    assert phases
    run(['cc',obj,caller,'-lm','-o',exe])
    r,_,_=run([exe])
    fields=r.stdout.split(); assert fields[0]=='answers' and int(fields[1])==100000 and fields[2]=='kernel_cpu_ns'
    answers=100000
    (OUT/(backend+'-answers.txt')).write_text(r.stdout)
    rows.append(dict(backend=backend,object_sha256=sha(obj),object_bytes=obj.stat().st_size,
                     generation_s=sum(int(x[3]) for x in phases)/1e9,whole_emit_wall_s=wall,
                     whole_emit_cpu_s=cpu,wall=[],cpu=[],process_cpu=[],raw_answers=[]))
    print(backend,'built, independent expected closure count verified',flush=True)
for turn in range(8):
    for row in (rows if turn%2==0 else list(reversed(rows))):
        r,wall,cpu=run([OUT/row['backend']]);fields=r.stdout.split()
        assert fields[0]=='answers' and int(fields[1])==answers and fields[2]=='kernel_cpu_ns'
        row['raw_answers'].append(r.stdout)
        row['wall'].append(wall);row['process_cpu'].append(cpu);row['cpu'].append(int(fields[3])/1e9)
    print('runtime round',turn+1,flush=True)
for row in rows:
    row['median_cpu_s']=statistics.median(row['cpu']);row['median_wall_s']=statistics.median(row['wall'])
report=dict(compiler=str(COMPILER),compiler_sha256=sha(COMPILER),caller_sha256=sha(caller),
            inputs={p.name:sha(p) for p in [*ROOT.glob('*.coil'),ROOT/'runner.c',ROOT/'Coil.toml']},rows=rows,
            qualification='Diagnostic only: actual resolver operation, opaque C caller controls construction parameters; create/release excluded from kernel process-CPU timer; one excluded warmup, eight alternating runtime samples. Not whole-bootstrap acceptance.')
(OUT/'results.json').write_text(json.dumps(report,indent=2)+'\n')
print(json.dumps(rows,indent=2),flush=True)
