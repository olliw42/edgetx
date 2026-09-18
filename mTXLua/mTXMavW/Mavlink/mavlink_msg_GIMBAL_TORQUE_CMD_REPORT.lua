local GIMBAL_TORQUE_CMD_REPORT = {}
GIMBAL_TORQUE_CMD_REPORT.id = 214
GIMBAL_TORQUE_CMD_REPORT.crc_extra = 69
GIMBAL_TORQUE_CMD_REPORT.fields = {
             { "rl_torque_cmd", "<i2" },
             { "el_torque_cmd", "<i2" },
             { "az_torque_cmd", "<i2" },
             { "target_system", "<B" },
             { "target_component", "<B" },
             }
return GIMBAL_TORQUE_CMD_REPORT
