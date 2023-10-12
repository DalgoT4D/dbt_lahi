{{ config(
  materialized='table'
) }}

SELECT 
    state,
    school_status,
    COUNT(DISTINCT school_id_udi) as total_schools,
    COUNT(DISTINCT vtp) as total_vtp,
    COUNT(DISTINCT state_job_role_9_and_10) as total_state_job_role_9_10,
    COUNT(DISTINCT lahi_job_role_9_and_10) as total_lahi_job_role_9_10,
    COUNT(DISTINCT state_job_role_11_and_12) as total_state_job_role_11_12,
    COUNT(DISTINCT lahi_job_role_11_and_12) as total_lahi_job_role_11_12,
    SUM(total_boys) as total_boys,
    SUM(total_girls) as total_girls,
    SUM(grand_total) as grand_total
FROM {{ ref('union_state_aggregated') }}
GROUP BY state, school_status
