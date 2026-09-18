local QSHOT_STATUS = {}
QSHOT_STATUS.id = 60020
QSHOT_STATUS.crc_extra = 202
QSHOT_STATUS.fields = {
             { "mode", "<I2" },
             { "shot_state", "<I2" },
             }
return QSHOT_STATUS
