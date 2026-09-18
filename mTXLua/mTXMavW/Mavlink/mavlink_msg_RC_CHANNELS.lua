local RC_CHANNELS = {}
RC_CHANNELS.id = 65
RC_CHANNELS.crc_extra = 118
RC_CHANNELS.fields = {
             { "time_boot_ms", "<I4" },
             { "chan1_raw", "<I2" },
             { "chan2_raw", "<I2" },
             { "chan3_raw", "<I2" },
             { "chan4_raw", "<I2" },
             { "chan5_raw", "<I2" },
             { "chan6_raw", "<I2" },
             { "chan7_raw", "<I2" },
             { "chan8_raw", "<I2" },
             { "chan9_raw", "<I2" },
             { "chan10_raw", "<I2" },
             { "chan11_raw", "<I2" },
             { "chan12_raw", "<I2" },
             { "chan13_raw", "<I2" },
             { "chan14_raw", "<I2" },
             { "chan15_raw", "<I2" },
             { "chan16_raw", "<I2" },
             { "chan17_raw", "<I2" },
             { "chan18_raw", "<I2" },
             { "chancount", "<B" },
             { "rssi", "<B" },
             }
return RC_CHANNELS
