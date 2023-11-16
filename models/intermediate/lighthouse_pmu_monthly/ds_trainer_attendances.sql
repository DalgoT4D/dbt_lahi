{{ 
  config(
    materialized='table',
    indexes=[
      {'columns': ['_airbyte_ab_id'], 'type': 'hash'}
    ]
  ) 
}}

SELECT
  vtreporting as "vtreporting",
  vtid as "vtid",
  academicyearid as "academicyearid",
  observationday as "observationday",
  dstrainerattendanceid as "dstrainerattendanceid",
  reportingmonth as "reportingmonth",
  holiday as "holiday",
  onleave as "onleave",
  createdon as "createdon",
  vtpid as "vtpid",
  workingdays as "workingdays",
  vtschoolsectorid as "vtschoolsectorid",
  _airbyte_ab_id as "_airbyte_ab_id",
  _airbyte_emitted_at as "_airbyte_emitted_at",
  _airbyte_normalized_at as "_airbyte_normalized_at",
  _airbyte_dstrainerattendances_hashid as "_airbyte_dstrainerattendances_hashid"
FROM {{ source('source_lahi', 'ds_trainer_attendances') }}
