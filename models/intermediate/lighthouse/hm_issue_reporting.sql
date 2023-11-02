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
,_airbyte_data::json->>'SubIssue' as "sub_issue"
,_airbyte_data::json->>'Longitude' as "longitude"
,_airbyte_data::json->>'UpdatedOn' as "updated_on"
,_airbyte_data::json->>'HMIssueReportingId' as "hmissue_reporting_id"
,_airbyte_data::json->>'Month' as "month"
,_airbyte_data::json->>'ApprovalStatus' as "approval_status"
,_airbyte_data::json->>'IsActive' as "is_active"
,_airbyte_data::json->>'AcademicYearId' as "academic_year_id"
,_airbyte_data::json->>'Remarks' as "remarks"
,_airbyte_data::json->>'IssueReportDate' as "issue_report_date"
,_airbyte_data::json->>'CreatedBy' as "created_by"
,_airbyte_data::json->>'CreatedOn' as "created_on"
,_airbyte_data::json->>'HMId' as "hmid"
,_airbyte_data::json->>'StudentType' as "student_type"
,_airbyte_data::json->>'ApprovedDate' as "approved_date"
,_airbyte_data::json->>'IssueDetails' as "issue_details"
,_airbyte_data::json->>'Latitude' as "latitude"
,_airbyte_data::json->>'NoOfStudents' as "no_of_students"
,_airbyte_data::json->>'StudentClass' as "student_class"
,_airbyte_data::json->>'MainIssue' as "main_issue"
,_airbyte_data::json->>'GeoLocation' as "geo_location"
FROM {{source('source_lahi','hm_issue_reporting')}}
