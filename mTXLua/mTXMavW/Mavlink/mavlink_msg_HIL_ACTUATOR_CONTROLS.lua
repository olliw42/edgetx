local HIL_ACTUATOR_CONTROLS = {}
HIL_ACTUATOR_CONTROLS.id = 93
HIL_ACTUATOR_CONTROLS.crc_extra = 47
HIL_ACTUATOR_CONTROLS.fields = {
             { "time_usec", "<I8" },
             { "flags", "<I8" },
             { "controls", "<f", 16 },
             { "mode", "<B" },
             }
return HIL_ACTUATOR_CONTROLS
