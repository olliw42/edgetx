local CAMERA_CAPTURE_STATUS = {}
CAMERA_CAPTURE_STATUS.id = 262
CAMERA_CAPTURE_STATUS.crc_extra = 12
CAMERA_CAPTURE_STATUS.fields = {
             { "time_boot_ms", "<I4" },
             { "image_interval", "<f" },
             { "recording_time_ms", "<I4" },
             { "available_capacity", "<f" },
             { "image_status", "<B" },
             { "video_status", "<B" },
             { "image_count", "<i4" },
             { "camera_device_id", "<B" },
             }
return CAMERA_CAPTURE_STATUS
