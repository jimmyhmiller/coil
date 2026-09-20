#!/usr/bin/env python3
"""Generate precise compiler-metadata graph visitors from declared Coil types.

Visitors copy only typed live ranges and rewrite only declared pointers. Unknown
opaque fields fail generation until their ownership is explicitly classified.
"""
from pathlib import Path
import re
import sys

ROOT = Path(__file__).resolve().parents[2]
TOKEN = re.compile(r';[^\n]*|#\\(?:[A-Za-z]+|.)|"(?:\\.|[^"\\])*"|[()\[\]]|[^\s()\[\]";]+')
class Vector(list): pass

def read(text):
    tokens = [m.group() for m in TOKEN.finditer(text) if not m.group().startswith(';')]
    def node(i):
        t = tokens[i]
        if t not in ('(', '['): return t, i+1
        closing = ')' if t == '(' else ']'
        items=Vector() if t=='[' else []; i+=1
        while tokens[i] != closing:
            item,i=node(i); items.append(item)
        return items,i+1
    forms=[]; i=0
    while i<len(tokens):
        item,i=node(i); forms.append(item)
    return forms

def freeze(t): return tuple(map(freeze,t)) if isinstance(t,list) else t

def render(t):
    if not isinstance(t,tuple): return t
    if t[0]=='fnptr': return '(fnptr '+t[1]+' ['+' '.join(map(render,t[2]))+'] '+render(t[3])+')'
    return '('+' '.join(map(render,t))+')'

modules={}; definitions={}
for path in list((ROOT/'src/compiler').glob('*.coil'))+list((ROOT/'src/stdlib').glob('*.coil')):
    if path.name in ('guide.coil','retained_snapshot.coil'): continue
    forms=read(path.read_text())
    module=next((f[1] for f in forms if isinstance(f,list) and len(f)>1 and f[0]=='module'),None)
    if not module: continue
    own={f[1]:f for f in forms if isinstance(f,list) and len(f)>2 and f[0] in ('defstruct','defsum','deftrait')}
    imports=[f for f in forms if isinstance(f,list) and len(f)>1 and f[0]=='import']
    modules[module]=(own,imports)
    for name,form in own.items(): definitions[module+'.'+name]=(module,form)

PRIMITIVES={'i8','i16','i32','i64','u8','u16','u32','u64','isize','usize','f32','f64','bool','void','never','Code','CodeBuilder'}
def resolve(name,mod,params):
    if name in params:return params[name]
    if name.lstrip(':') in PRIMITIVES:return name.lstrip(':')
    if name in definitions:return name
    own,imports=modules[mod]
    if name in own:return mod+'.'+name
    if '/' in name:
        alias,leaf=name.split('/',1)
        for imp in imports:
            if ':as' in imp and imp[imp.index(':as')+1]==alias:
                return imp[1][1:-1]+'.'+leaf
    candidates=[]
    for imp in imports:
        imported=imp[1][1:-1]
        if ':use' not in imp:continue
        use=imp[imp.index(':use')+1]
        if (use=='*' or name in use) and imported+'.'+name in definitions:
            candidates.append(imported+'.'+name)
    if len(set(candidates))==1:return candidates[0]
    if 'coil.core.'+name in definitions:return 'coil.core.'+name
    raise ValueError(('unresolved metadata type',name,mod,candidates))

def qualify(t,mod,params):
    if isinstance(t,str):return resolve(t,mod,params)
    head=t[0]
    if head in ('ptr','ref','mut','slice','array','dyn','fnptr'):
        if head=='fnptr':return ('fnptr',t[1],tuple(qualify(x,mod,params) for x in t[2]),qualify(t[3],mod,params))
        if head=='array':return ('array',qualify(t[1],mod,params),str(t[2]))
        return (head,qualify(t[1],mod,params))
    return (resolve(head,mod,params),)+tuple(qualify(x,mod,params) for x in t[1:])

def definition(t):
    head=t[0] if isinstance(t,tuple) else t
    mod,form=definitions[head]
    generic=isinstance(form[2],Vector) and (not form[2] or isinstance(form[2][0],str))
    parameters=dict(zip([p[0] if isinstance(p,list) else p for p in form[2]],t[1:])) if generic else {}
    tail=form[3:] if generic else form[2:]
    return head,mod,form[0],parameters,tail

ROOTS=['coil.compiler.loader.LS','coil.compiler.ast.Program','coil.compiler.ast.AstUnitState',
       ('coil.arraylist.ArrayList','coil.compiler.metaengine.MEEntry'), 'coil.reader.Sexp']
OVERRIDES={
 ('coil.compiler.loader.LS','semantic_maps'):('ptr','coil.compiler.comptime.SemMapsSnap'),
 ('coil.compiler.loader.LS','checker_context'):('ptr','coil.compiler.check.Cx'),
 ('coil.compiler.loader.SemanticWorkspaceSlot','value'):('ptr','coil.compiler.resolve.SemanticWorkspace'),
 ('coil.compiler.metaengine.MEEntry','interpcx'):('ptr','coil.compiler.interp.Interp'),
}
NULL_FIELDS={('coil.compiler.loader.LS','parent'),
 ('coil.compiler.check.Cx','anon_outer_env')}
EMPTY_LISTS={
 ('coil.compiler.loader.LS','out'),
 ('coil.compiler.check.Cx','cur_bounds'), ('coil.compiler.check.Cx','loops'),
 ('coil.compiler.check.Cx','anon_funcs'),
 ('coil.compiler.resolve.SemanticWorkspace','resolved_revisions')}
EMPTY_MAPS={
 ('coil.compiler.check.Cx','synth_cache'),
 ('coil.compiler.resolve.SemanticWorkspace','revision_heads'),
 ('coil.compiler.resolve.SemanticWorkspace','failed_parses')}

# Pointer fields whose closure is sealed once and then held as an artifact. The
# number is the root kind: it names the walk a sealed root is recorded with. A
# field is only sealed when the driver registered its pointer as a root, which it
# does for records nothing will write again.
ARTIFACT_FIELDS={
 ('coil.compiler.ast.Func','body'):1,
 ('coil.compiler.ast.Func','params'):2,
 ('coil.compiler.ast.Extern','params'):6,
 ('coil.compiler.check.Sig','params'):6,
 ('coil.compiler.check.Sig','fnptr_params'):6}
ARTIFACT_KINDS={}

# Declaration records an accepted program is made of. Their closures are sealed,
# and a run of them that is spelled exactly like a run sealed before is held as one
# chunk artifact instead of being walked record by record. That is what makes the
# cost of publishing follow what changed: the flat arrays are rebuilt on every
# edit, but the records in them mostly are not. The number is the chunk kind.
SEALED_RECORDS={
 'coil.compiler.ast.Func':1,
 'coil.compiler.ast.Extern':2,
 'coil.compiler.check.Sig':3,
 'coil.compiler.ast.StructDef':4,
 'coil.compiler.ast.SumDef':5,
 'coil.compiler.ast.TraitDef':6,
 'coil.compiler.ast.ImplDef':7,
 # NOT the slots of the name -> position tables (kind 8 is left unused). Measured:
 # their values are list positions, so removing one function renumbers every later
 # one, and hashing scatters those across the table -- 177 of its chunks were
 # re-recorded on every edit. Those tables stop churning when they map a name to
 # something stable instead of a position; chunking cannot fix that from outside.
 # Lists of names, and the loader's and resolver's own record lists: rebuilt by the
 # pruning passes on every edit, unchanged in content on almost all of them.
 ('slice','u8'):9,
 'coil.reader.Sexp':10,
 'coil.compiler.loader.Expansion':11,
 'coil.compiler.ast.SrcModEntry':12,
 # Constants, and the checker's record of each. A retained definition under the Var
 # policy is a constant whose value is an expression tree, so a program of N such
 # definitions had N trees walked and copied by every publication: measured with
 # 2,000 of them, 66k `Expr` of the 170k records one trivial edit visited. (13 and
 # 14 are taken by the note below.)
 'coil.compiler.ast.Const':15,
 'coil.compiler.check.ConstEntry':16}
# NOT the resolver's value and type entries (kinds 13 and 14 are left unused).
# `semantic-inherit-resolution!` copies every entry's strings into fresh storage for
# every candidate, so a run of them is never spelled the same twice: sealing them put
# ~20 KB of new strings into each publication's block, which one long-lived function
# then pins. They can be sealed once inheriting stops copying them.
CHUNK_SIZES={}
def chunk_records(t): return CHUNK_SIZES.get(freeze(t),CHUNK_RECORDS)
# A run shorter than this is walked: holding a chunk costs more than visiting a few
# records, and a freshly submitted form is made of hundreds of tiny nested lists.
CHUNK_MINIMUM=8
def occupied(t,node):
    # Only an occupied slot has a key and a value; the rest of the table is whatever
    # was there before, and is neither walked nor part of a chunk's spelling.
    return '(= (.state '+node+') 1)' if isinstance(t,tuple) and t[0]=='coil.hashmap.Entry' else 'true'
CHUNK_RECORDS=64

# A record spelled out field by field, with an address for every pointer: two runs
# with the same spelling are the same records. Padding never enters it, which a
# comparison of their bytes could not promise.
ident_ids={}; ident_queue=[]
def ident_name(t):
    t=freeze(t)
    if t not in ident_ids: ident_ids[t]=len(ident_ids); ident_queue.append(t)
    return 'identity-'+str(ident_ids[t])
def ident_call(t,value): return '('+ident_name(t)+' out '+value+')'
def ident_body(t):
    push=lambda v:'(push! out '+v+')'
    if isinstance(t,str) and t in PRIMITIVES:
        if t in ('void','never'): return '0'
        if t=='bool': return push('(if value 1 0)')
        if t in ('f32','f64'):
            wide='i32' if t=='f32' else 'i64'
            return '(let [(mut bits) value] '+push('(p/cast i64 (load (p/cast (ptr '+wide+') (mut bits))))')+')'
        if t in ('Code','CodeBuilder'): raise ValueError(('no identity for a compile-time value',t))
        return push('(p/cast i64 value)')
    if isinstance(t,tuple):
        head=t[0]
        if head in ('ptr','ref','mut'): return push('(p/cast i64 value)')
        if head=='fnptr': return push('(p/cast i64 (p/cast (ptr i8) value))')
        if head=='slice': return '(do '+push('(p/cast i64 (slice-data value))')+' '+push('(len value)')+' 0)'
        if head in ('dyn','array'): raise ValueError(('no identity for',t))
    head,mod,kind,params,tail=definition(t)
    if head=='coil.arraylist.ArrayList':
        return '(do '+push('(p/cast i64 (.data value))')+' '+push('(.len value)')+' 0)'
    if head=='coil.hashmap.HashMap':
        return '(do '+push('(p/cast i64 (.slots value))')+' '+push('(.cap value)')+' '+push('(.len value)')+' 0)'
    if head=='coil.hashmap.Entry':
        return ('(do '+push('(.state value)')+' (when (= (.state value) 1) '
                +' '.join(ident_call(qualify(f[1],mod,params),'(.'+f[0]+' value)') for f in tail[0] if f[0]!='state')+' 0) 0)')
    if kind=='defstruct':
        return '(do '+' '.join(ident_call(qualify(f[1],mod,params),'(.'+f[0]+' value)') for f in tail[0])+' 0)'
    arms=[]
    for index,variant in enumerate(tail):
        name=mod+'.'+variant[0];fields=variant[1] if len(variant)>1 else [];args=['v'+str(i) for i in range(len(fields))]
        types=[qualify(f[1],mod,params) for f in fields]
        arms.append('('+name+' ['+' '.join(args)+'] (do '+push(str(index))+' '+' '.join(ident_call(f,a) for f,a in zip(types,args))+' 0))')
    return '(match value '+' '.join(arms)+')'

OPAQUE_FIELDS={('coil.compiler.loader.LS','code_session_state'),
               ('coil.compiler.metaengine.MEEntry','fp'),
               # A persistent base is owned by its revision and shared between
               # snapshots; a snapshot only points at it.
               ('coil.compiler.comptime.SemMapsSnap','base')}
ids={}; queue=[]; output=[]; used=set()
def ident(t):
    t=freeze(t)
    if t not in ids:ids[t]=len(ids);queue.append(t)
    return 'snapshot-'+str(ids[t])

def call(kind,t,value):return '('+ident(t)+'-'+kind+' g '+value+')'
def scalar(t):return isinstance(t,str) and t in PRIMITIVES

def body(t):
    ty=render(t)
    if scalar(t):return '0','value'
    if isinstance(t,tuple):
        head=t[0]
        if head in ('fnptr',):return '0','value'
        if head=='dyn':
            if t[1]!='coil.alloc.Allocator':raise ValueError(('unclassified dyn',t))
            return '0','(.destination g)'
        if head in ('ptr','ref','mut'):
            inner=t[1]
            if scalar(inner):return '0','value' # Native/raw storage; containers describe their live ranges explicitly.
            return call('scan',inner,'value'),f'(p/cast {ty} (graph-address g (p/cast i64 value)))'
        if head=='slice':
            inner=t[1];ity=render(inner)
            walk=f'''(do (graph-range! g (p/cast i64 (slice-data value)) (* (len value) (p/sizeof {ity})) (p/alignof {ity}))
              (for [i 0 (len value)] {('0' if scalar(inner) else call('scan',inner,'(p/index (slice-data value) i)'))}) 0)'''
            relocate=f'(slice-new [{ity}] (p/cast (ptr {ity}) (if (= (len value) 0) 0 (graph-address g (p/cast i64 (slice-data value))))) (len value))'
            if inner=='u8': walk='(do (graph-mark-scope! g value) '+walk+' 0)'
            return walk,relocate
        if head=='array':raise ValueError(('inline array needs visitor',t))
    head,mod,kind,params,tail=definition(t);used.add(mod)
    if head=='coil.scratch.ScratchArena':
        return '0','(coil.scratch.ScratchArena :parent (.destination g) :current (p/cast (ptr coil.scratch.ScratchSegment) 0) :initial-cap 256 :closed false :total 0 :live 0 :peak 0 :reserved 0)'
    if head=='coil.arraylist.ArrayList':
        inner=t[1];ity=render(inner)
        walk=f'''(do (graph-range! g (p/cast i64 (.data value)) (* (.len value) (p/sizeof {ity})) (p/alignof {ity}))
          (for [i 0 (.len value)] {('0' if scalar(inner) else call('scan',inner,'(p/index (.data value) i)'))}) 0)'''
        if freeze(inner) in SEALED_RECORDS:
            chunk_kind=SEALED_RECORDS[freeze(inner)]; stem=ident(inner)
            walk=f'''(do (graph-range! g (p/cast i64 (.data value)) (* (.len value) (p/sizeof {ity})) (p/alignof {ity}))
          (let [(mut at) 0]
            (loop
              (when (>= (load at) (.len value)) (break))
              (let [count (if (< (- (.len value) (load at)) {chunk_records(inner)}) (- (.len value) (load at)) {chunk_records(inner)})
                    first (p/index (.data value) (load at))]
                (if (< count {CHUNK_MINIMUM})
                  (for [k 0 count] ({stem}-seal-scan g (p/index first k)))
                  (unless (graph-chunk-held? g {chunk_kind} (p/cast (ptr i8) first) count (p/fnptr-of {stem}-chunk-identify))
                    (for [k 0 count] ({stem}-seal-scan g (p/index first k)))
                    (graph-note-chunk! g {chunk_kind} (p/cast i64 first) count)
                    0))
                (set! at (+ (load at) count)))))
          0)'''
        value=f'''(coil.arraylist.ArrayList :data (p/cast (ptr {ity}) (if (= (.len value) 0) 0 (graph-address g (p/cast i64 (.data value)))))
          :len (.len value) :cap (.len value) :alc (.destination g))'''
        return walk,value
    if head=='coil.hashmap.HashMap':
        entry=('coil.hashmap.Entry',)+t[1:]; ety=render(entry)
        walk=f'''(do (graph-range! g (p/cast i64 (.slots value)) (* (.cap value) (p/sizeof {ety})) (p/alignof {ety}))
          {call('walk',('ptr','coil.hashmap.KeyOps'),'(.ops value)')}
          (for [i 0 (.cap value)]
            (let [item (p/index (.slots value) i)]
              (when (= (.state item) 1) {call('scan',entry,'item')} 0))) 0)'''
        if freeze(entry) in SEALED_RECORDS:
            chunk_kind=SEALED_RECORDS[freeze(entry)]; stem=ident(entry)
            walk=f'''(do (graph-range! g (p/cast i64 (.slots value)) (* (.cap value) (p/sizeof {ety})) (p/alignof {ety}))
          {call('walk',('ptr','coil.hashmap.KeyOps'),'(.ops value)')}
          (let [(mut at) 0]
            (loop
              (when (>= (load at) (.cap value)) (break))
              (let [count (if (< (- (.cap value) (load at)) {chunk_records(entry)}) (- (.cap value) (load at)) {chunk_records(entry)})
                    first (p/index (.slots value) (load at))]
                (unless (graph-chunk-held? g {chunk_kind} (p/cast (ptr i8) first) count (p/fnptr-of {stem}-chunk-identify))
                  (for [k 0 count]
                    (let [item (p/index first k)]
                      (when (= (.state item) 1) ({stem}-seal-scan g item) 0)))
                  (graph-note-chunk! g {chunk_kind} (p/cast i64 first) count)
                  0)
                (set! at (+ (load at) count)))))
          0)'''
        value=f'''(coil.hashmap.HashMap :slots (p/cast (ptr {ety}) (if (= (.cap value) 0) 0 (graph-address g (p/cast i64 (.slots value)))))
          :cap (.cap value) :len (.len value) :tombs (.tombs value) :alc (.destination g)
          :ops {call('value',('ptr','coil.hashmap.KeyOps'),'(.ops value)')})'''
        return walk,value
    if kind=='defstruct':
        walks=[]; fields=[]
        if head in ('coil.compiler.ast.Expr','coil.reader.Sexp'):
            walks.append('(when (.liveness g) (set! (mut (.live-nids g)) (.nid value) 0) 0)')
        for name,raw,*rest in tail[0]:
            field=qualify(raw,mod,params);expr='(.'+name+' value)';key=(head,name)
            if name=='source' and field=='i64' and head!='coil.compiler.ast.SrcModEntry':
                walks.append('(when (.liveness g) (set! (mut (.live-sources g)) '+expr+' 0) 0)')
            if name=='ctxt' and field=='i64': walks.append('(when (.liveness g) (set! (mut (.live-contexts g)) '+expr+' 0) 0)')
            if head=='coil.compiler.ast.CoreDeclBox' and name in ('srcs','ctxts'):
                target='live-sources' if name=='srcs' else 'live-contexts'
                walks.append('(unless (or (not (.liveness g)) (= (p/cast i64 '+expr+') 0)) (for [i 0 (len (load '+expr+'))] (set! (mut (.'+target+' g)) (get (load '+expr+') i) 0)) 0)')

            if key in EMPTY_LISTS:
                fields+=[':'+name, '(al-new ['+render(field[1])+'] (.destination g))'];continue
            if key in EMPTY_MAPS:
                ops='(.ops '+expr+')'
                walks.append(call('walk',('ptr','coil.hashmap.KeyOps'),ops))
                fields+=[':'+name, '(coil.hashmap.HashMap :slots (p/cast (ptr (coil.hashmap.Entry '+render(field[1])+' '+render(field[2])+')) 0) :len 0 :cap 0 :tombs 0 :alc (.destination g) :ops '+call('value',('ptr','coil.hashmap.KeyOps'),ops)+')'];continue
            if key in NULL_FIELDS:
                fields+=[':'+name,f'(p/cast {render(field)} 0)'];continue
            if key in OPAQUE_FIELDS:
                fields+=[':'+name,expr];continue
            if key in OVERRIDES:
                precise=OVERRIDES[key];cast=f'(p/cast {render(precise)} {expr})'
                walks.append(call('walk',precise,cast))
                fields+=[':'+name,f'(p/cast {render(field)} {call("value",precise,cast)})'];continue
            if isinstance(field,tuple) and field[0]=='ptr' and scalar(field[1]):
                raise ValueError(('unclassified raw pointer',head,name,field))
            field_walk=call('walk',field,expr)
            if key in ARTIFACT_FIELDS:
                pointee=freeze(field[1]); kind=ARTIFACT_FIELDS[key]
                if ARTIFACT_KINDS.setdefault(kind,pointee)!=pointee:
                    raise ValueError(('artifact kind names two types',kind,pointee))
                # A closure sealed by an earlier graph is an artifact: it is held whole and
                # its recorded ids are marked, instead of being walked into again.
                field_walk=f'''(let [saved (.freezing g)]
                  (unless (graph-enter-artifact! g (p/cast i64 {expr}))
                    (when (hm/hm-contains? (.frozen-roots g) (p/cast i64 {expr})) (set! (.freezing g) true) 0)
                    {field_walk} (set! (.freezing g) saved) 0) 0)'''
            walks.append(field_walk);fields+=[':'+name,call('value',field,expr)]
        if head in ('coil.compiler.ast.ValueResEntry','coil.compiler.ast.TypeResEntry'):
            walks=['(set! (.weak-alias g) true)']+walks+['(set! (.weak-alias g) false)']
        if head=='coil.reader.Sexp': walks.append('(when (.liveness g) (set! (mut (.live-scopes g)) (.hyg value) 0) 0)')
        walk='(do '+' '.join(walks)+' 0)'
        value='('+head+' '+' '.join(fields)+')'
        if head=='coil.compiler.loader.Source':
            # Source slots are mutable revision-local records, but their payload
            # is immutable. The graph owner explicitly opts into shared storage.
            disabled='(= (p/cast i64 (.source-store g)) 0)'
            walk=f'(if {disabled} {walk} 0)'
            value=f'''(if {disabled} {value}
              (let [source (graph-source! g (.name value) (.text value) (.line_starts value))]
                (coil.compiler.loader.Source :name (.name source) :text (.text source)
                  :line_starts (field source lines))))'''
        return walk,value
    walks=[];values=[]
    for variant in tail:
        name=mod+'.'+variant[0];fields=variant[1] if len(variant)>1 else [];args=['v'+str(i) for i in range(len(fields))]
        types=[qualify(f[1],mod,params) for f in fields]
        walks.append('('+name+' ['+' '.join(args)+'] (do '+' '.join(call('walk',f,a) for f,a in zip(types,args))+' 0))')
        values.append('('+name+' ['+' '.join(args)+'] ('+name+' '+' '.join(call('value',f,a) for f,a in zip(types,args))+'))')
    return '(match value '+' '.join(walks)+')','(match value '+' '.join(values)+')'

for t in ROOTS:ident(t)
typed_walks=[]
i=0
while i<len(queue):
    t=queue[i];name=ident(t);ty=render(t);walk,value=body(t)
    typed_walks.append(walk)
    output += [f'''
(defn {name}-walk [(g (ptr Graph)) (value {ty})] (-> i64) {walk})
(defn {name}-value [(g (ptr Graph)) (value {ty})] (-> {ty}) {value})
(defn {name}-fix [(g (ptr Graph)) (from (ptr i8)) (to (ptr i8))] (-> i64)
  (set! (p/cast (ptr {ty}) to) ({name}-value g (load (p/cast (ptr {ty}) from)))) 0)
(defn {name}-scan [(g (ptr Graph)) (node (ptr {ty}))] (-> i64)
  (when (graph-enter-typed! g (p/cast i64 node) (p/sizeof {ty}) (p/alignof {ty}) {i+1} (p/fnptr-of {name}-fix) (p/fnptr-of {name}-scan-erased))
    ({name}-walk g (load node)) 0) 0)
(defn {name}-scan-erased [(g (ptr Graph)) (node (ptr i8))] (-> i64)
  ({name}-scan g (p/cast (ptr {ty}) node)))
''']
    if freeze(t) in SEALED_RECORDS:
        # The record itself belongs to whatever array holds it and is relocated with
        # it; what it points to is sealed.
        output += [f'''
(defn {name}-seal-scan [(g (ptr Graph)) (node (ptr {ty}))] (-> i64)
  (when (graph-enter-typed! g (p/cast i64 node) (p/sizeof {ty}) (p/alignof {ty}) {i+1} (p/fnptr-of {name}-fix) (p/fnptr-of {name}-scan-erased))
    (let [saved (.freezing g)]
      (unless (= (p/cast i64 (.heap g)) 0) (set! (.freezing g) true) 0)
      ({name}-walk g (load node))
      (set! (.freezing g) saved) 0) 0) 0)
(defn {name}-walk-erased [(g (ptr Graph)) (node (ptr i8))] (-> i64)
  (when {occupied(t,'(p/cast (ptr '+ty+') node)')} ({name}-walk g (load (p/cast (ptr {ty}) node))) 0) 0)
(defn {name}-chunk-identify [(out (ptr (ArrayList i64))) (first (ptr i8)) (count i64)] (-> i64)
  (for [k 0 count] {ident_call(t,'(load (p/index (p/cast (ptr '+ty+') first) k))')}) 0)
''']
    i+=1
# Checked bodies may freeze only AST/syntax payloads, never mutable phase state
# or independently owned Source payload headers. Audit the actual generated
# traversal so a future AST field cannot silently expand this lifetime boundary.
frozen_pending=[ids[t] for t in ARTIFACT_KINDS.values()]
# A sealed record is not itself sealed; everything its walk reaches is.
for record in SEALED_RECORDS:
    frozen_pending.extend(int(n) for n in re.findall(r'snapshot-(\d+)-(?:walk|scan)\b',typed_walks[ids[record]]))
frozen_seen=set()
while frozen_pending:
    index=frozen_pending.pop()
    if index in frozen_seen:continue
    frozen_seen.add(index)
    typ=queue[index]; head=typ[0] if isinstance(typ,tuple) else typ
    if head.startswith(('coil.compiler.loader.', 'coil.compiler.check.',
                        'coil.compiler.resolve.', 'coil.compiler.metaengine.',
                        'coil.compiler.interp.')):
        raise ValueError(('checked body reaches mutable or separately owned metadata',typ))
    frozen_pending.extend(int(n) for n in re.findall(r'snapshot-(\d+)-(?:walk|scan)\b',typed_walks[index]))
imports='\n'.join('(import "'+m+'")' for m in sorted(used) if m != 'coil.core')
header=''';;; Generated by scripts/compiler/gen-retained-snapshot.py; do not edit.
(module coil.compiler.retained_snapshot)
(import "coil.primitive" :as p)
(import "coil.alloc" :use *)
(import "coil.arraylist" :use *)
(import "coil.slice" :use *)
(import "coil.compiler.retained_graph" :use *)
(import "coil.hashmap" :as hm)
(import "coil.scratch" :as scratch)
'''
type_names='(defn snapshot-type-name [(kind i64)] (-> (slice u8)) (cond '+ ' '.join('(= kind '+str(i+1)+') "'+render(t).replace('\\','\\\\').replace('"','\\"')+'"' for t,i in ids.items())+' "unknown"))\n'
wrappers=''
for name,t in zip(('scan-loader!','scan-program!','scan-resolution!','scan-meta-entries!','scan-syntax!'), ROOTS):
    wrappers+='(defn '+name+' [(g (ptr Graph)) (root (ptr '+render(t)+'))] (-> i64) ('+ident(t)+'-scan g root))\n'
# The walk a sealed root of each kind is recorded with.
wrappers+='(defn artifact-scan [(kind i64)] (-> (fnptr c [(ptr Graph) (ptr i8)] i64)) (cond '+' '.join(
    '(= kind '+str(k)+') (p/fnptr-of '+ident(t)+'-scan-erased)' for k,t in sorted(ARTIFACT_KINDS.items()))+' :else (do (abort) (p/fnptr-of '+ident(ARTIFACT_KINDS[1])+'-scan-erased))))\n'
identity_output=[]; k=0
while k<len(ident_queue):
    t=ident_queue[k]
    identity_output.append('(defn '+ident_name(t)+' [(out (ptr (ArrayList i64))) (value '+render(t)+')] (-> i64) '+ident_body(t)+' 0)\n')
    k+=1
def dispatch(name,result,pick):
    return '(defn '+name+' [(kind i64)] (-> '+result+') (cond '+' '.join(
        '(= kind '+str(kind)+') '+pick(record) for record,kind in sorted(SEALED_RECORDS.items(),key=lambda e:e[1]))+' :else (do (abort) '+pick(min(SEALED_RECORDS.items(),key=lambda e:e[1])[0])+')))\n'
wrappers+=dispatch('chunk-walk','(fnptr c [(ptr Graph) (ptr i8)] i64)',lambda r:'(p/fnptr-of '+ident(r)+'-walk-erased)')
wrappers+=dispatch('chunk-identify','(fnptr c [(ptr (ArrayList i64)) (ptr i8) i64] i64)',lambda r:'(p/fnptr-of '+ident(r)+'-chunk-identify)')
wrappers+=dispatch('chunk-stride','i64',lambda r:'(p/sizeof '+render(r)+')')
result=header+imports+'\n'+''.join(output)+''.join(identity_output)+type_names+wrappers
target=ROOT/'src/compiler/retained_snapshot.coil'
if '--check' in sys.argv:
    if not target.exists() or target.read_text()!=result:
        raise SystemExit('retained metadata visitors are stale; run scripts/compiler/gen-retained-snapshot.py')
else:
    target.write_text(result)
print('generated',len(ids),'precise metadata visitors')

# A second visitor uses the same declared AST shapes to follow semantic nominal
# type dependencies. It does not retain source quotes, indexes, or allocator data.
# Every new AST field is traversed automatically; identifier-bearing lowering
# nodes are classified explicitly below instead of searching display strings.
dep_ids={}; dep_queue=[]; dep_output=[]; dep_used=set()
def dep_ident(t):
    t=freeze(t)
    if t not in dep_ids: dep_ids[t]=len(dep_ids); dep_queue.append(t)
    return 'type-refs-'+str(dep_ids[t])
def dep_call(t,value):return '('+dep_ident(t)+' (mut refs) (mut seen) '+value+')'
def dep_mark(value): return '(set! (mut refs) '+value+' 0)'
SEMANTIC_NAMES={
 ('coil.compiler.ast.Type','TStruct'):{'name'},
 ('coil.compiler.ast.Type','TApp'):{'name'},
 ('coil.compiler.ast.ExprKind','EVar'):{'name'},
 ('coil.compiler.ast.ExprKind','ECall'):{'func'},
 ('coil.compiler.ast.ExprKind','ENamedCall'):{'func'},
 ('coil.compiler.ast.ExprKind','EConstruct'):{'sum'},
 ('coil.compiler.ast.ExprKind','EDynDispatch'):{'dyn_struct','vtable_struct'},
 ('coil.compiler.ast.ExprKind','EMakeDyn'):{'dyn_struct','vtable_struct'},
}
def dep_body(t):
    if scalar(t) or t=='coil.reader.Sexp':return '0'
    if isinstance(t,tuple):
        if t[0] in ('fnptr','dyn'):return '0'
        if t[0]=='slice':return '0' # AST slices are strings, not typed nodes.
        if t[0] in ('ptr','ref','mut'):
            inner=t[1]
            if scalar(inner):return '0'
            key='(GraphKey :address (p/cast i64 value) :kind '+str(dep_ids[t]+1)+')'
            return '(unless (= (p/cast i64 value) 0) (let [key '+key+'] (unless (hm-contains? [GraphKey i64] (load seen) key) (set! (mut seen) key 0) '+dep_call(inner,'(load value)')+' 0)) 0)'
    head,mod,kind,params,tail=definition(t);dep_used.add(mod)
    if head=='coil.arraylist.ArrayList':
        return '(for [i 0 (.len value)] '+dep_call(t[1],'(get value i)')+' 0)'
    if kind=='defstruct':
        ops=[]
        for name,raw,*rest in tail[0]:
            field=qualify(raw,mod,params);expr='(.'+name+' value)'
            if head=='coil.compiler.ast.Arm' and name=='variant':ops.append(dep_mark(expr))
            ops.append(dep_call(field,expr))
        return '(do '+' '.join(ops)+' 0)'
    variants=[]
    for variant in tail:
        fields=variant[1] if len(variant)>1 else []; args=['v'+str(i) for i in range(len(fields))]
        ops=[]
        for (name,raw,*rest),arg in zip(fields,args):
            if name in SEMANTIC_NAMES.get((head,variant[0]),set()):ops.append(dep_mark(arg))
            ops.append(dep_call(qualify(raw,mod,params),arg))
        variants.append('('+mod+'.'+variant[0]+' ['+' '.join(args)+'] (do '+' '.join(ops)+' 0))')
    return '(match value '+' '.join(variants)+')'
dep_roots=['coil.compiler.ast.Program','coil.compiler.ast.StructDef','coil.compiler.ast.SumDef','coil.compiler.ast.Func','coil.compiler.ast.Const']
for t in dep_roots:dep_ident(t)
i=0
while i<len(dep_queue):
    t=dep_queue[i];name=dep_ident(t);body=dep_body(t)
    dep_output.append('(defn '+name+' [(refs (mut (HashMap (slice u8) i64))) (seen (mut (HashMap GraphKey i64))) (value '+render(t)+')] (-> i64) '+body+' 0)\n')
    i+=1
dep_header=''';;; Generated by scripts/compiler/gen-retained-snapshot.py; do not edit.
;;; Follows checked nominal types and semantic constructor identities, including
;;; generic bodies. Quoted source has no checked type dependency until expanded.
(module coil.compiler.type_references)
(import "coil.primitive" :as p)
(import "coil.hashmap" :use *)
(import "coil.arraylist" :use *)
(import "coil.compiler.retained_graph" :use [GraphKey graph-keyops])
'''
dep_wrappers=''
for name,t in zip(('program!','struct!','sum!','func!','const!'),dep_roots):
    dep_wrappers+='(defn '+name+' [(refs (mut (HashMap (slice u8) i64))) (seen (mut (HashMap GraphKey i64))) (value (ptr '+render(t)+'))] (-> i64) ('+dep_ident(t)+' (mut refs) (mut seen) (load value)))\n'
dep_result=dep_header+'\n'.join('(import "'+m+'")' for m in sorted(dep_used) if m!='coil.core')+'\n'+''.join(dep_output)+dep_wrappers
dep_target=ROOT/'src/compiler/type_references.coil'
if '--check' in sys.argv:
    if not dep_target.exists() or dep_target.read_text()!=dep_result:
        raise SystemExit('type dependency visitors are stale; run scripts/compiler/gen-retained-snapshot.py')
else:dep_target.write_text(dep_result)
print('generated',len(dep_ids),'type dependency visitors')
