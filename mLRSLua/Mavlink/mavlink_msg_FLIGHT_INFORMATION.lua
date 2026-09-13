local FLIGHT_INFORMATION = {}
FLIGHT_INFORMATION.id = 264
FLIGHT_INFORMATION.crc_extra = 49
FLIGHT_INFORMATION.fields = {
             { "arming_time_utc", "<I8" },
             { "takeoff_time_utc", "<I8" },
             { "flight_uuid", "<I8" },
             { "time_boot_ms", "<I4" },
             { "landing_time", "<I4" },
             }
return FLIGHT_INFORMATION
