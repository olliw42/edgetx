local GENERATOR_STATUS = {}
GENERATOR_STATUS.id = 373
GENERATOR_STATUS.crc_extra = 117
GENERATOR_STATUS.fields = {
             { "status", "<I8" },
             { "battery_current", "<f" },
             { "load_current", "<f" },
             { "power_generated", "<f" },
             { "bus_voltage", "<f" },
             { "bat_current_setpoint", "<f" },
             { "runtime", "<I4" },
             { "time_until_maintenance", "<i4" },
             { "generator_speed", "<I2" },
             { "rectifier_temperature", "<i2" },
             { "generator_temperature", "<i2" },
             }
return GENERATOR_STATUS
