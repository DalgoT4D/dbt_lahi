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
,_airbyte_data::json->>'SchoolId' as "school_id"
,_airbyte_data::json->>'AcademicYearId' as "academic_year_id"
,_airbyte_data::json->>'CreatedOn' as "created_on"
,_airbyte_data::json->>'HMId' as "hmid"
,_airbyte_data::json->>'UpdatedBy' as "updated_by"
,_airbyte_data::json->>'HMSchoolId' as "hmschool_id"
,_airbyte_data::json->>'IsActive' as "is_active"
,_airbyte_data::json->>'CreatedBy' as "created_by"
,_airbyte_data::json->>'DateOfResignation' as "date_of_resignation"
,_airbyte_data::json->>'DateOfJoining' as "date_of_joining"
FROM {{source('source_lahi','hm_schools_map')}}
