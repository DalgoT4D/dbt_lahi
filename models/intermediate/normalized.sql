{{ config(
  materialized='table',
   indexes=[
      {'columns': ['_airbyte_ab_id'], 'type': 'hash'}
    ],
    schema='intermediate'

) }}

-- Creating a CTE that flattens the JSON data from the raw_enrollment table


({{
    flatten_json(
        model_names = [
                        source('source_lahi', 'andhra_pradesh_database'),
                        source('source_lahi', 'assam_database'), 
                        source('source_lahi', 'chattisgarh_database'), 
                        source('source_lahi', 'delhi_database'), 
                        source('source_lahi', 'gujarat_database'), 
                        source('source_lahi', 'himachal_pradesh_database'), 
                        source('source_lahi', 'karnataka_database'), 
                        source('source_lahi', 'maharastra_database'), 
                ],
        json_column = '_airbyte_data'
    )
}})

