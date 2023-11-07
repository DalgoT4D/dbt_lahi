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
updatedon as "updatedon",
vtid as "vtid",
_airbyte_normalized_at as "_airbyte_normalized_at",
isactive as "isactive",
vtclassstudentid as "vtclassstudentid",
updatedby as "updatedby",
createdon as "createdon",
studentid as "studentid",
_airbyte_emitted_at as "_airbyte_emitted_at",
_airbyte_vtclassstudents_hashid as "_airbyte_vtclassstudents_hashid"
FROM {{source('source_lahi','vt_class_students')}}
