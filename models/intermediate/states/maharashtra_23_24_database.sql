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
                        source('source_lahi', 'maharashtra_23_24_database'), 
                ],
        json_column = '_airbyte_data'
    )
}})


SELECT
    "_airbyte_ab_id" AS "airbyte_ab_id",
    "Year_of_Approval_under_SHI" AS "year_of_approval_under_shi",
    "VC_Email_Id" AS "vc_email_id",
    "HM_Name" AS "hm_name",
    "Block" AS "block",
    "SHI_Identifier" AS "shi_identifier",
    "School_Funded_Under" AS "school_funded_under",
    "12Boys" AS "boys_12",
    "Hub_Spoke_Identifier" AS "hub_spoke_identifier",
    "Sector_Trade" AS "sector_trade",
    "HM_Email_Id" AS "hm_email_id",
    "11_Total" AS "total_11",
    "10Girls" AS "girls_10",
    "School_Category" AS "school_category",
    "VT_Name" AS "vt_name",
    "10Boys" AS "boys_10",
    "LAB" AS "lab",
    "PM_Shri_Identifier" AS "pm_shri_identifier",
    "VC_Phone_Number" AS "vc_phone_number",
    "9Girls" AS "girls_9",
    "VC_Name" AS "vc_name",
    "Year_of_Approval" AS "year_of_approval",
    "School_ID_UDI" AS "school_id_udi",
    "12_Total" AS "total_12",
    "State" AS "state",
    "CWSN_Identifier" AS "cwsn_identifier",
    "11Boys" AS "boys_11",
    "VT_Mobile_Number" AS "vt_mobile_number",
    "KGBV_School_Identifier" AS "kgvb_school_identifier",
    "District" AS "district",
    "VTP" AS "vtp",
    "9Boys" AS "boys_9",
    "Grand_Total" AS "grand_total",
    "12Girls" AS "girls_12",
    "Academic_Year" AS "academic_year",
    "Total_Boys" AS "total_boys",
    "HM_Phone_Number" AS "hm_phone_number",
    "Job_Role_9&10" AS "lahi_job_role_9_and_10",
    "Year_of_Implementation" AS "year_of_implementation",
    "VT_Email_Id" AS "vt_email_id",
    "School_Management" AS "school_management",
    "School_Status" AS "school_status",
    "10_Total" AS "total_10",
    "SoE_SOAL_Identifier" AS "soe_soal_identifier",
    "School_Type" AS "school_type",
    "School_Name" AS "school_name",
    "11Girls" AS "girls_11",
    "Year_of_Approval_under_PM_Shri" AS "year_of_approval_under_pm_shri",
    "Job_Role_11&12" AS "lahi_job_role_11_and_12",
--     "School_Sector_Type
-- _
-- _Single_Double_Triple" AS "school_sector_type_single_double_triple",
    "VT_Gender" AS "vt_gender",
    "VT_Status" AS "vt_status",
    "9_Total" AS "total_9",
    "Division" AS "division",
    "Total_Girls" AS "total_girls",
    "Year_of_Approval_under_Hub_Spoke" AS "year_of_approval_under_hub_spoke"
FROM mycte
