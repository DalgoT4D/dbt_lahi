{{ 
  config(
    materialized='table'
  ) 
}}

SELECT
    stc.studentid AS total_students
FROM (
    SELECT
        MAX(CASE WHEN name = 'Class 10' THEN total_guest_lectures ELSE NULL END) AS "guest_lectures_10",
        MAX(CASE WHEN name = 'Class 11' THEN total_guest_lectures ELSE NULL END) AS "guest_lectures_11",
        MAX(CASE WHEN name = 'Class 12' THEN total_guest_lectures ELSE NULL END) AS "guest_lectures_12",
        MAX(CASE WHEN name = 'Class 9' THEN total_guest_lectures ELSE NULL END) AS "guest_lectures_9"
    FROM (
        SELECT
            sc.name,
            SUM(dgl.guestlecturecount) AS total_guest_lectures
        FROM
            {{ ref('school_classes') }} sc
        LEFT JOIN
            {{ ref('ds_guest_lectures') }} dgl ON sc.classid = dgl.classid
        LEFT JOIN
            {{ ref('student_classes') }} stc on dgl.classid = stc.classid
        GROUP BY
            sc.name, stc.studentid
    ) AS class_guest_lectures
) AS class_guest_lectures
