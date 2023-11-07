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
vcid as "vcid",
createdby as "createdby",
updatedon as "updatedon",
schoolvtpsectorid as "schoolvtpsectorid",
_airbyte_vcschoolsectors_hashid as "_airbyte_vcschoolsectors_hashid",
dateofallocation as "dateofallocation",
_airbyte_normalized_at as "_airbyte_normalized_at",
isactive as "isactive",
vcschoolsectorid as "vcschoolsectorid",
updatedby as "updatedby",
academicyearid as "academicyearid",
createdon as "createdon",
_airbyte_emitted_at as "_airbyte_emitted_at",
isayrollover as "isayrollover"
FROM {{source('source_lahi','vc_school_sectors')}}
