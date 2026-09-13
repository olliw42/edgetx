local GNSS_INTEGRITY = {}
GNSS_INTEGRITY.id = 441
GNSS_INTEGRITY.crc_extra = 169
GNSS_INTEGRITY.fields = {
             { "system_errors", "<I4" },
             { "raim_hfom", "<I2" },
             { "raim_vfom", "<I2" },
             { "id", "<B" },
             { "authentication_state", "<B" },
             { "jamming_state", "<B" },
             { "spoofing_state", "<B" },
             { "raim_state", "<B" },
             { "corrections_quality", "<B" },
             { "system_status_summary", "<B" },
             { "gnss_signal_quality", "<B" },
             { "post_processing_quality", "<B" },
             }
return GNSS_INTEGRITY
