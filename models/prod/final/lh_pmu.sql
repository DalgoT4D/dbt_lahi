{{
  config(
    materialized='table'
  )
}}

WITH RankedData AS (
    SELECT
        state,
        academic_year,
        school_id_udi,
        state_sector,
        school_type,
        school_category,
        vtp,
        vt_name,
        lab_status,
        vt_status,
        school_status,
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
        state_job_role,
        ROW_NUMBER() OVER (PARTITION BY school_id_udi, state_sector, state_job_role ORDER BY state_job_role) AS rn
    FROM (
        SELECT
            state,
            academic_year,
            school_id_udi,
            state_sector,
            school_type,
            school_category,
            vtp,
            vt_name,
            lab as lab_status,
            vt_status,
            school_status,
            UNNEST(ARRAY['total_boys', 'total_girls']) AS gender,
            total_boys,
            total_girls,
            state_job_role
        FROM {{ ref('lh_union_state') }}
    ) AS GenderData
    GROUP BY 
        state,
        academic_year,
        school_id_udi,
        state_sector,
        school_category,
        school_type,
        vtp,
        vt_name,
        lab_status,
        vt_status,
        school_status,
        gender,
        state_job_role,
        total_boys,
        total_girls
)
SELECT
    state,
    academic_year,
    school_id_udi as school_id,
    state_sector,
    school_category,
    school_type,
    vtp,
    vt_name,
    lab_status,
    vt_status,
    school_status,
    gender,
    gender_count,
    state_job_role
FROM RankedData
WHERE rn = 1