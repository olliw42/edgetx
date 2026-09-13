local GPS2_RTK = {}
GPS2_RTK.id = 128
GPS2_RTK.crc_extra = 226
GPS2_RTK.fields = {
             { "time_last_baseline_ms", "<I4" },
             { "tow", "<I4" },
             { "baseline_a_mm", "<i4" },
             { "baseline_b_mm", "<i4" },
             { "baseline_c_mm", "<i4" },
             { "accuracy", "<I4" },
             { "iar_num_hypotheses", "<i4" },
             { "wn", "<I2" },
             { "rtk_receiver_id", "<B" },
             { "rtk_health", "<B" },
             { "rtk_rate", "<B" },
             { "nsats", "<B" },
             { "baseline_coords_type", "<B" },
             }
return GPS2_RTK
