local AVSS_PRS_SYS_STATUS = {}
AVSS_PRS_SYS_STATUS.id = 60050
AVSS_PRS_SYS_STATUS.crc_extra = 220
AVSS_PRS_SYS_STATUS.fields = {
             { "time_boot_ms", "<I4" },
             { "error_status", "<I4" },
             { "battery_status", "<I4" },
             { "arm_status", "<B" },
             { "charge_status", "<B" },
             }
return AVSS_PRS_SYS_STATUS
