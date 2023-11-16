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
  reportingmonth as "reportingmonth",
  districtid as "districtid",
  vcschoolsectorid as "vcschoolsectorid",
  schoolmanagementid as "schoolmanagementid",
  dscoordinatorattendanceid as "dscoordinatorattendanceid",
  divisionid as "divisionid",
  vtpid as "vtpid",
  vcreporting as "vcreporting",
  createdon as "createdon",
  sectorid as "sectorid",
  schoolid as "schoolid",
  workingdays as "workingdays",
  _airbyte_ab_id as "_airbyte_ab_id",
  _airbyte_emitted_at as "_airbyte_emitted_at",
  _airbyte_normalized_at as "_airbyte_normalized_at",
  _airbyte_dscoordinatorattendances_hashid as "_airbyte_dscoordinatorattendances_hashid"
FROM {{ source('source_lahi', 'ds_coordinator_attendances') }}
