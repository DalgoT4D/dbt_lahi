--DBT AUTOMATION has generated this model, please DO NOT EDIT 
--Please make sure you dont change the model name 


{{ 
  config(
    materialized='table'
  ) 
}}


with mycte as (
{{
    flatten_json(
        model_names = [
                        source('source_lahi', 'assam_23_24_database'), 
                ],
        json_column = '_airbyte_data'
    )
}})

    SELECT 
    "VC_Email_Id" AS vc_email_id,
    "HM_Name" AS hm_name,
    "Block" AS block,
    "School_Funded_Under" AS school_funded_under,
    "Job_Role_For_Class_11_and_12_" AS job_role_11_12,
    "12Boys" AS boys_12,
    "HM_Email_Id_" AS hm_email_id,
    "Sector_Trade" AS sector_trade,
    "11_Total" AS total_11,
    "10Girls" AS girls_10,
    "VT_Name" AS vt_name,
    "10Boys" AS boys_10,
    "VC_Phone_Number" AS vc_phone_number,
    "9Girls" AS girls_9,
    "VC_Name" AS vc_name,
    "Year_of_Approval" AS year_of_approval,
    "School_ID_UDI" AS school_id_udi,
    "12_Total" AS total_12,
    "State" AS state,
    "11Boys" AS boys_11,
    "VT_Mobile_Number" AS vt_mobile_number,
    "District" AS district,
    "VTP" AS vtp,
    "9Boys" AS boys_9,
    "12Girls" AS girls_12,
    "Academic_Year" AS academic_year,
    "HM_Phone_Number" AS hm_phone_number,
    "Job_Role_For_Class_9_and_10_" AS job_role_9_10,
    "VT_Email_Id" AS vt_email_id,
    "School_Management" AS school_management,
    "10_Total" AS total_10,
    "Grand_Total_9_to_12" AS grand_total_9_to_12,
    "School_Name" AS school_name,
    "11Girls" AS girls_11,
    "Total_Girls_9_to_12" AS total_girls_9_to_12,
    "Total_Boys_9_to_12" AS total_boys_9_to_12,
    "9_Total" AS total_9,
    "Division" AS division
FROM mycte