{{ config(
  materialized='table',
  schema='prod'
) }}

WITH aggregated_data AS (
    SELECT 
        "PMU_Monthly_state" AS state,
        TO_DATE("PMU_Monthly_month", 'YYYY-MM-DD') AS month,
        SUM("Internship_internship_ongoing_gp_internship_OnGoing_12_M"::numeric) AS internship_ongoing_12_M,
        SUM("Internship_internship_ongoing_gp_internship_OnGoing_11_M"::numeric) AS internship_ongoing_11_M,
        SUM("Internship_internship_ongoing_gp_internship_OnGoing_12_F"::numeric) AS internship_ongoing_12_F,
        SUM("Internship_internship_ongoing_gp_internship_OnGoing_11_F"::numeric) AS internship_ongoing_11_F,
        SUM("Exit_Survey_Exit_Survey_details_Exit_Survey_Completed_10_M"::numeric) AS exit_survey_completed_10_M,
        SUM("Exit_Survey_Exit_Survey_details_Exit_Survey_Completed_12_F"::numeric) AS exit_survey_completed_12_F,
        SUM("Exit_Survey_Exit_Survey_details_Exit_Survey_Completed_12_M"::numeric) AS exit_survey_completed_12_M,
        SUM("Exit_Survey_Exit_Survey_details_Exit_Survey_Completed_10_F"::numeric) AS exit_survey_completed_10_F,
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
        SUM("TOT_TOT_details_No_of_days_induction"::numeric) AS no_of_days_induction,
        SUM("TOT_TOT_details_No_VTs_recruited"::numeric) AS no_of_vts_recruited,
        SUM("TOT_TOT_details_No_VTs_participated_in_in_service_training"::numeric) AS no_of_vts_participated_in_service_training,
        SUM("TOT_TOT_details_No_VTs_participated_in_induction"::numeric) AS no_of_vts_participated_in_induction,
        SUM("TOT_TOT_details_No_of_days_in_service_training"::numeric) AS no_of_days_in_service_training,
        SUM(CASE WHEN "School_VTP_VT_VT_Recruitment_status" <> 'not_applicable' THEN 1 ELSE 0 END) AS count_vt_approved,
        SUM(CASE WHEN "School_VTP_VT_VT_Recruitment_status" IN ('appointed', 'joined') THEN 1 ELSE 0 END) AS count_vt_appointed,
        SUM("School_Lab_labs_approved"::numeric) AS school_lab_approved,
        SUM("School_Lab_No_Labs_Pending"::numeric) AS school_lab_pending
    FROM {{ref('pmu_monthly_report')}}
    GROUP BY "PMU_Monthly_state", month
),
sector_counts AS (
    SELECT 
        state,
        month,
        unnest(array[
            'Internship_ongoing_12_M',
            'Internship_ongoing_11_M',
            'Internship_ongoing_12_F',
            'Internship_ongoing_11_F',
            'Exit_Survey_Completed_10_M',
            'Exit_Survey_Completed_12_F',
            'Exit_Survey_Completed_12_M',
            'Exit_Survey_Completed_10_F',
            'Guest_Lecture_Conducted_12',
            'Guest_Lecture_Conducted_11',
            'Guest_Lecture_Conducted_10',
            'Guest_Lecture_Conducted_9',
            'Industrial_Visit_Conducted_11',
            'Industrial_Visit_Conducted_10',
            'Industrial_Visit_Conducted_9',
            'Industrial_Visit_Conducted_12',
            'Job_mela_participated_12_M',
            'Job_mela_participated_10_M',
            'Job_mela_participated_12_F',
            'Job_mela_participated_10_F',
            'No_of_days_induction',
            'No_VTs_recruited',
            'No_VTs_participated_in_in_service_training',
            'No_VTs_participated_in_induction',
            'No_of_days_in_service_training',
            'Count_VT_Approved',
            'Count_VT_Appointed',
            'School_Lab_Approved',
            'School_Lab_Pending'
        ]) AS original_indicator_name,
        REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(unnest(array[
            'Internship_Ongoing_12_M',
            'Internship_Ongoing_11_M',
            'Internship_Ongoing_12_F',
            'Internship_Ongoing_11_F',
            'Exit_Survey_Completed_10_M',
            'Exit_Survey_Completed_12_F',
            'Exit_Survey_Completed_12_M',
            'Exit_Survey_Completed_10_F',
            'Guest_Lecture_Conducted_12',
            'Guest_Lecture_Conducted_11',
            'Guest_Lecture_Conducted_10',
            'Guest_Lecture_Conducted_9',
            'Industrial_Visit_Conducted_11',
            'Industrial_Visit_Conducted_10',
            'Industrial_Visit_Conducted_9',
            'Industrial_Visit_Conducted_12',
            'Job_mela_participated_12_M',
            'Job_mela_participated_10_M',
            'Job_mela_participated_12_F',
            'Job_mela_participated_10_F',
            'No_of_days_induction',
            'No_VTs_recruited',
            'No_VTs_participated_in_in_service_training',
            'No_VTs_participated_in_induction',
            'No_of_days_in_service_training',
            'Count_VT_Approved',
            'Count_VT_Appointed',
            'School_Lab_Approved',
            'School_Lab_Pending'
        ]), '_12_M', ''), '_11_M', ''), '_12_F', ''), '_11_F', ''), '_10_F', ''), '_10_M', ''), '_9', ''), '_10', ''), '_11', ''), '_12', ''), '_', ' ') AS indicator_name,
        unnest(array[
            COALESCE(internship_ongoing_12_M, 0),
            COALESCE(internship_ongoing_11_M, 0),
            COALESCE(internship_ongoing_12_F, 0),
            COALESCE(internship_ongoing_11_F, 0),
            COALESCE(exit_survey_completed_10_M, 0),
            COALESCE(exit_survey_completed_12_F, 0),
            COALESCE(exit_survey_completed_12_M, 0),
            COALESCE(exit_survey_completed_10_F, 0),
            COALESCE(guest_lecture_conducted_12, 0),
            COALESCE(guest_lecture_conducted_11, 0),
            COALESCE(guest_lecture_conducted_10, 0),
            COALESCE(guest_lecture_conducted_9, 0),
            COALESCE(industrial_visit_conducted_11, 0),
            COALESCE(industrial_visit_conducted_10, 0),
            COALESCE(industrial_visit_conducted_9, 0),
            COALESCE(industrial_visit_conducted_12, 0),
            COALESCE(job_mela_male_participated_12, 0),
            COALESCE(job_mela_male_participated_10, 0),
            COALESCE(job_mela_female_participated_12, 0),
            COALESCE(job_mela_female_participated_10, 0),
            COALESCE(no_of_days_induction, 0),
            COALESCE(no_of_vts_recruited, 0),
            COALESCE(no_of_vts_participated_in_service_training, 0),
            COALESCE(no_of_vts_participated_in_induction, 0),
            COALESCE(no_of_days_in_service_training, 0),
            COALESCE(count_vt_approved, 0),
            COALESCE(count_vt_appointed, 0),
            COALESCE(school_lab_approved, 0),
            COALESCE(school_lab_pending, 0)
        ]) AS indicator_count
    FROM aggregated_data
)
SELECT 
    state,
    month,
    CASE 
        WHEN original_indicator_name LIKE '%_9%' THEN '9'
        WHEN original_indicator_name LIKE '%_10%' THEN '10'
        WHEN original_indicator_name LIKE '%_11%' THEN '11'
        WHEN original_indicator_name LIKE '%_12%' THEN '12'
    END AS class,
    CASE 
        WHEN original_indicator_name LIKE '%_M' THEN 'M'
        WHEN original_indicator_name LIKE '%_F' THEN 'F'
    END AS gender,
    indicator_name,
    indicator_count
FROM sector_counts