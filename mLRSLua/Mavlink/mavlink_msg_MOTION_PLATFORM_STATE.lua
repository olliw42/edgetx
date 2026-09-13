local MOTION_PLATFORM_STATE = {}
MOTION_PLATFORM_STATE.id = 52502
MOTION_PLATFORM_STATE.crc_extra = 88
MOTION_PLATFORM_STATE.fields = {
             { "time_boot_ms", "<I4" },
             { "x", "<f" },
             { "y", "<f" },
             { "z", "<f" },
             { "roll", "<f" },
             { "pitch", "<f" },
             { "yaw", "<f" },
             { "vel_x", "<f" },
             { "vel_y", "<f" },
             { "vel_z", "<f" },
             { "vel_roll", "<f" },
             { "vel_pitch", "<f" },
             { "vel_yaw", "<f" },
             { "acc_x", "<f" },
             { "acc_y", "<f" },
             { "acc_z", "<f" },
             { "acc_roll", "<f" },
             { "acc_pitch", "<f" },
             { "acc_yaw", "<f" },
             { "health", "<B" },
             { "mode", "<B" },
             }
return MOTION_PLATFORM_STATE
