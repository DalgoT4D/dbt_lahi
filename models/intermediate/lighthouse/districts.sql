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
createdby as "createdby",
updatedon as "updatedon",
description as "description",
divisionid as "divisionid",
statecode as "statecode",
_airbyte_normalized_at as "_airbyte_normalized_at",
isactive as "isactive",
updatedby as "updatedby",
_airbyte_districts_hashid as "_airbyte_districts_hashid",
districtcode as "districtcode",
_airbyte_emitted_at as "_airbyte_emitted_at",
districtname as "districtname",
createdon as "createdon"
FROM {{source('source_lahi','districts')}}
