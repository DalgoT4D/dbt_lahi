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
,_airbyte_data::json->>'YearCode' as "year_code"
,_airbyte_data::json->>'IsActive' as "is_active"
,_airbyte_data::json->>'AcademicYearId' as "academic_year_id"
,_airbyte_data::json->>'PhaseId' as "phase_id"
,_airbyte_data::json->>'CreatedBy' as "created_by"
,_airbyte_data::json->>'CreatedOn' as "created_on"
,_airbyte_data::json->>'Description' as "description"
,_airbyte_data::json->>'IsCurrentAcademicYear' as "is_current_academic_year"
,_airbyte_data::json->>'EndMonth' as "end_month"
,_airbyte_data::json->>'StartMonth' as "start_month"
,_airbyte_data::json->>'YearName' as "year_name"
FROM {{source('source_lahi','academic_years')}}
