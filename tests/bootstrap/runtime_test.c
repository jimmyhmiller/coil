#include <assert.h>
#define main bootstrap_main
#include "../../src/bootstrap/runtime.c"
#undef main

static uint8_t *test_memory;
static const uint64_t test_heap_base = 65536;
uint8_t **const wasm_memory = &test_memory;
const uint64_t *const wasm___heap_base = &test_heap_base;
void wasm_init(void) { test_memory = calloc(1, test_heap_base); }
uint64_t wasm_main(uint32_t argc, uint64_t argv) { (void)argc; (void)argv; return 0; }

static uint64_t guest_string(const char *text) {
    size_t size = strlen(text) + 1;
    uint64_t offset = rt_malloc(size);
    memcpy(MEM + offset, text, size);
    return offset;
}
static uint64_t guest_vector(const uint64_t *items, size_t count) {
    uint64_t offset = rt_malloc((count + 1) * 8);
    memcpy(MEM + offset, items, count * 8);
    memset(MEM + offset + count * 8, 0, 8);
    return offset;
}
int main(void) {
    wasm_init(); g_brk = g_cap = test_heap_base;
    uint64_t out = rt_malloc(8);
    hdr_size_set(out, 123);
    assert(env_posix_memalign(out, 3, 100) == EINVAL);
    assert(hdr_size_get(out) == 123);
    for (uint64_t alignment = 8; alignment <= 4096; alignment *= 2) {
        assert(env_posix_memalign(out, alignment, 97) == 0);
        uint64_t ptr = hdr_size_get(out);
        assert(ptr % alignment == 0);
        memset(MEM + ptr, 42, 97);
        rt_free(ptr);
        uint64_t previous_break = g_brk;
        assert(env_posix_memalign(out, alignment, 97) == 0);
        assert(hdr_size_get(out) == ptr && g_brk == previous_break);
        rt_free(ptr);
    }
    uint64_t small = rt_malloc(32);
    memset(MEM + small, 73, 32);
    uint64_t grown = rt_realloc(small, 1000000);
    for (int i = 0; i < 32; ++i) assert(MEM[grown + i] == 73);
    rt_free(grown);

    uint64_t key = guest_string("COIL_BOOTSTRAP_RUNTIME_TEST");
    assert(env_setenv(key, guest_string("first"), 1) == 0);
    uint64_t first = env_getenv(key);
    assert(first && !strcmp(hoststr(first), "first") && env_getenv(key) == first);
    assert(env_setenv(key, guest_string("second"), 1) == 0);
    assert(!strcmp(hoststr(env_getenv(key)), "second"));
    assert(env_unsetenv(key) == 0 && env_getenv(key) == 0);

    uint64_t directory = guest_string("/tmp/coil-bootstrap-runtime-XXXXXX");
    assert(env_mkdtemp(directory) == directory);
    char file[4096];
    snprintf(file, sizeof file, "%s/item-XXXXXX", hoststr(directory));
    uint64_t path = guest_string(file);
    int fd = (int32_t)env_mkstemp(path);
    assert(fd >= 0); close(fd);
    uint64_t handle = env_opendir(directory);
    assert(handle);
    int found = 0;
    uint64_t entry;
    while ((entry = env_readdir(handle))) {
        if (!strncmp(hoststr(entry + 21), "item-", 5)) {
            assert(MEM[entry + 20] == DT_REG); found = 1;
        }
    }
    assert(found && env_closedir(handle) == 0);
    assert(env_remove(path) == 0 && env_rmdir(directory) == 0);
    assert(env_opendir(directory) == 0);

    uint64_t args[] = {guest_string("sh"), guest_string("-c"),
        guest_string("test \"$COIL_BOOTSTRAP_CHILD\" = inherited || exit 9; exit 7")};
    uint64_t environment[] = {guest_string("COIL_BOOTSTRAP_CHILD=inherited")};
    uint64_t argv = guest_vector(args, 3), envp = guest_vector(environment, 1);
    uint64_t pid_out = rt_malloc(4), status = rt_malloc(4);
    assert(env_posix_spawnp(pid_out, args[0], 1, 0, argv, envp) == ENOTSUP);
    assert(env_posix_spawnp(pid_out, args[0], 0, 0, argv, envp) == 0);
    int32_t pid, result; memcpy(&pid, MEM + pid_out, 4);
    assert((int32_t)env_waitpid((uint32_t)pid, status, 0) == pid);
    memcpy(&result, MEM + status, 4);
    assert(WIFEXITED(result) && WEXITSTATUS(result) == 7);
    assert(env_posix_spawnp(pid_out, guest_string("/nonexistent/coil-test"), 0, 0, argv, envp) == ENOENT);
    assert(env_dladdr(123, out) == 0);
    free(test_memory);
    puts("bootstrap runtime: aligned reuse, relocation, environment, directory I/O, and process marshalling passed");
    return 0;
}
