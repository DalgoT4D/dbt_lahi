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
,_airbyte_data::json->>'Village' as "village"
,_airbyte_data::json->>'UpdatedOn' as "updated_on"
,_airbyte_data::json->>'SchoolId' as "school_id"
,_airbyte_data::json->>'SchoolCategoryId' as "school_category_id"
,_airbyte_data::json->>'AcademicYearId' as "academic_year_id"
,_airbyte_data::json->>'SchoolManagementId' as "school_management_id"
,_airbyte_data::json->>'UDISE' as "udise"
,_airbyte_data::json->>'StateCode' as "state_code"
,_airbyte_data::json->>'SchoolTypeId' as "school_type_id"
,_airbyte_data::json->>'CreatedOn' as "created_on"
,_airbyte_data::json->>'Demography' as "demography"
,_airbyte_data::json->>'IsImplemented' as "is_implemented"
,_airbyte_data::json->>'UpdatedBy' as "updated_by"
,_airbyte_data::json->>'SchoolName' as "school_name"
,_airbyte_data::json->>'BlockName' as "block_name"
,_airbyte_data::json->>'Panchayat' as "panchayat"
,_airbyte_data::json->>'IsActive' as "is_active"
,_airbyte_data::json->>'PhaseId' as "phase_id"
,_airbyte_data::json->>'CreatedBy' as "created_by"
,_airbyte_data::json->>'DivisionId' as "division_id"
,_airbyte_data::json->>'BlockId' as "block_id"
,_airbyte_data::json->>'DistrictCode' as "district_code"
,_airbyte_data::json->>'Pincode' as "pincode"
FROM {{source('source_lahi','schools')}}
