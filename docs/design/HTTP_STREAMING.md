# Streaming response bodies in `coil.http.client`

**Status: implemented.** `request-stream` delivers response-body bytes to a typed Coil
consumer as they arrive, instead of buffering the whole body first. The buffered
`request` is unchanged for callers and is now implemented on top of it.

Requested for the Coil agent harness, which consumes model-provider SSE responses and
needs to decode events and redraw its footer while the provider is still generating.

## The API

```lisp
(const BODY-CONTINUE 0)
(const BODY-STOP 1)

(defstruct BodySink
  [(context (ptr i8))
   (consume (fnptr c [(ptr u8) i64 (ptr i8)] i64))])

(defstruct StreamingResponse
  [(status i64) (headers (slice Header)) (stopped bool)])

(defn request-stream [(a (ptr alloc/Allocator)) (req (ptr Request)) (sink BodySink)]
  (-> (Result StreamingResponse HttpError)))
```

`Request` is unchanged, so timeouts, TLS defaults and redirect policy are the same values
in the same fields. The response carries no body: those bytes were transport-owned and
valid only for the duration of each `consume` call.

### Why `i64` rather than a `BodyFlow` sum

The original sketch had `consume` return a two-variant sum. `consume` is a
`(fnptr c …)` — it crosses a C ABI boundary, where a `defsum` return has no guaranteed
representation (compare gotcha 19: a struct-typed `defn` parameter compiles to `(ref T)`,
so it cannot match a C callback signature). Two named constants are unambiguous at that
boundary and read the same at the call site. The sink is called from Coil, but keeping the
signature C-shaped means a C consumer can also implement one.

## The four failure modes stay distinguishable

| Case | How it reports |
|---|---|
| consumer stop | `(Ok r)` with `streaming-response-stopped` true |
| timeout / cancellation | `(Err e)` with `error-timeout?` true |
| allocation failure | `(Err (OutOfMemory))` |
| transport failure | `(Err (Transport code message))` |

An HTTP error status is none of these — it is an `Ok` carrying that status, as with
`request`.

**A consumer stop is a success, not an error.** The caller asked for it, and the status
and headers are still valid because they arrived before any body byte did. Reporting it as
`Err` would force every caller to treat a deliberate early exit as a failure.

**Timeout is a predicate, not a new variant.** Adding `Timeout` to `HttpError` would break
every existing exhaustive `match` on it, which the request explicitly ruled out
("Existing callers should not need changes"). The curl code was already in
`Transport`; `error-timeout?` names it. Both the connect and the total timeout surface as
one curl code, so the two are not distinguished from each other — the request's own
`connect-timeout-ms`/`timeout-ms` say which applied.

## How a stop actually stops

A write callback aborts a libcurl transfer by returning a count different from the one
curl offered; curl then fails the perform with `CURLE_WRITE_ERROR`. That is the only way
to stop a blocking transfer from inside the callback.

So `BODY-STOP` becomes a short count, and the fact that we did it is recorded in
`StreamState.stopped`. Our trampoline is the only thing that ever short-counts, and only
after the sink asked, so that flag cleanly separates a deliberate stop from a genuine
write failure. On the way out, `(or (curl-ok? performed) stopped)` is the success test.

## Synchronous, and reentrant

The transfer runs on the calling thread and `consume` is called from it, so a sink needs
no locking and `request-stream` has not returned while the sink runs.

A nested `request`/`request-stream` from inside a sink **is** permitted: each call
allocates its own curl easy handle and the module keeps no shared state. It blocks the
outer transfer for its whole duration. This is *tested*
(`check-reentrant-request`), not merely reasoned about — a nested buffered request runs
inside an outer streaming callback and both complete.

## `request` is now a thin wrapper

`request` supplies a sink that appends to an `ArrayList` and then packages the result as a
`Response`. Sharing one implementation is what keeps the two from drifting in timeout,
TLS, redirect or cleanup behavior — the failure mode where a fix lands in one path and
not the other.

The existing buffered integration gate (`scripts/tests/http-client.sh`) passes unchanged,
which is the evidence that the rewrite preserved behavior.

## Tests

`scripts/tests/http-client-stream.sh` starts `tests/http_client_stream_server.py` and runs
`tests/http_client_stream_integration.coil`; each check returns a distinct exit code so a
failure names itself. `python3 scripts/dev.py test http` runs both HTTP gates.

The load-bearing test is **`check-streams-incrementally`**. The server flushes three
fragments 300 ms apart, and the test asserts the first callback ran well before the
transfer finished. Measured: first callback at **83 ms**, transfer **694 ms**. A buffered
implementation that replayed the body through several callbacks would pass every other
check here and fail this one, which is exactly what the feature request asked for.

The rest: multi-chunk ordering, a record torn across three flushes, empty and single-chunk
bodies, binary bytes (NUL, lone `0xFF`, truncated multi-byte), non-2xx with headers,
consumer stop after a partial body, total timeout after partial delivery, connect timeout,
connection refused before headers, disconnect mid-body, 50 repeated requests for leaks and
fd exhaustion, reentrancy, and the buffered API still behaving as before.

`tests/http_client_stream_compile.coil` covers the whole exported surface with no network,
so the API shape is gated even where the suite cannot run.

## Not done

- **Cancellation from another thread.** The request asks the API to "compose with a
  standard cancellation token if Coil has one" so a blocked transfer can be interrupted
  from outside. `BODY-STOP` only reaches a transfer that is actively delivering bytes; a
  transfer blocked on a silent socket stops only at its timeout. Doing this properly means
  `CURLOPT_XFERINFOFUNCTION` (which curl calls periodically even while idle) wired to
  `coil.cancellation` — worth doing, but it is a second feature, not part of this one.
- **Streaming request bodies.** This is response-side only; a request body is still one
  `(slice u8)`.
