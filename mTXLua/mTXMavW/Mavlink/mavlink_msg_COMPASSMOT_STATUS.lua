local COMPASSMOT_STATUS = {}
COMPASSMOT_STATUS.id = 177
COMPASSMOT_STATUS.crc_extra = 240
COMPASSMOT_STATUS.fields = {
             { "current", "<f" },
             { "CompensationX", "<f" },
             { "CompensationY", "<f" },
             { "CompensationZ", "<f" },
             { "throttle", "<I2" },
             { "interference", "<I2" },
             }
return COMPASSMOT_STATUS
