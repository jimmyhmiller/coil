#include "ir.h"
#include "ir_builder.h"
#include <stdint.h>
#include <stdio.h>
#include <inttypes.h>

static void generate(ir_ctx *ctx, int mode) {
    ir_START();
    ir_ref a = ir_PARAM(IR_U32, "a", 1);
    ir_ref b = ir_PARAM(IR_U32, "b", 2);
    ir_ref x = ir_ZEXT_U64(a);
    ir_ref y = ir_ZEXT_U64(b);
    ir_ref answer;
    if (mode == 2) {
        ir_ref signed_wide = ir_ZEXT_I64(a);
        answer = ir_ABS_I64(signed_wide);
    } else {
        answer = mode == 0 ? ir_MIN_U64(x, y) : ir_MAX_U64(x, y);
    }
    ir_RETURN(ir_TRUNC_I32(answer));
}

int main(void) {
    ir_consistency_check();
    int failures = 0;
    for (int mode = 0; mode < 3; mode++) for (int level = 1; level <= 2; level++) {
        ir_ctx context;
        ir_init(&context, IR_FUNCTION | IR_OPT_FOLDING, IR_CONSTS_LIMIT_MIN, IR_INSNS_LIMIT_MIN);
        context.ret_type = IR_I32;
        generate(&context, mode);
        size_t size = 0;
        void *entry = ir_jit_compile(&context, level, &size);
        if (!entry) return 2;
        uint32_t a = 0x80000001u, b = 1;
        uint32_t expected = mode == 0 ? b : a;
        uint32_t actual = (uint32_t)((int32_t (*)(uint32_t, uint32_t))entry)(a, b);
        printf("mode=%d O%d expected=%08" PRIx32 " actual=%08" PRIx32 " bytes=%zu\n", mode, level, expected, actual, size);
        failures += actual != expected;
        ir_free(&context);
    }
    return failures != 0;
}
