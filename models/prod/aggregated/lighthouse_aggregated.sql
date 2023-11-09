{{ config(
  materialized='table'
) }}

SELECT
    ST.statename AS state,
    SC.studentid AS student_id,
    S.schoolid AS school_id_udi,
    S.schoolname AS school_name,
    SHC.categoryname AS school_category,
    S.isactive AS school_status,
    SE.sectorname AS sector_name,
    VTP.vtpname AS vtp,
    VT.fullname as vt_name,
    VT.isactive as vt_status,
    JR.jobrolename as job_role
FROM {{ ref('student_classes') }} SC
LEFT JOIN {{ ref('schools') }} S ON SC.schoolid = S.schoolid
LEFT JOIN {{ ref('states') }} ST ON S.statecode = ST.statecode
LEFT JOIN {{ ref('school_categories') }} SHC ON S.schoolcategoryid = SHC.schoolcategoryid
LEFT JOIN {{ ref('student_class_details') }} SCD ON SC.studentid = SCD.studentid
LEFT JOIN {{ ref('sectors') }} SE ON SCD.sectorid = SE.sectorid
LEFT JOIN {{ ref('vt_class_students') }} VCS ON SC.studentid = VCS.studentid
LEFT JOIN {{ ref('vocational_trainers')}} VT ON VCS.vtid = VT.vtid
LEFT JOIN {{ ref('vocational_training_providers')}} VTP ON VT.vtpid = VTP.vtpid
LEFT JOIN {{ ref('job_roles')}} JR ON SCD.jobroleid = JR.jobroleid


