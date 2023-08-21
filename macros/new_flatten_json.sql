{% macro new_flatten_json(model_names, json_column) %}
  {% set survey_methods_query %}
    SELECT DISTINCT(jsonb_object_keys({{ json_column }})) as column_name
    FROM {{ model_names | join(', ') }}
  {% endset %}

  {% set results = run_query(survey_methods_query) %}

  {% if execute %}
    {# Return the first column #}
    {% set results_list = results.columns[0].values() %}
  {% else %}
    {% set results_list = [] %}
  {% endif %}

  SELECT
    _airbyte_ab_id,
    {% for column_name in results_list %}
      {{ json_column }}->>'{{ column_name }}' as {{ column_name | replace('/', '_') | replace('-', '_') }}{% if not loop.last %},{% endif %}
    {% endfor %},
    {{ json_column }}->>'voc_school_details/voc_school_details_db_student_details_3_stud' as vocshooldetailsvocschool
  FROM {{ model_names | join(', ') }}
{% endmacro %}
