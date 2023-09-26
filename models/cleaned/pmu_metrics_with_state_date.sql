{{ config(
  materialized='table',
  schema='intermediate'
) }}

WITH sector_counts AS (
    SELECT 
        "PMU_Monthly_state" AS state,
        "PMU_Monthly_month" AS month,
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
        SUM("Job_Mela_Job_Mela_details_Job_Mela_schools"::numeric) AS job_mela_schools_participated,
        SUM("TOT_TOT_details_No_of_days_induction"::numeric) AS number_of_days_induction,
        SUM("TOT_TOT_details_No_VTs_recruited"::numeric) AS number_of_vts_recruited,
        SUM("TOT_TOT_details_No_VTs_participated_in_in_service_training"::numeric) AS number_of_vts_participated_in_service_training,
        SUM("TOT_TOT_details_No_VTs_participated_in_induction"::numeric) AS number_of_vts_participated_in_induction,
        SUM("TOT_TOT_details_No_of_days_in_service_training"::numeric) AS number_of_days_in_service_training,
        SUM("School_Lab_labs_approved"::numeric) AS lab_status_approved,
        SUM("School_Lab_No_Labs_Pending"::numeric) AS lab_status_pending,
        SUM(CASE 
                WHEN "School_VTP_VT_VT_Recruitment_status" IN ('appointed', 'joined') 
                THEN 1 
                ELSE 0 
            END) AS count_vt_appointed,
        SUM(CASE 
                WHEN "School_VTP_VT_VT_Recruitment_status" <> 'not_applicable' 
                THEN 1 
                ELSE 0 
            END) AS count_vt_approved,
        ROUND(AVG(CAST("School_VTP_VT_average_vt_attendance" AS NUMERIC)), 0) AS avg_vt_attendance
    FROM dev_intermediate.pmu_monthly_report
    GROUP BY "PMU_Monthly_state", "PMU_Monthly_month"
)

SELECT 
    state,
    month,
    internship_ongoing_12_boys,
    internship_ongoing_11_boys,
    internship_ongoing_12_girls,
    internship_ongoing_11_girls,
    COALESCE(internship_ongoing_12_boys, 0) + COALESCE(internship_ongoing_11_boys, 0) + COALESCE(internship_ongoing_12_girls, 0) + COALESCE(internship_ongoing_11_girls, 0) as internship_ongoing,
    exit_survey_completed_10_boys,
    exit_survey_completed_12_girls,
    exit_survey_completed_12_boys,
    exit_survey_completed_10_girls,
    COALESCE(exit_survey_completed_10_boys, 0) + COALESCE(exit_survey_completed_12_girls, 0) + COALESCE(exit_survey_completed_12_boys, 0) + COALESCE(exit_survey_completed_10_girls, 0) as exit_survey,
    guest_lecture_conducted_12,
    guest_lecture_conducted_11,
    guest_lecture_conducted_10,
    guest_lecture_conducted_9,
    COALESCE(guest_lecture_conducted_12, 0) + COALESCE(guest_lecture_conducted_11, 0) + COALESCE(guest_lecture_conducted_10, 0) + COALESCE(guest_lecture_conducted_9, 0)as guest_lecture,
    industrial_visit_conducted_12,
    industrial_visit_conducted_11,
    industrial_visit_conducted_10,
    industrial_visit_conducted_9,
    COALESCE(industrial_visit_conducted_12, 0) + COALESCE(industrial_visit_conducted_11, 0) + COALESCE(industrial_visit_conducted_10, 0) + COALESCE(industrial_visit_conducted_9, 0) as industrial_visit,
    job_mela_male_participated_12,
    job_mela_male_participated_10,
    job_mela_female_participated_12,
    job_mela_female_participated_10,
    COALESCE(job_mela_male_participated_10, 0) + COALESCE(job_mela_male_participated_12, 0) as job_mela_boys_participated,
    COALESCE(job_mela_female_participated_10, 0) + COALESCE(job_mela_female_participated_12, 0) as job_mela_girls_participated,
    COALESCE(job_mela_male_participated_10, 0) + COALESCE(job_mela_male_participated_12, 0) + COALESCE(job_mela_female_participated_10, 0) + COALESCE(job_mela_female_participated_12, 0) as job_mela_total_participated,
    job_mela_schools_participated,
    number_of_days_in_service_training,
    number_of_vts_participated_in_service_training,
    number_of_vts_recruited,
    number_of_days_induction,
    number_of_vts_participated_in_induction,
    COALESCE(number_of_vts_participated_in_service_training, 0) + COALESCE(number_of_vts_participated_in_induction, 0) as TOT,
    lab_status_approved,
    lab_status_pending,
    CASE 
        WHEN COALESCE(lab_status_approved, 0) + COALESCE(lab_status_pending, 0) = 0 THEN NULL
        ELSE (COALESCE(lab_status_approved, 0) / (COALESCE(lab_status_approved, 0) + COALESCE(lab_status_pending, 0))) * 100
    END as lab_status,
    count_vt_appointed,
    count_vt_approved,
    CASE 
        WHEN count_vt_approved = 0 THEN NULL
        ELSE CONCAT(
            ROUND((CAST(count_vt_appointed AS decimal) / NULLIF(count_vt_approved, 0)) * 100, 2)::TEXT, 
            ' %'
        )
    END as prct_vt_appointed,
    avg_vt_attendance::TEXT || ' days / 30 days' as avg_vt_attendance
FROM sector_counts
