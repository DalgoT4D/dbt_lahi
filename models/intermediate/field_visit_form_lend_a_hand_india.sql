{{ config(
  materialized='table',
  indexes=[
    {'columns': ['_airbyte_ab_id'], 'type': 'hash'}
  ],
  schema='intermediate'
) }}

WITH my_cte AS (
  {{
    new_flatten_json(
      model_names = [source('source_lahi', 'field_visit_form_lend_a_hand_india_database')],
      json_column = '_airbyte_data'
    )
  }}
)

SELECT
  _airbyte_ab_id,
  "end",
  "_uuid",
  "start",
  "state",
  "today",
  "_status",
  "visit_type",
  "__version__",
  "employee_code",
  "employee_name",
  "school_location",
  date_time_of_Visit,
  other_visit_details_purpose AS Other_Visit_purpose,
  other_visit_details_city_inst AS Other_Visit_city_inst,
  other_visit_details_name_inst AS Other_Visit_name_inst,
  date_time_at_the_end_of_visit,
  other_visit_details_contact_inst AS Other_Visit_contact_inst,
  other_visit_details_district_all AS Other_Visit_district_all,
  other_visit_details_mob_num_inst AS Other_Visit_mob_num_inst,
  other_visit_details_other_notes_all AS Other_Visit_other_notes_all,
  other_visit_details_Designation_inst AS Other_Visit_Designation_inst
FROM my_cte