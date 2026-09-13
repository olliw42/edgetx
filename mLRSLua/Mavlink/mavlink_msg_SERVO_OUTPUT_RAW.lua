local SERVO_OUTPUT_RAW = {}
SERVO_OUTPUT_RAW.id = 36
SERVO_OUTPUT_RAW.crc_extra = 222
SERVO_OUTPUT_RAW.fields = {
             { "time_usec", "<I4" },
             { "servo1_raw", "<I2" },
             { "servo2_raw", "<I2" },
             { "servo3_raw", "<I2" },
             { "servo4_raw", "<I2" },
             { "servo5_raw", "<I2" },
             { "servo6_raw", "<I2" },
             { "servo7_raw", "<I2" },
             { "servo8_raw", "<I2" },
             { "port", "<B" },
             { "servo9_raw", "<I2" },
             { "servo10_raw", "<I2" },
             { "servo11_raw", "<I2" },
             { "servo12_raw", "<I2" },
             { "servo13_raw", "<I2" },
             { "servo14_raw", "<I2" },
             { "servo15_raw", "<I2" },
             { "servo16_raw", "<I2" },
             }
return SERVO_OUTPUT_RAW
