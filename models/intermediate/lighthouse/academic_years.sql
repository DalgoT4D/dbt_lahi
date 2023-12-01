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
iscurrentacademicyear as "iscurrentacademicyear",
createdby as "createdby",
updatedon as "updatedon",
phaseid as "phaseid",
description as "description",
yearcode as "yearcode",
yearname as "yearname",
_airbyte_normalized_at as "_airbyte_normalized_at",
isactive as "isactive",
startmonth as "startmonth",
updatedby as "updatedby",
endmonth as "endmonth",
academicyearid as "academicyearid",
createdon as "createdon",
_airbyte_academicyears_hashid as "_airbyte_academicyears_hashid",
_airbyte_emitted_at as "_airbyte_emitted_at"
FROM {{source('source_lahi','academic_years')}}
