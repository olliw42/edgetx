local ACTUATOR_CONTROL_TARGET = {}
ACTUATOR_CONTROL_TARGET.id = 140
ACTUATOR_CONTROL_TARGET.crc_extra = 181
ACTUATOR_CONTROL_TARGET.fields = {
             { "time_usec", "<I8" },
             { "controls", "<f", 8 },
             { "group_mlx", "<B" },
             }
return ACTUATOR_CONTROL_TARGET
