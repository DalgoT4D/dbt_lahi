{{ config(
  materialized='table'
) }}

SELECT
    state,
    academic_year,
    year_of_approval,
    school_id,
    state_sector,
    lahi_sector,
    school_type,
    CASE
        WHEN school_category = 'Composite' THEN 'Composite (9-12)'
        WHEN school_category = 'Non Composite' THEN 'Non-Composite (9-10)'
        ELSE school_category
    END AS school_category,
    vtp,
    vt_name,
    CASE
        WHEN lab_status = 'No' THEN 'Not Available'
        WHEN lab_status = 'NA' THEN 'Not Available'
        WHEN lab_status = 'Dont Know' THEN 'Not Applicable'
        WHEN lab_status = '0' THEN 'Not Available'
        WHEN lab_status = 'Yes' THEN 'Available'
        ELSE lab_status
    END AS lab_status,
    CASE
        WHEN vt_status = 'No Information Available' THEN 'Not Available'
        WHEN vt_status = 'Appointed' THEN 'Available'
        WHEN vt_status = 'Active' THEN 'Available'
        WHEN vt_status = 'Started but Enrollment zero' THEN 'Available'
        WHEN vt_status = 'Not Applicable' THEN 'Not Applicable'
        WHEN vt_status = 'NA' THEN 'Not Available'
        ELSE vt_status
    END AS vt_status,
    CASE
        WHEN school_status = 'New' THEN 'Not Started'
        WHEN school_status = 'Started but enrollment zero' THEN 'Started'
        WHEN school_status = 'No Information Available' THEN 'Not Started'
        WHEN school_status = 'Started ' THEN 'Started'
        WHEN school_status = 'Not started' THEN 'Not Started'
        ELSE school_status
    END AS school_status,
    CASE 
        WHEN gender = 'total_boys' THEN 'M'
        WHEN gender = 'total_girls' THEN 'F'
        ELSE gender
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
        WHEN state_job_role_11 IS NOT NULL OR state_job_role_12 IS NOT NULL OR 
            state_job_role_11_and_12 IS NOT NULL OR state_job_role_9_and_10 IS NOT NULL  OR 
            lahi_job_role_11_and_12 IS NOT NULL OR lahi_job_role_9_and_10 IS NOT NULL
            THEN 
                CASE 
                    WHEN state_job_role_11 IS NOT NULL THEN '11'
                    WHEN state_job_role_12 IS NOT NULL THEN '12'
                    WHEN state_job_role_11_and_12 IS NOT NULL THEN '11-12'
                    WHEN state_job_role_9_and_10 IS NOT NULL THEN '9-10'
                    WHEN lahi_job_role_11_and_12 IS NOT NULL THEN '11-12'
                    WHEN lahi_job_role_9_and_10 IS NOT NULL THEN '9-10'
                END
    END as grade_group
FROM (
    SELECT
        state,
        academic_year,
        year_of_approval,
        school_id_udi as school_id,
        school_type,
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
        lahi_job_role_11_and_12,
        lahi_job_role_9_and_10,
        state_job_role_11,
        state_job_role_12,
        state_job_role_11_and_12,
        state_job_role_9_and_10
    FROM {{ ref('union_state_aggregated') }}
) as unnested_data
