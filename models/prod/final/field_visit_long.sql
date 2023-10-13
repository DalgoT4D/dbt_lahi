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
        TO_DATE("Date_time_of_Visit", 'YYYY-MM-DD') as date_time_of_visit,
        date_time_at_the_end_of_visit,
        EXTRACT(MONTH FROM TO_TIMESTAMP(date_time_at_the_end_of_visit, 'YYYY-MM-DDTHH24:MI:SS')) AS month,
        TRIM(TO_CHAR(TO_TIMESTAMP(date_time_at_the_end_of_visit, 'YYYY-MM-DDTHH24:MI:SS'), 'Month')) AS month_name,
        EXTRACT(DAY FROM TO_TIMESTAMP(date_time_at_the_end_of_visit, 'YYYY-MM-DDTHH24:MI:SS')) AS date
    FROM {{ref('pmu_field_visit')}}
    GROUP BY 
        id, visit_type, date_time_at_the_end_of_visit, _geolocation, employee_name, State, date_time_of_visit, ve_schools_covered
)

SELECT 
    id,
    State,
    date_time_of_visit,
    visit_type,
    employee_name,
    ve_schools_covered,
    month,
    month_name,
    date,
    'latitude' AS geo_type,
    latitude AS geo
FROM 
    cte

UNION ALL

SELECT 
    id,
    State,
    date_time_of_visit,
    visit_type,
    employee_name,
    ve_schools_covered,
    month,
    month_name,
    date,
    'longitude' AS geo_type,
    longitude AS geo
FROM 
    cte