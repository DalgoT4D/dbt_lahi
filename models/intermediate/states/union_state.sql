{{ config(
  materialized='table',
  schema='intermediate'
) }}

with my_cte as ({{ dbt_utils.union_relations(
    relations=[
        ref('andhra_pradesh_state_database'),
        ref('assam_state_database'),
        ref('chattisgarh_state_database'),
        ref('delhi_state_database'),
        ref('gujarat_state_database'),
        ref('himachal_pradesh_state_database'),
        ref('karnataka_state_database'),
        ref('maharashtra_state_database')
    ]
) }})

SELECT 
    _airbyte_ab_id,
    village,
    s_no,
    vc_email_id,
    hm_name,
    block,
    books_class_9,
    job_role_for_class_11_and_12_,
    remarks,
    "12boys",
    hm_email_id,
    sector_trade,
    "11_total",
    "10girls",
    school_category,
    "10boys",
    lab,
    po_email_id,
    vc_phone_number,
    "9girls",
    pincode,
    vc_name,
    cluster,
    year_of_approval,
    school_id_udi,
    "12_total",
    school_type_name,
    state,
    "11boys",
    trade,
    longitude,
    vt_mobile_number,
    district,
    vtp,
    approval_year,
    "9boys",
    grand_total,
    "12girls",
    total_boys,
    hm_phone_number,
    job_role_for_class_9_and_10_,
    vt_email_id,
    books_class_11,
    vt_name,
    school_management,
    school_status,
    "10_total",
    school_type,
    po_mob_number,
    school_name,
    "11girls",
    po_name,
    school_location_name,
    code_24070101811,
    schoolcategory,
    latitude,
    books_class_12,
    udise_code,
    vt_status,
    "9_total",
    school_type_1,
    gender,
    books_class_10,
    division,
    total_girls,
    applicable_classes_10,
    applicable_classes_12,
    job_role_for_class_11_and_12,
    "Applicable_Classes_09",
    _12_total,
    job_role__for_class_11_and_12_,
    school_id___udi,
    job_role__for_class_9_and_10_
FROM my_cte