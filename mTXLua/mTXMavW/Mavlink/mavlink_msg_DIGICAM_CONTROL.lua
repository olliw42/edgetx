local DIGICAM_CONTROL = {}
DIGICAM_CONTROL.id = 155
DIGICAM_CONTROL.crc_extra = 22
DIGICAM_CONTROL.fields = {
             { "extra_value", "<f" },
             { "target_system", "<B" },
             { "target_component", "<B" },
             { "session", "<B" },
             { "zoom_pos", "<B" },
             { "zoom_step", "<b" },
             { "focus_lock", "<B" },
             { "shot", "<B" },
             { "command_id", "<B" },
             { "extra_param", "<B" },
             }
return DIGICAM_CONTROL
