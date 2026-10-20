// The guest's C calls that runtime.c and runtime32.c host, where the guest's
// layout differs from the host's: variadic arguments, and open(2)'s flags.
//
// A variadic import takes, after its fixed parameters, the address of a buffer
// holding the variadic arguments. Both of Coil's wasm backends pass it as
// LLVM's wasm backend does, and lay the buffer out as clang's va_arg reads it:
// each argument at its natural size and alignment, an int or narrower integer
// in 4 bytes, a long long or double in 8, and a long, size_t or pointer in
// GUEST_POINTER_BYTES. Linear memory is little-endian whatever the host is.
//
// The includer defines MEM, die() and GUEST_POINTER_BYTES first.

#ifndef GUEST_POINTER_BYTES
#error "define GUEST_POINTER_BYTES (4 or 8) before including guest_varargs.h"
#endif

// The next variadic argument of SIZE bytes, read from the buffer at *AT.
static uint64_t guest_va_arg(uint64_t *at, unsigned size) {
    if (*at == 0) die("a variadic import read an argument its caller did not pass");
    uint64_t p = (*at + size - 1) & ~(uint64_t)(size - 1);
    uint64_t v = 0;
    for (unsigned i = 0; i < size; i++) v |= (uint64_t)MEM[p + i] << (8 * i);
    *at = p + size;
    return v;
}

static uint64_t guest_sign_extend(uint64_t v, unsigned bytes) {
    unsigned shift = 64 - 8 * bytes;
    return bytes == 8 ? v : (uint64_t)((int64_t)(v << shift) >> shift);
}

static uint64_t guest_zero_extend(uint64_t v, unsigned bytes) {
    return bytes == 8 ? v : v & ((UINT64_C(1) << (8 * bytes)) - 1);
}

// printf's FMT over the arguments in the buffer at VA, into OUT (at most CAP
// bytes, NUL-terminated when CAP is not 0). Each conversion is rebuilt for the
// host's snprintf, a `*` width or precision replaced by the int the guest
// passed, so the text is the host libc's. Returns the full length, as snprintf.
static size_t guest_format(char *out, size_t cap, const char *fmt, uint64_t va) {
    size_t o = 0;
    #define GUEST_PUT(ch) do { if (o + 1 < cap) out[o] = (ch); o++; } while (0)
    #define GUEST_EMIT(value) do { \
        int n = snprintf(o < cap ? out + o : NULL, o < cap ? cap - o : 0, spec, value); \
        if (n < 0) die("printf: the host could not format a conversion"); \
        o += (size_t)n; \
    } while (0)
    for (const char *p = fmt; *p; ) {
        if (*p != '%') { GUEST_PUT(*p); p++; continue; }
        if (p[1] == '%') { GUEST_PUT('%'); p += 2; continue; }
        char spec[64];
        size_t s = 0;
        spec[s++] = *p++;
        while (*p && strchr("-+ #0", *p)) {
            if (s + 1 >= sizeof spec) die("printf: a conversion's flags are too long");
            spec[s++] = *p++;
        }
        for (int part = 0; part < 2; part++) {          // the width, then the precision
            if (part == 1) {
                if (*p != '.') break;
                spec[s++] = *p++;
            }
            if (*p == '*') {
                p++;
                int n = (int)(int32_t)guest_va_arg(&va, 4);
                s += (size_t)snprintf(spec + s, sizeof spec - s, "%d", n);
            } else {
                while (*p >= '0' && *p <= '9') {
                    if (s + 8 >= sizeof spec) die("printf: a conversion's width or precision is too long");
                    spec[s++] = *p++;
                }
            }
        }
        unsigned bytes = 4;                              // the integer argument's size
        int narrow = 0;                                  // 1 for h, 2 for hh
        if (*p == 'h') { narrow = 1; p++; if (*p == 'h') { narrow = 2; p++; } }
        else if (*p == 'l') { bytes = GUEST_POINTER_BYTES; p++; if (*p == 'l') { bytes = 8; p++; } }
        else if (*p == 'j') { bytes = 8; p++; }
        else if (*p == 'z' || *p == 't') { bytes = GUEST_POINTER_BYTES; p++; }
        else if (*p == 'L') die("printf: long double arguments are not supported");
        char conv = *p;
        if (!conv) die("printf: the format ends inside a conversion");
        p++;
        switch (conv) {
        case 'd': case 'i': {
            int64_t v = (int64_t)guest_sign_extend(guest_va_arg(&va, bytes), bytes);
            if (narrow == 1) v = (short)v;
            if (narrow == 2) v = (signed char)v;
            spec[s++] = 'l'; spec[s++] = 'l'; spec[s++] = conv; spec[s] = 0;
            GUEST_EMIT((long long)v);
            break;
        }
        case 'u': case 'x': case 'X': case 'o': {
            uint64_t v = guest_zero_extend(guest_va_arg(&va, bytes), bytes);
            if (narrow == 1) v = (unsigned short)v;
            if (narrow == 2) v = (unsigned char)v;
            spec[s++] = 'l'; spec[s++] = 'l'; spec[s++] = conv; spec[s] = 0;
            GUEST_EMIT((unsigned long long)v);
            break;
        }
        case 'c':
            spec[s++] = 'c'; spec[s] = 0;
            GUEST_EMIT((int)(int32_t)guest_va_arg(&va, 4));
            break;
        case 's': {
            if (bytes != 4) die("printf: wide strings are not supported");
            uint64_t at = guest_va_arg(&va, GUEST_POINTER_BYTES);
            spec[s++] = 's'; spec[s] = 0;
            GUEST_EMIT((const char *)(MEM + at));
            break;
        }
        case 'p':                                        // the guest's address, as hex
            spec[s++] = '#'; spec[s++] = 'l'; spec[s++] = 'l'; spec[s++] = 'x'; spec[s] = 0;
            GUEST_EMIT((unsigned long long)guest_va_arg(&va, GUEST_POINTER_BYTES));
            break;
        case 'f': case 'F': case 'e': case 'E': case 'g': case 'G': case 'a': case 'A': {
            uint64_t bits = guest_va_arg(&va, 8);
            double d;
            memcpy(&d, &bits, 8);
            spec[s++] = conv; spec[s] = 0;
            GUEST_EMIT(d);
            break;
        }
        default: {
            char message[64];
            snprintf(message, sizeof message, "printf: unsupported conversion '%%%c'", conv);
            die(message);
        }
        }
    }
    if (cap) out[o < cap ? o : cap - 1] = 0;
    #undef GUEST_EMIT
    #undef GUEST_PUT
    return o;
}

// FMT formatted whole, in a host buffer the caller frees; its length in *LEN.
static char *guest_format_alloc(const char *fmt, uint64_t va, size_t *len) {
    size_t n = guest_format(NULL, 0, fmt, va);
    char *text = malloc(n + 1);
    if (!text) die("printf: out of memory");
    guest_format(text, n + 1, fmt, va);
    *len = n;
    return text;
}

// printf and dprintf for the guest: the length written, or -1.
static uint32_t guest_printf(const char *fmt, uint64_t va) {
    size_t n;
    char *text = guest_format_alloc(fmt, va, &n);
    size_t written = fwrite(text, 1, n, stdout);
    free(text);
    return written == n ? (uint32_t)n : (uint32_t)-1;
}
static uint32_t guest_dprintf(int fd, const char *fmt, uint64_t va) {
    size_t n;
    char *text = guest_format_alloc(fmt, va, &n);
    int failed = 0;
    for (size_t done = 0; done < n && !failed; ) {
        ssize_t w = write(fd, text + done, n - done);
        if (w < 0 && errno == EINTR) continue;
        if (w <= 0) failed = 1; else done += (size_t)w;
    }
    free(text);
    return failed ? (uint32_t)-1 : (uint32_t)n;
}

// The guest numbers open(2) flags as Coil's wasm host interface does (Darwin's
// numbering; docs/reference/WASM.md). Translate them to this host's, and refuse
// a bit the interface does not define rather than pass it through.
enum {
    WASM_O_ACCMODE = 3, WASM_O_APPEND = 0x8, WASM_O_NOFOLLOW = 0x100,
    WASM_O_CREAT = 0x200, WASM_O_TRUNC = 0x400, WASM_O_EXCL = 0x800,
    WASM_O_DIRECTORY = 0x100000, WASM_O_CLOEXEC = 0x1000000,
};
static int native_open_flags(uint32_t flags, int *out) {
    static const struct { uint32_t wasm; int native; } bits[] = {
        { WASM_O_APPEND, O_APPEND }, { WASM_O_NOFOLLOW, O_NOFOLLOW },
        { WASM_O_CREAT, O_CREAT }, { WASM_O_TRUNC, O_TRUNC }, { WASM_O_EXCL, O_EXCL },
        { WASM_O_DIRECTORY, O_DIRECTORY }, { WASM_O_CLOEXEC, O_CLOEXEC },
    };
    uint32_t acc = flags & WASM_O_ACCMODE;
    if (acc == 3) return -1;
    int native = acc == 0 ? O_RDONLY : acc == 1 ? O_WRONLY : O_RDWR;
    uint32_t rest = flags & ~(uint32_t)WASM_O_ACCMODE;
    for (size_t i = 0; i < sizeof bits / sizeof bits[0]; i++) {
        if (rest & bits[i].wasm) { native |= bits[i].native; rest &= ~bits[i].wasm; }
    }
    if (rest != 0) return -1;
    *out = native;
    return 0;
}

// open(2) for the guest. Its mode is a variadic int, read only when the flags
// create a file, as libc's open reads it.
static int guest_open(const char *path, uint32_t flags, uint64_t va) {
    int native;
    if (native_open_flags(flags, &native) != 0) { errno = EINVAL; return -1; }
    mode_t mode = 0;
    if (native & O_CREAT) mode = (mode_t)guest_va_arg(&va, 4);
    return open(path, native, mode);
}
