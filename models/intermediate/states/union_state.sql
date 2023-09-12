{{ config(
  materialized='table'
) }}

with my_cte as ({{ dbt_utils.union_relations(
    relations=[ref('andhra_pradesh_state_database'),ref('assam_state_database'),
    ref('chattisgarh_state_database'),ref('delhi_state_database'),ref('gujarat_state_database'),
    ref('himachal_pradesh_state_database'),ref('karnataka_state_database'),
    ref('maharashtra_state_database')]
) }})

select lab from my_cte
