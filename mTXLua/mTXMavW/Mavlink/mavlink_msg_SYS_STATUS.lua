local SYS_STATUS = {}
SYS_STATUS.id = 1
SYS_STATUS.crc_extra = 124
SYS_STATUS.fields = {
             { "onboard_control_sensors_present", "<I4" },
             { "onboard_control_sensors_enabled", "<I4" },
             { "onboard_control_sensors_health", "<I4" },
             { "load", "<I2" },
             { "voltage_battery", "<I2" },
             { "current_battery", "<i2" },
             { "drop_rate_comm", "<I2" },
             { "errors_comm", "<I2" },
             { "errors_count1", "<I2" },
             { "errors_count2", "<I2" },
             { "errors_count3", "<I2" },
             { "errors_count4", "<I2" },
             { "battery_remaining", "<b" },
             { "onboard_control_sensors_present_extended", "<I4" },
             { "onboard_control_sensors_enabled_extended", "<I4" },
             { "onboard_control_sensors_health_extended", "<I4" },
             }
return SYS_STATUS
