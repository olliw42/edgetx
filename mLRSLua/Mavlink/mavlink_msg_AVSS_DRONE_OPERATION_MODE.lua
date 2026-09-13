local AVSS_DRONE_OPERATION_MODE = {}
AVSS_DRONE_OPERATION_MODE.id = 60053
AVSS_DRONE_OPERATION_MODE.crc_extra = 45
AVSS_DRONE_OPERATION_MODE.fields = {
             { "time_boot_ms", "<I4" },
             { "M300_operation_mode", "<B" },
             { "horsefly_operation_mode", "<B" },
             }
return AVSS_DRONE_OPERATION_MODE
