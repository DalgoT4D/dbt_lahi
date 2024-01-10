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
                        source('source_lahi', 'andhra_pradesh_database'), 
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
    "HM_Name" as "hm_name",
    "Block" as "block",
    "Books_Class_9" as "books_class_9",
    "Job_Role_For_Class_11_and_12_" as "state_job_role_11_and_12",
    CASE 
        WHEN "Job_Role_For_Class_11_and_12_" = 'Domesstic Data Entry Operator' THEN 'Domestic Data Entry Operator'
        ELSE "Job_Role_For_Class_11_and_12_"
    END AS "lahi_job_role_11_and_12",
    "Job_Role_For_Class_9_and_10_" as "state_job_role_9_and_10",
    CASE 
        WHEN "Job_Role_For_Class_9_and_10_" = 'Domesstic Data Entry Operator' THEN 'Domestic Data Entry Operator'
        ELSE "Job_Role_For_Class_9_and_10_"
    END AS "lahi_job_role_9_and_10",
    NULL as "remarks",
    "12Boys" as "boys_12",
    "HM_Email_Id_" as "hm_email_id",
    "Sector_Trade" as "sector_trade",
    "11_Total" as "11_total",
    "10Girls" as "girls_10",
    "School_Category" as "school_category",
    "10Boys" as "boys_10",
    "LAB" as "lab",
    NULL as "po_email_id",
    "VC_Phone_Number" as "vc_phone_number",
    "9Girls" as "girls_9",
    NULL as "pincode",
    "VC_Name" as "vc_name",
    NULL as "cluster",
    "Year_of_Approval" as "year_of_approval",
    "School_ID_UDI" as "school_id_udi",
    "12_Total" as "12_total",
    NULL as "school_type_name",
    "State" as "state",
    "11Boys" as "boys_11",
    NULL as "trade",
    NULL as "longitude",
    "VT_Mobile_Number" as "vt_mobile_number",
    "District" as "district",
    "VTP" as "vtp",
    NULL as "approval_year",
    "9Boys" as "boys_9",
    "Grand_Total" as "grand_total",
    "12Girls" as "girls_12",
    "Total_Boys" as "total_boys",
    "HM_Phone_Number" as "hm_phone_number",
    "VT_Email_Id" as "vt_email_id",
    "Books_Class_11" as "books_class_11",
    "VT_Name_" as "vt_name",
    "School_Management" as "school_management",
    "School_Status" as "school_status",
    "10_Total" as "10_total",
    "School_Type" as "school_type",
    NULL as "po_mob_number",
    "School_Name" as "school_name",
    "11Girls" as "girls_11",
    NULL as "po_name",
    NULL as "school_location_name",
    NULL as "code_24070101811",
    NULL as "schoolcategory",
    NULL as "latitude",
    "Books_Class_12" as "books_class_12",
    NULL as "udise_code",
    "VT_Status" as "vt_status",
    NULL as "applicable_classes_12",
    "9_Total" as "9_total",
    NULL as "school_type_1",
    "Gender" as "gender",
    "Books_Class_10" as "books_class_10",
    "Division" as "division",
    "Total_Girls" as "total_girls",
    NULL as "applicable_classes_10"
FROM mycte