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
createdby as "createdby",
statecode as "statecode",
schoolname as "schoolname",
blockid as "blockid",
_airbyte_ab_id as "_airbyte_ab_id",
updatedon as "updatedon",
village as "village",
phaseid as "phaseid",
divisionid as "divisionid",
_airbyte_normalized_at as "_airbyte_normalized_at",
isactive as "isactive",
schoolcategoryid as "schoolcategoryid",
updatedby as "updatedby",
blockname as "blockname",
createdon as "createdon",
districtcode as "districtcode",
demography as "demography",
panchayat as "panchayat",
schoolid as "schoolid",
_airbyte_schools_hashid as "_airbyte_schools_hashid",
academicyearid as "academicyearid",
schoolmanagementid as "schoolmanagementid",
isimplemented as "isimplemented",
schooltypeid as "schooltypeid",
udise as "udise",
clusterid as "clusterid",
pincode as "pincode",
_airbyte_emitted_at as "_airbyte_emitted_at"
FROM {{source('source_lahi','schools')}}
