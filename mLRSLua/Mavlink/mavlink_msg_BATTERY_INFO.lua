local BATTERY_INFO = {}
BATTERY_INFO.id = 372
BATTERY_INFO.crc_extra = 26
BATTERY_INFO.fields = {
             { "discharge_minimum_voltage", "<f" },
             { "charging_minimum_voltage", "<f" },
             { "resting_minimum_voltage", "<f" },
             { "charging_maximum_voltage", "<f" },
             { "charging_maximum_current", "<f" },
             { "nominal_voltage", "<f" },
             { "discharge_maximum_current", "<f" },
             { "discharge_maximum_burst_current", "<f" },
             { "design_capacity", "<f" },
             { "full_charge_capacity", "<f" },
             { "cycle_count", "<I2" },
             { "weight", "<I2" },
             { "id", "<B" },
             { "battery_function", "<B" },
             { "type", "<B" },
             { "state_of_health", "<B" },
             { "cells_in_series", "<B" },
             { "manufacture_date", "<c9" },
             { "serial_number", "<c32" },
             { "name", "<c50" },
             }
return BATTERY_INFO
