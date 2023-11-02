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
,_airbyte_data::json->>'UpdatedOn' as "updated_on"
,_airbyte_data::json->>'AcademicYearId' as "academic_year_id"
,_airbyte_data::json->>'SchoolVTPSectorId' as "school_vtpsector_id"
,_airbyte_data::json->>'CreatedOn' as "created_on"
,_airbyte_data::json->>'VCId' as "vcid"
,_airbyte_data::json->>'UpdatedBy' as "updated_by"
,_airbyte_data::json->>'VCSchoolSectorId' as "vcschool_sector_id"
,_airbyte_data::json->>'IsActive' as "is_active"
,_airbyte_data::json->>'CreatedBy' as "created_by"
,_airbyte_data::json->>'DateOfRemoval' as "date_of_removal"
,_airbyte_data::json->>'DateOfAllocation' as "date_of_allocation"
,_airbyte_data::json->>'IsAYRollover' as "is_ayrollover"
FROM {{source('source_lahi','vc_school_sectors')}}
