local SENS_ATMOS = {}
SENS_ATMOS.id = 8009
SENS_ATMOS.crc_extra = 144
SENS_ATMOS.fields = {
             { "timestamp", "<I8" },
             { "TempAmbient", "<f" },
             { "Humidity", "<f" },
             }
return SENS_ATMOS
