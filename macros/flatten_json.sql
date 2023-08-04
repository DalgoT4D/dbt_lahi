{% macro flatten_json(model_names, json_column) %}

{% set combined_models_query %}
SELECT * FROM (
    {% for model_name in model_names %}
        SELECT * FROM {{ model_name }}{% if not loop.last %} UNION ALL {% endif %}
    {% endfor %}
) AS combined_models
{% endset %}

{% set survey_methods_query %}
SELECT DISTINCT(jsonb_object_keys({{ json_column }})) as column_name
FROM ({{ combined_models_query }}) AS combined_models
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
        {% set transformed_column_name = column_name | 
               replace('11Boys', 'boys11') | 
               replace('9Boys', 'boys9') | 
               replace('12Girls', 'Girls12') | 
               replace('10 Total', 'Total 10') | 
               replace('10Girls', 'Girls10') |
               replace('11Girls', 'Girls 11')  |
               replace('10Boys', 'Boys 10')  |
               replace('9Girls', 'Girls 9')  |
               replace('12 Total', 'Total 12')  |
               replace('/', '_') | replace('-', '_') |
               replace(' ', '_') | replace('.', '_') 
               %}

        {% set prefix = '' %}
        {% set suffix = '' %}
        {% set found_non_digit = false %}
        {% set ignore_parentheses = false %}
        {% for char in column_name %}
            {% if char == '(' %}
                {% set ignore_parentheses = true %}
            {% elif char == ')' %}
                {% set ignore_parentheses = false %}
            {% endif %}
            {% if not char.isdigit() and not ignore_parentheses %}
                {% set found_non_digit = true %}
            {% endif %}
            {% if found_non_digit and not ignore_parentheses %}
                {% set suffix = suffix + char %}
            {% else %}
                {% set prefix = prefix + char %}
            {% endif %}
        {% endfor %}
        {% if prefix %}
            _{{ transformed_column_name | replace(prefix, '') }}{{ suffix }} "{{ prefix }}",
        {% else %}
            {{ json_column }}->>'{{ column_name }}' AS {{ transformed_column_name }}{% if not loop.last %},{% endif %}
        {% endif %}
    {% endfor %}
FROM ({{ combined_models_query }}) AS combined_models
{% endmacro %}
