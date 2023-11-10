{{ config(
  materialized='table'
) }}

SELECT
    S.udise AS school_id_udi,
    S.schoolname AS school_name,
    SC.fullname as student_name,
    CASE 
        WHEN CAST(SC.gender AS INTEGER) = 207 THEN 'M'
        WHEN CAST(SC.gender AS INTEGER) = 208 THEN 'F'
        ELSE 'Unknown' 
    END AS gender,
    SHC.categoryname AS school_category,
    ST.statename AS state,
    SE.sectorname AS sector_name,
    VTP.vtpname AS vtp,
    VT.fullname AS vt_name,
    VT.isactive AS vt_status,
    JR.jobrolename AS job_role,
    COUNT(SC.studentid) AS total_students
FROM {{ ref('schools') }} S
LEFT JOIN {{ ref('student_classes') }} SC ON S.schoolid = SC.schoolid
LEFT JOIN {{ ref('academic_years') }} AY ON SC.academicyearid = AY.academicyearid
LEFT JOIN {{ ref('school_categories') }} SHC ON S.schoolcategoryid = SHC.schoolcategoryid
LEFT JOIN {{ ref('states') }} ST ON S.statecode = ST.statecode
LEFT JOIN {{ ref('student_class_details') }} SCD ON SC.studentid = SCD.studentid
LEFT JOIN {{ ref('sectors') }} SE ON SCD.sectorid = SE.sectorid
LEFT JOIN {{ ref('vt_class_students') }} VCS ON SC.studentid = VCS.studentid
LEFT JOIN {{ ref('vocational_trainers') }} VT ON VCS.vtid = VT.vtid
LEFT JOIN {{ ref('vocational_training_providers') }} VTP ON VT.vtpid = VTP.vtpid
LEFT JOIN {{ ref('job_roles') }} JR ON SCD.jobroleid = JR.jobroleid
WHERE AY.yearname = '2022-2023'
GROUP BY S.udise, S.schoolname, SC.fullname, SC.gender, SHC.categoryname, ST.statename, SE.sectorname, VTP.vtpname, VT.fullname, VT.isactive, JR.jobrolename