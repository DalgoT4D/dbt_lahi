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
        date_of_visit,
        month,
        month_name,
        date_at_end_of_visit
    FROM {{ref('field_visit_aggregated')}}
    GROUP BY 
        id, visit_type, latitude, longitude, month, month_name, date_at_end_of_visit, employee_name, project, State, date_of_visit, ve_schools_covered
)

SELECT 
    id,
    State,
    date_of_visit,
    visit_type,
    employee_name,
    project,
    ve_schools_covered,
    month,
    month_name,
    date_at_end_of_visit,
    'latitude' AS geo_type,
    latitude AS geo
FROM 
    cte

UNION ALL

SELECT 
    id,
    State,
    date_of_visit,
    visit_type,
    employee_name,
    project,
    ve_schools_covered,
    month,
    month_name,
    date_at_end_of_visit,
    'longitude' AS geo_type,
    longitude AS geo
FROM 
    cte