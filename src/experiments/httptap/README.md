# httptap — every HTTP request your program makes, sent somewhere to be looked at

```sh
coil build app.coil -o app --use httptap
COIL_HTTP_TAP=har:///tmp/session.har ./app
```

No source edits. No wrapper library. No import in the application. `app.coil`
calls `coil.http.client` the way it always did; one flag on the build line makes
every one of those calls report itself.

This is a **dialect** in the sense the metaprogram docs use: a module you import
(here, via `--use`) that registers a whole-program transform. The transform reads
the compiler's own checked model of the program, finds every call that resolves
to `coil.http.client/request` or `request-stream` — through any alias, in any
module, **including libraries whose source you did not write** — and rewrites it
to a traced stand-in that carries a compile-time-constant description of the call
site.

Matching is semantic, not textual: `primitive/code-decl` reports the exact entity
the type-checker resolved the call head to. So `(http/request …)`, `(h/request …)`
and a bare referred `request` all match, and your own local function named
`request` does not.

## What a destination learns

| | |
|---|---|
| **provenance** | module, function, file, line, column of the call site |
| **request** | method, URL, headers, body |
| **response** | status, headers, body (capped), true body length, truncation flag |
| **outcome** | success, HTTP error status, or transport failure with its message |
| **timing** | wall-clock start, monotonic elapsed |
| **streaming** | whether it streamed, total bytes, whether the consumer stopped early |

The provenance row is the one no proxy, `curl` wrapper or packet capture can give
you. It is also free: those five values are literals baked in at compile time.

## Destinations

Chosen at **run** time, so one binary serves all three.

```sh
COIL_HTTP_TAP=file:///tmp/http.jsonl   # one JSON object per request, per line
COIL_HTTP_TAP=har:///tmp/session.har   # HAR 1.2 — open in Chrome DevTools
COIL_HTTP_TAP=cdp://127.0.0.1:9229     # live: DevTools attaches to the program
# unset                                 # no tap; requests run untouched
```

| also | |
|---|---|
| `COIL_HTTP_TAP_MAX_BODY=N` | bytes of each body to keep (default 65536) |
| `COIL_HTTP_TAP_WAIT=1` | `cdp` only: block at start-up until DevTools attaches |

A destination that cannot be brought up is a **hard, fatal error**. A tracing
tool that silently records nothing is worse than no tracing tool: it answers
"there were no requests" when the truth is "I never looked".

### `file:` — JSON Lines

One object per request, flushed as each finishes, so a program that crashes still
leaves behind everything that had completed. The destination to reach for when
the consumer is `jq` or a diff between two runs.

```json
{"id":2,"startedMs":1786075820402,"durationNs":313000,
 "site":{"module":"tapdemo.api","function":"post-echo","file":"…/demoapi.coil","line":46,"column":12},
 "method":"POST","url":"http://127.0.0.1:8111/echo",
 "requestHeaders":[{"name":"X-Coil-Demo","value":"httptap"}],"requestBody":"hello from coil",
 "status":418,"responseHeaders":[…],"responseBody":"hello from coil",
 "responseBodyLength":15,"truncated":false,"streamed":false,"failed":false,"error":"","errorCode":0}
```

### `har:` — an archive DevTools already reads

Written at exit. Drag it onto **DevTools ▸ Network** for a native waterfall,
header inspection and body preview, out of a program that has nothing to do with
a browser. Each entry carries a `_coil` block with the site — a custom field,
which HAR permits and viewers preserve.

Two things it deliberately does not claim: `httpVersion` is `""` (the client does
not report the negotiated version) and the whole elapsed span is `timings.wait`
(the tap measures one span, so a send/receive breakdown would be a fiction drawn
as a waterfall).

### `cdp:` — live Chrome DevTools

The same trick the Node inspector plays. DevTools does not care that there is no
browser on the other end of the socket, only that something speaks the Chrome
DevTools Protocol over a WebSocket. The program prints:

```
httptap: DevTools endpoint on ws://127.0.0.1:9229/httptap
httptap: open devtools://devtools/bundled/inspector.html?ws=127.0.0.1:9229/httptap
```

Paste that `devtools://` URL into Chrome and requests appear in the Network panel
as they happen. The site shows up in the **Initiator** column (as file/line) and
again in a `_coil` field on the event.

Implemented: the `/json/version` and `/json/list` discovery endpoints, the RFC
6455 handshake, `Network.requestWillBeSent` / `responseReceived` /
`loadingFinished` / `loadingFailed`, and `Network.getResponseBody` — which is
what makes clicking a request and reading its body work. Every other command
gets an empty result, because DevTools waits on the ids it sent and an
unanswered one stalls the panel.

Events raised before anyone attaches are queued and flushed at handshake, and at
exit the program stays alive while DevTools is still attached — a program that
vanished the moment its last request finished would give you nothing to look at.
Use `COIL_HTTP_TAP_WAIT=1` to hold start-up until you have attached.

## Running it

Two commands, nothing to set up:

```sh
coil build src/experiments/httptap/demo.coil -o /tmp/demo --use httptap
COIL_HTTP_TAP=file:///tmp/http.jsonl /tmp/demo
```

Or `src/experiments/httptap/scripts/demo.sh`, which also builds it untapped for
comparison. The demo talks to example.com, so there is no server to run.

Its requests are issued from `tapdemo.api` — a module that imports
`coil.http.client` and knows nothing about httptap — and every report names
*that* module and the function inside it:

```
   "site":{"module":"tapdemo.api","function":"get-status","file":"…/demoapi.coil","line":34,"column":12}
   "site":{"module":"tapdemo.api","function":"post-echo","file":"…/demoapi.coil","line":46,"column":12}
   "site":{"module":"tapdemo.api","function":"get-status","file":"…/demoapi.coil","line":34,"column":12}
   "site":{"module":"tapdemo.api","function":"stream-count","file":"…/demoapi.coil","line":70,"column":12}
   "site":{"module":"tapdemo.api","function":"get-status","file":"…/demoapi.coil","line":34,"column":12}
```

## Adding a destination

A destination is a `TapSink`: a context pointer and three function pointers.

```coil
(defstruct TapSink
  [(context (ptr i8))
   (on-start  (fnptr c [(ptr i8) (ptr TapEvent)] i64))   ; request going out
   (on-finish (fnptr c [(ptr i8) (ptr TapEvent)] i64))   ; completed or failed
   (on-close  (fnptr c [(ptr i8)] i64))])                ; once, at exit
```

Fill one in and call `httptap.rt/tap-set-sink!`. The start/finish split is what
lets one interface serve both kinds of destination: a live viewer wants to show a
request while it is in flight, a file format wants one finished record.

The slices on a `TapEvent` **borrow** the caller's memory and are valid only for
the duration of the callback. `jsonl` and `cdp` serialize immediately; `har`
accumulates the serialized text rather than deep-copying structures; `cdp` copies
response bodies aside because `getResponseBody` is answered much later.

To ship a destination as a scheme, add a branch to `httptap.boot/tap-boot!`.

## The files

| | |
|---|---|
| `httptap.coil` | the transform — module `httptap`, the name you pass to `--use` |
| `rt.coil` | runtime: `TapEvent`, `TapSink`, the traced stand-ins, JSON/base64/UTF-8 helpers |
| `boot.coil` | reads `COIL_HTTP_TAP` and installs a sink |
| `jsonl.coil`, `har.coil`, `cdp.coil` | the three destinations |
| `ws.coil` | SHA-1 and RFC 6455 framing, for `cdp` |
| `demo.coil`, `demoapi.coil` | the demo application and its "library" layer |
| `scripts/demo.sh` | builds it both ways and runs them |

## How the transform stays honest

- **Fixpoint safety.** Transforms run to a fixpoint, so every rewrite has to be
  recognizable as already done. A rewritten call site is self-evident — it no
  longer calls the real client. The `tap-boot!` injected at the top of `main` is
  not, so it announces itself with a `__httptap_boot__` binding.
- **It skips its own modules.** `httptap.rt` calls the real client on purpose;
  rewriting that call would make the tap tap itself, forever.
- **It skips the standard library** via `primitive/code-from-user?`, and leaves
  subtrees containing no HTTP call structurally untouched, so unrelated code
  keeps its original nodes and the source spans every later diagnostic points at.
- **Untapped is a real path, not a hope.** With `COIL_HTTP_TAP` unset the sink
  vtable is still installed (the null sink), because a rewritten call site can
  run before `main` does.

## Two things this needed from the rest of the tree

Both are now fixed in the tree and in the installed compiler, so httptap builds
with a plain `coil build`.

**`coil.http.client` now exports its `HttpError` variants.** The sum was
exported but `InvalidRequest` / `OutOfMemory` / `Transport` were not, so no
consumer could match on the error it was handed — `error-timeout?` existed as the
workaround. Fixed in `src/stdlib/http_client.coil`.

**The reader now understands `\r`.** It used to handle only `\n \t \" \\` and pass
any other escape through as the bare character, so `"\r\n"` was the two letters
`rn` — silently, which is how 1132 `\r` escapes across this tree (every HTTP
conformance test) came to be feeding malformed input. `src/compiler/reader.coil`
now recognizes `\r`, `\0` and `\xHH`, and rejects an unknown escape outright.
