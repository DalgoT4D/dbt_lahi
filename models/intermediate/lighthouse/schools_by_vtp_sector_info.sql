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
,_airbyte_data::json->>'VTClassId' as "vtclass_id"
,_airbyte_data::json->>'VTId' as "vtid"
,_airbyte_data::json->>'AcademicYearId' as "academic_year_id"
,_airbyte_data::json->>'ImplementedSchoolId' as "implemented_school_id"
,_airbyte_data::json->>'DistrictId' as "district_id"
,_airbyte_data::json->>'DivisionId' as "division_id"
,_airbyte_data::json->>'VTSchoolSectorId' as "vtschool_sector_id"
,_airbyte_data::json->>'SectorId' as "sector_id"
,_airbyte_data::json->>'VCId' as "vcid"
,_airbyte_data::json->>'VTPId' as "vtpid"
,_airbyte_data::json->>'ApprovedSchoolId' as "approved_school_id"
FROM {{source('source_lahi','schools_by_vtp_sector_info')}}
