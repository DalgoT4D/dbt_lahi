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
,_airbyte_data::json->>'ClassId' as "class_id"
,_airbyte_data::json->>'StudentRollNumber' as "student_roll_number"
,_airbyte_data::json->>'StudentClassMappingId' as "student_class_mapping_id"
,_airbyte_data::json->>'CreatedOn' as "created_on"
,_airbyte_data::json->>'UpdatedBy' as "updated_by"
,_airbyte_data::json->>'IsActive' as "is_active"
,_airbyte_data::json->>'VTId' as "vtid"
,_airbyte_data::json->>'SectionId' as "section_id"
,_airbyte_data::json->>'CreatedBy' as "created_by"
,_airbyte_data::json->>'StudentId' as "student_id"
,_airbyte_data::json->>'IsAYRollover' as "is_ayrollover"
FROM {{source('source_lahi','student_class_mapping')}}
