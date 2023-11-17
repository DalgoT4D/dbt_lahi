{{ config(
  materialized='table'
) }}

SELECT
    AY.yearname AS academic_year,
    ST.statename AS state,
    SCM.studentid AS student_id,
    CASE 
        WHEN CAST(SC.gender AS INTEGER) = 207 THEN 'M'
        WHEN CAST(SC.gender AS INTEGER) = 208 THEN 'F'
        ELSE 'Unknown' 
    END AS gender,
    S.schoolid as school_id,
    S.udise AS school_id_udi,
    S.schoolname AS school_name,
    SHC.categoryname AS school_category,
    S.isactive AS school_status,
    SE.sectorname AS sector_name,
    VT.fullname AS vt_name,
    VT.isactive AS vt_status,
    VTP.vtpname AS vtp,
    JR.jobrolename AS job_role
FROM {{ ref('schools') }} S
LEFT JOIN {{ ref('student_class_mapping') }} SCM ON SCM.schoolid = S.schoolid
LEFT JOIN {{ ref('academic_years') }} AY ON SCM.academicyearid = AY.academicyearid
LEFT JOIN {{ ref('states') }} ST ON S.statecode = ST.statecode
LEFT JOIN {{ ref('student_classes') }} SC ON SCM.studentid = SC.studentid
LEFT JOIN {{ ref('school_categories') }} SHC ON S.schoolcategoryid = SHC.schoolcategoryid
LEFT JOIN {{ ref('student_class_details') }} SCD ON SCM.studentid = SCD.studentid
LEFT JOIN {{ ref('sectors') }} SE ON SCD.sectorid = SE.sectorid
LEFT JOIN {{ ref('vocational_trainers') }} VT ON SCM.vtid = VT.vtid
LEFT JOIN {{ ref('vocational_training_providers') }} VTP ON VT.vtpid = VTP.vtpid
LEFT JOIN {{ ref('job_roles') }} JR ON SCD.jobroleid = JR.jobroleid
WHERE AY.yearname = '2022-2023'
