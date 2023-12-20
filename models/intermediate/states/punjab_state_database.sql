{{ config(
  materialized='table'
) }}


with mycte as (
{{
    flatten_json(
        model_names = [
                        source('source_lahi', 'punjab_database'), 
                ],
        json_column = '_airbyte_data'
    )
}})

SELECT
    "VC_Email_Id" AS "vc_email_id",
    "HM_Name" AS "hm_name",
    "Block" AS "block",
    "Books_Class_9" AS "books_class_9",
    "Job_Role_For_Class_11_and_12_" AS "lahi_job_role_11_and_12",
    "12Boys" AS "boys_12",
    "HM_Email_Id_" AS "hm_email_id",
    "Sector_Trade" AS "sector_trade",
    "11_Total" AS "total_11",
    "10Girls" AS "girls_10",
    "School_Category" AS "school_category",
    "VT_Name" AS "vt_name",
    "10Boys" AS "boys_10",
    "LAB" AS "lab",
    "VC_Phone_Number" AS "vc_phone_number",
    "9Girls" AS "girls_9",
    "VC_Name" AS "vc_name",
    "Year_of_Approval" AS "year_of_approval",
    "School_ID_UDI" AS "school_id_udi",
    "12_Total" AS "total_12",
    "State" AS "state",
    "11Boys" AS "boys_11",
    "VT_Mobile_Number" AS "vt_mobile_number",
    "District" AS "district",
    "VTP" AS "vtp",
    "9Boys" AS "boys_9",
    "Grand_Total" AS "grand_total",
    "12Girls" AS "girls_12",
    "Academic_Year" AS "academic_year",
    "Total_Boys" AS "total_boys",
    "HM_Phone_Number" AS "hm_phone_number",
    "Job_Role_For_Class_9_and_10_" AS "lahi_job_role_9_and_10",
    "VT_Email_Id" AS "vt_email_id",
    "Books_Class_11" AS "books_class_11",
    "School_Management" AS "school_management",
    "School_Status" AS "school_status",
    "10_Total" AS "total_10",
    "School_Type" AS "school_type",
    "School_Name" AS "school_name",
    "11Girls" AS "girls_11",
    "VT_Status" AS "vt_status",
    "9_Total" AS "total_9",
    "Gender" AS "gender",
    "Books_Class_10" AS "books_class_10",
    "Division" AS "division",
    "Total_Girls" AS "total_girls"
FROM mycte
