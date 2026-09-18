local ASLUAV_STATUS = {}
ASLUAV_STATUS.id = 8006
ASLUAV_STATUS.crc_extra = 97
ASLUAV_STATUS.fields = {
             { "Motor_rpm", "<f" },
             { "LED_status", "<B" },
             { "SATCOM_status", "<B" },
             { "Servo_status", "<B", 8 },
             }
return ASLUAV_STATUS
