local NAV_CONTROLLER_OUTPUT = {}
NAV_CONTROLLER_OUTPUT.id = 62
NAV_CONTROLLER_OUTPUT.crc_extra = 183
NAV_CONTROLLER_OUTPUT.fields = {
             { "nav_roll", "<f" },
             { "nav_pitch", "<f" },
             { "alt_error", "<f" },
             { "aspd_error", "<f" },
             { "xtrack_error", "<f" },
             { "nav_bearing", "<i2" },
             { "target_bearing", "<i2" },
             { "wp_dist", "<I2" },
             }
return NAV_CONTROLLER_OUTPUT
