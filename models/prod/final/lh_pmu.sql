{{
  config(
    materialized='table'
  )
}}

WITH RankedData AS (
    SELECT
        state,
        academic_year,
        school_id_udi AS school_id_udi,
        state_sector,
        class,
        school_category,
        school_type,
        vtp,
        vt_name,
        lab_status,
        vt_status,
        school_status,
        total_boys,
        total_girls,
        grand_total,
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
        lahi_job_role,
        MAX(CASE WHEN class IN ('09', '10') THEN lahi_job_role END) AS lahi_job_role_9_and_10,
        MAX(CASE WHEN class IN ('11', '12') THEN lahi_job_role END) AS lahi_job_role_11_and_12,
        ROW_NUMBER() OVER (PARTITION BY school_id_udi, state_sector, lahi_job_role ORDER BY lahi_job_role) AS rn
    FROM (
        SELECT
            state,
            academic_year,
            school_id_udi,
            state_sector,
            school_type,
            class,
            school_category,
            vtp,
            vt_name,
            lab as lab_status,
            vt_status,
            school_status,
            UNNEST(ARRAY['total_boys', 'total_girls']) AS gender,
            total_boys,
            total_girls,
            grand_total,
            lahi_job_role
        FROM {{ ref('lh_union_state') }}
    ) AS GenderData
    GROUP BY 
        state,
        academic_year,
        school_id_udi,
        state_sector,
        class,
        school_category,
        school_type,
        vtp,
        vt_name,
        lab_status,
        vt_status,
        school_status,
        total_boys,
        total_girls,
        grand_total,
        gender,
        lahi_job_role
)
SELECT
    state,
    academic_year,
    school_id_udi,
    state_sector,
    class,
    school_category,
    school_type,
    vtp,
    vt_name,
    lab_status,
    vt_status,
    school_status,
    total_boys,
    total_girls,
    grand_total,
    gender,
    gender_count,
    lahi_job_role,
    lahi_job_role_9_and_10,
    lahi_job_role_11_and_12
FROM RankedData
WHERE rn = 1