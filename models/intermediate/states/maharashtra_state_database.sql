{{ config(
  materialized='table',
   indexes=[
      {'columns': ['_airbyte_ab_id'], 'type': 'hash'}
    ]

) }}

-- Creating a CTE that flattens the JSON data from the raw_enrollment table


with mycte as (
{{
    flatten_json(
        model_names = [
                        source('source_lahi', 'maharashtra_database'), 
                ],
        json_column = '_airbyte_data'
    )
}})

SELECT 
    _airbyte_ab_id,
    NULL as "village",
    "S.No" AS "s_no",
    "VC_Email_Id" AS "vc_email_id",
    "HM_Name" AS "hm_name",
    "Block" AS "block",
    "Books_Class_9" AS "books_class_9",
    "Job_Role_For_Class_11_and_12_" AS "lahi_job_role_11_and_12",
    "Job_Role_For_Class_9_and_10_" AS "lahi_job_role_9_and_10",
    "Remarks" AS "remarks",
    "12Boys" AS "12boys",
    "HM_Email_Id_" AS "hm_email_id",
    "Sector_Trade" AS "sector_trade",
    CASE 
      WHEN "State" = 'Maharashtra' AND "Sector_Trade" = 'Apparel, Made-Ups & Home Furnishing' THEN 'Apparels, Made Ups & Home Furnishing'
      WHEN "State" = 'Maharashtra' AND "Sector_Trade" = 'IT/ITeS' THEN 'IT-ITeS'
      ELSE "Sector_Trade"
    END AS "lahi_sector_name",
    "11_Total" AS "11_total",
    "10Girls" AS "10girls",
    "School_Category" AS "school_category",
    "10Boys" AS "10boys",
    "LAB" AS "lab",
    "PO_Email_Id" AS "po_email_id",
    "VC_Phone_Number" AS "vc_phone_number",
    "9Girls" AS "9girls",
    NULL as "pincode",
    "VC_Name" AS "vc_name",
    NULL as "cluster",
    "Year_of_Approval" AS "year_of_approval",
    "School_ID_UDI" AS "school_id_udi",
    "12_Total" AS "12_total",
    NULL as "school_type_name",
    "State" AS "state",
    "11Boys" AS "11boys",
    NULL as "trade",
    NULL as "longitude",
    "VT_Mobile_Number" AS "vt_mobile_number",
    "District" AS "district",
    "VTP" AS "vtp",
    NULL as "approval_year",
    "9Boys" AS "9boys",
    "Grand_Total" AS "grand_total",
    "12Girls" AS "12girls",
    "Total_Boys" AS "total_boys",
    "HM_Phone_Number" AS "hm_phone_number",
    "VT_Email_Id" AS "vt_email_id",
    "Books_Class_11" AS "books_class_11",
    "VT_Name" AS "vt_name",
    "School_Management" AS "school_management",
    "School_Status" AS "school_status",
    "10_Total" AS "10_total",
    "School_Type" AS "school_type",
    "PO_Mob_Number" AS "po_mob_number",
    "School_Name" AS "school_name",
    "11Girls" AS "11girls",
    "PO_Name_Samagra_Shiksha_District_Coordinator_" AS "po_name",
    NULL as "school_location_name",
    NULL as "code_24070101811",
    NULL as "schoolcategory",
    NULL as "latitude",
    "Books_Class_12" AS "books_class_12",
    NULL as "udise_code",
    "VT_Status" AS "vt_status",
    "9_Total" AS "9_total",
    "School_Type_1" AS "school_type_1",
    "Gender" AS "gender",
    "Books_Class_10" AS "books_class_10",
    "Division" AS "division",
    "Total_Girls" AS "total_girls",
    NULL as "applicable_classes_10"
FROM mycte