local PARAM_MAP_RC = {}
PARAM_MAP_RC.id = 50
PARAM_MAP_RC.crc_extra = 78
PARAM_MAP_RC.fields = {
             { "param_value0", "<f" },
             { "scale", "<f" },
             { "param_value_min", "<f" },
             { "param_value_max", "<f" },
             { "param_index", "<i2" },
             { "target_system", "<B" },
             { "target_component", "<B" },
             { "param_id", "<c16" },
             { "parameter_rc_channel_index", "<B" },
             }
return PARAM_MAP_RC
