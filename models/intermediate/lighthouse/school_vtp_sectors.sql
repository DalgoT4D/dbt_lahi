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
schoolid as "schoolid",
sectorid as "sectorid",
updatedon as "updatedon",
schoolvtpsectorid as "schoolvtpsectorid",
vtpid as "vtpid",
_airbyte_normalized_at as "_airbyte_normalized_at",
isactive as "isactive",
remarks as "remarks",
updatedby as "updatedby",
academicyearid as "academicyearid",
createdon as "createdon",
_airbyte_schoolvtpsectors_hashid as "_airbyte_schoolvtpsectors_hashid",
_airbyte_emitted_at as "_airbyte_emitted_at",
isayrollover as "isayrollover"
FROM {{source('source_lahi','school_vtp_sectors')}}
