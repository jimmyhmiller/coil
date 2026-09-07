union Floats { float scalar; float lanes[3]; };
struct Nested { union Floats values; float tail; };
extern union Floats coil_union_echo(union Floats);
extern struct Nested coil_union_nested(struct Nested);
long native_union_check(void) {
    union Floats input = { .lanes = { 1.5f, 2.5f, 3.5f } };
    union Floats result = coil_union_echo(input);
    struct Nested nested = { input, 4.5f };
    struct Nested output = coil_union_nested(nested);
    return result.lanes[0] == 1.5f && result.lanes[1] == 2.5f && result.lanes[2] == 3.5f
        && output.values.lanes[0] == 1.5f && output.values.lanes[1] == 2.5f
        && output.values.lanes[2] == 3.5f && output.tail == 4.5f ? 42 : 1;
}
