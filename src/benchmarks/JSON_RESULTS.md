# JSON tape benchmark

Fixture revision: `17b13dd2d7a5e5fdd5594e847077932f955b5e2b`.

Host: `Darwin 25.5.0 arm64`. Coil: `unknown`.

The input file is loaded once per process. Each timed command validates and indexes it 20 times and prints the accumulated token count.

## `twitter.json`

Bytes: `631514`; tokens per parse: `27259`.

| Command | Mean [ms] | Min [ms] | Max [ms] | Relative |
|:---|---:|---:|---:|---:|
| `Coil tape` | 12.6 ± 0.2 | 12.1 | 12.8 | 1.00 |

## `citm_catalog.json`

Bytes: `1727204`; tokens per parse: `63647`.

| Command | Mean [ms] | Min [ms] | Max [ms] | Relative |
|:---|---:|---:|---:|---:|
| `Coil tape` | 26.8 ± 0.3 | 26.1 | 27.0 | 1.00 |

## `canada.json`

Bytes: `2251051`; tokens per parse: `167187`.

| Command | Mean [ms] | Min [ms] | Max [ms] | Relative |
|:---|---:|---:|---:|---:|
| `Coil tape` | 51.7 ± 0.5 | 51.0 | 52.7 | 1.00 |
