local SENS_POWER_BOARD = {}
SENS_POWER_BOARD.id = 8013
SENS_POWER_BOARD.crc_extra = 222
SENS_POWER_BOARD.fields = {
             { "timestamp", "<I8" },
             { "pwr_brd_system_volt", "<f" },
             { "pwr_brd_servo_volt", "<f" },
             { "pwr_brd_digital_volt", "<f" },
             { "pwr_brd_mot_l_amp", "<f" },
             { "pwr_brd_mot_r_amp", "<f" },
             { "pwr_brd_analog_amp", "<f" },
             { "pwr_brd_digital_amp", "<f" },
             { "pwr_brd_ext_amp", "<f" },
             { "pwr_brd_aux_amp", "<f" },
             { "pwr_brd_status", "<B" },
             { "pwr_brd_led_status", "<B" },
             }
return SENS_POWER_BOARD
