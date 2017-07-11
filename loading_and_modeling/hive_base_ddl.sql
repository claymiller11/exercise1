DROP TABLE effective_care;
CREATE EXTERNAL TABLE effective_care (provider_id string, hospital_name string, address string, city string, state string, zip string, county string, phone_number string, condition string, measure_id string, measure_name string, score int, sample int, footnote string, measure_start_date date, measure_end_date date)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES (
 "separatorChar" = ",",
"quoteChar" ='"',
"escapeChar" = '\\'
)
STORED AS TEXTFILE
LOCATION '/user/w205/hospital_compare/effective_care';

DROP TABLE hospitals;
CREATE EXTERNAL TABLE hospitals (provider_id string, hospital_name string, address string, city string, state string, zip string, county string, phone_number string, hospital_type string, hospital_ownership string, emergency_services string)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES (
"separatorChar" = ",",
"quoteChar" = '"',
"escapeChar" = "\\"
)
STORED AS TEXTFILE
LOCATION '/user/w205/hospital_compare/hospitals';

DROP TABLE measures;
CREATE EXTERNAL TABLE measures (measure_name string, measure_id string, measure_start_qtr string, measure_start_date date, measure_end_qtr string, measure_end_date date)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES (
"separatorChar" = ",",
"quoteChar" = '"',
"escapeChar" = "\\"
)
STORED AS TEXTFILE
LOCATION '/user/w205/hospital_compare/measures';

DROP TABLE readmissions;
CREATE EXTERNAL TABLE readmissions (provider_id string, hospital_name string, address string, city string, state string, zip string, county string, phone_number string, measure_name string, measure_id string, compare_national string, denominator int, score float, lower_est float, higher_est float, footnote string, measure_start_date date, measure_end_date date)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES (
"separatorChar" = ",",
"quoteChar" = '"',
"escapeChar" = "\\"
)
STORED AS TEXTFILE
LOCATION '/user/w205/hospital_compare/readmissions';

DROP TABLE responses;
CREATE EXTERNAL TABLE responses (provider_id string, hospital_name string, address string, city string, state string, zip string, county string, comm_nurses_achv string, comm_nurses_imprv string, comm_nurses_dim string, comm_drs_achv string, comm_drs_imprv string, comm_drs_dim string, resp_staff_achv string, resp_staff_imprv string, resp_staff_dim string, pain_mgmt_achv string, pain_mgmt_imprv string, pain_mgmt_dim string, comm_meds_achv string, comm_meds_imprv string, comm_meds_dim string, clean_quiet_achv string, clean_quiet_imprv string, clean_quiet_dim string, discharge_info_achv string, discharge_info_imprv string, discharge_info_dim string, overall_achv string, overall_imprv string, overall_dim string, hcahp_case_score int, hcahps_consistency_score int)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES (
"separatorChar" = ",",
"quoteChar" = '"',
"escapeChar" = "\\"
)
STORED AS TEXTFILE
LOCATION '/user/w205/hospital_compare/survey_responses';
 
