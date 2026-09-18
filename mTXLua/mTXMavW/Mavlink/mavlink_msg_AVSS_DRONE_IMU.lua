local AVSS_DRONE_IMU = {}
AVSS_DRONE_IMU.id = 60052
AVSS_DRONE_IMU.crc_extra = 101
AVSS_DRONE_IMU.fields = {
             { "time_boot_ms", "<I4" },
             { "q1", "<f" },
             { "q2", "<f" },
             { "q3", "<f" },
             { "q4", "<f" },
             { "xacc", "<f" },
             { "yacc", "<f" },
             { "zacc", "<f" },
             { "xgyro", "<f" },
             { "ygyro", "<f" },
             { "zgyro", "<f" },
             }
return AVSS_DRONE_IMU
