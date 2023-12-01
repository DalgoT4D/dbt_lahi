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
vtclassid as "vtclassid",
_airbyte_schoolsbyvtpsectorinfo_hashid as "_airbyte_schoolsbyvtpsectorinfo_hashid",
sectorid as "sectorid",
vtid as "vtid",
divisionid as "divisionid",
approvedschoolid as "approvedschoolid",
vtschoolsectorid as "vtschoolsectorid",
_airbyte_normalized_at as "_airbyte_normalized_at",
implementedschoolid as "implementedschoolid",
academicyearid as "academicyearid",
vtpid as "vtpid",
_airbyte_emitted_at as "_airbyte_emitted_at",
districtid as "districtid"
FROM {{source('source_lahi','schools_by_vtp_sector_info')}}
