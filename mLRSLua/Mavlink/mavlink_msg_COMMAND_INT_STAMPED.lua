local COMMAND_INT_STAMPED = {}
COMMAND_INT_STAMPED.id = 223
COMMAND_INT_STAMPED.crc_extra = 119
COMMAND_INT_STAMPED.fields = {
             { "vehicle_timestamp", "<I8" },
             { "utc_time", "<I4" },
             { "param1", "<f" },
             { "param2", "<f" },
             { "param3", "<f" },
             { "param4", "<f" },
             { "x", "<i4" },
             { "y", "<i4" },
             { "z", "<f" },
             { "command", "<I2" },
             { "target_system", "<B" },
             { "target_component", "<B" },
             { "frame", "<B" },
             { "current", "<B" },
             { "autocontinue", "<B" },
             }
return COMMAND_INT_STAMPED
