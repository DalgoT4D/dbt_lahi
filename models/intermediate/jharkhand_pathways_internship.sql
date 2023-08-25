{{ config(
  materialized='table',
  indexes=[
    {'columns': ['_airbyte_ab_id'], 'type': 'hash'}
  ],
  schema='intermediate'
) }}

{{
  new_flatten_json(
    model_names = [source('source_lahi', 'jharkhand_pathways_internship')],
    json_column = '_airbyte_data'
  )
}}
