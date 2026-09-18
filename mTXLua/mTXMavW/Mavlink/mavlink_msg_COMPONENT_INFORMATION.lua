local COMPONENT_INFORMATION = {}
COMPONENT_INFORMATION.id = 395
COMPONENT_INFORMATION.crc_extra = 0
COMPONENT_INFORMATION.fields = {
             { "time_boot_ms", "<I4" },
             { "general_metadata_file_crc", "<I4" },
             { "peripherals_metadata_file_crc", "<I4" },
             { "general_metadata_uri", "<c100" },
             { "peripherals_metadata_uri", "<c100" },
             }
return COMPONENT_INFORMATION
