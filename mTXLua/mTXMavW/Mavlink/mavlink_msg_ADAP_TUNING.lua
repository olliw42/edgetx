local ADAP_TUNING = {}
ADAP_TUNING.id = 11010
ADAP_TUNING.crc_extra = 46
ADAP_TUNING.fields = {
             { "desired", "<f" },
             { "achieved", "<f" },
             { "error", "<f" },
             { "theta", "<f" },
             { "omega", "<f" },
             { "sigma", "<f" },
             { "theta_dot", "<f" },
             { "omega_dot", "<f" },
             { "sigma_dot", "<f" },
             { "f", "<f" },
             { "f_dot", "<f" },
             { "u", "<f" },
             { "axis", "<B" },
             }
return ADAP_TUNING
