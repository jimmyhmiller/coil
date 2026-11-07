// PC-sampling profiler: DYLD_INSERT_LIBRARIES=pcprof.dylib PCPROF_OUT=file
#include <signal.h>
#include <sys/time.h>
#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <string.h>
#include <unistd.h>
#include <mach-o/dyld.h>
#include <sys/ucontext.h>
#include <dlfcn.h>
#define CAP (1<<24)
static uint64_t *pcs, *lrs; static volatile uint64_t n;
static void handler(int sig, siginfo_t *si, void *ctx) {
  ucontext_t *uc = (ucontext_t*)ctx;
  uint64_t pc = uc->uc_mcontext->__ss.__pc;
  uint64_t i = __atomic_fetch_add(&n, 1, __ATOMIC_RELAXED);
  if (i < CAP) { pcs[i] = pc; lrs[i] = uc->uc_mcontext->__ss.__lr; }
}
static void dump(void) {
  struct itimerval z = {0}; setitimer(ITIMER_PROF, &z, 0);
  const char *out = getenv("PCPROF_OUT"); if (!out) return;
  char path[4096]; snprintf(path, sizeof path, "%s.%d", out, (int)getpid());
  FILE *f = fopen(path, "w"); if (!f) return;
  // main image slide
  for (uint32_t i = 0; i < _dyld_image_count(); i++) {
    const char *name = _dyld_get_image_name(i);
    fprintf(f, "image %s %lx\n", name, (unsigned long)_dyld_get_image_vmaddr_slide(i));
  }
  uint64_t m = n < CAP ? n : CAP;
  for (uint64_t i = 0; i < m; i++) {
    Dl_info info; const char *lib = "?", *sym = "?";
    if (dladdr((void*)pcs[i], &info)) { lib = info.dli_fname ? strrchr(info.dli_fname, '/') + 1 : "?"; sym = info.dli_sname ? info.dli_sname : "?"; }
    Dl_info li; const char *lsym = "?";
    if (dladdr((void*)lrs[i], &li) && li.dli_sname) lsym = li.dli_sname;
    fprintf(f, "%llx %s %s %llx %s\n", (unsigned long long)pcs[i], lib, sym, (unsigned long long)lrs[i], lsym);
  }
  fclose(f);
}
__attribute__((constructor)) static void init(void) {
  if (!getenv("PCPROF_OUT")) return;
  pcs = malloc(sizeof(uint64_t) * CAP); lrs = malloc(sizeof(uint64_t) * CAP);
  struct sigaction sa; memset(&sa, 0, sizeof sa);
  sa.sa_sigaction = handler; sa.sa_flags = SA_SIGINFO | SA_RESTART;
  sigaction(SIGPROF, &sa, 0);
  struct itimerval tv = { {0, 500}, {0, 500} };  // 2 kHz CPU-time
  setitimer(ITIMER_PROF, &tv, 0);
  atexit(dump);
}
