local GIMBAL_MANAGER_STATUS = {}
GIMBAL_MANAGER_STATUS.id = 281
GIMBAL_MANAGER_STATUS.crc_extra = 48
GIMBAL_MANAGER_STATUS.fields = {
             { "time_boot_ms", "<I4" },
             { "flags", "<I4" },
             { "gimbal_device_id", "<B" },
             { "primary_control_sysid", "<B" },
             { "primary_control_compid", "<B" },
             { "secondary_control_sysid", "<B" },
             { "secondary_control_compid", "<B" },
             }
return GIMBAL_MANAGER_STATUS
