local FUEL_STATUS = {}
FUEL_STATUS.id = 371
FUEL_STATUS.crc_extra = 10
FUEL_STATUS.fields = {
             { "maximum_fuel", "<f" },
             { "consumed_fuel", "<f" },
             { "remaining_fuel", "<f" },
             { "flow_rate", "<f" },
             { "temperature", "<f" },
             { "fuel_type", "<I4" },
             { "id", "<B" },
             { "percent_remaining", "<B" },
             }
return FUEL_STATUS
