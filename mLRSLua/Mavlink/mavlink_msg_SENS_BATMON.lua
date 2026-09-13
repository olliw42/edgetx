local SENS_BATMON = {}
SENS_BATMON.id = 8010
SENS_BATMON.crc_extra = 155
SENS_BATMON.fields = {
             { "batmon_timestamp", "<I8" },
             { "temperature", "<f" },
             { "safetystatus", "<I4" },
             { "operationstatus", "<I4" },
             { "voltage", "<I2" },
             { "current", "<i2" },
             { "batterystatus", "<I2" },
             { "serialnumber", "<I2" },
             { "cellvoltage1", "<I2" },
             { "cellvoltage2", "<I2" },
             { "cellvoltage3", "<I2" },
             { "cellvoltage4", "<I2" },
             { "cellvoltage5", "<I2" },
             { "cellvoltage6", "<I2" },
             { "SoC", "<B" },
             }
return SENS_BATMON
