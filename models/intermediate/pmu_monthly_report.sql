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
  "pmu_pmu_report",
  "meta_instanceid",
  "_submission_time",
  "_xform_id_string",
  "pmu_monthly_month",
  "pmu_monthly_state",
  "_validation_status",
  "school_vtp_vt_no_vts",
  "vtp_report_no_of_vtp",
  "pmu_monthly_pmu_email",
  "guest_lecture_gl_report",
  "pmu_meeting_conducted_spd",
  "pmu_monthly_academic_year",
  "pmu_monthly_rm_report_dis",
  "vt_salary_grp_salary_type",
  "industrial_visit_iv_report",
  "vtp_report_no_of_vpt_reports",
  "internship_internship_ongoing",
  "school_vtp_vt_schools_started",
  "internship_internship_completed",
  "vtp_report_vtp_submitting_reports",
  "internship_internship_ongoing_data",
  "school_vtp_vt_average_vt_attendance",
  "school_vtp_vt_no_vt_positions_filled",
  "report_components_group_vtp_vt_1_vtp_vt",
  "pmu_meeting_conducted_component_incharge",
  "vt_salary_grp_group_dec_22_vt_pay_dec_22",
  "vt_salary_grp_group_feb_22_vt_pay_feb_22",
  "vt_salary_grp_group_feb_23_vt_pay_feb_23",
  "vt_salary_grp_group_may_22_vt_pay_may_22",
  "vt_salary_grp_group_nov_22_vt_pay_nov_22",
  "vt_salary_grp_group_oct_22_vt_pay_oct_22",
  "report_components_group_mis_1_mis_state_1",
  "vt_salary_grp_group_july_22_vt_pay_july_22",
  "vt_salary_grp_group_june_22_vt_pay_june_22",
  "vt_salary_grp_group_sept_22_vt_pay_sept_22",
  "report_components_group_tot_1_tot_conducted",
  "vt_salary_grp_group_april_22_vt_pay_april_22",
  "vt_salary_grp_group_april_23_vt_pay_april_23",
  "vt_salary_grp_group_march_22_vt_pay_march_22",
  "vt_salary_grp_group_march_23_vt_pay_march_23",
  "report_components_group_lab_setup_1_lab_setup",
  "vt_salary_grp_group_august_22_vt_pay_august_22",
  "vt_salary_grp_group_january_22_vt_pay_january_22",
  "vt_salary_grp_group_january_23_vt_pay_january_23",
  "report_components_group_job_mela_1_job_mela_update",
  "report_components_group_pab_1_pab_minutes_received",
  "report_components_group_assessment_1_assessment_update",
  "report_components_group_internship_1_internship_status",
  "report_components_group_skill_comp_1_skill_comp_update",
  "report_components_group_pre_vocational_1_pre_vocational",
  "report_components_group_exit_survey_1_exit_survey_update",
  "report_components_group_certificate_1_certificate_received",
  "report_components_group_guest_lecture_1_guest_lecture_status",
  "guest_lecture_guest_lecture_details_guest_lecture_conducted_9",
  "guest_lecture_guest_lecture_details_guest_lecture_conducted_10",
  "guest_lecture_guest_lecture_details_guest_lecture_conducted_11",
  "guest_lecture_guest_lecture_details_guest_lecture_conducted_12",
  "report_components_group_industrial_visit_1_industrial_visit_status",
  "industrial_visit_industrial_visit_details_industrial_visit_cond"
--   "Industrial_Visit_Industrial_Visit_details_Industrial_Visit_Conducted_10",
--   "Industrial_Visit_Industrial_Visit_details_Industrial_Visit_Conducted_11",
--   "Industrial_Visit_Industrial_Visit_details_Industrial_Visit_Conducted_12"
FROM my_cte