local MISSION_ITEM_INT = {}
MISSION_ITEM_INT.id = 73
MISSION_ITEM_INT.crc_extra = 38
MISSION_ITEM_INT.fields = {
             { "param1", "<f" },
             { "param2", "<f" },
             { "param3", "<f" },
             { "param4", "<f" },
             { "x", "<i4" },
             { "y", "<i4" },
             { "z", "<f" },
             { "seq", "<I2" },
             { "command", "<I2" },
             { "target_system", "<B" },
             { "target_component", "<B" },
             { "frame", "<B" },
             { "current", "<B" },
             { "autocontinue", "<B" },
             { "mission_type", "<B" },
             }
return MISSION_ITEM_INT
