local TEST_TYPES = {}
TEST_TYPES.id = 17000
TEST_TYPES.crc_extra = 103
TEST_TYPES.fields = {
             { "u64", "<I8" },
             { "s64", "<i8" },
             { "d", "<d" },
             { "u64_array", "<I8", 3 },
             { "s64_array", "<i8", 3 },
             { "d_array", "<d", 3 },
             { "u32", "<I4" },
             { "s32", "<i4" },
             { "f", "<f" },
             { "u32_array", "<I4", 3 },
             { "s32_array", "<i4", 3 },
             { "f_array", "<f", 3 },
             { "u16", "<I2" },
             { "s16", "<i2" },
             { "u16_array", "<I2", 3 },
             { "s16_array", "<i2", 3 },
             { "c", "<b" },
             { "s", "<c10" },
             { "u8", "<B" },
             { "s8", "<b" },
             { "u8_array", "<B", 3 },
             { "s8_array", "<b", 3 },
             }
return TEST_TYPES
