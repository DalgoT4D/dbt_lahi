{{ 
  config(
    materialized='table'
  ) 
}}

WITH internship_dates AS (
    SELECT 
        DATE_TRUNC('month', date_of_commencement_internship_progres::DATE)::DATE AS month_start,
        date_of_completion_internship_progress::DATE AS internship_completed,
        school_state AS state,
        CASE 
            WHEN student_gender = 'Male' THEN 'M'
            WHEN student_gender = 'Female' THEN 'F'
            ELSE student_gender
        END AS gender,
        CASE 
            WHEN student_class = 'Class 9' THEN '9'
            WHEN student_class = 'Class 10' THEN '10'
            WHEN student_class = 'Class 11' THEN '11'
            WHEN student_class = 'Class 12' THEN '12'
            ELSE student_class
        END AS class,
        name_of_employer_shop_organization_compa
    FROM {{ ref('pathways_aggregated') }}
)

SELECT 
    'Internship Ongoing (LH)' AS indicator_name,
    SUM(CASE
            -- WHEN name_of_employer_shop_organization_compa IS NOT NULL AND internship_completed IS NULL THEN 1
            WHEN name_of_employer_shop_organization_compa IS NOT NULL THEN 1
            ELSE 0
        END) AS indicator_count,
    state,
    gender,
    class,
    month_start AS month
FROM internship_dates
GROUP BY state, gender, class, month_start
