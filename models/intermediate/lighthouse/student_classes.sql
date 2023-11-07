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
lastname as "lastname",
createdby as "createdby",
classid as "classid",
studentuniqueid as "studentuniqueid",
dropoutreason as "dropoutreason",
_airbyte_ab_id as "_airbyte_ab_id",
updatedon as "updatedon",
vtid as "vtid",
_airbyte_studentclasses_hashid as "_airbyte_studentclasses_hashid",
_airbyte_normalized_at as "_airbyte_normalized_at",
dateofenrollment as "dateofenrollment",
isactive as "isactive",
studentid as "studentid",
updatedby as "updatedby",
createdon as "createdon",
schoolid as "schoolid",
deletedby as "deletedby",
firstname as "firstname",
academicyearid as "academicyearid",
sectionid as "sectionid",
dateofdropout as "dateofdropout",
gender as "gender",
fullname as "fullname",
deletedon as "deletedon",
middlename as "middlename",
_airbyte_emitted_at as "_airbyte_emitted_at",
mobile as "mobile"
FROM {{source('source_lahi','student_classes')}}
