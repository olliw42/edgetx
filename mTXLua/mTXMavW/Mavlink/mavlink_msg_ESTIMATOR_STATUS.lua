local ESTIMATOR_STATUS = {}
ESTIMATOR_STATUS.id = 230
ESTIMATOR_STATUS.crc_extra = 163
ESTIMATOR_STATUS.fields = {
             { "time_usec", "<I8" },
             { "vel_ratio", "<f" },
             { "pos_horiz_ratio", "<f" },
             { "pos_vert_ratio", "<f" },
             { "mag_ratio", "<f" },
             { "hagl_ratio", "<f" },
             { "tas_ratio", "<f" },
             { "pos_horiz_accuracy", "<f" },
             { "pos_vert_accuracy", "<f" },
             { "flags", "<I2" },
             }
return ESTIMATOR_STATUS
