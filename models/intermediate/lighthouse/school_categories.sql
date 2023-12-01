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
_airbyte_normalized_at as "_airbyte_normalized_at",
isactive as "isactive",
categoryname as "categoryname",
_airbyte_schoolcategories_hashid as "_airbyte_schoolcategories_hashid",
schoolcategoryid as "schoolcategoryid",
updatedby as "updatedby",
createdon as "createdon",
_airbyte_emitted_at as "_airbyte_emitted_at"
FROM {{source('source_lahi','school_categories')}}
