local GIMBAL_CONTROL = {}
GIMBAL_CONTROL.id = 201
GIMBAL_CONTROL.crc_extra = 205
GIMBAL_CONTROL.fields = {
             { "demanded_rate_x", "<f" },
             { "demanded_rate_y", "<f" },
             { "demanded_rate_z", "<f" },
             { "target_system", "<B" },
             { "target_component", "<B" },
             }
return GIMBAL_CONTROL
