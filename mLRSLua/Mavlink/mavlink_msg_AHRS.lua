local AHRS = {}
AHRS.id = 163
AHRS.crc_extra = 127
AHRS.fields = {
             { "omegaIx", "<f" },
             { "omegaIy", "<f" },
             { "omegaIz", "<f" },
             { "accel_weight", "<f" },
             { "renorm_val", "<f" },
             { "error_rp", "<f" },
             { "error_yaw", "<f" },
             }
return AHRS
