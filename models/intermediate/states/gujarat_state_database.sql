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
                        source('source_lahi', 'gujarat_database'), 
                ],
        json_column = '_airbyte_data'
    )
}})

SELECT 
    _airbyte_ab_id,
    "Village" as "village",
    NULL as "s_no",
    "VC_Email_Id" as "vc_email_id",
    "HM_Name" as "hm_name",
    "Block" as "block",
    "Books_Class_9" as "books_class_9",
    "Job_Role_For_Class_11_and_12_" as "state_job_role_11_and_12",
    CASE 
        WHEN "Job_Role_For_Class_11_and_12_" = 'Assistant Beauty Tharapist' THEN 'Assistant Beauty Therapist'
        WHEN "Job_Role_For_Class_11_and_12_" = 'Food & Beverge Sevice Trainee' THEN 'Food and Beverage Service Trainee'
        WHEN "Job_Role_For_Class_11_and_12_" = 'Domesstic Data Entry Operator' THEN 'Domestic Data Entry Operator'
        WHEN "Job_Role_For_Class_11_and_12_" = 'Retail Store Ops Assistant' THEN 'Store Operations Assistant'
        ELSE "Job_Role_For_Class_11_and_12_"
    END AS "lahi_job_role_11_and_12",
    "Job_Role_For_Class_9_and_10_" as "state_job_role_9_and_10",
    CASE 
        WHEN "Job_Role_For_Class_9_and_10_" = 'Assistant Beauty Tharapist' THEN 'Assistant Beauty Therapist'
        WHEN "Job_Role_For_Class_9_and_10_" = 'Food & Beverge Sevice Trainee' THEN 'Food and Beverage Service Trainee'
        WHEN "Job_Role_For_Class_9_and_10_" = 'Domesstic Data Entry Operator' THEN 'Domestic Data Entry Operator'
        WHEN "Job_Role_For_Class_9_and_10_" = 'Retail Store Ops Assistant' THEN 'Store Operations Assistant'
        ELSE "Job_Role_For_Class_9_and_10_"
    END AS "lahi_job_role_9_and_10",
    NULL as "remarks",
    "12Boys" as "12boys",
    "HM_Email_Id" as "hm_email_id",
    "11_Total" as "11_total",
    "10Girls" as "10girls",
    "School_Category" as "school_category",
    "10Boys" as "10boys",
    "LAB" as "lab",
    NULL as "po_email_id",
    "VC_Phone_Number" as "vc_phone_number",
    "9Girls" as "9girls",
    "PINCODE" as "pincode",
    "VC_Name" as "vc_name",
    "Cluster" as "cluster",
    NULL as "year_of_approval",
    NULL as "school_id_udi",
    "12_Total" as "12_total",
    "SchoolTypeName" as "school_type_name",
    "State" as "state",
    "11Boys" as "11boys",
    "Trade" as "sector_trade",
    "VT_Mobile_Number" as "vt_mobile_number",
    "Longitude" as "longitude",
    "District" as "district",
    "VTP" as "vtp",
    "Approval_Year" as "approval_year",
    "9Boys" as "9boys",
    "Grand_Total" as "grand_total",
    "12Girls" as "12girls",
    "Total_Boys" as "total_boys",
    "HM_Phone_Number" as "hm_phone_number",
    "VT_Email_Id" as "vt_email_id",
    "Books_Class_11" as "books_class_11",
    "VT_Name" as "vt_name",
    NULL as "school_management",
    "School_Status" as "school_status",
    "10_Total" as "10_total",
    "School_Type" as "school_type",
    NULL as "po_mob_number",
    "School_Name" as "school_name",
    "11Girls" as "11girls",
    NULL as "po_name",
    "SchoolLocationName" as "school_location_name",
    "24070101811" as "code_24070101811",
    "SchoolCategory" as "schoolcategory",
    "Latitude" as "latitude",
    "Books_Class_12" as "books_class_12",
    "UDISE_Code" as "udise_code",
    "VT_Status" as "vt_status",
    "9_Total" as "9_total",
    NULL as "school_type_1",
    "Gender" as "gender",
    "Books_Class_10" as "books_class_10",
    "Division" as "division",
    "Total_Girls" as "total_girls",
    NULL as "applicable_classes_10"
FROM mycte