local RC_CHANNELS_RAW = {}
RC_CHANNELS_RAW.id = 35
RC_CHANNELS_RAW.crc_extra = 244
RC_CHANNELS_RAW.fields = {
             { "time_boot_ms", "<I4" },
             { "chan1_raw", "<I2" },
             { "chan2_raw", "<I2" },
             { "chan3_raw", "<I2" },
             { "chan4_raw", "<I2" },
             { "chan5_raw", "<I2" },
             { "chan6_raw", "<I2" },
             { "chan7_raw", "<I2" },
             { "chan8_raw", "<I2" },
             { "port", "<B" },
             { "rssi", "<B" },
             }
return RC_CHANNELS_RAW
