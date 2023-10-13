{{ config(
  materialized='table'
) }}

WITH cte AS (
    SELECT 
        visit_type,
        id,
        employee_name,
        project,
        State,
        ve_schools_covered,
        latitude,
        longitude,
        date_time_of_visit,
        month,
        month_name,
        date
    FROM {{ref('field_visit_aggregated')}}
    GROUP BY 
        id, visit_type, latitude, longitude, month, month_name, date, employee_name, project, State, date_time_of_visit, ve_schools_covered
)

SELECT 
    id,
    State,
    date_time_of_visit,
    visit_type,
    employee_name,
    project,
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
    project,
    ve_schools_covered,
    month,
    month_name,
    date,
    'longitude' AS geo_type,
    longitude AS geo
FROM 
    cte