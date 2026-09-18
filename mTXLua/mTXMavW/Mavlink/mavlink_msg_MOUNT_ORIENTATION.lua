local MOUNT_ORIENTATION = {}
MOUNT_ORIENTATION.id = 265
MOUNT_ORIENTATION.crc_extra = 26
MOUNT_ORIENTATION.fields = {
             { "time_boot_ms", "<I4" },
             { "roll", "<f" },
             { "pitch", "<f" },
             { "yaw", "<f" },
             { "yaw_absolute", "<f" },
             }
return MOUNT_ORIENTATION
