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
isdcode as "isdcode",
countryname as "countryname",
createdby as "createdby",
updatedon as "updatedon",
_airbyte_countries_hashid as "_airbyte_countries_hashid",
countrycode as "countrycode",
countryicon as "countryicon",
description as "description",
isocode as "isocode",
_airbyte_normalized_at as "_airbyte_normalized_at",
currencyname as "currencyname",
isactive as "isactive",
updatedby as "updatedby",
createdon as "createdon",
currencycode as "currencycode",
_airbyte_emitted_at as "_airbyte_emitted_at"
FROM {{source('source_lahi','countries')}}
