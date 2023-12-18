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
                        source('source_lahi', 'karnataka_23_24_database'), 
                ],
        json_column = '_airbyte_data'
    )
}})


SELECT
    "Enrolment_Status_11_12_" AS enrolment_status_11_12,
    "Total_Girls_9_to_12" AS total_girls_9_to_12,
    "HM_Name" AS hm_name,
    "Block" AS block,
    "School_Funded_Under" AS school_funded_under,
    "Job_Role_For_Class_9_and_10_" AS job_role_for_class_9_10,
    "12Boys" AS boys_12,
    "Sector_Trade" AS sector_trade,
    "HM_Email_Id" AS hm_email_id,
    "11_Total" AS total_11,
    "10Girls" AS girls_10,
    "School_Category" AS school_category,
    "10Boys" AS boys_10,
    "9Girls" AS girls_9,
    "Year_of_Approval" AS year_of_approval,
    "School_ID_UDI" AS school_id_udi,
    "12_Total" AS total_12,
    "State" AS state,
    "Job_Role_For_Class_11_and_12_" AS job_role_for_class_11_12,
    "11Boys" AS boys_11,
    "Grand_Total_9_to_12" AS grand_total_9_to_12,
    "District" AS district,
    "9Boys" AS boys_9,
    "12Girls" AS girls_12,
    "Academic_Year" AS academic_year,
    "HM_Phone_Number" AS hm_phone_number,
    "Total_Boys_9_to_12" AS total_boys_9_to_12,
    "Year_of_Implementation" AS year_of_implementation,
    "School_Management" AS school_management,
    "School_Status" AS school_status,
    "10_Total" AS total_10,
    "School_Type" AS school_type,
    "School_Name" AS school_name,
    "11Girls" AS girls_11,
    "Enrolment_Status_9_10_" AS enrolment_status_9_10,
    "VT_Status" AS vt_status,
    "School_Sector_Type_Single_Double_Triple" AS school_sector_type_single_double_triple,
    "9_Total" AS total_9,
    "Division" AS division
FROM dev_intermediate_states.karnataka_23_24_database