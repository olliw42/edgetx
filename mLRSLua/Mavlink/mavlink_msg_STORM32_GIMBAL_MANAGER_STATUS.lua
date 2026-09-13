local STORM32_GIMBAL_MANAGER_STATUS = {}
STORM32_GIMBAL_MANAGER_STATUS.id = 60011
STORM32_GIMBAL_MANAGER_STATUS.crc_extra = 183
STORM32_GIMBAL_MANAGER_STATUS.fields = {
             { "device_flags", "<I2" },
             { "manager_flags", "<I2" },
             { "gimbal_id", "<B" },
             { "supervisor", "<B" },
             { "profile", "<B" },
             }
return STORM32_GIMBAL_MANAGER_STATUS
