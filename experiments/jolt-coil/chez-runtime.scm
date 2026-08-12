;; Compile Jolt's unchanged Chez source-mode entry from the Jolt repository root,
;; exactly where bin/jolt runs it. Every nested load is expanded into this native
;; compilation unit; no runtime Scheme evaluator exists in this path.
(load "host/chez/cli.ss")
