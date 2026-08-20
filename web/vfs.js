// vfs.js — the in-memory filesystem the wasm-hosted compiler runs on.
//
// The compiler is ordinary POSIX code: it opens files, walks up from argv[0] to find
// its standard library, and writes its output with write(2). None of that changes in
// the browser; only the bytes behind those calls do. This module is that backing
// store, plus the pack format `build.py` ships the stdlib in.
//
// Layout mirrors an installed toolchain exactly (see scripts/dev.py::install_library),
// because that is what stdlib discovery walks:
//   /coil/bin/coil                  argv[0] — never read, only realpath'd
//   /coil/lib/coil/prelude.coil
//   /coil/lib/coil/stdlib/*.coil
//   /work/                          the user's source, and anything the compiler emits

const enc = new TextEncoder();
const dec = new TextDecoder();

export const MAGIC = 'COILFS1\0';

// pack: [8-byte magic][u32 headerLen][headerLen bytes of JSON [[path,off,len],…]][blob]
export function unpack(buf) {
  const bytes = new Uint8Array(buf);
  const magic = dec.decode(bytes.subarray(0, 8));
  if (magic !== MAGIC) throw new Error(`vfs: bad pack magic ${JSON.stringify(magic)}`);
  const headerLen = new DataView(bytes.buffer, bytes.byteOffset + 8, 4).getUint32(0, true);
  const header = JSON.parse(dec.decode(bytes.subarray(12, 12 + headerLen)));
  const blobStart = 12 + headerLen;
  const files = new Map();
  for (const [path, off, len] of header) {
    files.set(path, bytes.subarray(blobStart + off, blobStart + off + len));
  }
  return files;
}

export function normalize(path, cwd) {
  if (!path.startsWith('/')) path = cwd + '/' + path;
  const out = [];
  for (const part of path.split('/')) {
    if (part === '' || part === '.') continue;
    if (part === '..') { out.pop(); continue; }
    out.push(part);
  }
  return '/' + out.join('/');
}

export class Vfs {
  // `base` is shared, read-only, and never copied: every compile starts from the same
  // stdlib bytes and only its own writes land in the overlay.
  constructor(base, cwd = '/work') {
    this.base = base;
    this.overlay = new Map();
    this.cwd = cwd;
    this.fds = new Map();          // fd -> {path, pos, data, writing}
    this.nextFd = 3;               // 0/1/2 are the std streams
  }

  read(path) {
    return this.overlay.get(path) ?? this.base.get(path) ?? null;
  }

  writeFile(path, data) {
    this.overlay.set(path, typeof data === 'string' ? enc.encode(data) : data);
  }

  exists(path) {
    return this.overlay.has(path) || this.base.has(path);
  }

  // A directory exists if anything lives under it. The compiler probes candidate
  // library directories this way while walking up from argv[0].
  isDir(path) {
    const prefix = path.endsWith('/') ? path : path + '/';
    for (const p of this.overlay.keys()) if (p.startsWith(prefix)) return true;
    for (const p of this.base.keys()) if (p.startsWith(prefix)) return true;
    return false;
  }

  paths() {
    return [...new Set([...this.base.keys(), ...this.overlay.keys()])].sort();
  }

  // Files the compile produced, so the page can hand back an emitted .wasm module.
  emitted() {
    return this.overlay;
  }

  open(path, { write = false, truncate = false } = {}) {
    if (write) {
      const existing = truncate ? null : this.read(path);
      const data = existing ? Array.from(existing) : [];
      const fd = this.nextFd++;
      this.fds.set(fd, { path, pos: data.length, data, writing: true });
      return fd;
    }
    // Opening a DIRECTORY read-only succeeds on a real filesystem, and that is exactly
    // how loader.coil's path-readable? probes for `lib/coil/stdlib` while hunting for
    // the standard library. Fail it and the compiler cannot find its own library.
    let data = this.read(path);
    if (data === null) {
      if (!this.isDir(path)) return -1;
      data = new Uint8Array(0);
    }
    const fd = this.nextFd++;
    this.fds.set(fd, { path, pos: 0, data, writing: false });
    return fd;
  }

  readFd(fd, len) {
    const h = this.fds.get(fd);
    if (!h || h.writing) return null;
    const n = Math.min(len, h.data.length - h.pos);
    const out = h.data.subarray(h.pos, h.pos + n);
    h.pos += n;
    return out;
  }

  writeFd(fd, bytes) {
    const h = this.fds.get(fd);
    if (!h || !h.writing) return -1;
    for (const b of bytes) h.data.push(b);
    h.pos = h.data.length;
    this.overlay.set(h.path, Uint8Array.from(h.data));
    return bytes.length;
  }

  close(fd) {
    const h = this.fds.get(fd);
    if (h && h.writing) this.overlay.set(h.path, Uint8Array.from(h.data));
    this.fds.delete(fd);
    return 0;
  }

  unlink(path) {
    return this.overlay.delete(path) ? 0 : (this.base.has(path) ? 0 : -1);
  }
}
