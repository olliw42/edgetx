local SENS_MPPT = {}
SENS_MPPT.id = 8003
SENS_MPPT.crc_extra = 231
SENS_MPPT.fields = {
             { "mppt_timestamp", "<I8" },
             { "mppt1_volt", "<f" },
             { "mppt1_amp", "<f" },
             { "mppt2_volt", "<f" },
             { "mppt2_amp", "<f" },
             { "mppt3_volt", "<f" },
             { "mppt3_amp", "<f" },
             { "mppt1_pwm", "<I2" },
             { "mppt2_pwm", "<I2" },
             { "mppt3_pwm", "<I2" },
             { "mppt1_status", "<B" },
             { "mppt2_status", "<B" },
             { "mppt3_status", "<B" },
             }
return SENS_MPPT
