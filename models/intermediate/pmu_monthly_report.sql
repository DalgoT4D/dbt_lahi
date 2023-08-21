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
    flatten_json(
        model_names = [source('source_lahi', 'pmu_monthly_report'),
                ],
        json_column = '_airbyte_data'
        )
    }}
)


SELECT
  _airbyte_ab_id,
  "end",
  "_tags",
  "_uuid",
  "start",
  "today",
  "_notes",
  "_status",
  "deviceid",
  "username",
  "__version__",
  "phonenumber",
  "_attachments",
  "_geolocation",
  "formhub_uuid",
  "_submitted_by",
  "PMU_pmu_report",
  "meta_instanceID",
  "_submission_time",
  "_xform_id_string",
  "PMU_Monthly_month",
  "PMU_Monthly_state",
  "_validation_status",
  "School_VTP_VT_No_VTs",
  "VTP_report_no_of_vtp",
  "PMU_Monthly_pmu_email",
  "Guest_Lecture_GL_report",
  "PMU_meeting_conducted_spd",
  "PMU_Monthly_academic_year",
  "PMU_Monthly_rm_report_dis",
  "VT_salary_grp_salary_type",
  "Industrial_Visit_IV_report",
  "VTP_report_no_of_vpt_reports",
  "Internship_internship_ongoing",
  "School_VTP_VT_schools_started",
  "Internship_internship_completed",
  "VTP_report_vtp_submitting_reports",
  "Internship_internship_ongoing_data",
  "School_VTP_VT_average_vt_attendance",
  "School_VTP_VT_No_vt_positions_filled",
  "Report_components_group_VTP_VT_1_VTP_VT",
  "PMU_meeting_conducted_component_incharge",
  "VT_salary_grp_group_Dec_22_vt_pay_Dec_22",
  "VT_salary_grp_group_Feb_22_vt_pay_Feb_22",
  "VT_salary_grp_group_Feb_23_vt_pay_Feb_23",
  "VT_salary_grp_group_May_22_vt_pay_May_22",
  "VT_salary_grp_group_Nov_22_vt_pay_Nov_22",
  "VT_salary_grp_group_Oct_22_vt_pay_Oct_22",
  "Report_components_group_mis_1_mis_state_1",
  "VT_salary_grp_group_July_22_vt_pay_July_22",
  "VT_salary_grp_group_June_22_vt_pay_June_22",
  "VT_salary_grp_group_Sept_22_vt_pay_Sept_22",
  "Report_components_group_TOT_1_TOT_conducted",
  "VT_salary_grp_group_April_22_vt_pay_April_22",
  "VT_salary_grp_group_April_23_vt_pay_April_23",
  "VT_salary_grp_group_March_22_vt_pay_March_22",
  "VT_salary_grp_group_March_23_vt_pay_March_23",
  "Report_components_group_Lab_setup_1_Lab_setup",
  "VT_salary_grp_group_August_22_vt_pay_August_22",
  "VT_salary_grp_group_January_22_vt_pay_January_22",
  "VT_salary_grp_group_January_23_vt_pay_January_23",
  "Report_components_group_Job_Mela_1_Job_Mela_update",
  "Report_components_group_PAB_1_pab_minutes_received",
  "Report_components_group_Assessment_1_Assessment_update",
  "Report_components_group_Internship_1_Internship_status",
  "Report_components_group_Skill_Comp_1_Skill_Comp_update",
  "Report_components_group_Pre_Vocational_1_Pre_Vocational",
  "Report_components_group_Exit_survey_1_Exit_survey_update",
  "Report_components_group_certificate_1_certificate_received",
  "Report_components_group_Guest_Lecture_1_Guest_Lecture_Status",
  "Guest_Lecture_Guest_Lecture_details_Guest_Lecture_Conducted_9",
  "Guest_Lecture_Guest_Lecture_details_Guest_Lecture_Conducted_10",
  "Guest_Lecture_Guest_Lecture_details_Guest_Lecture_Conducted_11",
  "Guest_Lecture_Guest_Lecture_details_Guest_Lecture_Conducted_12",
  "Report_components_group_Industrial_Visit_1_Industrial_Visit_Status"
--   "Industrial_Visit_Industrial_Visit_details_Industrial_Visit_Conducted_9",
--   "Industrial_Visit_Industrial_Visit_details_Industrial_Visit_Conducted_10",
--   "Industrial_Visit_Industrial_Visit_details_Industrial_Visit_Conducted_11",
--   "Industrial_Visit_Industrial_Visit_details_Industrial_Visit_Conducted_12"
FROM my_cte