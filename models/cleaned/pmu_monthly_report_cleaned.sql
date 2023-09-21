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
    SUM("Job_Mela_Job_Mela_details_Job_Mela_Participated_12_M"::numeric) AS job_mela_male_participated_12,
    SUM("Job_Mela_Job_Mela_details_Job_Mela_Participated_10_M"::numeric) AS job_mela_male_participated_10,
    SUM("Job_Mela_Job_Mela_details_Job_Mela_Participated_12_F"::numeric) AS job_mela_female_participated_12,
    SUM("Job_Mela_Job_Mela_details_Job_Mela_Participated_10_F"::numeric) AS job_mela_female_participated_10,
    SUM("Job_Mela_Job_Mela_details_Job_Mela_Offered_Job_12_M"::numeric) AS job_mela_male_offered_12,
    SUM("Job_Mela_Job_Mela_details_Job_Mela_Offered_Job_10_F"::numeric) AS job_mela_female_offered_10,
    SUM("Job_Mela_Job_Mela_details_Job_Mela_Offered_Job_12_F"::numeric) AS job_mela_female_offered_12,
    SUM("Job_Mela_Job_Mela_details_Job_Mela_Offered_Job_10_M"::numeric) AS job_mela_male_offered_10,
    SUM("TOT_TOT_details_No_of_days_induction"::numeric) AS number_of_days_induction,
    SUM("TOT_TOT_details_No_VTs_recruited"::numeric) AS number_of_vts_recruited,
    SUM("TOT_TOT_details_No_VTs_participated_in_in_service_training"::numeric) AS number_of_vts_participated_in_service_training,
    SUM("TOT_TOT_details_No_VTs_participated_in_induction"::numeric) AS number_of_vts_participated_in_induction,
    SUM("TOT_TOT_details_No_of_days_in_service_training"::numeric) AS number_of_days_in_service_training,
    SUM("School_Lab_labs_approved"::numeric) AS lab_status_approved,
    SUM("School_Lab_No_Labs_Pending"::numeric) AS lab_status_pending
  FROM dev_intermediate.pmu_monthly_report
)

SELECT 'internship_ongoing_12_boys' AS category, internship_ongoing_12_boys AS value FROM sum_cte
UNION ALL
SELECT 'internship_ongoing_11_boys' AS category, internship_ongoing_11_boys AS value FROM sum_cte
UNION ALL
SELECT 'internship_ongoing_12_girls' AS category, internship_ongoing_12_girls AS value FROM sum_cte
UNION ALL
SELECT 'internship_ongoing_11_girls' AS category, internship_ongoing_11_girls AS value FROM sum_cte
UNION ALL
SELECT 'Internship_Ongoing' AS category, 
  SUM(internship_ongoing_12_boys + internship_ongoing_11_boys + internship_ongoing_12_girls + internship_ongoing_11_girls) AS value FROM sum_cte
UNION ALL
SELECT 'internship_completed_12_boys' AS category, internship_completed_12_boys AS value FROM sum_cte
UNION ALL
SELECT 'internship_completed_12_girls' AS category, internship_completed_12_girls AS value FROM sum_cte
UNION ALL
SELECT 'internship_completed_11_girls' AS category, internship_completed_11_girls AS value FROM sum_cte
UNION ALL
SELECT 'internship_completed_11_boys' AS category, internship_completed_11_boys AS value FROM sum_cte
UNION ALL
SELECT 'exit_survey_completed_10_boys' AS category, exit_survey_completed_10_boys AS value FROM sum_cte
UNION ALL
SELECT 'exit_survey_completed_12_girls' AS category, exit_survey_completed_12_girls AS value FROM sum_cte
UNION ALL
SELECT 'exit_survey_completed_12_boys' AS category, exit_survey_completed_12_boys AS value FROM sum_cte
UNION ALL
SELECT 'exit_survey_completed_10_girls' AS category, exit_survey_completed_10_girls AS value FROM sum_cte
UNION ALL
SELECT 'Exit_survey_completed' AS category, 
  SUM(exit_survey_completed_10_boys + exit_survey_completed_12_girls + exit_survey_completed_12_boys + exit_survey_completed_10_girls) AS value FROM sum_cte
UNION ALL
SELECT 'guest_lecture_conducted_12' AS category, guest_lecture_conducted_12 AS value FROM sum_cte
UNION ALL
SELECT 'guest_lecture_conducted_11' AS category, guest_lecture_conducted_11 AS value FROM sum_cte
UNION ALL
SELECT 'guest_lecture_conducted_10' AS category, guest_lecture_conducted_10 AS value FROM sum_cte
UNION ALL
SELECT 'guest_lecture_conducted_9' AS category, guest_lecture_conducted_9 AS value FROM sum_cte
UNION ALL
SELECT 'Guest_lecture_conducted' AS category, 
  SUM(guest_lecture_conducted_12 + guest_lecture_conducted_11 + guest_lecture_conducted_10 + guest_lecture_conducted_9) AS value FROM sum_cte
UNION ALL
SELECT 'industrial_visit_conducted_12' AS category, industrial_visit_conducted_12 AS value FROM sum_cte
UNION ALL
SELECT 'industrial_visit_conducted_11' AS category, industrial_visit_conducted_11 AS value FROM sum_cte
UNION ALL
SELECT 'industrial_visit_conducted_10' AS category, industrial_visit_conducted_10 AS value FROM sum_cte
UNION ALL
SELECT 'industrial_visit_conducted_9' AS category, industrial_visit_conducted_9 AS value FROM sum_cte
UNION ALL
SELECT 'Industrial_visit_conducted' AS category, 
  SUM(industrial_visit_conducted_12 + industrial_visit_conducted_11 + industrial_visit_conducted_10 + industrial_visit_conducted_9) AS value FROM sum_cte
UNION ALL
SELECT 'job_mela_male_participated_12' AS category, job_mela_male_participated_12 AS value FROM sum_cte
UNION ALL
SELECT 'job_mela_male_participated_10' AS category, job_mela_male_participated_10 AS value FROM sum_cte
UNION ALL
SELECT 'job_mela_female_participated_12' AS category, job_mela_female_participated_12 AS value FROM sum_cte
UNION ALL
SELECT 'job_mela_female_participated_10' AS category, job_mela_female_participated_10 AS value FROM sum_cte
UNION ALL
SELECT 'job_mela_male_offered_12' AS category, job_mela_male_offered_12 AS value FROM sum_cte
UNION ALL
SELECT 'job_mela_female_offered_10' AS category, job_mela_female_offered_10 AS value FROM sum_cte
UNION ALL
SELECT 'job_mela_female_offered_12' AS category, job_mela_female_offered_12 AS value FROM sum_cte
UNION ALL
SELECT 'job_mela_male_offered_10' AS category, job_mela_male_offered_10 AS value FROM sum_cte
UNION ALL
SELECT 'Job_mela' AS category, 
  SUM(job_mela_male_participated_12 + job_mela_male_participated_10 + job_mela_female_participated_12 + job_mela_female_participated_10 + job_mela_male_offered_12 + job_mela_female_offered_10 + job_mela_female_offered_12 + job_mela_male_offered_10) AS value FROM sum_cte
UNION ALL
SELECT 'number_of_days_in_service_training' AS category, number_of_days_in_service_training AS value FROM sum_cte
UNION ALL
SELECT 'number_of_vts_participated_in_service_training' AS category, number_of_vts_participated_in_service_training AS value FROM sum_cte
UNION ALL
SELECT 'number_of_vts_recruited' AS category, number_of_vts_recruited AS value FROM sum_cte
UNION ALL
SELECT 'number_of_days_induction' AS category, number_of_days_induction AS value FROM sum_cte
UNION ALL
SELECT 'number_of_vts_participated_in_induction' AS category, number_of_vts_participated_in_induction AS value FROM sum_cte
UNION ALL
SELECT 'TOT' AS category, 
  SUM(number_of_days_in_service_training + number_of_vts_participated_in_service_training + number_of_vts_recruited + number_of_days_induction + number_of_days_induction + number_of_vts_participated_in_induction) AS value FROM sum_cte
UNION ALL
SELECT 'lab_status_approved' AS category, lab_status_approved AS value FROM sum_cte
UNION ALL
SELECT 'lab_status_pending' AS category, lab_status_pending AS value FROM sum_cte
UNION ALL
SELECT 'lab_status_required' AS category, (lab_status_approved + lab_status_pending) AS value FROM sum_cte
UNION ALL
SELECT 'lab_status' AS category, (lab_status_approved / (lab_status_approved + lab_status_pending)) * 100 AS value FROM sum_cte
