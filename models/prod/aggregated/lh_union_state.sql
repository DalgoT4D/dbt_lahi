{{ 
  config(
    materialized='table'
  ) 
}}

WITH SchoolData AS (
    SELECT
        SC.studentid AS student_id,
        SC.isactive AS student_status,
        ST.statename AS state,
        S.isactive AS school_status,
        S.isimplemented AS school_implemented,
        SE.sectorname AS lahi_sector,
        SHC.categoryname AS school_category,
        TE.testatus AS lab,
        TE.isactive AS lab_status,
        S.udise AS school_id_udi,
        AY.yearname AS yearname,
        VT.fullname AS vt_name,
        CASE 
            WHEN VT.natureofappointment::text = '56' THEN 'Approved but not appointed'
            WHEN VT.natureofappointment::text = '58' THEN 'Appointed'
            ELSE NULL -- Add additional cases if needed
        END AS vt_status,
        VT.isactive as vt_is_active,
        VTP.vtpname AS vtp,
        VTP.isactive AS vtp_status,
        class.classcode AS class,
        JR.jobrolename AS job_role,
        SUM(CASE WHEN CAST(C.gender AS INTEGER) = 207 THEN 1 ELSE 0 END) AS total_boys,
        SUM(CASE WHEN CAST(C.gender AS INTEGER) = 208 THEN 1 ELSE 0 END) AS total_girls
    FROM {{ ref('schools') }} S
    LEFT JOIN {{ ref('states') }} ST ON S.statecode = ST.statecode
    LEFT JOIN {{ ref('student_class_mapping') }} SC ON S.schoolid = SC.schoolid
    LEFT JOIN {{ ref('student_classes') }} C ON SC.studentid = C.studentid
    LEFT JOIN {{ ref('sections') }} sections ON SC.sectionid = sections.sectionid
    LEFT JOIN {{ ref('school_classes') }} class ON SC.classid = class.classid
    LEFT JOIN {{ ref('academic_years') }} AY ON SC.academicyearid = AY.academicyearid
    LEFT JOIN {{ ref('vt_class_students') }} VCS ON SC.studentid = VCS.studentid
    LEFT JOIN {{ ref('vocational_trainers') }} VT ON VCS.vtid = VT.vtid
    LEFT JOIN {{ ref('school_categories') }} SHC ON S.schoolcategoryid = SHC.schoolcategoryid
    LEFT JOIN {{ ref('vocational_training_providers') }} VTP ON VT.vtpid = VTP.vtpid
    LEFT JOIN {{ ref('student_class_details') }} SCD ON SC.studentid = SCD.studentid
    LEFT JOIN {{ ref('sectors') }} SE ON SCD.sectorid = SE.sectorid
    LEFT JOIN {{ ref('job_roles') }} JR ON SCD.jobroleid = JR.jobroleid
    LEFT JOIN {{ ref('tool_equipments') }} TE ON VT.vtid = TE.vtid
    GROUP BY SC.studentid, ST.statename, S.isactive, SE.sectorname, SHC.categoryname,
             TE.testatus, S.udise, AY.yearname, VT.fullname, VT.isactive, JR.jobrolename, VTP.vtpname, 
             class.classcode, VTP.isactive, SC.isactive, S.isimplemented, VT.natureofappointment, TE.isactive
)

SELECT
    SD.student_id,
    SD.student_status,
    SD.state,
    SD.school_status,
    SD.school_implemented,
    SD.lahi_sector,
    SD.school_category,
    SD.lab,
    SD.lab_status,
    SD.school_id_udi,
    SD.vtp,
    SD.vtp_status,
    SD.total_boys,
    SD.total_girls,
    SD.total_boys + SD.total_girls AS grand_total,
    SD.yearname,
    SD.vt_name,
    SD.vt_is_active,
    SD.vt_status, -- Changed to show vt_status as appointment_status
    SD.job_role,
    CASE WHEN SD.class IN ('9', '10') THEN SD.job_role ELSE NULL END AS lahi_job_role_9_and_10,
    CASE WHEN SD.class IN ('11', '12') THEN SD.job_role ELSE NULL END AS lahi_job_role_11_and_12
FROM SchoolData SD
