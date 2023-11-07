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
jobroleid as "jobroleid",
createdby as "createdby",
sectorid as "sectorid",
updatedon as "updatedon",
_airbyte_normalized_at as "_airbyte_normalized_at",
isactive as "isactive",
qpcode as "qpcode",
remarks as "remarks",
sectorjobroleid as "sectorjobroleid",
updatedby as "updatedby",
_airbyte_sectorjobroles_hashid as "_airbyte_sectorjobroles_hashid",
createdon as "createdon",
_airbyte_emitted_at as "_airbyte_emitted_at"
FROM {{source('source_lahi','sector_job_roles')}}
