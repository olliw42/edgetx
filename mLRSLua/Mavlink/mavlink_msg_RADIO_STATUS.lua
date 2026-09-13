local RADIO_STATUS = {}
RADIO_STATUS.id = 109
RADIO_STATUS.crc_extra = 185
RADIO_STATUS.fields = {
             { "rxerrors", "<I2" },
             { "fixed", "<I2" },
             { "rssi", "<B" },
             { "remrssi", "<B" },
             { "txbuf", "<B" },
             { "noise", "<B" },
             { "remnoise", "<B" },
             }
return RADIO_STATUS
