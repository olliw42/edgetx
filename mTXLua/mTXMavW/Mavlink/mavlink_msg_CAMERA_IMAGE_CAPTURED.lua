local CAMERA_IMAGE_CAPTURED = {}
CAMERA_IMAGE_CAPTURED.id = 263
CAMERA_IMAGE_CAPTURED.crc_extra = 133
CAMERA_IMAGE_CAPTURED.fields = {
             { "time_utc", "<I8" },
             { "time_boot_ms", "<I4" },
             { "lat", "<i4" },
             { "lon", "<i4" },
             { "alt", "<i4" },
             { "relative_alt", "<i4" },
             { "q", "<f", 4 },
             { "image_index", "<i4" },
             { "camera_id", "<B" },
             { "capture_result", "<b" },
             { "file_url", "<c205" },
             }
return CAMERA_IMAGE_CAPTURED
