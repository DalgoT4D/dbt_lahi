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
  vtid as "vtid",
  updatedby as "updatedby",
  createdby as "createdby",
  dateofjoining as "dateofjoining",
  isactive as "isactive",
  updatedon as "updatedon",
  createdon as "createdon",
  vtpid as "vtpid",
  dateofresignation as "dateofresignation",
  _airbyte_ab_id as "_airbyte_ab_id",
  _airbyte_emitted_at as "_airbyte_emitted_at",
  _airbyte_normalized_at as "_airbyte_normalized_at",
  _airbyte_coordinatortrainers_hashid as "_airbyte_coordinatortrainers_hashid"
FROM {{ source('source_lahi', 'coordinator_trainers') }}
