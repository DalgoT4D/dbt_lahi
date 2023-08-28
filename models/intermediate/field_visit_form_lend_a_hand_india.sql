{{ config(
  materialized='table',
  indexes=[
    {'columns': ['_airbyte_ab_id'], 'type': 'hash'}
  ],
  schema='intermediate'
) }}

{{
  flatten_json(
    model_names = [source('source_lahi', 'field_visit_form_lend_a_hand_india_database')],
    json_column = '_airbyte_data'
  )
}}

