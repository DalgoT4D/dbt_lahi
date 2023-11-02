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
,_airbyte_data::json->>'StudentUniqueId' as "student_unique_id"
,_airbyte_data::json->>'UpdatedOn' as "updated_on"
,_airbyte_data::json->>'SchoolId' as "school_id"
,_airbyte_data::json->>'LastName' as "last_name"
,_airbyte_data::json->>'AcademicYearId' as "academic_year_id"
,_airbyte_data::json->>'ClassId' as "class_id"
,_airbyte_data::json->>'DropoutReason' as "dropout_reason"
,_airbyte_data::json->>'DateOfDropout' as "date_of_dropout"
,_airbyte_data::json->>'CreatedOn' as "created_on"
,_airbyte_data::json->>'FirstName' as "first_name"
,_airbyte_data::json->>'Mobile' as "mobile"
,_airbyte_data::json->>'UpdatedBy' as "updated_by"
,_airbyte_data::json->>'IsActive' as "is_active"
,_airbyte_data::json->>'VTId' as "vtid"
,_airbyte_data::json->>'SectionId' as "section_id"
,_airbyte_data::json->>'DateOfEnrollment' as "date_of_enrollment"
,_airbyte_data::json->>'CreatedBy' as "created_by"
,_airbyte_data::json->>'DeletedBy' as "deleted_by"
,_airbyte_data::json->>'StudentId' as "student_id"
,_airbyte_data::json->>'MiddleName' as "middle_name"
,_airbyte_data::json->>'DeletedOn' as "deleted_on"
,_airbyte_data::json->>'Gender' as "gender"
,_airbyte_data::json->>'FullName' as "full_name"
FROM {{source('source_lahi','student_classes')}}
