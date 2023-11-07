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
vtpsectorjobrolename as "vtpsectorjobrolename",
_airbyte_normalized_at as "_airbyte_normalized_at",
isactive as "isactive",
updatedby as "updatedby",
_airbyte_vtpsectorjobroles_hashid as "_airbyte_vtpsectorjobroles_hashid",
createdon as "createdon",
vtpid as "vtpid",
_airbyte_emitted_at as "_airbyte_emitted_at",
vtpsectorjobroleid as "vtpsectorjobroleid"
FROM {{source('source_lahi','vtp_sector_job_roles')}}
