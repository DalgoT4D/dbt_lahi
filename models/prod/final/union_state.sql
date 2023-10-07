{{ config(
  materialized='table'
) }}

WITH sector_counts AS (
    SELECT 
        state,
        school_status,
        unnest(array['sector', 'school_category', 'vt_status', 'lab']) as indicator,
        unnest(array[sector, school_category, vt_status, lab]) as value,
        SUM(total_boys) as total_boys_count,
        SUM(total_girls) as total_girls_count,
        SUM(grand_total) as grand_total
    FROM {{ ref('union_state_aggregated') }}
    GROUP BY state, school_status, sector, school_category, vt_status, lab
)

SELECT 
    state,
    school_status,
    indicator,
    value,
    total_boys_count,
    total_girls_count,
    grand_total
FROM sector_counts
