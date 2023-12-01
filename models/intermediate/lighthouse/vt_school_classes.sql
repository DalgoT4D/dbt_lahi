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
sectionid as "sectionid",
createdby as "createdby",
schoolid as "schoolid",
updatedon as "updatedon",
vtid as "vtid",
_airbyte_vtschoolclasses_hashid as "_airbyte_vtschoolclasses_hashid",
vtschoolclassid as "vtschoolclassid",
classid as "classid",
_airbyte_normalized_at as "_airbyte_normalized_at",
isactive as "isactive",
updatedby as "updatedby",
createdon as "createdon",
_airbyte_emitted_at as "_airbyte_emitted_at"
FROM {{source('source_lahi','vt_school_classes')}}
