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
_airbyte_schoolveincharges_hashid as "_airbyte_schoolveincharges_hashid",
lastname as "lastname",
createdby as "createdby",
mobile1 as "mobile1",
_airbyte_ab_id as "_airbyte_ab_id",
updatedon as "updatedon",
vtid as "vtid",
_airbyte_normalized_at as "_airbyte_normalized_at",
isactive as "isactive",
updatedby as "updatedby",
createdon as "createdon",
veiid as "veiid",
schoolid as "schoolid",
firstname as "firstname",
dateofjoining as "dateofjoining",
email as "email",
gender as "gender",
fullname as "fullname",
dateofresignationfromroleschool as "dateofresignationfromroleschool",
middlename as "middlename",
_airbyte_emitted_at as "_airbyte_emitted_at",
mobile as "mobile"
FROM {{source('source_lahi','school_ve_incharges')}}
