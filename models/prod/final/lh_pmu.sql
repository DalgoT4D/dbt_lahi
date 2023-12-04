{{ 
  config(
    materialized='table'
  ) 
}}

SELECT
    state,
    school_id_udi as school_id,
    state_sector,
    NULL AS lahi_sector,
    CASE
        WHEN school_category = 'Non-Composite' THEN 'Non Composite'
        ELSE school_category
    END AS school_category,
    vtp,
    vt_name,
    lab,
    lab_status,
    vt_status,
    CASE
        WHEN school_status = 'true' THEN 'Started'
        WHEN school_status = 'false' THEN 'Not Started'
        ELSE school_status
    END AS school_status,
    CASE 
        WHEN gender = 'total_boys' THEN 'M'
        WHEN gender = 'total_girls' THEN 'F'
    END AS gender,
    COALESCE(
        CASE 
            WHEN gender = 'total_boys' THEN SUM(total_boys)
            WHEN gender = 'total_girls' THEN SUM(total_girls)
            ELSE 0
        END,
        0
    ) AS gender_count,
    NULL as lahi_job_role,
    state_job_role,
    NULL as grade_group
FROM (
    SELECT
        state,
        school_id_udi,
        state_sector,
        school_category,
        vtp,
        vt_name,
        lab,
        lab_status,
        vt_status,
        school_status,
        UNNEST(ARRAY['total_boys', 'total_girls']) AS gender,
        total_boys,
        total_girls,
        job_role as state_job_role
    FROM {{ ref('lh_union_state') }}
) AS GenderData
GROUP BY 
    state,
    school_id_udi,
    state_sector,
    school_category,
    vtp,
    vt_name,
    lab,
    lab_status,
    vt_status,
    school_status,
    gender,
    state_job_role