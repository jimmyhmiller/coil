"""Imported calls preserve host-boundary hooks, including function-table calls."""
from pathlib import Path
import os
import subprocess
import tempfile

ROOT = Path(__file__).resolve().parents[2]


# The two modules are encoded here rather than assembled from text, so the test
# needs only a C compiler: the CI job that runs it has no wasm-tools.
def uleb(n: int) -> bytes:
    out = bytearray()
    while True:
        byte, n = n & 0x7F, n >> 7
        out.append(byte | (0x80 if n else 0))
        if not n:
            return bytes(out)


def vec(items: list[bytes]) -> bytes:
    return uleb(len(items)) + b"".join(items)


def name(text: str) -> bytes:
    return uleb(len(text)) + text.encode()


def section(ident: int, body: bytes) -> bytes:
    return bytes([ident]) + uleb(len(body)) + body


def module(indirect: bool) -> bytes:
    """(type $signature (func (result i32)))
    (import "env" "probe" (func $probe (type $signature)))
    [(table 1 funcref) (elem (i32.const 0) $probe)]       ; when indirect
    (func (export "main") (result i32) call $probe)        ; or call_indirect"""
    i32, funcref, end = 0x7F, 0x70, 0x0B
    sections = [
        section(1, vec([bytes([0x60]) + vec([]) + vec([bytes([i32])])])),
        section(2, vec([name("env") + name("probe") + bytes([0x00]) + uleb(0)])),
        section(3, vec([uleb(0)])),
    ]
    if indirect:
        sections.append(section(4, vec([bytes([funcref, 0x00]) + uleb(1)])))
    sections.append(section(7, vec([name("main") + bytes([0x00]) + uleb(1)])))
    if indirect:
        # active segment for table 0 at offset (i32.const 0), holding $probe
        sections.append(section(9, vec([uleb(0) + bytes([0x41, 0x00, end]) + vec([uleb(0)])])))
        call = bytes([0x41, 0x00, 0x11]) + uleb(0) + uleb(0)  # call_indirect type 0, table 0
    else:
        call = bytes([0x10]) + uleb(0)  # call $probe
    body = vec([]) + call + bytes([end])
    sections.append(section(10, vec([uleb(len(body)) + body])))
    return b"\0asm" + bytes([1, 0, 0, 0]) + b"".join(sections)


with tempfile.TemporaryDirectory(prefix="coil-wasm2c-hooks-") as raw:
    directory = Path(raw)
    translator = directory / "wasm2c"
    cc = os.environ.get("CC", "cc")
    subprocess.run([cc, "-O2", str(ROOT / "src/bootstrap/wasm2c.c"), "-o", str(translator)], check=True)
    for indirect in (False, True):
        module_path, source = directory / "test.wasm", directory / "test.c"
        module_path.write_bytes(module(indirect))
        subprocess.run([str(translator), str(module_path), str(source), "little"], check=True)
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
