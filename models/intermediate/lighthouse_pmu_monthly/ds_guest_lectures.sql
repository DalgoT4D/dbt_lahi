{{ 
  config(
    materialized='table',
    indexes=[
      {'columns': ['_airbyte_ab_id'], 'type': 'hash'}
    ]
  ) 
}}

SELECT
  vcid as "vcid",
  academicyearid as "academicyearid",
  districtid as "districtid",
  jobroleid as "jobroleid",
  dsguestlectureid as "dsguestlectureid",
  classid as "classid",
  schoolmanagementid as "schoolmanagementid",
  divisionid as "divisionid",
  vtpid as "vtpid",
  guestlecturecount as "guestlecturecount",
  vtid as "vtid",
  noofschoolclasses as "noofschoolclasses",
  createdon as "createdon",
  reportmonth as "reportmonth",
  sectorid as "sectorid",
  classtaughtid as "classtaughtid",
  schoolid as "schoolid",
  _airbyte_ab_id as "_airbyte_ab_id",
  _airbyte_emitted_at as "_airbyte_emitted_at",
  _airbyte_normalized_at as "_airbyte_normalized_at",
  _airbyte_dsguestlectures_hashid as "_airbyte_dsguestlectures_hashid"
FROM {{ source('source_lahi', 'ds_guest_lectures') }}
