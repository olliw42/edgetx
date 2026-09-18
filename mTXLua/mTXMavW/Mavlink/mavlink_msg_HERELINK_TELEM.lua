local HERELINK_TELEM = {}
HERELINK_TELEM.id = 50003
HERELINK_TELEM.crc_extra = 62
HERELINK_TELEM.fields = {
             { "rf_freq", "<I4" },
             { "link_bw", "<I4" },
             { "link_rate", "<I4" },
             { "snr", "<i2" },
             { "cpu_temp", "<i2" },
             { "board_temp", "<i2" },
             { "rssi", "<B" },
             }
return HERELINK_TELEM
