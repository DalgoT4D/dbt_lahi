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
    SELECT
whatsappno as "whatsappno",
createdby as "createdby",
guardianname as "guardianname",
mothername as "mothername",
dateofbirth as "dateofbirth",
mobile1 as "mobile1",
_airbyte_ab_id as "_airbyte_ab_id",
jobroleid as "jobroleid",
updatedon as "updatedon",
sectorid as "sectorid",
issamestudenttrade as "issamestudenttrade",
aadhaarnumber as "aadhaarnumber",
_airbyte_normalized_at as "_airbyte_normalized_at",
isactive as "isactive",
cwsnstatus as "cwsnstatus",
updatedby as "updatedby",
createdon as "createdon",
isstudentve9and10 as "isstudentve9and10",
religion as "religion",
fathername as "fathername",
studentrollnumber as "studentrollnumber",
_airbyte_studentclassdetails_hashid as "_airbyte_studentclassdetails_hashid",
socialcategory as "socialcategory",
assessmentconducted as "assessmentconducted",
studentid as "studentid",
_airbyte_emitted_at as "_airbyte_emitted_at",
streamid as "streamid",
mobile as "mobile"
FROM {{source('source_lahi','student_class_details')}}
