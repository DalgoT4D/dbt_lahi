{{ config(
  materialized='table'
) }}

WITH cte AS (
    SELECT 
        visit_type,
        "_id" AS id,
        employee_name,
        State,
        "Voc_school_details_udise" AS ve_schools_covered,
        CASE 
            WHEN _geolocation IS NOT NULL AND _geolocation != 'null' AND _geolocation != '[null, null]' THEN (regexp_split_to_array(REPLACE(REPLACE(_geolocation, '[', ''), ']', ''), E', '))[1]::numeric
            ELSE NULL
        END AS latitude,
        CASE 
            WHEN _geolocation IS NOT NULL AND _geolocation != 'null' AND _geolocation != '[null, null]' THEN (regexp_split_to_array(REPLACE(REPLACE(_geolocation, '[', ''), ']', ''), E', '))[2]::numeric
            ELSE NULL
        END AS longitude,
        TO_DATE("Date_time_of_Visit", 'YYYY-MM-DD') as date_of_visit,
        date_time_at_the_end_of_visit
    FROM {{ref('pmu_field_visit')}}
    GROUP BY 
        id, visit_type, _geolocation, date_time_at_the_end_of_visit, employee_name, State, date_of_visit, ve_schools_covered
)

SELECT 
    cte.id,
    cte.State,
    cte.date_of_visit,
    cte.visit_type,
    cte.employee_name,
    ed."Project" AS project,
    cte.ve_schools_covered,
    EXTRACT(MONTH FROM cte.date_of_visit) AS month,
    TRIM(TO_CHAR(cte.date_of_visit, 'Month')) AS month_name,
    cte.date_of_visit::date AS date_at_end_of_visit,
    cte.latitude,
    cte.longitude,
    1 AS visit_count
FROM 
    cte
LEFT JOIN 
    {{ ref('employee_data') }} ed ON cte.employee_name = ed."Name"
