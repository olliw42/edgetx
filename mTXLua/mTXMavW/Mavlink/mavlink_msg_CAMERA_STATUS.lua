local CAMERA_STATUS = {}
CAMERA_STATUS.id = 179
CAMERA_STATUS.crc_extra = 189
CAMERA_STATUS.fields = {
             { "time_usec", "<I8" },
             { "p1", "<f" },
             { "p2", "<f" },
             { "p3", "<f" },
             { "p4", "<f" },
             { "img_idx", "<I2" },
             { "target_system", "<B" },
             { "cam_idx", "<B" },
             { "event_id", "<B" },
             }
return CAMERA_STATUS
