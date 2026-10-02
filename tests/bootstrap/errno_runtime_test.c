#include <assert.h>
#define main bootstrap_main
#ifdef TEST_WASM32
#include "../../src/bootstrap/runtime32.c"
typedef uint32_t guest_pointer;
#else
#include "../../src/bootstrap/runtime.c"
typedef uint64_t guest_pointer;
#endif
#undef main

static uint8_t *test_memory;
static const guest_pointer test_heap_base = 65536;
uint8_t **const wasm_memory = &test_memory;
const guest_pointer *const wasm___heap_base = &test_heap_base;
void (*wasm_host_call_enter)(void);
void (*wasm_host_call_leave)(void);
void wasm_init(void) { test_memory = calloc(1, test_heap_base); }
uint64_t wasm_main(uint32_t argc, guest_pointer argv) { (void)argc; (void)argv; return 0; }

int main(void) {
    wasm_init(); g_brk = g_cap = test_heap_base;
    errno = EACCES;
    guest_pointer cell = env___error();
    int32_t value;
    memcpy(&value, MEM + cell, sizeof value);
    assert(value == EACCES);
    value = 0; memcpy(MEM + cell, &value, sizeof value);
    guest_errno_enter();
    assert(errno == 0);
    assert((int32_t)env_write((uint32_t)-1, 0, 0) == -1);
    guest_errno_leave();
    memcpy(&value, MEM + cell, sizeof value);
    assert(value == EBADF);
    rt_malloc(1000000); // Cell identity survives moving the linear-memory buffer.
    assert(env___error() == cell);
    memcpy(&value, MEM + cell, sizeof value);
    assert(value == EBADF);
    value = 0; memcpy(MEM + cell, &value, sizeof value);
    guest_errno_enter(); guest_errno_leave();
    assert(errno == 0);
    free(test_memory);
    return 0;
}
