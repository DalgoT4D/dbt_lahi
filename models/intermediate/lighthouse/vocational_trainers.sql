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
  vcid as "vcid",
  email as "email",
  isactive as "isactive",
  industryexperiencemonths as "industryexperiencemonths",
  gender as "gender",
  vtid as "vtid",
  updatedby as "updatedby",
  academicqualification as "academicqualification",
  professionalqualificationdetails as "professionalqualificationdetails",
  trainingexperiencemonths as "trainingexperiencemonths",
  updatedon as "updatedon",
  createdon as "createdon",
  dateofbirth as "dateofbirth",
  createdby as "createdby",
  socialcategory as "socialcategory",
  firstname as "firstname",
  middlename as "middlename",
  mobile as "mobile",
  vtpid as "vtpid",
  professionalqualification as "professionalqualification",
  mobile1 as "mobile1",
  aadhaarnumber as "aadhaarnumber",
  dateofjoining as "dateofjoining",
  fullname as "fullname",
  lastname as "lastname",
  natureofappointment as "natureofappointment",
  dateofresignation as "dateofresignation",
  _airbyte_vocationaltrainers_hashid as "_airbyte_vocationaltrainers_hashid",
  _airbyte_emitted_at as "_airbyte_emitted_at",
  _airbyte_normalized_at as "_airbyte_normalized_at"
FROM {{source('source_lahi','vocational_trainers')}}
