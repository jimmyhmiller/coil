// hostlib.js — the libc pieces every JavaScript wasm host needs to get exactly
// right: the browser worker (web/coil-worker.js) and the Node hosts in
// src/tooling/wasm-host import it, so there is one copy of each.
//
// A variadic import's last argument is the address of the guest's va_list
// buffer: each argument at its natural size and alignment, an int or narrower
// integer in 4 bytes, and a long, long long, size_t, pointer or double in 8
// (wasm64; src/bootstrap/guest_varargs.h is the native hosts' copy of this).
// formatC writes what C's printf writes: floats are formatted from the exact
// decimal value of the double and rounded half to even, as libc does, which
// JavaScript's toFixed and toExponential do not.

// The reader for the variadic arguments in the buffer at VA, given a function
// returning a DataView of linear memory (memory can grow between reads).
export function vaReader(view, va) {
  let at = Number(va);
  return (size) => {
    if (at === 0) throw new Error('a variadic import read an argument its caller did not pass');
    at = Math.ceil(at / size) * size;
    const v = size === 4 ? BigInt(view().getUint32(at, true)) : view().getBigUint64(at, true);
    at += size;
    return v;
  };
}

// open(2)'s flags in the host interface's numbering (docs/reference/WASM.md),
// decoded; null when a bit the interface does not define is set.
export function wasmOpenFlags(flags) {
  flags = Number(flags);
  const access = flags & 3;
  const known = 3 | 0x8 | 0x100 | 0x200 | 0x400 | 0x800 | 0x100000 | 0x1000000;
  if (access === 3 || (flags & ~known) !== 0) return null;
  return {
    access: access === 0 ? 'read' : access === 1 ? 'write' : 'readwrite',
    append: (flags & 0x8) !== 0, nofollow: (flags & 0x100) !== 0, create: (flags & 0x200) !== 0,
    truncate: (flags & 0x400) !== 0, exclusive: (flags & 0x800) !== 0,
    directory: (flags & 0x100000) !== 0, cloexec: (flags & 0x1000000) !== 0,
  };
}

// fma/fmaf round a*b+c ONCE. JavaScript has no fused operation and a*b+c rounds
// twice, so compute the exact value as an integer scaled by a power of two and
// round that to `precision` significant bits, with `minExponent` the exponent of
// the smallest subnormal: fma is (53, -1074), fmaf (24, -149).
function exactParts(x) {
  const view = new DataView(new ArrayBuffer(8));
  view.setFloat64(0, x, true);
  const bits = view.getBigUint64(0, true);
  const exponent = Number((bits >> 52n) & 0x7ffn);
  const fraction = bits & 0xfffffffffffffn;
  const mantissa = exponent === 0 ? fraction : fraction | (1n << 52n);
  const scale = exponent === 0 ? -1074 : exponent - 1075;
  return { mantissa: bits >> 63n ? -mantissa : mantissa, scale };
}
export function fusedMultiplyAdd(a, b, c, precision, minExponent) {
  if (!Number.isFinite(a) || !Number.isFinite(b)) return a * b + c;
  // A finite product is exact, so an infinite or NaN addend is the result; a*b
  // could overflow on its own and meet the opposite infinity.
  if (!Number.isFinite(c)) return c;
  const pa = exactParts(a), pb = exactParts(b), pc = exactParts(c);
  let m1 = pa.mantissa * pb.mantissa, e1 = pa.scale + pb.scale;
  let m2 = pc.mantissa, e2 = pc.scale;
  const e = Math.min(e1, e2);
  let m = (m1 << BigInt(e1 - e)) + (m2 << BigInt(e2 - e));
  if (m === 0n) {
    // An exact zero sum is -0 only when both addends are -0 or negative zeros.
    const productNegative = (Object.is(a * b, -0) || a * b < 0);
    const cNegative = Object.is(c, -0) || c < 0;
    return productNegative && cNegative ? -0 : 0;
  }
  const negative = m < 0n;
  if (negative) m = -m;
  const bitLength = m.toString(2).length;
  const shift = Math.max(bitLength - precision, minExponent - e);
  let q = m, qe = e;
  if (shift > 0) {
    const s = BigInt(shift);
    q = m >> s;
    const rest = m - (q << s), half = 1n << (s - 1n);
    if (rest > half || (rest === half && (q & 1n) === 1n)) q += 1n;
    qe = e + shift;
  }
  const magnitude = Number(q) * Math.pow(2, qe);
  return negative ? -magnitude : magnitude;
}

const CONVERSION = /^%([-+ #0]*)(\*|\d*)(?:\.(\*|\d*))?(hh|h|ll|l|z|j|t)?(.)/;

// |x| as an exact decimal fraction: N / 10^scale.
function exactDecimal(x) {
  const view = new DataView(new ArrayBuffer(8));
  view.setFloat64(0, Math.abs(x));
  const bits = view.getBigUint64(0);
  const biased = Number((bits >> 52n) & 0x7ffn);
  let mantissa = bits & ((1n << 52n) - 1n);
  let exponent;
  if (biased === 0) exponent = -1074;
  else { mantissa |= 1n << 52n; exponent = biased - 1075; }
  if (exponent >= 0) return { n: mantissa << BigInt(exponent), scale: 0 };
  return { n: mantissa * 5n ** BigInt(-exponent), scale: -exponent };
}

// N / 10^drop, rounded half to even.
function dropDigits(n, drop) {
  if (drop <= 0) return n * 10n ** BigInt(-drop);
  const unit = 10n ** BigInt(drop);
  const q = n / unit, r = n % unit;
  if (2n * r > unit || (2n * r === unit && q % 2n === 1n)) return q + 1n;
  return q;
}

function fixed(x, precision, alternate) {
  const { n, scale } = exactDecimal(x);
  const digits = dropDigits(n, scale - precision).toString().padStart(precision + 1, '0');
  const whole = digits.slice(0, digits.length - precision);
  const fraction = digits.slice(digits.length - precision);
  return precision > 0 ? `${whole}.${fraction}` : (alternate ? `${whole}.` : whole);
}

// |x| to PRECISION digits after the first: the digit string and the exponent.
function scientificParts(x, precision) {
  if (x === 0) return { digits: '0'.repeat(precision + 1), exponent: 0 };
  const { n, scale } = exactDecimal(x);
  const length = n.toString().length;
  let exponent = length - 1 - scale;
  let digits = dropDigits(n, length - 1 - precision).toString();
  if (digits.length > precision + 1) { digits = digits.slice(0, precision + 1); exponent += 1; }
  return { digits, exponent };
}

function scientific(x, precision, alternate, upper) {
  const { digits, exponent } = scientificParts(x, precision);
  const mantissa = precision > 0 || alternate ? `${digits[0]}.${digits.slice(1)}` : digits[0];
  const e = `${exponent < 0 ? '-' : '+'}${String(Math.abs(exponent)).padStart(2, '0')}`;
  return `${mantissa}${upper ? 'E' : 'e'}${e}`;
}

function general(x, precision, alternate, upper) {
  const p = precision === 0 ? 1 : precision;
  const { exponent } = scientificParts(x, p - 1);
  let text = p > exponent && exponent >= -4
    ? fixed(x, p - 1 - exponent, alternate)
    : scientific(x, p - 1, alternate, upper);
  if (!alternate) {
    const e = text.search(/[eE]/);
    let body = e < 0 ? text : text.slice(0, e);
    const tail = e < 0 ? '' : text.slice(e);
    if (body.includes('.')) body = body.replace(/0+$/, '').replace(/\.$/, '');
    text = body + tail;
  }
  return text;
}

// FMT formatted over the arguments TAKE(size) reads in order, as a string of
// bytes (each char one byte). CSTR(address) is a guest C string's bytes.
export function formatC(fmt, take, cstr) {
  let out = '';
  for (let i = 0; i < fmt.length;) {
    if (fmt[i] !== '%') { out += fmt[i++]; continue; }
    if (fmt[i + 1] === '%') { out += '%'; i += 2; continue; }
    const m = CONVERSION.exec(fmt.slice(i));
    if (!m) throw new Error(`printf: the format ends inside a conversion: ${JSON.stringify(fmt)}`);
    i += m[0].length;
    let flags = m[1];
    let width = m[2] === '*' ? Number(BigInt.asIntN(32, take(4))) : Number(m[2] || 0);
    if (width < 0) { flags += '-'; width = -width; }
    let precision = m[3] === undefined ? null
      : m[3] === '*' ? Number(BigInt.asIntN(32, take(4))) : Number(m[3] || 0);
    if (precision !== null && precision < 0) precision = null;
    const length = m[4] ?? '';
    const conv = m[5];
    const bytes = length === '' || length === 'h' || length === 'hh' ? 4 : 8;
    let sign = '', prefix = '', body, numeric = true, zeroPad = flags.includes('0') && !flags.includes('-');
    const signOf = (negative) => negative ? '-' : flags.includes('+') ? '+' : flags.includes(' ') ? ' ' : '';
    switch (conv) {
      case 'd': case 'i': {
        let v = BigInt.asIntN(bytes * 8, take(bytes));
        if (length === 'h') v = BigInt.asIntN(16, v);
        if (length === 'hh') v = BigInt.asIntN(8, v);
        sign = signOf(v < 0n);
        body = (v < 0n ? -v : v).toString();
        if (precision !== null) { zeroPad = false; body = precision === 0 && v === 0n ? '' : body.padStart(precision, '0'); }
        break;
      }
      case 'u': case 'o': case 'x': case 'X': {
        let v = BigInt.asUintN(bytes * 8, take(bytes));
        if (length === 'h') v = BigInt.asUintN(16, v);
        if (length === 'hh') v = BigInt.asUintN(8, v);
        body = v.toString(conv === 'u' ? 10 : conv === 'o' ? 8 : 16);
        if (conv === 'X') body = body.toUpperCase();
        if (precision !== null) { zeroPad = false; body = precision === 0 && v === 0n ? '' : body.padStart(precision, '0'); }
        if (flags.includes('#')) {
          if (conv === 'o' && !body.startsWith('0')) body = `0${body}`;
          if ((conv === 'x' || conv === 'X') && v !== 0n) prefix = conv === 'x' ? '0x' : '0X';
        }
        break;
      }
      case 'c':
        numeric = false;
        body = String.fromCharCode(Number(take(4) & 0xffn));
        break;
      case 's': {
        numeric = false;
        if (length !== '') throw new Error('printf: wide strings are not supported');
        const text = cstr(take(8));
        body = precision === null ? text : text.slice(0, precision);
        break;
      }
      case 'p':
        body = take(8).toString(16);
        prefix = '0x';
        break;
      case 'f': case 'F': case 'e': case 'E': case 'g': case 'G': {
        const bits = take(8);
        const view = new DataView(new ArrayBuffer(8));
        view.setBigUint64(0, bits, true);
        const x = view.getFloat64(0, true);
        const upper = conv === 'F' || conv === 'E' || conv === 'G';
        sign = signOf(bits >> 63n === 1n);          // the sign bit: -0 and a negative NaN too
        const p = precision ?? 6, alternate = flags.includes('#');
        if (!Number.isFinite(x)) {
          zeroPad = false;
          body = Number.isNaN(x) ? 'nan' : 'inf';
          if (upper) body = body.toUpperCase();
        } else if (conv === 'f' || conv === 'F') body = fixed(x, p, alternate);
        else if (conv === 'e' || conv === 'E') body = scientific(x, p, alternate, upper);
        else body = general(x, p, alternate, upper);
        break;
      }
      default:
        throw new Error(`printf: unsupported conversion '%${conv}'`);
    }
    const text = sign + prefix + body;
    if (text.length >= width) out += text;
    else if (flags.includes('-')) out += text.padEnd(width, ' ');
    else if (zeroPad && numeric) out += sign + prefix + body.padStart(width - sign.length - prefix.length, '0');
    else out += text.padStart(width, ' ');
  }
  return out;
}
