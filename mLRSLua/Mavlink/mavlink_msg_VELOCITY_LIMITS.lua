local VELOCITY_LIMITS = {}
VELOCITY_LIMITS.id = 355
VELOCITY_LIMITS.crc_extra = 6
VELOCITY_LIMITS.fields = {
             { "horizontal_speed_limit", "<f" },
             { "vertical_speed_limit", "<f" },
             { "yaw_rate_limit", "<f" },
             }
return VELOCITY_LIMITS
