// errno is native thread-local state, while the guest needs a stable linear-
// memory offset. Synchronize the cell at imported-call boundaries so guest
// writes (notably clearing errno before readdir) reach libc, and libc failures
// become visible to the guest. Store offsets rather than movable host pointers.
extern void (*wasm_host_call_enter)(void);
extern void (*wasm_host_call_leave)(void);
static uint64_t guest_errno_cell;

static void guest_errno_enter(void) {
    if (guest_errno_cell) {
        int32_t value;
        memcpy(&value, MEM + guest_errno_cell, sizeof value);
        errno = value;
    }
}

static void guest_errno_leave(void) {
    if (guest_errno_cell) {
        int32_t value = errno;
        memcpy(MEM + guest_errno_cell, &value, sizeof value);
    }
}

static uint64_t guest_errno_address(void) {
    if (!guest_errno_cell) {
        int saved = errno;
        guest_errno_cell = rt_malloc(sizeof(int32_t));
        errno = saved;
        guest_errno_leave();
    }
    return guest_errno_cell;
}
