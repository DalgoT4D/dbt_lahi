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
                        source('source_lahi', 'karnataka_database'), 
                ],
        json_column = '_airbyte_data'
    )
}})


SELECT 
    _airbyte_ab_id,
    NULL as "village",
    NULL as "s_no",
    "vc_email_id",
    "hm_name",
    "block",
    "books_class_9",
    "jobrole_11_12" as "state_job_role_11_and_12",
    CASE 
        WHEN "jobrole_11_12" = 'Assistant Beauty Tharapist' THEN 'Assistant Beauty Therapist'
        WHEN "jobrole_11_12" = 'Domesstic Data Entry Operator' THEN 'Domestic Data Entry Operator'
        WHEN "jobrole_11_12" = 'Retail Store Ops Assistant' THEN 'Store Operations Assistant'
        ELSE "jobrole_11_12"
    END AS "lahi_job_role_11_and_12",
    "jobrole_9_10" as "state_job_role_9_and_10",
    CASE 
        WHEN "jobrole_9_10" = 'Assistant Beauty Tharapist' THEN 'Assistant Beauty Therapist'
        WHEN "jobrole_9_10" = 'Domesstic Data Entry Operator' THEN 'Domestic Data Entry Operator'
        WHEN "jobrole_9_10" = 'Retail Store Ops Assistant' THEN 'Store Operations Assistant'
        ELSE "jobrole_9_10"
    END AS "lahi_job_role_9_and_10",
    NULL as "remarks",
    NULL as "12boys",
    "hm_email_id" as "hm_email_id",
    "sector" as "sector_trade",
    "_11_total" as "11_total",
    "class10_g" as "10girls",
    "school_category",
    "class10_b" as "10boys",
    "lab",
    NULL as "po_email_id",
    "vc_phone_number",
    "class9_g" as "9girls",
    NULL as "pincode",
    NULL as "vc_name",
    NULL as "cluster",
    "year_of_approval",
    NULL as "school_id_udi",
    "_12_total",
    NULL as "school_type_name",
    "State" as "state",
    "class11_b" as "11boys",
    NULL as "trade",
    NULL as "longitude",
    "vt_mobile_number",
    "District" as "district",
    "vtp",
    NULL as "approval_year",
    "class9_b" as "9boys",
    "grand_total",
    "class12_g" as "12girls",
    "total_boys",
    "hm_phone_number",
    "vt_email_id",
    "books_class_11" as "books_class_11",
    "vt_name",
    "school_management",
    "school_status",
    "_10_total" as "10_total",
    "school_type",
    NULL as "po_mob_number",
    "school_name",
    "class11_g" as "11girls",
    NULL as "po_name",
    NULL as "school_location_name",
    NULL as "code_24070101811",
    NULL as "schoolcategory",
    NULL as "latitude",
    "books_class_12" as "books_class_12",
    NULL as "udise_code",
    "vt_status",
    "Total_Class_9" as "9_total",
    NULL as "school_type_1",
    "gender",
    "books_class_10" as "books_class_10",
    "Division" as "division",
    "total_girls",
    NULL as "applicable_classes_10"
FROM mycte