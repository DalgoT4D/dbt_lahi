{{ config(
  materialized='table',
   indexes=[
      {'columns': ['_airbyte_ab_id'], 'type': 'hash'}
    ]

) }}


with mycte as (
{{
    flatten_json(
        model_names = [
                        source('source_lahi', 'tamil_nadu_database'), 
                ],
        json_column = '_airbyte_data'
    )
}})


SELECT 
    _airbyte_ab_id,
    '2022-23' as "academic_year",
    NULL as "village",
    NULL as "s_no",
    "VC_Email_Id" as "vc_email_id",
    NULL as "hm_name",
    "Block" as "block",
    "Books_Class_9" as "books_class_9",
    "Job_Role_For_Class_11_" as "state_job_role_11",
    "Job_Role_For_Class_12_" as "state_job_role_12",
    "Job_Role_For_Class_9_and_10_" as "state_job_role_9_and_10",
    NULL as "remarks",
    NULL as "12boys",
    NULL as "hm_email_id",
    "Sector_Trade" as "sector_trade",
    "11_Total" as "11_total",
    NULL as "10girls",
    "School_Category" as "school_category",
    NULL as "10boys",
    "LAB" as "lab",
    NULL as "po_email_id",
    "VC_Phone_Number" as "vc_phone_number",
    NULL as "9girls",
    NULL as "pincode",
    "VC_Name" as "vc_name",
    NULL as "cluster",
    "Year_of_Approval" as "year_of_approval",
    "School_ID_UDI" as "school_id_udi",
    NULL as "12_total",
    "School_Type" as "school_type_name",
    "State" as "state",
    NULL as "11boys",
    NULL as "trade",
    NULL as "longitude",
    "VT_Mobile_Number" as "vt_mobile_number",
    "District" as "district",
    "VTP" as "vtp",
    NULL as "approval_year",
    NULL as "9boys",
    "Grand_Total" as "grand_total",
    NULL as "12girls",
    NULL as "total_boys",
    NULL as "hm_phone_number",
    "VT_Email_Id" as "vt_email_id",
    "Books_Class_11" as "books_class_11",
    "VT_Name" as "vt_name",
    "School_Management" as "school_management",
    "School_Status" as "school_status",
    NULL as "10_total",
    "School_Type" as "school_type",
    NULL as "po_mob_number",
    "School_Name" as "school_name",
    NULL as "11girls",
    NULL as "po_name",
    NULL as "school_location_name",
    NULL as "code_24070101811",
    NULL as "schoolcategory",
    NULL as "latitude",
    "Books_Class_12" as "books_class_12",
    NULL as "udise_code",
    "VT_Status" as "vt_status",
    NULL as "9_total",
    NULL as "school_type_1",
    "Gender" as "gender",
    "Books_Class_10" as "books_class_10",
    "Division" as "division",
    NULL as "total_girls",
    NULL as "applicable_classes_10"
FROM mycte