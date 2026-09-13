local HYGROMETER_SENSOR = {}
HYGROMETER_SENSOR.id = 12920
HYGROMETER_SENSOR.crc_extra = 20
HYGROMETER_SENSOR.fields = {
             { "temperature", "<i2" },
             { "humidity", "<I2" },
             { "id", "<B" },
             }
return HYGROMETER_SENSOR
