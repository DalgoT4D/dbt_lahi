{{ 
  config(
    materialized='table',
    indexes=[
      {'columns': ['_airbyte_ab_id'], 'type': 'hash'}
    ]
  ) 
}}

SELECT
  fvcontactpersonname as "fvcontactpersonname",
  academicyearid as "academicyearid",
  isactive as "isactive",
  fvorganisationaddress as "fvorganisationaddress",
  latitude as "latitude",
  fvorganisation as "fvorganisation",
  fvcontactpersonemail as "fvcontactpersonemail",
  approvalstatus as "approvalstatus",
  vtid as "vtid",
  updatedby as "updatedby",
  remarks as "remarks",
  sectiontaughtid as "sectiontaughtid",
  fieldvisitactivities as "fieldvisitactivities",
  updatedon as "updatedon",
  createdon as "createdon",
  feedbackfromorgnisation as "feedbackfromorgnisation",
  createdby as "createdby",
  approveddate as "approveddate",
  fvcontactpersondesignation as "fvcontactpersondesignation",
  fvpicture as "fvpicture",
  fvorganisationintereststatus as "fvorganisationintereststatus",
  longitude as "longitude",
  vtschoolsectorid as "vtschoolsectorid",
  fvcontactpersonmobile as "fvcontactpersonmobile",
  fvorignisationojtstatus as "fvorignisationojtstatus",
  reportingdate as "reportingdate",
  fvdistance as "fvdistance",
  geolocation as "geolocation",
  classtaughtid as "classtaughtid",
  fieldvisittheme as "fieldvisittheme",
  vtfieldindustryvisitconductedid as "vtfieldindustryvisitconductedid",
  _airbyte_ab_id as "_airbyte_ab_id",
  _airbyte_emitted_at as "_airbyte_emitted_at",
  _airbyte_normalized_at as "_airbyte_normalized_at",
  _airbyte_vtfieldindu__visitconducted_hashid as "_airbyte_vtfieldindu__visitconducted_hashid"
FROM {{ source('source_lahi', 'vt_field_industry_visit_conducted') }}
