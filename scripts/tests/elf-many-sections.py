#!/usr/bin/env python3
"""An ELF object with more sections than its header can count still links.

    scripts/tests/elf-many-sections.py <coil>        (on x86-64 Linux)

An ELF header's e_shnum is 16 bits. An object with 0xff00 sections or more says
0 there and keeps the count in section 0's sh_size. LLVM gives each function its
own section, so a big enough program at -O0 crosses that line (the compiler
itself has over 90,000), and `coil build` must still see which symbols it leaves
undefined: here curl's, which make the build link Coil's bundled libcurl.

The program has FUNCTIONS functions in a chain from main, and calls the HTTP
client only when given an argument, so running it needs no network.
"""

import os
import subprocess
import sys
import tempfile

FUNCTIONS = 70000
SHN_LORESERVE = 0xFF00


def main() -> int:
    if len(sys.argv) != 2:
        raise SystemExit(__doc__)
    coil = os.path.abspath(sys.argv[1])
    if not sys.platform.startswith("linux"):
        raise SystemExit("elf-many-sections: needs x86-64 Linux, where `coil build` writes ELF")
    work = tempfile.mkdtemp(prefix="elf-many-sections.")
    source = os.path.join(work, "many.coil")
    with open(source, "w") as out:
        out.write('(module many-sections)\n(import "coil.primitive" :as primitive)\n'
                  '(import "coil.http.client" :as http)\n(import "coil.alloc" :as alloc)\n\n')
        out.write(f"(defn f{FUNCTIONS} [(x i64)] (-> i64) x)\n")
        for k in range(FUNCTIONS - 1, -1, -1):
            out.write(f"(defn f{k} [(x i64)] (-> i64) (f{k + 1} (primitive/iadd x 1)))\n")
        out.write('''
(defn fetch [] (-> i64)
  (let [r (primitive/alloc-stack http/Request)]
    (set! (.method r) "GET")
    (set! (.url r) "https://example.com/")
    (set! (.headers r) (slice::new [http/Header] (primitive/cast (ptr http/Header) 0) 0))
    (set! (.body r) "")
    (set! (.connect-timeout-ms r) 5000)
    (set! (.timeout-ms r) 10000)
    (set! (.follow-redirects r) true)
    (set! (.ca-info r) "")
    (match (http/request (alloc/malloc-allocator) r)
      (Err [e] 1)
      (Ok [response] (do (http/response-free (alloc/malloc-allocator) response) 0)))))

(defn main [(argc i64) (argv (ptr (ptr i8)))] (-> i64)
  (if (> argc 1)
      (fetch)
      (if (= (f0 0) ''' + str(FUNCTIONS) + ''') 0 1)))
''')
    flags = ["--backend", "llvm", "-O0", "--no-debug"]
    obj = os.path.join(work, "many.o")
    subprocess.run([coil, "emit-obj", source, *flags, "-o", obj], check=True, stdout=subprocess.DEVNULL)
    with open(obj, "rb") as f:
        header = f.read(64)
    shnum = int.from_bytes(header[60:62], "little")
    if shnum != 0:
        raise SystemExit(f"elf-many-sections: FAIL — the object has e_shnum {shnum}, so it does not "
                         f"test extended section numbering; raise FUNCTIONS past {SHN_LORESERVE}")
    exe = os.path.join(work, "many")
    built = subprocess.run([coil, "build", source, *flags, "-o", exe],
                           stdout=subprocess.PIPE, stderr=subprocess.STDOUT, text=True)
    if built.returncode != 0:
        tail = "\n".join(built.stdout.splitlines()[-8:])
        raise SystemExit(f"elf-many-sections: FAIL — the build did not link:\n{tail}")
    ran = subprocess.run([exe])
    if ran.returncode != 0:
        raise SystemExit(f"elf-many-sections: FAIL — the program exited {ran.returncode}")
    print(f"elf-many-sections: PASS ({FUNCTIONS} functions, e_shnum 0, linked with libcurl, ran)")
    return 0


if __name__ == "__main__":
    sys.exit(main())
