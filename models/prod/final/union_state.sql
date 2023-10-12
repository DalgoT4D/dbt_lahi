{{ config(
  materialized='table'
) }}

SELECT
    state,
    school_id,
    state_sector,
    lahi_sector,
    school_category,
    vtp,
    vt_name,
    lab_status,
    vt_status,
    school_status,
    CASE 
        WHEN gender = 'total_boys' THEN 'M'
        WHEN gender = 'total_girls' THEN 'F'
    END as gender,
    COALESCE(
        CASE 
            WHEN gender = 'total_boys' THEN total_boys
            WHEN gender = 'total_girls' THEN total_girls
            ELSE 0
        END,
        0
    ) as gender_count,
    state_job_role,
    lahi_job_role,
    CASE 
        WHEN state_job_role_11 IS NOT NULL OR state_job_role_12 IS NOT NULL OR state_job_role_11_and_12 IS NOT NULL OR state_job_role_9_and_10 IS NOT NULL THEN 
            CASE 
                WHEN state_job_role_11 IS NOT NULL THEN '11'
                WHEN state_job_role_12 IS NOT NULL THEN '12'
                WHEN state_job_role_11_and_12 IS NOT NULL THEN '11-12'
                WHEN state_job_role_9_and_10 IS NOT NULL THEN '9-10'
            END
    END as grade_group
FROM (
    SELECT
        state,
        school_id_udi as school_id,
        state_sector,
        lahi_sector,
        school_category,
        vtp,
        vt_name,
        lab as lab_status,
        vt_status,
        school_status,
        total_boys,
        total_girls,
        unnest(array['total_boys', 'total_girls']) as gender,
        CASE 
            WHEN state_job_role_11 IS NOT NULL THEN state_job_role_11
            WHEN state_job_role_12 IS NOT NULL THEN state_job_role_12
            WHEN state_job_role_11_and_12 IS NOT NULL THEN state_job_role_11_and_12
            WHEN state_job_role_9_and_10 IS NOT NULL THEN state_job_role_9_and_10
        END as state_job_role,
        CASE 
            WHEN lahi_job_role_11_and_12 IS NOT NULL THEN lahi_job_role_11_and_12
            WHEN lahi_job_role_9_and_10 IS NOT NULL THEN lahi_job_role_9_and_10
        END as lahi_job_role,
        state_job_role_11,
        state_job_role_12,
        state_job_role_11_and_12,
        state_job_role_9_and_10
    FROM {{ ref('union_state_aggregated') }}
) as unnested_data
