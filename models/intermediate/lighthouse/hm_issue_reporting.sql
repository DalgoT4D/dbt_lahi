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
    SELECT
subissue as "subissue",
latitude as "latitude",
createdby as "createdby",
studenttype as "studenttype",
issuereportdate as "issuereportdate",
issuemappingid as "issuemappingid",
_airbyte_ab_id as "_airbyte_ab_id",
"Month" as "month",
_airbyte_hmissuereporting_hashid as "_airbyte_hmissuereporting_hashid",
longitude as "longitude",
updatedon as "updatedon",
approveddate as "approveddate",
studentclass as "studentclass",
_airbyte_normalized_at as "_airbyte_normalized_at",
isactive as "isactive",
hmid as "hmid",
updatedby as "updatedby",
createdon as "createdon",
hmissuereportingid as "hmissuereportingid",
remarks as "remarks",
academicyearid as "academicyearid",
noofstudents as "noofstudents",
geolocation as "geolocation",
approvalstatus as "approvalstatus",
issuedetails as "issuedetails",
mainissue as "mainissue",
_airbyte_emitted_at as "_airbyte_emitted_at"
FROM {{source('source_lahi','hm_issue_reporting')}}
