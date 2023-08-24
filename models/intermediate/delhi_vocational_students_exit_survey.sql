{{ config(
  materialized='table',
   indexes=[
      {'columns': ['_airbyte_ab_id'], 'type': 'hash'}
    ],
    schema='intermediate'

) }}

-- Creating a CTE that flattens the JSON data from the raw_enrollment table

{{
  new_flatten_json(
      model_names = [source('source_lahi', 'delhi_vocational_students_exit_survey_database')
      ],
      json_column = '_airbyte_data'
      )
  }}

