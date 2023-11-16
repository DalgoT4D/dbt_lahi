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
  reportedvt as "reportedvt",
  totalvt as "totalvt",
  jobroleid as "jobroleid",
  classid as "classid",
  schoolmanagementid as "schoolmanagementid",
  divisionid as "divisionid",
  vtpid as "vtpid",
  createdon as "createdon",
  placedvt as "placedvt",
  sectorid as "sectorid",
  dstrainerid as "dstrainerid",
  _airbyte_ab_id as "_airbyte_ab_id",
  _airbyte_emitted_at as "_airbyte_emitted_at",
  _airbyte_normalized_at as "_airbyte_normalized_at",
  _airbyte_dstrainers_hashid as "_airbyte_dstrainers_hashid"
FROM {{ source('source_lahi', 'ds_trainers') }}
