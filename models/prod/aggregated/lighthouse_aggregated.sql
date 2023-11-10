{{ config(
  materialized='table'
) }}

SELECT
    SC.dateofenrollment AS dateofenrollment,
    AY.yearname AS academic_year,
    ST.statename AS state,
    SC.studentid AS student_id,
    CASE 
        WHEN CAST(SC.gender AS INTEGER) = 207 THEN 'M'
        WHEN CAST(SC.gender AS INTEGER) = 208 THEN 'F'
        ELSE 'Unknown' 
    END AS gender,
    S.udise AS school_id_udi,
    S.schoolname AS school_name,
    SHC.categoryname AS school_category,
    S.isactive AS school_status,
    SE.sectorname AS sector_name,
    VTP.vtpname AS vtp,
    VT.fullname AS vt_name,
    VT.isactive AS vt_status,
    JR.jobrolename AS job_role
FROM {{ ref('student_classes') }} SC
LEFT JOIN {{ ref('academic_years') }} AY ON SC.academicyearid = AY.academicyearid
LEFT JOIN {{ ref('schools') }} S ON SC.schoolid = S.schoolid
LEFT JOIN {{ ref('states') }} ST ON S.statecode = ST.statecode
LEFT JOIN {{ ref('school_categories') }} SHC ON S.schoolcategoryid = SHC.schoolcategoryid
LEFT JOIN {{ ref('student_class_details') }} SCD ON SC.studentid = SCD.studentid
LEFT JOIN {{ ref('sectors') }} SE ON SCD.sectorid = SE.sectorid
LEFT JOIN {{ ref('vt_class_students') }} VCS ON SC.studentid = VCS.studentid
LEFT JOIN {{ ref('vocational_trainers') }} VT ON VCS.vtid = VT.vtid
LEFT JOIN {{ ref('vocational_training_providers') }} VTP ON VT.vtpid = VTP.vtpid
LEFT JOIN {{ ref('job_roles') }} JR ON SCD.jobroleid = JR.jobroleid
WHERE AY.yearname = '2022-2023'
  AND (SC.dateofenrollment BETWEEN '2022-06-06' AND '2023-06-06')
  AND (SC.dateofdropout IS NULL OR SC.dateofdropout < '2022-06-06' OR SC.dateofdropout > '2023-06-06')
