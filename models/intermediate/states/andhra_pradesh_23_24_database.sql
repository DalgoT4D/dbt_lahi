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


with mycte as (
{{
    flatten_json(
        model_names = [
                        source('source_lahi', 'andhra_pradesh_23_24_database'), 
                ],
        json_column = '_airbyte_data'
    )
}})


    -- Assuming 'mycte' is a common table expression (CTE) or a table/view containing the mentioned columns

-- Transforming the data based on specified mappings
SELECT 
    _airbyte_ab_id,
    "Enrolment_Status_11_12_" as "enrolment_status_11_12",
    "VC_Email_Id" as "vc_email_id",
    "HM_Name" as "hm_name",
    "Block" as "block",
    "School_Funded_Under" as "school_funded_under",
    "Job_Role_For_Class_11_and_12_" as "lahi_job_role_11_and_12",
    "12Boys" as "boys_12",
    "Hub_Spoke_Identifier" as "hub_spoke_identifier",
    "HM_Email_Id_" as "hm_email_id",
    "Sector_Trade" as "sector_trade",
    "11_Total" as "total_11",
    "10Girls" as "girls_10",
    "School_Category" as "school_category",
    "VT_Name" as "vt_name",
    "10Boys" as "boys_10",
    "LAB" as "lab",
    "PM_Shri_Identifier" as "pm_shri_identifier",
    "VC_Phone_Number" as "vc_phone_number",
    "9Girls" as "girls_9",
    "VC_Name" as "vc_name",
    "Year_of_Approval" as "year_of_approval",
    "School_ID_UDI" as "school_id_udi",
    "12_Total" as "total_12",
    "State" as "state",
    "CWSN_Identifier" as "cwsn_identifier",
    "11Boys" as "boys_11",
    "VT_Mobile_Number" as "vt_mobile_number",
    "KGBV_School_Identifier" as "kgbv_school_identifier",
    "District" as "district",
    "VTP" as "vtp",
    "9Boys" as "boys_9",
    "Grand_Total" as "grand_total",
    "12Girls" as "girls_12",
    "Academic_Year" as "academic_year",
    "Total_Boys" as "total_boys",
    "HM_Phone_Number" as "hm_phone_number",
    "Job_Role_For_Class_9_and_10_" as "lahi_job_role_9_and_10",
    "Year_of_Implementation" as "year_of_implementation",
    "VT_Email_Id" as "vt_email_id",
    "School_Management" as "school_management",
    "School_Status" as "school_status",
    "10_Total" as "total_10",
    "SoE_SOAL_Identifier" as "soe_soal_identifier",
    "School_Type" as "school_type",
    "School_Name" as "school_name",
    "11Girls" as "girls_11",
    "Year_of_Approval_under_PM_Shri" as "year_of_approval_pm_shri",
    "Enrolment_Status_9_10_" as "enrolment_status_9_10",
    -- "School_Sector_Type
    -- _
    -- _Single_Double_Triple" as "school_sector_type",
    "VT_Status" as "vt_status",
    "9_Total" as "total_9",
    "Gender" as "gender",
    "Division" as "division",
    "Total_Girls" as "total_girls",
    "Year_of_Approval_under_Hub_Spoke" as "year_of_approval_hub_spoke"
FROM mycte
