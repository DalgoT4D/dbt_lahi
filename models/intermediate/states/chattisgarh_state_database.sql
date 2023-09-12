{{ config(
  materialized='table',
   indexes=[
      {'columns': ['_airbyte_ab_id'], 'type': 'hash'}
    ],
    schema='intermediate'

) }}

-- Creating a CTE that flattens the JSON data from the raw_enrollment table

with mycte as (
{{
    flatten_json(
        model_names = [
                        source('source_lahi', 'chattisgarh_database'), 
                ],
        json_column = '_airbyte_data'
    )
}})

SELECT 
    _airbyte_ab_id,
    NULL as "village",
    NULL as "s_no",
    "VC_Email" as "vc_email_id",
    "HM_Name" as "hm_name",
    "Block" as "block",
    "Books_Class_9" as "books_class_9",
    "Job_Role_For_Class_11_and_12_" as "job_role_for_class_11_and_12",
    NULL as "remarks",
    "12Boys" as "12boys",
    "HM_Email_Id_" as "hm_email_id",
    "Sector_Trade" as "sector_trade",
    "11_Total" as "11_total",
    "10Girls" as "10girls",
    "Applicable_Classes_09" as "Applicable_Classes_09",
    "10Boys" as "10boys",
    "LAB" as "lab",
    NULL as "po_email_id",
    "VC_Contact_details" as "vc_phone_number",
    NULL as "9girls",
    NULL as "pincode",
    "VC_Name" as "vc_name",
    NULL as "cluster",
    "Year_of_Approval" as "year_of_approval",
    "School_ID_UDI" as "school_id_udi",
    "12_Total" as "12_total",
    NULL as "school_type_name",
    "State" as "state",
    "11Boys" as "11boys",
    NULL as "trade",
    NULL as "longitude",
    "Applicable_Classes_11" as "vt_mobile_number",
    "District" as "district",
    "VTP" as "vtp",
    NULL as "approval_year",
    "9Boys" as "9boys",
    "Grand_Total" as "grand_total",
    "12Girls" as "12girls",
    "Total_Boys" as "total_boys",
    "HM_Phone_Number" as "hm_phone_number",
    "Job_Role_For_Class_9_and_10_" as "job_role_for_class_9_and_10_",
    NULL as "vt_email_id",
    "Books_Class_11" as "books_class_11",
    "School_Management" as "school_management",
    "School_Status" as "school_status",
    "10_Total" as "10_total",
    "School_Type" as "school_type",
    NULL as "po_mob_number",
    "School_Name" as "school_name",
    "11Girls" as "11girls",
    NULL as "po_name",
    NULL as "school_location_name",
    NULL as "code_24070101811",
    NULL as "schoolcategory",
    NULL as "latitude",
    "Books_Class_12" as "books_class_12",
    NULL as "udise_code",
    "VT_Status" as "vt_status",
    "Applicable_Classes_12" as "applicable_classes_12",
    "9_Total" as "9_total",
    NULL as "school_type_1",
    "Gender" as "gender",
    "Books_Class_10" as "books_class_10",
    "Division" as "division",
    "Total_Girls" as "total_girls",
    "Applicable_Classes_10" as "applicable_classes_10"
FROM mycte
