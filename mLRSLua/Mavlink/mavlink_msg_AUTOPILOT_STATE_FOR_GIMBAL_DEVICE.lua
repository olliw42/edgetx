local AUTOPILOT_STATE_FOR_GIMBAL_DEVICE = {}
AUTOPILOT_STATE_FOR_GIMBAL_DEVICE.id = 286
AUTOPILOT_STATE_FOR_GIMBAL_DEVICE.crc_extra = 210
AUTOPILOT_STATE_FOR_GIMBAL_DEVICE.fields = {
             { "time_boot_us", "<I8" },
             { "q", "<f", 4 },
             { "q_estimated_delay_us", "<I4" },
             { "vx", "<f" },
             { "vy", "<f" },
             { "vz", "<f" },
             { "v_estimated_delay_us", "<I4" },
             { "feed_forward_angular_velocity_z", "<f" },
             { "estimator_status", "<I2" },
             { "target_system", "<B" },
             { "target_component", "<B" },
             { "landed_state", "<B" },
             { "angular_velocity_z", "<f" },
             }
return AUTOPILOT_STATE_FOR_GIMBAL_DEVICE
