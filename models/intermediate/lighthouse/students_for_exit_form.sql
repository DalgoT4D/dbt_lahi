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
,_airbyte_data::json->>'LastName' as "last_name"
,_airbyte_data::json->>'AcademicYear' as "academic_year"
,_airbyte_data::json->>'Category' as "category"
,_airbyte_data::json->>'NameOfSchool' as "name_of_school"
,_airbyte_data::json->>'CreatedOn' as "created_on"
,_airbyte_data::json->>'FatherName' as "father_name"
,_airbyte_data::json->>'FirstName' as "first_name"
,_airbyte_data::json->>'VTMobile' as "vtmobile"
,_airbyte_data::json->>'VCId' as "vcid"
,_airbyte_data::json->>'VTPName' as "vtpname"
,_airbyte_data::json->>'StudentFullName' as "student_full_name"
,_airbyte_data::json->>'Class' as "class"
,_airbyte_data::json->>'UpdatedBy' as "updated_by"
,_airbyte_data::json->>'District' as "district"
,_airbyte_data::json->>'Sector' as "sector"
,_airbyte_data::json->>'IsActive' as "is_active"
,_airbyte_data::json->>'VTId' as "vtid"
,_airbyte_data::json->>'VTName' as "vtname"
,_airbyte_data::json->>'CreatedBy' as "created_by"
,_airbyte_data::json->>'UdiseCode' as "udise_code"
,_airbyte_data::json->>'ExitStudentId' as "exit_student_id"
,_airbyte_data::json->>'VTPId' as "vtpid"
,_airbyte_data::json->>'JobRole' as "job_role"
,_airbyte_data::json->>'MiddleName' as "middle_name"
,_airbyte_data::json->>'DOB' as "dob"
,_airbyte_data::json->>'Gender' as "gender"
,_airbyte_data::json->>'VCName' as "vcname"
FROM {{source('source_lahi','students_for_exit_form')}}
