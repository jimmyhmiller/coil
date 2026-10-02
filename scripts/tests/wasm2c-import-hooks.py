"""Imported calls preserve host-boundary hooks, including function-table calls."""
from pathlib import Path
import os
import shutil
import subprocess
import tempfile

ROOT = Path(__file__).resolve().parents[2]
if not shutil.which("wasm-tools"):
    raise SystemExit("wasm2c import hooks: wasm-tools is required")
with tempfile.TemporaryDirectory(prefix="coil-wasm2c-hooks-") as raw:
    directory = Path(raw)
    translator = directory / "wasm2c"
    cc = os.environ.get("CC", "cc")
    subprocess.run([cc, "-O2", str(ROOT / "src/bootstrap/wasm2c.c"), "-o", str(translator)], check=True)
    for indirect in (False, True):
        table = '(table 1 funcref) (elem (i32.const 0) $probe)' if indirect else ''
        call = 'i32.const 0 call_indirect (type $signature)' if indirect else 'call $probe'
        wat = directory / "test.wat"
        wat.write_text(f'''(module
          (type $signature (func (result i32)))
          (import "env" "probe" (func $probe (type $signature)))
          {table}
          (func (export "main") (result i32) {call}))''')
        module, source = directory / "test.wasm", directory / "test.c"
        subprocess.run(["wasm-tools", "parse", str(wat), "-o", str(module)], check=True)
        subprocess.run([str(translator), str(module), str(source), "little"], check=True)
        host = directory / "host.c"
        host.write_text('''#include <assert.h>
          #include <stdint.h>
          extern void (*wasm_host_call_enter)(void);
          extern void (*wasm_host_call_leave)(void);
          extern void wasm_init(void);
          extern uint32_t wasm_main(void);
          static int state;
          static void enter(void) { assert(state == 0); state = 1; }
          uint32_t env_probe(void) { assert(state == 1); state = 2; return 42; }
          static void leave(void) { assert(state == 2); state = 3; }
          int main(void) {
            wasm_init();
            wasm_host_call_enter = enter; wasm_host_call_leave = leave;
            assert(wasm_main() == 42 && state == 3);
            return 0;
          }''')
        binary = directory / "test"
        subprocess.run([cc, "-O1", "-fsanitize=address,undefined", str(source), str(host),
                        "-lm", "-o", str(binary)], check=True)
        subprocess.run([str(binary)], check=True)
print("wasm2c imported-call hooks: direct and indirect calls passed")
