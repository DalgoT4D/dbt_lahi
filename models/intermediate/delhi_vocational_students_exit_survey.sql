{{ config(
  materialized='table',
   indexes=[
      {'columns': ['_airbyte_ab_id'], 'type': 'hash'}
    ],
    schema='intermediate'

) }}

-- Creating a CTE that flattens the JSON data from the raw_enrollment table

WITH my_cte AS (
  {{
    new_flatten_json(
        model_names = [source('source_lahi', 'delhi_vocational_students_exit_survey_database')
        ],
        json_column = '_airbyte_data'
        )
    }}
)

SELECT
  _airbyte_ab_id,
  "_id",
  "end",
  "_uuid",
  "start",
  "today",
  "_status",
  "__version__",
  "_attachments",
  "_geolocation",
  "_submitted_by",
  "_submission_time",
  "_xform_id_string",
  "_validation_status",
  "sector_class_class",
  "sector_class_sector",
  "sector_class_jobrole",
  "cascading_login_udise",
  "cascading_login_vt_code",
  "cascading_login_district",
  "cascading_login_vt_contact",
  "sector_class_academic_year",
  "cascading_login_school_name",
  "cascading_login_sector_code",
  "cascading_login_vt_name_other",
  student_enrol_exit_student_info_exit_survey_Lahi_Touch AS Survey_lahi_touch,
  student_enrol_exit_student_info_Student_Other_details_stream AS stream,
  student_enrol_exit_student_info_Student_Personal_details_age AS age,
  student_enrol_exit_student_info_Student_Personal_details_dob AS dob,
  student_enrol_exit_student_info_permanent_address_village_city AS village_city,
  student_enrol_exit_student_info_Student_Personal_details_gender AS gender,
  student_enrol_exit_student_info_Student_Other_details_fathers_name AS fathers_name,
  student_enrol_exit_student_info_Student_Other_details_mothers_name AS mothers_name,
  student_enrol_exit_student_info_Student_Personal_details_first_name AS first_name,
  student_enrol_exit_student_info_Student_Other_details_contact_number AS contact_number,
  student_enrol_exit_student_info_Student_Personal_details_middle_name AS middle_name,
  student_enrol_exit_student_info_exit_survey_Internship_gp_internship AS internship_gp_internship,
  student_enrol_exit_student_info_permanent_address_district_residence AS district_residence,
  student_enrol_exit_student_info_Student_Personal_details_dob_dd_mm_yy AS dob_dd_mm_yy,
  student_enrol_exit_student_info_Student_Other_details_alternate_number AS alternate_number,
--   student_enrol_exit_student_info_exit_survey_job_emp_aspirations_location AS job_emp_aspirations_location,
  student_enrol_exit_student_info_exit_survey_employment_gp_student_employed AS employment_gp_student_employed,
  student_enrol_exit_student_info_exit_survey_skill_programs_skill_dev_program AS skill_programs_skill_dev_program,
--   student_enrol_exit_student_info_exit_survey_Higher_education_gp_education_type AS Higher_education_gp_education_type,
--   student_enrol_exit_student_info_exit_survey_Higher_education_gp_education_course AS Higher_education_gp_education_course,
--   student_enrol_exit_student_info_exit_survey_Higher_education_gp_education_stream AS Higher_education_gp_education_stream,
--   student_enrol_exit_student_info_exit_survey_skill_programs_interest_skill_program AS skill_programs_interest_skill_program,
--   student_enrol_exit_student_info_exit_survey_Higher_education_gp_include_ve_subject AS Higher_education_gp_include_ve_subject,
--   student_enrol_exit_student_info_exit_survey_register_portal_gp_willing_naps_portal AS register_portal_gp_willing_naps_portal,
  student_enrol_exit_student_info_exit_survey_Education_Details_gp_continue_education AS Education_Details_gp_continue_education
--   student_enrol_exit_student_info_exit_survey_job_emp_aspirations_aspiration_interest AS job_emp_aspirations_aspiration_interest,
--   student_enrol_exit_student_info_exit_survey_register_portal_gp_registered_on_portal AS register_portal_gp_registered_on_portal,
--   student_enrol_exit_student_info_exit_survey_job_emp_aspirations_job_employ_interest_12th AS job_emp_aspirations_job_employ_interest_12th
FROM my_cte