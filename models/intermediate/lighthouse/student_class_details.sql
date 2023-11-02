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
,_airbyte_data::json->>'AadhaarNumber' as "aadhaar_number"
,_airbyte_data::json->>'StudentRollNumber' as "student_roll_number"
,_airbyte_data::json->>'CreatedOn' as "created_on"
,_airbyte_data::json->>'FatherName' as "father_name"
,_airbyte_data::json->>'MotherName' as "mother_name"
,_airbyte_data::json->>'Religion' as "religion"
,_airbyte_data::json->>'Mobile' as "mobile"
,_airbyte_data::json->>'SocialCategory' as "social_category"
,_airbyte_data::json->>'JobRoleId' as "job_role_id"
,_airbyte_data::json->>'UpdatedBy' as "updated_by"
,_airbyte_data::json->>'GuardianName' as "guardian_name"
,_airbyte_data::json->>'IsActive' as "is_active"
,_airbyte_data::json->>'StreamId' as "stream_id"
,_airbyte_data::json->>'IsSameStudentTrade' as "is_same_student_trade"
,_airbyte_data::json->>'Mobile1' as "mobile1"
,_airbyte_data::json->>'CreatedBy' as "created_by"
,_airbyte_data::json->>'CWSNStatus' as "cwsnstatus"
,_airbyte_data::json->>'SectorId' as "sector_id"
,_airbyte_data::json->>'AssessmentConducted' as "assessment_conducted"
,_airbyte_data::json->>'IsStudentVE9And10' as "is_student_ve9and10"
,_airbyte_data::json->>'StudentId' as "student_id"
,_airbyte_data::json->>'DateOfBirth' as "date_of_birth"
,_airbyte_data::json->>'WhatsAppNo' as "whats_app_no"
FROM {{source('source_lahi','student_class_details')}}
