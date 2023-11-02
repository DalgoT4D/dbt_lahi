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
    SELECT _airbyte_ab_id 
,_airbyte_data::json->>'VTSchoolSectorJobRoleId' as "vtschool_sector_job_role_id"
,_airbyte_data::json->>'JobRoleId' as "job_role_id"
,_airbyte_data::json->>'CreatedBy' as "created_by"
,_airbyte_data::json->>'CreatedOn' as "created_on"
,_airbyte_data::json->>'IsActive' as "is_active"
,_airbyte_data::json->>'VTSchoolSectorId' as "vtschool_sector_id"
FROM {{source('source_lahi','vt_school_sector_job_roles')}}
