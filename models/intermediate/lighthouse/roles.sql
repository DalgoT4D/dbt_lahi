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
description as "description",
landingpageurl as "landingpageurl",
_airbyte_normalized_at as "_airbyte_normalized_at",
isactive as "isactive",
remarks as "remarks",
"Name" as "name",
code as "code",
updatedby as "updatedby",
createdon as "createdon",
_airbyte_emitted_at as "_airbyte_emitted_at",
roleid as "roleid",
_airbyte_roles_hashid as "_airbyte_roles_hashid"
FROM {{source('source_lahi','roles')}}
