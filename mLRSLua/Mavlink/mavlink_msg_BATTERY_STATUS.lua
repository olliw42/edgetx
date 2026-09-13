local BATTERY_STATUS = {}
BATTERY_STATUS.id = 147
BATTERY_STATUS.crc_extra = 154
BATTERY_STATUS.fields = {
             { "current_consumed", "<i4" },
             { "energy_consumed", "<i4" },
             { "temperature", "<i2" },
             { "voltages", "<I2", 10 },
             { "current_battery", "<i2" },
             { "id", "<B" },
             { "battery_function", "<B" },
             { "type", "<B" },
             { "battery_remaining", "<b" },
             { "time_remaining", "<i4" },
             { "charge_state", "<B" },
             { "voltages_ext", "<I2", 4 },
             { "mode", "<B" },
             { "fault_bitmask", "<I4" },
             }
return BATTERY_STATUS
