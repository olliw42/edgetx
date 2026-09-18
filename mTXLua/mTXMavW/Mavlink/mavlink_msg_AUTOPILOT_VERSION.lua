local AUTOPILOT_VERSION = {}
AUTOPILOT_VERSION.id = 148
AUTOPILOT_VERSION.crc_extra = 178
AUTOPILOT_VERSION.fields = {
             { "capabilities", "<I8" },
             { "uid", "<I8" },
             { "flight_sw_version", "<I4" },
             { "middleware_sw_version", "<I4" },
             { "os_sw_version", "<I4" },
             { "board_version", "<I4" },
             { "vendor_id", "<I2" },
             { "product_id", "<I2" },
             { "flight_custom_version", "<B", 8 },
             { "middleware_custom_version", "<B", 8 },
             { "os_custom_version", "<B", 8 },
             { "uid2", "<B", 18 },
             }
return AUTOPILOT_VERSION
