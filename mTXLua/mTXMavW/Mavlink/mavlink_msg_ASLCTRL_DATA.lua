local ASLCTRL_DATA = {}
ASLCTRL_DATA.id = 8004
ASLCTRL_DATA.crc_extra = 172
ASLCTRL_DATA.fields = {
             { "timestamp", "<I8" },
             { "h", "<f" },
             { "hRef", "<f" },
             { "hRef_t", "<f" },
             { "PitchAngle", "<f" },
             { "PitchAngleRef", "<f" },
             { "q", "<f" },
             { "qRef", "<f" },
             { "uElev", "<f" },
             { "uThrot", "<f" },
             { "uThrot2", "<f" },
             { "nZ", "<f" },
             { "AirspeedRef", "<f" },
             { "YawAngle", "<f" },
             { "YawAngleRef", "<f" },
             { "RollAngle", "<f" },
             { "RollAngleRef", "<f" },
             { "p", "<f" },
             { "pRef", "<f" },
             { "r", "<f" },
             { "rRef", "<f" },
             { "uAil", "<f" },
             { "uRud", "<f" },
             { "aslctrl_mode", "<B" },
             { "SpoilersEngaged", "<B" },
             }
return ASLCTRL_DATA
