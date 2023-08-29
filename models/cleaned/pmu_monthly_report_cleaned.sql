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
    SUM("re_details_Guest_Lecture_Conducted_9"::numeric) AS guest_lecture_conducted_9
  FROM {{ ref('pmu_monthly_report') }}
)

SELECT 'internship_ongoing_12_boys' AS category, internship_ongoing_12_boys AS value FROM sum_cte
UNION ALL
SELECT 'internship_ongoing_11_boys' AS category, internship_ongoing_11_boys AS value FROM sum_cte
UNION ALL
SELECT 'internship_ongoing_12_girls' AS category, internship_ongoing_12_girls AS value FROM sum_cte
UNION ALL
SELECT 'internship_ongoing_11_girls' AS category, internship_ongoing_11_girls AS value FROM sum_cte
UNION ALL
SELECT 'internship_completed_12_boys' AS category, internship_completed_12_boys AS value FROM sum_cte
UNION ALL
SELECT 'internship_completed_12_girls' AS category, internship_completed_12_girls AS value FROM sum_cte
UNION ALL
SELECT 'internship_completed_11_girls' AS category, internship_completed_11_girls AS value FROM sum_cte
UNION ALL
SELECT 'internship_completed_11_boys' AS category, internship_completed_11_boys AS value FROM sum_cte
UNION ALL
SELECT 'exit_survey_completed_12_girls' AS category, exit_survey_completed_12_girls AS value FROM sum_cte
UNION ALL
SELECT 'exit_survey_completed_12_boys' AS category, exit_survey_completed_12_boys AS value FROM sum_cte
UNION ALL
SELECT 'exit_survey_completed_10_boys' AS category, exit_survey_completed_10_boys AS value FROM sum_cte
UNION ALL
SELECT 'exit_survey_completed_10_girls' AS category, exit_survey_completed_10_girls AS value FROM sum_cte
UNION ALL
SELECT 'guest_lecture_conducted_12' AS category, guest_lecture_conducted_12 AS value FROM sum_cte
UNION ALL
SELECT 'guest_lecture_conducted_11' AS category, guest_lecture_conducted_11 AS value FROM sum_cte
UNION ALL
SELECT 'guest_lecture_conducted_10' AS category, guest_lecture_conducted_10 AS value FROM sum_cte
UNION ALL
SELECT 'guest_lecture_conducted_9' AS category, guest_lecture_conducted_9 AS value FROM sum_cte
