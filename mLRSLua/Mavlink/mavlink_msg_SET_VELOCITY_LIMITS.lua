local SET_VELOCITY_LIMITS = {}
SET_VELOCITY_LIMITS.id = 354
SET_VELOCITY_LIMITS.crc_extra = 210
SET_VELOCITY_LIMITS.fields = {
             { "horizontal_speed_limit", "<f" },
             { "vertical_speed_limit", "<f" },
             { "yaw_rate_limit", "<f" },
             { "target_system", "<B" },
             { "target_component", "<B" },
             }
return SET_VELOCITY_LIMITS
