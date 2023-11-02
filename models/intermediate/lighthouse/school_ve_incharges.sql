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
,_airbyte_data::json->>'DateOfJoining' as "date_of_joining"
,_airbyte_data::json->>'DateOfResignationFromRoleSchool' as "date_of_resignation_from_role_school"
,_airbyte_data::json->>'Email' as "email"
,_airbyte_data::json->>'UpdatedBy' as "updated_by"
,_airbyte_data::json->>'UpdatedOn' as "updated_on"
,_airbyte_data::json->>'MiddleName' as "middle_name"
,_airbyte_data::json->>'FirstName' as "first_name"
,_airbyte_data::json->>'Mobile' as "mobile"
,_airbyte_data::json->>'SchoolId' as "school_id"
,_airbyte_data::json->>'VEIId' as "veiid"
,_airbyte_data::json->>'LastName' as "last_name"
,_airbyte_data::json->>'Mobile1' as "mobile1"
,_airbyte_data::json->>'Gender' as "gender"
,_airbyte_data::json->>'FullName' as "full_name"
,_airbyte_data::json->>'CreatedBy' as "created_by"
,_airbyte_data::json->>'CreatedOn' as "created_on"
,_airbyte_data::json->>'IsActive' as "is_active"
,_airbyte_data::json->>'VTId' as "vtid"
FROM {{source('source_lahi','school_ve_incharges')}}
