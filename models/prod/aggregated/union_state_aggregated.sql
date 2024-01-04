{{ config(
  materialized='table'
) }}

with my_cte as ({{ dbt_utils.union_relations(
    relations=[
        ref('andhra_pradesh_state_database'),
        ref('assam_state_database'),
        ref('chattisgarh_state_database'),
        ref('delhi_state_database'),
        ref('gujarat_state_database'),
        ref('himachal_pradesh_state_database'),
        ref('jharkhand_state_database'),
        ref('karnataka_state_database'),
        ref('ladakh_state_database'),
        ref('nagaland_state_database'),
        ref('odisha_state_database'),
        ref('punjab_state_database'),
        ref('rajasthan_state_database'),
        ref('tamil_nadu_state_database'),
        ref('telangana_state_database'),
        ref('uttarakhand_state_database'),
        ref('andhra_pradesh_23_24_database'),
        ref('assam_23_24_database'),
        ref('chattisgarh_23_24_database'),
        ref('delhi_23_24_database'),
        ref('gujarat_23_24_database'),
        ref('himachal_pradesh_23_24_database'),
        ref('jharkhand_23_24_database'),
        ref('karnataka_23_24_database'),
        ref('ladakh_23_24_database'),
        ref('nagaland_23_24_database'),
        ref('odisha_23_24_database'),
        ref('punjab_23_24_database'),
        ref('rajasthan_23_24_database'),
        ref('tamil_nadu_23_24_database'),
        ref('telangana_23_24_database'),
        ref('uttarakhand_23_24_database'),
        ref('lh_union_state')
    ]
) }})

SELECT 
    state,
    CASE
        WHEN academic_year = '2021-2022' THEN '2021-22'
        WHEN academic_year = '2022-2023' THEN '2022-23'
        WHEN academic_year = '2023-2024' THEN '2023-24'
        ELSE academic_year
    END AS academic_year,
    school_status,
    CASE
        WHEN school_type = 'Provincialised' THEN 'Government'
        WHEN school_type = 'Provincialized' THEN 'Government'
        WHEN school_type = 'GOVT. PROVINCIALISED' THEN 'Government'
        WHEN school_type = 'GOVT AIDED' THEN 'Government'
        WHEN school_type = 'Govt.' THEN 'Government'
        WHEN school_type = 'Department of Education' THEN 'Government'
        WHEN school_type = 'Private Unaided' THEN 'Private - Unaided'
        WHEN school_type = 'Government Aided' THEN 'Government'
        ELSE school_type
    END AS school_type,
    sector_trade as state_sector,
    lahi_sector_name as lahi_sector,
    CASE WHEN "total_boys" ~ '^[0-9\.]+$' THEN "total_boys"::numeric ELSE 0 END as total_boys,
    CASE WHEN "total_girls" ~ '^[0-9\.]+$' THEN "total_girls"::numeric ELSE 0 END as total_girls,
    school_category,
    lab,
    school_id_udi,
    vtp,
    CASE WHEN "grand_total" ~ '^[0-9\.]+$' THEN "grand_total"::numeric ELSE 0 END as grand_total,
    vt_name,
    vt_status,
    "state_job_role_11",
    "state_job_role_12",
    state_job_role_11_and_12,
    lahi_job_role_11_and_12,
    state_job_role_9_and_10,
    lahi_job_role_9_and_10
FROM my_cte
