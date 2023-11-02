--DBT AUTOMATION has generated this model, please DO NOT EDIT 
--Please make sure you dont change the model name 


{{ 
  config(
    materialized='table',
    indexes=[
      {'columns': ['_airbyte_ab_id'], 'type': 'hash'}
    ]
  ) 
}}
    SELECT _airbyte_ab_id 
,_airbyte_data::json->>'UpdatedBy' as "updated_by"
,_airbyte_data::json->>'UpdatedOn' as "updated_on"
,_airbyte_data::json->>'SchoolCategoryId' as "school_category_id"
,_airbyte_data::json->>'IsActive' as "is_active"
,_airbyte_data::json->>'CreatedBy' as "created_by"
,_airbyte_data::json->>'CreatedOn' as "created_on"
,_airbyte_data::json->>'Description' as "description"
,_airbyte_data::json->>'CategoryName' as "category_name"
FROM {{source('source_lahi','school_categories')}}
