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
vtpsectorid as "vtpsectorid",
_airbyte_normalized_at as "_airbyte_normalized_at",
isactive as "isactive",
_airbyte_vtpsectors_hashid as "_airbyte_vtpsectors_hashid",
remarks as "remarks",
updatedby as "updatedby",
academicyearid as "academicyearid",
createdon as "createdon",
vtpid as "vtpid",
_airbyte_emitted_at as "_airbyte_emitted_at",
isayrollover as "isayrollover"
FROM {{source('source_lahi','vtp_sectors')}}
