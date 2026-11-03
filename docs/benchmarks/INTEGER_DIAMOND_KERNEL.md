# Integer PHI conversion compiler measurement

Compiler1d012d63 versus installed2332c195, identical const-mask fixture
SHA0393b0c9df47004a76c6825c43382aee448966f4f200c04e5372d43b2197c8fb.
Ten million feedback iterations; one excluded warmup, five alternating samples.

| Compiler/backend | Median process seconds | Kernel instructions | Branches |
|---|---:|---:|---:|
|2332c195 stogir O3|0.10039470798801631|173|34|
|1d012d63 stogir O3|0.09939704195130616|173|34|
|2332c195 LLVM O3|0.03654345800168812|24|1|

All checksum9979482367440117777. No material speed improvement is established;
backend gap remains2.72×. Direct pass tests cover1024 cases and pass ASAN and
stogir-built execution, but the relevant compiler-generated shapes do not yet
trigger the conversion. Reducing those shapes is the next investigation.
Raw samples adjacent. This is not full compiler acceptance.
