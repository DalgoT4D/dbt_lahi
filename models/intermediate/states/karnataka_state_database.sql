{{ config(
  materialized='table'
) }}

with mycte as (
{{
    flatten_json(
        model_names = [
                        source('source_lahi', 'karnataka_database'), 
                ],
        json_column = '_airbyte_data'
)
}})


SELECT 
    _airbyte_ab_id,
    '2022-23' as academic_year,
    NULL as village,
    NULL as s_no,
    "VC_Email_ID" as vc_email_id,
    "HM_Name" as hm_name,
    "Block" as block,
    "Books_Class_9" as books_class_9,
    "Jobrole_11_12" as state_job_role_11_and_12,
    CASE 
        WHEN "Jobrole_11_12" = 'Assistant Beauty Tharapist' THEN 'Assistant Beauty Therapist'
        WHEN "Jobrole_11_12" = 'Domesstic Data Entry Operator' THEN 'Domestic Data Entry Operator'
        WHEN "Jobrole_11_12" = 'Retail Store Ops Assistant' THEN 'Store Operations Assistant'
        ELSE "Jobrole_11_12"
    END AS lahi_job_role_11_and_12,
    "Jobrole_9_10" as state_job_role_9_and_10,
    CASE 
        WHEN "Jobrole_9_10" = 'Assistant Beauty Tharapist' THEN 'Assistant Beauty Therapist'
        WHEN "Jobrole_9_10" = 'Domesstic Data Entry Operator' THEN 'Domestic Data Entry Operator'
        WHEN "Jobrole_9_10" = 'Retail Store Ops Assistant' THEN 'Store Operations Assistant'
        ELSE "Jobrole_9_10"
    END AS lahi_job_role_9_and_10,
    NULL as remarks,
    "Class12_B" as boys_12,
    "HM_Email_ID" as hm_email_id,
    "Sector" as sector_trade,
    "_11_total" as "11_total",
    "Class10_G" as girls_10,
    "School_Category",
    "Class10_B" as boys_10,
    "Lab",
    NULL as po_email_id,
    "Vc_Phone_Number" as "vc_phone_number",
    "Class9_G" as girls_9,
    NULL as pincode,
    NULL as vc_name,
    NULL as cluster,
    "Year_of_Approval",
    "Udise" as school_id_udi,
    "_12_total",
    NULL as school_type_name,
    "State" as state,
    "Class11_B" as boys_11,
    NULL as trade,
    NULL as longitude,
    "VT_Mobile_Number",
    "District" as district,
    "VTP",
    "Year_of_Approval" as approval_year,
    "Class9_B" as boys_9,
    "Grand_Total",
    "Class12_G" as girls_12,
    "Total_Boys",
    "HM_Phone_Number",
    "VT_Email_ID",
    "Books_Class_11" as books_class_11,
    "VT_Name",
    "School_Management",
    "School_Status",
    "_10_total" as "10_total",
    "School_Type",
    NULL as po_mob_number,
    "School_Name",
    "Class11_G" as girls_11,
    NULL as po_name,
    NULL as school_location_name,
    NULL as code_24070101811,
    NULL as schoolcategory,
    NULL as latitude,
    "Books_Class_12" as books_class_12,
    NULL as udise_code,
    "VT_Status",
    "Total_Class_9" as "9_total",
    NULL as school_type_1,
    "Gender",
    "Books_Class_10" as books_class_10,
    "Division" as division,
    "Total_Girls",
    NULL as applicable_classes_10
FROM mycte
