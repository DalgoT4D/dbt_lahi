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
                        source('source_lahi', 'ladakh_23_24_database'), 
                ],
        json_column = '_airbyte_data'
    )
}})


SELECT
    "Enrolment_Status_11_12_" AS "enrolment_status_11_12",
    "School_Type" AS "school_type",
    "11Boys" AS "boys_11",
    "10_Girls" AS "girls_10",
    "11_Total" AS "total_11",
    "School_Name" AS "school_name",
    "School_Category" AS "school_category",
    "Year_of_Approval_under_PM_Shri" AS "year_of_approval_under_pm_shri",
    "VT_Mobile_Number" AS "vt_mobile_number",
    "KGBV_School_Identifier" AS "kgvb_school_identifier",
    "12_Girls" AS "girls_12",
    "District" AS "district",
    "11_Girls" AS "girls_11",
    "VC_Email_Id" AS "vc_email_id",
    "VT_Name" AS "vt_name",
    "HM_Name" AS "hm_name",
    "LAB" AS "lab",
    "School_Sector_Type_Single_Double_Triple" AS "school_sector_type_single_double_triple",
    "VTP" AS "vtp",
    "PM_Shri_Identifier" AS "pm_shri_identifier",
    "Block" AS "block",
    "12_Boys" AS "boys_12",
    "VC_Phone_Number" AS "vc_phone_number",
    "Books_Class_12" AS "books_class_12",
    "Enrolment_Status_9_10_" AS "enrolment_status_9_10",
    "Books_Class_9" AS "books_class_9",
    "Grand_Total" AS "grand_total",
    "9_Boys" AS "boys_9",
    "School_Funded_Under" AS "school_funded_under",
    "Academic_Year" AS "academic_year",
    "Job_Role_For_Class_11_and_12_" AS "job_role_for_class_11_12",
    "Total_Boys" AS "total_boys",
    "VT_Gender" AS "vt_gender",
    "VT_Status" AS "vt_status",
    "HM_Phone_Number" AS "hm_phone_number",
    "Job_Role_For_Class_9_and_10_" AS "job_role_for_class_9_10",
    "Year_of_Implementation" AS "year_of_implementation",
    "VT_Email_Id" AS "vt_email_id",
    "9_Total" AS "total_9",
    "Books_Class_11" AS "books_class_11",
    "VC_Name" AS "vc_name",
    "Year_of_Approval" AS "year_of_approval",
    "School_Management" AS "school_management",
    "School_Status" AS "school_status",
    "10_Total" AS "total_10",
    "School_ID_UDI" AS "school_id_udi",
    "10_Boys" AS "boys_10",
    "12_Total" AS "total_12",
    "Hub_Spoke_Identifier" AS "hub_spoke_identifier",
    "SoE_SOAL_Identifier" AS "soe_soal_identifier",
    "HM_Email_Id_" AS "hm_email_id",
    "Books_Class_10" AS "books_class_10",
    "Division" AS "division",
    "Sector_Trade" AS "sector_trade",
    "Total_Girls" AS "total_girls",
    "9_Girls" AS "girls_9",
    "State" AS "state",
    "Year_of_Approval_under_Hub_Spoke" AS "year_of_approval_under_hub_spoke",
    "CWSN_Identifier" AS "cwsn_identifier"
FROM mycte