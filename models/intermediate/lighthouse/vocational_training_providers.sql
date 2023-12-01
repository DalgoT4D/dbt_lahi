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
vtpemailid as "vtpemailid",
createdby as "createdby",
primarycontactemail as "primarycontactemail",
primarymobilenumber as "primarymobilenumber",
primarycontactperson as "primarycontactperson",
certificationno as "certificationno",
_airbyte_ab_id as "_airbyte_ab_id",
updatedon as "updatedon",
_airbyte_normalized_at as "_airbyte_normalized_at",
isactive as "isactive",
updatedby as "updatedby",
vtpshortname as "vtpshortname",
createdon as "createdon",
vtpmobileno as "vtpmobileno",
contractapprovaldate as "contractapprovaldate",
certificationagency as "certificationagency",
vtpstatecoordinatormobile as "vtpstatecoordinatormobile",
contractenddate as "contractenddate",
_airbyte_vocationaltrainingproviders_hashid as "_airbyte_vocationaltrainingproviders_hashid",
vtpid as "vtpid",
vtpname as "vtpname",
moudocupload as "moudocupload",
approvalyear as "approvalyear",
vtpstatecoordinatoremail as "vtpstatecoordinatoremail",
vtpstatecoordinator as "vtpstatecoordinator",
_airbyte_emitted_at as "_airbyte_emitted_at",
vtpaddress as "vtpaddress"
FROM {{source('source_lahi','vocational_training_providers')}}
