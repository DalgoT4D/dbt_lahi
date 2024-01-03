{{ config(
  materialized='table'
) }}


with mycte as (
{{
    flatten_json(
        model_names = [
                        source('source_lahi', 'rajasthan_database'), 
                ],
        json_column = '_airbyte_data'
    )
}})


SELECT
    "S.No" AS "sno",
    "VC_Email_Id" AS "vc_email",
    "HM_Name" AS "hm_name",
    "Block" AS "block",
    "Job_Role_For_Class_11_and_12_" AS "lahi_job_role_11_and_12",
    "Remarks" AS "remarks",
    "12Boys" AS "boys_12",
    "HM_Email_Id_" AS "hm_email",
    "Sector_Trade" AS "sector_trade",
    "11_Total" AS "total_11",
    "10Girls" AS "girls_10",
    "School_Category" AS "school_category",
    "VT_Name" AS "vt_name",
    "10Boys" AS "boys_10",
    "LAB" AS "lab",
    "PO_Email_Id" AS "po_email",
    "VC_Phone_Number" AS "vc_phone",
    "9Girls" AS "girls_9",
    "Books_Class_9" AS "books_9",
    "A.Y" AS "a_y",
    "VC_Name" AS "vc_name",
    "Year_of_Approval" AS "approval_year",
    "School_ID_UDI" AS "school_id_udi",
    "12_Total" AS "total_12",
    "State" AS "state",
    "11Boys" AS "boys_11",
    "VT_Mobile_Number" AS "vt_mobile",
    "District" AS "district",
    "VTP" AS "vtp",
    "le_Trade,_ICT_Schools,_Aspirational_District_school,_KGBV,_Hub_" AS "trade_kgbv_hub",
    "9Boys" AS "boys_9",
    "Grand_Total" AS "grand_total",
    "12Girls" AS "girls_12",
    "Academic_Year" AS "academic_year",
    "Total_Boys" AS "total_boys",
    "HM_Phone_Number" AS "hm_phone",
    "Job_Role_For_Class_9_and_10_" AS "lahi_job_role_9_and_10",
    "Books_Class_11" AS "books_11",
    "VT_Email_Id" AS "vt_email",
    "School_Management" AS "school_management",
    "School_Status" AS "school_status",
    "10_Total" AS "total_10",
    "School_Type" AS "school_type",
    "PO_Mob_Number" AS "po_mobile",
    "School_Name" AS "school_name",
    "11Girls" AS "girls_11",
    "PO_Name_Samagra_Shiksha_District_Coordinator_" AS "po_name",
    "Books_Class_10" AS "books_10",
    -- "School_Sector_Type__Single_Double_Triple" AS "sector_type",
    "VT_Status" AS "vt_status",
    "9_Total" AS "total_9",
    "Books_Class_12" AS "books_12",
    "Gender" AS "gender",
    "Division" AS "division",
    "Total_Girls" AS "total_girls"
FROM mycte
