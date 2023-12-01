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

SELECT
  _airbyte_ab_id as "_airbyte_ab_id",
  sequenceno as "sequenceno",
  createdby as "createdby",
  stateid as "stateid",
  statecode as "statecode",
  updatedon as "updatedon",
  _airbyte_states_hashid as "_airbyte_states_hashid",
  description as "description",
  isactive as "isactive",
  statename as "statename",
  countrycode as "countrycode",
  updatedby as "updatedby",
  createdon as "createdon",
  _airbyte_emitted_at as "_airbyte_emitted_at",
  _airbyte_normalized_at as "_airbyte_normalized_at"
FROM {{source('source_lahi','states')}}
