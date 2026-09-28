#!/usr/bin/env python3
"""Check every C `extern` the compiler and standard library declare against the
host's real prototypes.

A program that declares a C function correctly must be able to import any
standard-library module, or link `coil.jit`, without the compiler reporting
"C symbol 'X' is declared twice with different signatures". So each extern in
src/compiler and src/stdlib must agree with the system headers under the rule the
compiler itself uses (resolve.coil `extern-abi-type-eq`): all pointers and
function pointers agree, integers agree when their widths do (signedness is not
ABI), and every other type must match exactly. Two declarations of one symbol in
the repository must also agree with each other.

The truth comes from one selective `cimport` of a header that includes the system
headers listed below (each only if the host has it), asking for exactly the names
the repository declares. A header update is picked up without editing this file.

    python3 scripts/tests/extern-prototypes.py build/bin/coil
    python3 scripts/tests/extern-prototypes.py build/bin/coil --keep DIR   # keep the probe
"""
import os
import re
import subprocess
import sys
import tempfile

ROOT = os.path.dirname(os.path.dirname(os.path.dirname(os.path.abspath(__file__))))

HEADERS = [
    "unistd.h", "fcntl.h", "dlfcn.h", "sys/socket.h", "sys/stat.h", "sys/mman.h",
    "sys/wait.h", "sys/time.h", "sys/resource.h", "sys/ioctl.h", "sys/select.h",
    "sys/uio.h", "netinet/in.h", "arpa/inet.h", "netdb.h", "poll.h", "string.h",
    "stdlib.h", "stdio.h", "signal.h", "pthread.h", "time.h", "errno.h", "dirent.h",
    "spawn.h", "termios.h", "math.h", "setjmp.h", "sched.h", "semaphore.h",
    "libgen.h", "glob.h", "pwd.h", "locale.h", "utime.h", "ctype.h", "execinfo.h",
    # Darwin
    "sys/sysctl.h", "mach-o/dyld.h", "mach/mach_time.h", "mach/mach.h",
    "libkern/OSCacheControl.h", "malloc/malloc.h", "sys/event.h", "copyfile.h",
    "sys/param.h", "sys/mount.h", "crt_externs.h", "sys/attr.h",
    # Linux
    "sys/epoll.h", "sys/eventfd.h", "sys/random.h", "malloc.h", "sys/prctl.h",
]

INT_BITS = {"i8": 8, "u8": 8, "i16": 16, "u16": 16, "i32": 32, "u32": 32,
            "i64": 64, "u64": 64, "isize": 64, "usize": 64}


# ---- a small reader: enough of Coil's surface syntax to find extern forms ----

def read_forms(text):
    """Top-level forms as nested lists: [line, "(" or "[", child...]."""
    i, n, line = 0, len(text), 1
    stack = [[0, ""]]
    while i < n:
        c = text[i]
        if c == "\n":
            line += 1
            i += 1
        elif c in " \t\r,":
            i += 1
        elif c == ";":
            while i < n and text[i] != "\n":
                i += 1
        elif c in "([":
            stack.append([line, c])
            i += 1
        elif c in ")]":
            done = stack.pop()
            stack[-1].append(done)
            i += 1
        elif c == '"':
            j = i + 1
            while j < n and text[j] != '"':
                j += 2 if text[j] == "\\" else 1
            stack[-1].append(text[i:j + 1])
            line += text[i:j + 1].count("\n")
            i = j + 1
        elif text.startswith("#\\", i):
            j = i + 3
            while j < n and text[j] not in " \t\r\n()[]":
                j += 1
            stack[-1].append(text[i:j])
            i = j
        else:
            j = i
            while j < n and text[j] not in " \t\r\n()[];\"":
                j += 1
            stack[-1].append(text[i:j])
            i = j
    return stack[0][2:]


def items(form):
    return form[2:] if isinstance(form, list) else []


def type_class(t):
    """The ABI class `extern-abi-type-eq` compares."""
    if isinstance(t, list):
        body = items(t)
        if body and body[0] in ("ptr", "fnptr"):
            return "ptr"
        return "(" + " ".join(type_class(x) for x in body) + ")"
    return "int%d" % INT_BITS[t] if t in INT_BITS else t


def extern_signature(form):
    """(link-name, [param classes], variadic, return class) of an `(extern …)`."""
    body = items(form)[1:]
    name = body[0]
    # The linker name is the last component of the Coil name (extern-link-name).
    link = re.split(r"[/.]", name)[-1]
    params, ret = None, "void"
    k = 1
    while k < len(body):
        x = body[k]
        if x == ":as":
            link = body[k + 1].strip('"')
            k += 2
        elif isinstance(x, str) and x.startswith(":"):
            k += 2
        elif isinstance(x, list) and x[1] == "[" and params is None:
            params = x
            k += 1
        elif isinstance(x, list) and items(x)[:1] == ["->"]:
            ret = type_class(items(x)[1]) if len(items(x)) > 1 else "void"
            k += 1
        else:
            k += 1
    ps = items(params) if params else []
    return link, [type_class(p) for p in ps if p != "..."], "..." in ps, ret


def externs_in(text):
    """(line, signature) of every literal `(extern NAME …)` in `text`. An extern a
    template builds (`(extern ~name …)`) is a macro's output, not a declaration."""
    found = []

    def walk(form):
        if isinstance(form, list):
            body = items(form)
            if body[:1] == ["extern"] and form[1] == "(" and len(body) > 1 \
                    and isinstance(body[1], str) and "~" not in body[1]:
                found.append((form[0], extern_signature(form)))
            else:
                for x in body:
                    walk(x)

    for f in read_forms(text):
        walk(f)
    return found


# ---- the host's truth ----

def from_dump(node):
    """A `coil dump-load` node -- (sym@… "x"), (kw@… "x"), (list@… …), (vec@… …) --
    as the tree `read_forms` produces for the same source text."""
    if not isinstance(node, list):
        return node
    body = items(node)
    kind = body[0].split("@")[0] if body else ""
    args = body[1:]
    if kind in ("sym", "int"):
        return args[0].strip('"')
    if kind == "str":
        return args[0]
    if kind == "kw":
        return ":" + args[0].strip('"')
    if kind in ("list", "vec"):
        return [node[0], "(" if kind == "list" else "["] + [from_dump(x) for x in args]
    return node


def host_prototypes(compiler, names, where):
    """`link-name -> signature` for every name in `names` a host header declares."""
    wrapper = os.path.join(where, "prototypes.h")
    with open(wrapper, "w") as out:
        for h in HEADERS:
            out.write(f"#if __has_include(<{h}>)\n#include <{h}>\n#endif\n")
    probe = os.path.join(where, "prototypes.coil")
    with open(probe, "w") as out:
        out.write("(module extern-prototypes)\n")
        out.write(f'(cimport "{wrapper}" :use [{" ".join(sorted(names))}])\n')
    result = subprocess.run([compiler, "dump-load", probe], capture_output=True, text=True,
                            timeout=900)
    if result.returncode != 0 or "(forms" not in result.stdout:
        raise SystemExit(f"cimport of the host headers failed (exit {result.returncode}):\n"
                         f"{result.stdout[-2000:]}{result.stderr[-2000:]}")
    truth = {}

    def walk(node):
        if not isinstance(node, list):
            return
        body = items(node)
        if body and body[0] == "tf" and len(body) >= 3 and isinstance(body[1], list) \
                and '"extern-prototypes"' in items(body[1]):
            decl = from_dump(body[2])
            if isinstance(decl, list) and items(decl)[:1] == ["extern"]:
                sig = extern_signature(decl)
                truth[sig[0]] = sig
            return
        for x in body:
            walk(x)

    for form in read_forms(result.stdout):
        walk(form)
    return truth


def main():
    args = sys.argv[1:]
    keep = None
    if "--keep" in args:
        k = args.index("--keep")
        keep = os.path.abspath(args[k + 1])
        del args[k:k + 2]
        os.makedirs(keep, exist_ok=True)
    if len(args) != 1:
        raise SystemExit(__doc__)
    compiler = os.path.abspath(args[0])

    declared = {}
    for sub in ("src/compiler", "src/stdlib"):
        for dirpath, _, names in os.walk(os.path.join(ROOT, sub)):
            for name in sorted(names):
                if name.endswith(".coil") and name != "guide.coil":
                    path = os.path.join(dirpath, name)
                    source = open(path).read()
                    # Meta forms can select an ABI declaration for the target.
                    # Inspect the compiler's expansion, not both quoted branches
                    # in the source, so the gate checks the emitted extern.
                    if re.search(r"(?m)^\s*\(meta(?:\s|\()", source):
                        result = subprocess.run([compiler, "expand", path], cwd=ROOT,
                                                capture_output=True, text=True, timeout=900)
                        if result.returncode:
                            raise SystemExit(f"cannot expand {path}:\n"
                                             f"{result.stdout}{result.stderr}")
                        source = result.stdout
                    declared[os.path.relpath(path, ROOT)] = externs_in(source)
    names = {sig[0] for found in declared.values() for _, sig in found}

    with tempfile.TemporaryDirectory(prefix="coil-extern-prototypes-") as tmp:
        truth = host_prototypes(compiler, names, keep or tmp)
    if len(truth) < 50:
        raise SystemExit(f"only {len(truth)} host prototypes were found; the header probe is broken")

    problems, first_seen, checked = [], {}, 0
    for rel in sorted(declared):
        for line, sig in declared[rel]:
            link, params, variadic, ret = sig
            if link in truth:
                checked += 1
                c = truth[link]
                if (params, variadic, ret) != c[1:]:
                    problems.append(f"{rel}:{line}: {link} {params}{' ...' if variadic else ''} -> {ret}"
                                    f"  but C declares {c[1]}{' ...' if c[2] else ''} -> {c[3]}")
            prior = first_seen.setdefault(link, (rel, line, sig))
            if prior[2][1:] != sig[1:]:
                problems.append(f"{rel}:{line}: {link} disagrees with {prior[0]}:{prior[1]}")

    if problems:
        print("\n".join(problems))
        print(f"{len(problems)} extern declaration(s) disagree with the host's C prototypes")
        return 1
    print(f"extern prototypes: {checked} system externs match the host's C prototypes")
    return 0


if __name__ == "__main__":
    sys.exit(main())
