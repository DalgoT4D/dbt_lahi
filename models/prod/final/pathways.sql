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
    indicator_name,
    COUNT(*) AS indicator_count,
    state,
    gender,
    class,
    month_start AS month
FROM (
    SELECT 
        CASE 
            WHEN name_of_employer_shop_organization_compa IS NOT NULL AND internship_completed IS NULL THEN 'Internship Onboarded (PW)'
            WHEN name_of_employer_shop_organization_compa IS NOT NULL AND internship_completed IS NOT NULL THEN 'Internship Completed (PW)'
            ELSE 'Other'
        END AS indicator_name,
        state,
        gender,
        class,
        month_start
    FROM internship_dates
) AS subquery
WHERE indicator_name IN ('Internship Onboarded (PW)', 'Internship Completed (PW)')
GROUP BY state, gender, class, month_start, indicator_name