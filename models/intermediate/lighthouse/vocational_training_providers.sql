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
,_airbyte_data::json->>'PrimaryContactPerson' as "primary_contact_person"
,_airbyte_data::json->>'VTPAddress' as "vtpaddress"
,_airbyte_data::json->>'ApprovalYear' as "approval_year"
,_airbyte_data::json->>'VTPName' as "vtpname"
,_airbyte_data::json->>'VTPMobileNo' as "vtpmobile_no"
,_airbyte_data::json->>'VTPShortName' as "vtpshort_name"
,_airbyte_data::json->>'UpdatedBy' as "updated_by"
,_airbyte_data::json->>'VTPStateCoordinator' as "vtpstate_coordinator"
,_airbyte_data::json->>'VTPStateCoordinatorEmail' as "vtpstate_coordinator_email"
,_airbyte_data::json->>'UpdatedOn' as "updated_on"
,_airbyte_data::json->>'VTPStateCoordinatorMobile' as "vtpstate_coordinator_mobile"
,_airbyte_data::json->>'PrimaryMobileNumber' as "primary_mobile_number"
,_airbyte_data::json->>'CertificationNo' as "certification_no"
,_airbyte_data::json->>'VTPEmailId' as "vtpemail_id"
,_airbyte_data::json->>'PrimaryContactEmail' as "primary_contact_email"
,_airbyte_data::json->>'CreatedBy' as "created_by"
,_airbyte_data::json->>'VTPId' as "vtpid"
,_airbyte_data::json->>'CreatedOn' as "created_on"
,_airbyte_data::json->>'IsActive' as "is_active"
,_airbyte_data::json->>'CertificationAgency' as "certification_agency"
FROM {{source('source_lahi','vocational_training_providers')}}
