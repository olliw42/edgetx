local CAMERA_TRACKING_GEO_STATUS = {}
CAMERA_TRACKING_GEO_STATUS.id = 276
CAMERA_TRACKING_GEO_STATUS.crc_extra = 18
CAMERA_TRACKING_GEO_STATUS.fields = {
             { "lat", "<i4" },
             { "lon", "<i4" },
             { "alt", "<f" },
             { "h_acc", "<f" },
             { "v_acc", "<f" },
             { "vel_n", "<f" },
             { "vel_e", "<f" },
             { "vel_d", "<f" },
             { "vel_acc", "<f" },
             { "dist", "<f" },
             { "hdg", "<f" },
             { "hdg_acc", "<f" },
             { "tracking_status", "<B" },
             { "camera_device_id", "<B" },
             }
return CAMERA_TRACKING_GEO_STATUS
