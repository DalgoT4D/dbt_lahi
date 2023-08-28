{{ config(
  materialized='table',
  indexes=[
    {'columns': ['_airbyte_ab_id'], 'type': 'hash'}
  ],
  schema='intermediate'
) }}

{{
  flatten_json(
    model_names = [source('source_lahi', 'gujarat_pathways_internship')],
    json_column = '_airbyte_data'
  )
}}
