local COMMAND_LONG_STAMPED = {}
COMMAND_LONG_STAMPED.id = 224
COMMAND_LONG_STAMPED.crc_extra = 102
COMMAND_LONG_STAMPED.fields = {
             { "vehicle_timestamp", "<I8" },
             { "utc_time", "<I4" },
             { "param1", "<f" },
             { "param2", "<f" },
             { "param3", "<f" },
             { "param4", "<f" },
             { "param5", "<f" },
             { "param6", "<f" },
             { "param7", "<f" },
             { "command", "<I2" },
             { "target_system", "<B" },
             { "target_component", "<B" },
             { "confirmation", "<B" },
             }
return COMMAND_LONG_STAMPED
