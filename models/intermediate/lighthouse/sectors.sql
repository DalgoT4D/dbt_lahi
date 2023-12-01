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
sectorid as "sectorid",
updatedon as "updatedon",
_airbyte_sectors_hashid as "_airbyte_sectors_hashid",
description as "description",
displayorder as "displayorder",
_airbyte_normalized_at as "_airbyte_normalized_at",
isactive as "isactive",
updatedby as "updatedby",
createdon as "createdon",
sectorname as "sectorname",
_airbyte_emitted_at as "_airbyte_emitted_at"
FROM {{source('source_lahi','sectors')}}
