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
vcname as "vcname",
lastname as "lastname",
vcid as "vcid",
createdby as "createdby",
mothername as "mothername",
category as "category",
sector as "sector",
_airbyte_studentsforexitform_hashid as "_airbyte_studentsforexitform_hashid",
udisecode as "udisecode",
_airbyte_ab_id as "_airbyte_ab_id",
nameofschool as "nameofschool",
vtname as "vtname",
"Class" as "class",
updatedon as "updatedon",
vtid as "vtid",
academicyear as "academicyear",
_airbyte_normalized_at as "_airbyte_normalized_at",
isactive as "isactive",
updatedby as "updatedby",
createdon as "createdon",
exitstudentid as "exitstudentid",
jobrole as "jobrole",
vtmobile as "vtmobile",
firstname as "firstname",
fathername as "fathername",
vtpid as "vtpid",
dob as "dob",
vtpname as "vtpname",
district as "district",
studentfullname as "studentfullname",
gender as "gender",
middlename as "middlename",
_airbyte_emitted_at as "_airbyte_emitted_at",
studentuniqueid as "studentuniqueid"
FROM {{source('source_lahi','students_for_exit_form')}}
