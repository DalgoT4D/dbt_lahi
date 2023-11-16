{{ 
  config(
    materialized='table'
  ) 
}}

SELECT
    ST.statename AS state,
    S.isactive AS school_status
    SE.sectorname AS sector_name,
    CASE 
        WHEN CAST(C.gender AS INTEGER) = 207 THEN 'M'
        WHEN CAST(C.gender AS INTEGER) = 208 THEN 'F'
        ELSE 'Unknown' 
    END AS gender,
    SHC.categoryname AS school_category,
    TE.testatus AS lab_status,
    S.udise AS school_id_udi,
    VTP.vtpname AS vtp,
    COUNT(SC.studentid) AS total_students,
    AY.yearname as yearname,
    VT.fullname AS vt_name,
    VT.isactive AS vt_status,
    JR.jobrolename AS job_role
FROM {{ ref('schools') }} S
LEFT JOIN {{ ref('student_class_mapping') }} SC ON S.schoolid = SC.schoolid
LEFT JOIN {{ ref('student_classes') }} C ON S.schoolid = C.schoolid
LEFT JOIN {{ ref('academic_years') }} AY ON SC.academicyearid = AY.academicyearid
LEFT JOIN {{ ref('school_categories') }} SHC ON S.schoolcategoryid = SHC.schoolcategoryid
LEFT JOIN {{ ref('states') }} ST ON S.statecode = ST.statecode
LEFT JOIN {{ ref('student_class_details') }} SCD ON SC.studentid = SCD.studentid
LEFT JOIN {{ ref('sectors') }} SE ON SCD.sectorid = SE.sectorid
LEFT JOIN {{ ref('vt_class_students') }} VCS ON SC.studentid = VCS.studentid
LEFT JOIN {{ ref('vocational_trainers') }} VT ON VCS.vtid = VT.vtid
LEFT JOIN {{ ref('vocational_training_providers') }} VTP ON VT.vtpid = VTP.vtpid
LEFT JOIN {{ ref('job_roles') }} JR ON SCD.jobroleid = JR.jobroleid
LEFT JOIN {{ ref('tool_equipments') }} TE on S.schoolid = TE.schoolid
where SC.isactive=true
GROUP BY S.udise, S.schoolname,S.isactive, SC.isactive, AY.yearname, SHC.categoryname, ST.statename, SE.sectorname, VTP.vtpname, VT.fullname, VT.isactive, JR.jobrolename, TE.testatus
