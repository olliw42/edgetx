local SET_ACTUATOR_CONTROL_TARGET = {}
SET_ACTUATOR_CONTROL_TARGET.id = 139
SET_ACTUATOR_CONTROL_TARGET.crc_extra = 168
SET_ACTUATOR_CONTROL_TARGET.fields = {
             { "time_usec", "<I8" },
             { "controls", "<f", 8 },
             { "group_mlx", "<B" },
             { "target_system", "<B" },
             { "target_component", "<B" },
             }
return SET_ACTUATOR_CONTROL_TARGET
