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
,_airbyte_data::json->>'UpdatedBy' as "updated_by"
,_airbyte_data::json->>'UpdatedOn' as "updated_on"
,_airbyte_data::json->>'SectorId' as "sector_id"
,_airbyte_data::json->>'VTPId' as "vtpid"
,_airbyte_data::json->>'IsActive' as "is_active"
,_airbyte_data::json->>'AcademicYearId' as "academic_year_id"
,_airbyte_data::json->>'Remarks' as "remarks"
,_airbyte_data::json->>'VTPSectorId' as "vtpsector_id"
,_airbyte_data::json->>'IsAYRollover' as "is_ayrollover"
,_airbyte_data::json->>'CreatedBy' as "created_by"
,_airbyte_data::json->>'CreatedOn' as "created_on"
FROM {{source('source_lahi','vtp_sectors')}}
