{{ config(
  materialized='table',
) }}

WITH sum_cte AS (
  SELECT
    SUM("Internship_internship_ongoing_gp_internship_OnGoing_12_M"::numeric) AS internship_ongoing_12_boys,
    SUM("Internship_internship_ongoing_gp_internship_OnGoing_11_M"::numeric) AS internship_ongoing_11_boys,
    SUM("Internship_internship_ongoing_gp_internship_OnGoing_12_F"::numeric) AS internship_ongoing_12_girls,
    SUM("Internship_internship_ongoing_gp_internship_OnGoing_11_F"::numeric) AS internship_ongoing_11_girls,
    SUM("Internship_internship_completed_gp_internship_Comp_12_M"::numeric) AS internship_completed_12_boys,
    SUM("Internship_internship_completed_gp_internship_Comp_12_F"::numeric) AS internship_completed_12_girls,
    SUM("Internship_internship_completed_gp_internship_Comp_11_F"::numeric) AS internship_completed_11_girls,
    SUM("Internship_internship_completed_gp_internship_Comp_11_M"::numeric) AS internship_completed_11_boys,
    SUM("Exit_Survey_Exit_Survey_details_Exit_Survey_Completed_10_M"::numeric) AS exit_survey_completed_10_boys,
    SUM("Exit_Survey_Exit_Survey_details_Exit_Survey_Completed_12_F"::numeric) AS exit_survey_completed_12_girls,
    SUM("Exit_Survey_Exit_Survey_details_Exit_Survey_Completed_12_M"::numeric) AS exit_survey_completed_12_boys,
    SUM("Exit_Survey_Exit_Survey_details_Exit_Survey_Completed_10_F"::numeric) AS exit_survey_completed_10_girls,
    SUM("re_details_Guest_Lecture_Conducted_12"::numeric) AS guest_lecture_conducted_12,
    SUM("re_details_Guest_Lecture_Conducted_11"::numeric) AS guest_lecture_conducted_11,
    SUM("re_details_Guest_Lecture_Conducted_10"::numeric) AS guest_lecture_conducted_10,
    SUM("re_details_Guest_Lecture_Conducted_9"::numeric) AS guest_lecture_conducted_9,
    SUM("al_Visit_details_Industrial_Visit_Conducted_11"::numeric) AS industrial_visit_conducted_11,
    SUM("al_Visit_details_Industrial_Visit_Conducted_10"::numeric) AS industrial_visit_conducted_10,
    SUM("al_Visit_details_Industrial_Visit_Conducted_9"::numeric) AS industrial_visit_conducted_9,
    SUM("al_Visit_details_Industrial_Visit_Conducted_12"::numeric) AS industrial_visit_conducted_12,
    SUM("School_Lab_labs_approved"::numeric) AS lab_status_approved,
    SUM("School_Lab_No_Labs_Pending"::numeric) AS lab_status_pending
  FROM dev_intermediate.pmu_monthly_report
)

SELECT
  SUM(internship_ongoing_12_boys + internship_ongoing_11_boys + internship_ongoing_12_girls + internship_ongoing_11_girls) AS internship_ongoing,
  SUM(internship_completed_12_boys + internship_completed_12_girls + internship_completed_11_girls + internship_completed_11_boys) AS internship_completed,
  SUM(exit_survey_completed_10_boys + exit_survey_completed_12_girls + exit_survey_completed_12_boys + exit_survey_completed_10_girls) AS exit_survey,
  SUM(guest_lecture_conducted_12 + guest_lecture_conducted_11 + guest_lecture_conducted_10 + guest_lecture_conducted_9) AS guest_lectures,
  SUM(industrial_visit_conducted_12 + industrial_visit_conducted_11 + industrial_visit_conducted_10 + industrial_visit_conducted_9) AS industrial_visit,
  SUM(lab_status_approved + lab_status_pending) AS total_lab_status
FROM sum_cte