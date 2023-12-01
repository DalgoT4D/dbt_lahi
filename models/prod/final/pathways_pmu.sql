{{ 
  config(
    materialized='table'
  ) 
}}

WITH unioned_data AS (
    {{ dbt_utils.union_relations(
        relations=[
            ref('pmu_normalized'),
            ref('pathways')
        ]
    ) }}
)

SELECT
    state,
    month,
    class,
    gender,
    indicator_name,
    indicator_count
FROM unioned_data