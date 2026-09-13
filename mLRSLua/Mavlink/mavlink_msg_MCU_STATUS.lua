local MCU_STATUS = {}
MCU_STATUS.id = 11039
MCU_STATUS.crc_extra = 142
MCU_STATUS.fields = {
             { "MCU_temperature", "<i2" },
             { "MCU_voltage", "<I2" },
             { "MCU_voltage_min", "<I2" },
             { "MCU_voltage_max", "<I2" },
             { "id", "<B" },
             }
return MCU_STATUS
