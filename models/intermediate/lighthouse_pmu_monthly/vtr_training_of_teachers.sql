{{ 
  config(
    materialized='table',
    indexes=[
      {'columns': ['_airbyte_ab_id'], 'type': 'hash'}
    ]
  ) 
}}

SELECT
  updatedby as "updatedby",
  trainingby as "trainingby",
  createdby as "createdby",
  trainingdetails as "trainingdetails",
  isactive as "isactive",
  vtdailyreportingid as "vtdailyreportingid",
  vtrtrainingofteacherid as "vtrtrainingofteacherid",
  updatedon as "updatedon",
  createdon as "createdon",
  trainingtypeid as "trainingtypeid",
  _airbyte_ab_id as "_airbyte_ab_id",
  _airbyte_emitted_at as "_airbyte_emitted_at",
  _airbyte_normalized_at as "_airbyte_normalized_at",
  _airbyte_vtrtrainingofteachers_hashid as "_airbyte_vtrtrainingofteachers_hashid"
FROM {{ source('source_lahi', 'vtr_training_of_teachers') }}
