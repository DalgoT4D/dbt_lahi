{{ config(
  materialized='table',
  schema='intermediate'
) }}

WITH sector_counts AS (
    SELECT 
        state,
        sector_trade AS sector,
        total_boys::numeric,
        total_girls::numeric
    FROM dev_intermediate.sector
    WHERE sector_trade IS NOT NULL
)

SELECT 
    state,
    sector,
    SUM(total_boys) as total_boys,
    SUM(total_girls) as total_girls
FROM sector_counts
GROUP BY state, sector
