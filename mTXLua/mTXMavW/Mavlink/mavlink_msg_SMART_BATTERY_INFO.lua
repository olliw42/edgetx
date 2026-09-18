local SMART_BATTERY_INFO = {}
SMART_BATTERY_INFO.id = 370
SMART_BATTERY_INFO.crc_extra = 75
SMART_BATTERY_INFO.fields = {
             { "capacity_full_specification", "<i4" },
             { "capacity_full", "<i4" },
             { "cycle_count", "<I2" },
             { "weight", "<I2" },
             { "discharge_minimum_voltage", "<I2" },
             { "charging_minimum_voltage", "<I2" },
             { "resting_minimum_voltage", "<I2" },
             { "id", "<B" },
             { "battery_function", "<B" },
             { "type", "<B" },
             { "serial_number", "<c16" },
             { "device_name", "<c50" },
             { "charging_maximum_voltage", "<I2" },
             { "cells_in_series", "<B" },
             { "discharge_maximum_current", "<I4" },
             { "discharge_maximum_burst_current", "<I4" },
             { "manufacture_date", "<c11" },
             }
return SMART_BATTERY_INFO
