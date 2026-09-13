local NAV_FILTER_BIAS = {}
NAV_FILTER_BIAS.id = 220
NAV_FILTER_BIAS.crc_extra = 34
NAV_FILTER_BIAS.fields = {
             { "usec", "<I8" },
             { "accel_0", "<f" },
             { "accel_1", "<f" },
             { "accel_2", "<f" },
             { "gyro_0", "<f" },
             { "gyro_1", "<f" },
             { "gyro_2", "<f" },
             }
return NAV_FILTER_BIAS
