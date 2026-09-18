local SENSOR_AIRFLOW_ANGLES = {}
SENSOR_AIRFLOW_ANGLES.id = 8016
SENSOR_AIRFLOW_ANGLES.crc_extra = 149
SENSOR_AIRFLOW_ANGLES.fields = {
             { "timestamp", "<I8" },
             { "angleofattack", "<f" },
             { "sideslip", "<f" },
             { "angleofattack_valid", "<B" },
             { "sideslip_valid", "<B" },
             }
return SENSOR_AIRFLOW_ANGLES
