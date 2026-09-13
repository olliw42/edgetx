local CAMERA_SETTINGS = {}
CAMERA_SETTINGS.id = 260
CAMERA_SETTINGS.crc_extra = 146
CAMERA_SETTINGS.fields = {
             { "time_boot_ms", "<I4" },
             { "mode_id", "<B" },
             { "zoomLevel", "<f" },
             { "focusLevel", "<f" },
             { "camera_device_id", "<B" },
             }
return CAMERA_SETTINGS
