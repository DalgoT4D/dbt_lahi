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
dateofresignation as "dateofresignation",
createdby as "createdby",
schoolid as "schoolid",
updatedon as "updatedon",
dateofjoining as "dateofjoining",
_airbyte_normalized_at as "_airbyte_normalized_at",
isactive as "isactive",
hmid as "hmid",
updatedby as "updatedby",
hmschoolid as "hmschoolid",
academicyearid as "academicyearid",
createdon as "createdon",
_airbyte_hmschoolsmap_hashid as "_airbyte_hmschoolsmap_hashid",
_airbyte_emitted_at as "_airbyte_emitted_at"
FROM {{source('source_lahi','hm_schools_map')}}
