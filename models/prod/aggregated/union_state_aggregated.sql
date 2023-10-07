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
        ref('karnataka_state_database'),
        ref('ladakh_state_database'),
        ref('maharashtra_state_database'),
        ref('nagaland_state_database'),
        ref('odisha_state_database'),
        ref('tamil_nadu_state_database'),
        ref('telangana_state_database')
    ]
) }})

SELECT 
    "state_job_role_11",
    "state_job_role_12",
    state_job_role_11_and_12,
    lahi_job_role_11_and_12,
    state_job_role_9_and_10,
    lahi_job_role_9_and_10,
    CASE WHEN "total_boys" ~ '^[0-9\.]+$' THEN "total_boys"::numeric ELSE 0 END as total_boys,
    CASE WHEN "total_girls" ~ '^[0-9\.]+$' THEN "total_girls"::numeric ELSE 0 END as total_girls,
    sector_trade as sector,
    school_category,
    lab,
    school_id_udi,
    state,
    vtp,
    CASE WHEN "grand_total" ~ '^[0-9\.]+$' THEN "grand_total"::numeric ELSE 0 END as grand_total,
    vt_name,
    school_status,
    vt_status
FROM my_cte