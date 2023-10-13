{{ config(
  materialized='table',
   indexes=[
      {'columns': ['_airbyte_ab_id'], 'type': 'hash'}
    ]
) }}

-- Creating a CTE that flattens the JSON data from the raw_enrollment table


{{
flatten_json(
    model_names = [source('source_lahi', 'employee_data_database'),
            ],
    json_column = '_airbyte_data'
    )
}}


