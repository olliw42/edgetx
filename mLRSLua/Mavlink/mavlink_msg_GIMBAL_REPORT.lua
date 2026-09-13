local GIMBAL_REPORT = {}
GIMBAL_REPORT.id = 200
GIMBAL_REPORT.crc_extra = 134
GIMBAL_REPORT.fields = {
             { "delta_time", "<f" },
             { "delta_angle_x", "<f" },
             { "delta_angle_y", "<f" },
             { "delta_angle_z", "<f" },
             { "delta_velocity_x", "<f" },
             { "delta_velocity_y", "<f" },
             { "delta_velocity_z", "<f" },
             { "joint_roll", "<f" },
             { "joint_el", "<f" },
             { "joint_az", "<f" },
             { "target_system", "<B" },
             { "target_component", "<B" },
             }
return GIMBAL_REPORT
