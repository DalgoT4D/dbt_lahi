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
_airbyte_vtschoolsectorjobroles_hashid as "_airbyte_vtschoolsectorjobroles_hashid",
vtschoolsectorjobroleid as "vtschoolsectorjobroleid",
vtschoolsectorid as "vtschoolsectorid",
_airbyte_normalized_at as "_airbyte_normalized_at",
isactive as "isactive",
remarks as "remarks",
createdon as "createdon",
_airbyte_emitted_at as "_airbyte_emitted_at"
FROM {{source('source_lahi','vt_school_sector_job_roles')}}
