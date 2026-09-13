local COMPONENT_INFORMATION_BASIC = {}
COMPONENT_INFORMATION_BASIC.id = 396
COMPONENT_INFORMATION_BASIC.crc_extra = 50
COMPONENT_INFORMATION_BASIC.fields = {
             { "capabilities", "<I8" },
             { "time_boot_ms", "<I4" },
             { "time_manufacture_s", "<I4" },
             { "vendor_name", "<c32" },
             { "model_name", "<c32" },
             { "software_version", "<c24" },
             { "hardware_version", "<c24" },
             { "serial_number", "<c32" },
             }
return COMPONENT_INFORMATION_BASIC
