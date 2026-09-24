/* Differential oracle for tests/fuzz/http_upstream_fuzz.coil: runs upstream C
 * llhttp 9.4.3 over an input split into chunks and serializes every callback
 * into a trace whose format tests/fuzz/http_fuzz.coil's recorder (`Rec`)
 * reproduces byte for byte. Linked only into the oracle archive that
 * scripts/native/build-llhttp.sh builds; never into a Coil program.
 *
 * Trace grammar (all ASCII):
 *   span events   an uppercase kind letter followed by the span's bytes as
 *                 lowercase hex. Consecutive callbacks of the same kind with no
 *                 other event between them are MERGED (one kind letter), so the
 *                 trace does not depend on where the input was split.
 *   simple events a punctuation/uppercase marker, optionally followed by
 *                 "{...}" data.
 *   end           "#" errno "," error-offset "," reason "," finish-result
 *
 * Every chunk is copied into its own exactly-sized malloc block so that, under
 * AddressSanitizer, a read past the end of a chunk is caught. */
#include "llhttp.h"
#include <stdint.h>
#include <stdlib.h>
#include <string.h>

typedef struct {
  uint8_t* out;
  int64_t cap;
  int64_t len;
  int span_kind; /* kind letter of the span the trace currently ends in, or 0 */
  int64_t overflow;
  int64_t events;     /* simple events so far */
  int64_t pause_mask; /* pause at simple event i when bit (i % 64) is set */
  int64_t hc_ret;     /* what on_headers_complete returns when not pausing */
  int paused;         /* the last HPE_PAUSED came from us */
  int64_t calls;      /* callbacks of every kind so far */
  int64_t fail_at;    /* callback number that returns fail_code (-1: none) */
  int64_t fail_code;
} trace_rec;

static void put(trace_rec* r, uint8_t b) {
  if (r->len < r->cap) r->out[r->len++] = b; else r->overflow = 1;
}
static void put_str(trace_rec* r, const char* s) { while (*s) put(r, (uint8_t) *s++); }
static void put_hex_u64(trace_rec* r, uint64_t v) {
  char buf[17];
  int n = 0;
  if (v == 0) { put(r, '0'); return; }
  while (v) { buf[n++] = "0123456789abcdef"[v & 15]; v >>= 4; }
  while (n) put(r, (uint8_t) buf[--n]);
}
static void put_i64(trace_rec* r, int64_t v) {
  if (v < 0) { put(r, '-'); put_hex_u64(r, (uint64_t) (-(v + 1)) + 1); }
  else put_hex_u64(r, (uint64_t) v);
}
static void simple(trace_rec* r, char marker) { r->span_kind = 0; put(r, (uint8_t) marker); }
/* Called once per callback of any kind: nonzero means "return this error". */
static int maybe_fail(trace_rec* r) {
  return r->calls++ == r->fail_at ? (int) r->fail_code : 0;
}
/* Called once per simple event, after it is recorded: an injected error,
 * HPE_PAUSED, or 0. */
static int maybe_pause(trace_rec* r) {
  int f = maybe_fail(r);
  int64_t i = r->events++;
  if (f) return f;
  if ((r->pause_mask >> (i & 63)) & 1) { r->paused = 1; return HPE_PAUSED; }
  return 0;
}
static void span(trace_rec* r, char kind, const char* at, size_t n) {
  size_t i;
  if (r->span_kind != kind) { put(r, (uint8_t) kind); r->span_kind = kind; }
  for (i = 0; i < n; i++) {
    uint8_t b = (uint8_t) at[i];
    put(r, (uint8_t) "0123456789abcdef"[b >> 4]);
    put(r, (uint8_t) "0123456789abcdef"[b & 15]);
  }
}
static trace_rec* R(llhttp_t* p) { return (trace_rec*) p->data; }

#define SPAN_CB(name, kind) \
  static int name(llhttp_t* p, const char* at, size_t n) { span(R(p), kind, at, n); return maybe_fail(R(p)); }
#define SIMPLE_CB(name, marker) \
  static int name(llhttp_t* p) { simple(R(p), marker); return maybe_pause(R(p)); }

SPAN_CB(cb_protocol, 'P')
SPAN_CB(cb_url, 'U')
SPAN_CB(cb_status, 'S')
SPAN_CB(cb_method, 'M')
SPAN_CB(cb_version, 'V')
SPAN_CB(cb_header_field, 'F')
SPAN_CB(cb_header_value, 'W')
SPAN_CB(cb_ext_name, 'X')
SPAN_CB(cb_ext_value, 'Y')
SPAN_CB(cb_body, 'D')
SIMPLE_CB(cb_message_begin, 'B')
SIMPLE_CB(cb_protocol_complete, 'Q')
SIMPLE_CB(cb_url_complete, 'R')
SIMPLE_CB(cb_status_complete, 'T')
SIMPLE_CB(cb_method_complete, 'N')
SIMPLE_CB(cb_version_complete, 'O')
SIMPLE_CB(cb_header_field_complete, 'G')
SIMPLE_CB(cb_header_value_complete, 'J')
SIMPLE_CB(cb_ext_name_complete, 'K')
SIMPLE_CB(cb_ext_value_complete, 'L')
SIMPLE_CB(cb_chunk_complete, 'E')
SIMPLE_CB(cb_reset, 'A')

static int cb_message_complete(llhttp_t* p) {
  trace_rec* r = R(p);
  simple(r, 'C');
  put(r, '{');
  put_i64(r, llhttp_should_keep_alive(p));
  put(r, '}');
  return maybe_pause(r);
}

static int cb_chunk_header(llhttp_t* p) {
  trace_rec* r = R(p);
  simple(r, 'Z');
  put(r, '{');
  put_hex_u64(r, p->content_length);
  put(r, '}');
  return maybe_pause(r);
}

static int cb_headers_complete(llhttp_t* p) {
  trace_rec* r = R(p);
  simple(r, 'H');
  put(r, '{');
  put_i64(r, p->type); put(r, ',');
  put_i64(r, p->method); put(r, ',');
  put_i64(r, p->http_major); put(r, ',');
  put_i64(r, p->http_minor); put(r, ',');
  put_i64(r, p->status_code); put(r, ',');
  put_i64(r, p->flags); put(r, ',');
  put_i64(r, p->upgrade); put(r, ',');
  put_hex_u64(r, p->content_length); put(r, ',');
  put_i64(r, llhttp_should_keep_alive(p)); put(r, ',');
  put_i64(r, llhttp_message_needs_eof(p));
  put(r, '}');
  { int e = maybe_pause(r); if (e) return e; }
  return (int) r->hc_ret;
}

/* Run upstream over data split at `cuts` (strictly increasing offsets in
 * (0, len)) with lenient flags `lenient`, pausing at simple callback i when bit
 * (i % 64) of `pause_mask` is set (and resuming at once), returning `hc_ret`
 * from on_headers_complete, and returning `fail_code` from callback number
 * `fail_at` (-1: none). Writes the trace to `out` and returns its length, or -1
 * on overflow of `out`. */
int64_t http_fuzz_trace(const uint8_t* data, int64_t len, int64_t type, int64_t lenient,
                        const int64_t* cuts, int64_t ncuts, uint8_t* out, int64_t cap,
                        int64_t pause_mask, int64_t hc_ret, int64_t fail_at, int64_t fail_code) {
  llhttp_t parser;
  llhttp_settings_t settings;
  trace_rec rec;
  int64_t start = 0, k;
  llhttp_errno_t err = HPE_OK;
  int64_t err_off = -1;
  int64_t fin = -1;

  memset(&rec, 0, sizeof rec);
  rec.out = out;
  rec.cap = cap;
  rec.pause_mask = pause_mask;
  rec.hc_ret = hc_ret;
  rec.fail_at = fail_at;
  rec.fail_code = fail_code;

  llhttp_settings_init(&settings);
  settings.on_message_begin = cb_message_begin;
  settings.on_protocol = cb_protocol;
  settings.on_url = cb_url;
  settings.on_status = cb_status;
  settings.on_method = cb_method;
  settings.on_version = cb_version;
  settings.on_header_field = cb_header_field;
  settings.on_header_value = cb_header_value;
  settings.on_chunk_extension_name = cb_ext_name;
  settings.on_chunk_extension_value = cb_ext_value;
  settings.on_headers_complete = cb_headers_complete;
  settings.on_body = cb_body;
  settings.on_message_complete = cb_message_complete;
  settings.on_protocol_complete = cb_protocol_complete;
  settings.on_url_complete = cb_url_complete;
  settings.on_status_complete = cb_status_complete;
  settings.on_method_complete = cb_method_complete;
  settings.on_version_complete = cb_version_complete;
  settings.on_header_field_complete = cb_header_field_complete;
  settings.on_header_value_complete = cb_header_value_complete;
  settings.on_chunk_extension_name_complete = cb_ext_name_complete;
  settings.on_chunk_extension_value_complete = cb_ext_value_complete;
  settings.on_chunk_header = cb_chunk_header;
  settings.on_chunk_complete = cb_chunk_complete;
  settings.on_reset = cb_reset;

  llhttp_init(&parser, (llhttp_type_t) type, &settings);
  parser.lenient_flags = (uint16_t) lenient;
  parser.data = &rec;

  for (k = 0; k <= ncuts; k++) {
    int64_t end = k < ncuts ? cuts[k] : len;
    int64_t n = end - start;
    char* chunk = (char*) malloc(n > 0 ? (size_t) n : 1);
    const char* at = chunk;
    memcpy(chunk, data + start, (size_t) n);
    for (;;) {
      rec.paused = 0;
      err = llhttp_execute(&parser, at, (size_t) (chunk + n - at));
      if (err == HPE_PAUSED && rec.paused) {
        /* our own pause: resume where the parser stopped */
        at = llhttp_get_error_pos(&parser);
        llhttp_resume(&parser);
        continue;
      }
      break;
    }
    if (err != HPE_OK) {
      const char* pos = llhttp_get_error_pos(&parser);
      err_off = pos == NULL ? -1 : start + (int64_t) (pos - chunk);
      free(chunk);
      break;
    }
    free(chunk);
    start = end;
  }
  /* llhttp_errno_t is an unsigned enum to clang; a callback's -1 comes back
   * through it, so read both results as the int they are. */
  if (err == HPE_OK) fin = (int32_t) llhttp_finish(&parser);

  rec.span_kind = 0;
  put(&rec, '#');
  put_i64(&rec, (int32_t) err); put(&rec, ',');
  put_i64(&rec, err_off); put(&rec, ',');
  if (err != HPE_OK && llhttp_get_error_reason(&parser) != NULL)
    put_str(&rec, llhttp_get_error_reason(&parser));
  put(&rec, ',');
  put_i64(&rec, fin);
  if (fin > 0 && llhttp_get_error_reason(&parser) != NULL &&
      llhttp_get_error_reason(&parser)[0] != '\0') {
    put(&rec, ',');
    put_str(&rec, llhttp_get_error_reason(&parser));
  }
  return rec.overflow ? -1 : rec.len;
}
