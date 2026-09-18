local PID_TUNING = {}
PID_TUNING.id = 194
PID_TUNING.crc_extra = 98
PID_TUNING.fields = {
             { "desired", "<f" },
             { "achieved", "<f" },
             { "FF", "<f" },
             { "P", "<f" },
             { "I", "<f" },
             { "D", "<f" },
             { "axis", "<B" },
             { "SRate", "<f" },
             { "PDmod", "<f" },
             }
return PID_TUNING
