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
classid as "classid",
_airbyte_normalized_at as "_airbyte_normalized_at",
isactive as "isactive",
_airbyte_studentclassmapping_hashid as "_airbyte_studentclassmapping_hashid",
studentrollnumber as "studentrollnumber",
updatedby as "updatedby",
studentclassmappingid as "studentclassmappingid",
academicyearid as "academicyearid",
createdon as "createdon",
studentid as "studentid",
_airbyte_emitted_at as "_airbyte_emitted_at",
isayrollover as "isayrollover"
FROM {{source('source_lahi','student_class_mapping')}}
