local CAMERA_FOV_STATUS = {}
CAMERA_FOV_STATUS.id = 271
CAMERA_FOV_STATUS.crc_extra = 22
CAMERA_FOV_STATUS.fields = {
             { "time_boot_ms", "<I4" },
             { "lat_camera", "<i4" },
             { "lon_camera", "<i4" },
             { "alt_camera", "<i4" },
             { "lat_image", "<i4" },
             { "lon_image", "<i4" },
             { "alt_image", "<i4" },
             { "q", "<f", 4 },
             { "hfov", "<f" },
             { "vfov", "<f" },
             { "camera_device_id", "<B" },
             }
return CAMERA_FOV_STATUS
