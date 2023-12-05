{{ 
  config(
    materialized='table'
  ) 
}}

WITH unioned_data AS (
    {{ dbt_utils.union_relations(
        relations=[
            ref('lh_pmu'),
            ref('union_state')
        ]
    ) }}
)

select state,
    school_id,
    state_sector,
    lahi_sector,
    school_category,
    vtp,
    vt_name,
    lab_status,
    vt_status,
    school_status,
    gender,
    gender_count numeric,
    state_job_role,
    lahi_job_role,
    grade_group
 from unioned_data