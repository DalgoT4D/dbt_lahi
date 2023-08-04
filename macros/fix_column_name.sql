{% macro fix_column_name(model_name, json_column, target_column, replacement_column) %}

{% set survey_methods_query %}
SELECT DISTINCT(jsonb_object_keys({{ json_column }})) as column_name
FROM {{ model_name }}
{% endset %}

{% set results = run_query(survey_methods_query) %}

{% if execute %}
    {# Return the first column #}
    {% set results_list = results.columns[0].values() %}
{% else %}
    {% set results_list = [] %}
{% endif %}

SELECT
    {% for column_name in results_list %}
        {% if column_name == target_column %}
            {{ json_column }}->>'{{ column_name }}' AS {{ replacement_column }}{% if not loop.last %},{% endif %}
        {% else %}
            {{ json_column }}->>'{{ column_name }}' AS {{ column_name }}{% if not loop.last %},{% endif %}
        {% endif %}
    {% endfor %}
FROM {{ model_name }}
{% endmacro %}
