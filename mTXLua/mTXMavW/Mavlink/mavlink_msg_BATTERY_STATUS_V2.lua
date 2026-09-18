local BATTERY_STATUS_V2 = {}
BATTERY_STATUS_V2.id = 369
BATTERY_STATUS_V2.crc_extra = 151
BATTERY_STATUS_V2.fields = {
             { "voltage", "<f" },
             { "current", "<f" },
             { "capacity_consumed", "<f" },
             { "capacity_remaining", "<f" },
             { "status_flags", "<I4" },
             { "temperature", "<i2" },
             { "id", "<B" },
             { "percent_remaining", "<B" },
             }
return BATTERY_STATUS_V2
