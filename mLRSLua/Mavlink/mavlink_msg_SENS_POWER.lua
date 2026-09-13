local SENS_POWER = {}
SENS_POWER.id = 8002
SENS_POWER.crc_extra = 218
SENS_POWER.fields = {
             { "adc121_vspb_volt", "<f" },
             { "adc121_cspb_amp", "<f" },
             { "adc121_cs1_amp", "<f" },
             { "adc121_cs2_amp", "<f" },
             }
return SENS_POWER
