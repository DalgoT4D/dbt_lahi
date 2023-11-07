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
dateofremoval as "dateofremoval",
jobroleid as "jobroleid",
createdby as "createdby",
schoolid as "schoolid",
sectorid as "sectorid",
updatedon as "updatedon",
vtid as "vtid",
_airbyte_vtschoolsectors_hashid as "_airbyte_vtschoolsectors_hashid",
dateofallocation as "dateofallocation",
vtschoolsectorid as "vtschoolsectorid",
_airbyte_normalized_at as "_airbyte_normalized_at",
isactive as "isactive",
updatedby as "updatedby",
academicyearid as "academicyearid",
createdon as "createdon",
_airbyte_emitted_at as "_airbyte_emitted_at",
isayrollover as "isayrollover"
FROM {{source('source_lahi','vt_school_sectors')}}
