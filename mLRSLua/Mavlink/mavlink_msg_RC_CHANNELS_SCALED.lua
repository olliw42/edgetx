local RC_CHANNELS_SCALED = {}
RC_CHANNELS_SCALED.id = 34
RC_CHANNELS_SCALED.crc_extra = 237
RC_CHANNELS_SCALED.fields = {
             { "time_boot_ms", "<I4" },
             { "chan1_scaled", "<i2" },
             { "chan2_scaled", "<i2" },
             { "chan3_scaled", "<i2" },
             { "chan4_scaled", "<i2" },
             { "chan5_scaled", "<i2" },
             { "chan6_scaled", "<i2" },
             { "chan7_scaled", "<i2" },
             { "chan8_scaled", "<i2" },
             { "port", "<B" },
             { "rssi", "<B" },
             }
return RC_CHANNELS_SCALED
