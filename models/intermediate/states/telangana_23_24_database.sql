--DBT AUTOMATION has generated this model, please DO NOT EDIT 
--Please make sure you dont change the model name 


{{ 
  config(
    materialized='table',
    indexes=[
      {'columns': ['_airbyte_ab_id'], 'type': 'hash'}
    ]
  ) 
}}
    with mycte as (
{{
    flatten_json(
        model_names = [
                        source('source_lahi', 'telangana_23_24_database'), 
                ],
        json_column = '_airbyte_data'
    )
}})


select * from mycte