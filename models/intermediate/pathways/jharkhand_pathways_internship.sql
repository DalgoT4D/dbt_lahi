--DBT AUTOMATION has generated this model, please DO NOT EDIT 
--Please make sure you dont change the model name 


{{ 
  config(
    materialized='table',
    indexes=[
      {'columns': ['_airbyte_ab_id'], 'type': 'hash'}
    ]
  ) 
}}
    SELECT _airbyte_ab_id 
,_airbyte_data::json->>'Total Hours Covered
 (Daily Dairy)' as "total_hours_covered___daily_dairy_"
,_airbyte_data::json->>'VT Remarks for student' as "vt_remarks_for_student"
,_airbyte_data::json->>'Student Sector' as "student_sector"
,_airbyte_data::json->>'School District' as "school_district"
,_airbyte_data::json->>'Udise' as "udise"
,_airbyte_data::json->>'School Block' as "school_block"
,_airbyte_data::json->>'VT-Employer_Ratio' as "vt_employer_ratio"
,_airbyte_data::json->>'Student Class' as "student_class"
,_airbyte_data::json->>'Student School Category' as "student_school_category"
,_airbyte_data::json->>'Student Completed Internship?' as "student_completed_internship_"
,_airbyte_data::json->>'Student Daily Work Register maintained?' as "student_daily_work_register_maintained_"
,_airbyte_data::json->>'Project Report Photo' as "project_report_photo"
,_airbyte_data::json->>'Student Date Of Birth' as "student_date_of_birth"
,_airbyte_data::json->>'Student Full Name' as "student_full_name"
,_airbyte_data::json->>'Letter of Confirmation Signed by Employer & HoS?' as "letter_of_confirmation_signed_by_employe"
,_airbyte_data::json->>'Total Days completed in Internship
 (Internship Progress form)' as "total_days_completed_in_internship___int"
,_airbyte_data::json->>'Student Whatsapp number' as "student_whatsapp_number"
,_airbyte_data::json->>'Student District' as "student_district"
,_airbyte_data::json->>'Last Updated' as "last_updated"
,_airbyte_data::json->>'Internship Type
 (Internship Progress form)' as "internship_type___internship_progress_fo"
,_airbyte_data::json->>'Internship Certificate given by Employer to student?
 (Internship progress Form)' as "internship_certificate_given_by_employer"
,_airbyte_data::json->>'Student Attendance Sheet maintained?' as "student_attendance_sheet_maintained_"
,_airbyte_data::json->>'No of Students enrolled with employer' as "no_of_students_enrolled_with_employer"
,_airbyte_data::json->>'VT Mobile' as "vt_mobile"
,_airbyte_data::json->>'Student Father Name' as "student_father_name"
,_airbyte_data::json->>'Internship_Hrs_Category' as "internship_hrs_category"
,_airbyte_data::json->>'Internship Project Report Available?t' as "internship_project_report_available_t"
,_airbyte_data::json->>'Name of Supervisor at workplace
 (Feedback Form)' as "name_of_supervisor_at_workplace___feedba"
,_airbyte_data::json->>'Student Job Role' as "student_job_role"
,_airbyte_data::json->>'Student Academic Year' as "student_academic_year"
,_airbyte_data::json->>'Student School Management' as "student_school_management"
,_airbyte_data::json->>'Student Feedback' as "student_feedback"
,_airbyte_data::json->>'School State' as "school_state"
,_airbyte_data::json->>'VTP Name' as "vtp_name"
,_airbyte_data::json->>'Total Days completed in Internship
 (Daily Dairy)' as "total_days_completed_in_internship___dai"
,_airbyte_data::json->>'Student School Name' as "student_school_name"
,_airbyte_data::json->>'Student MiddleName' as "student_middle_name"
,_airbyte_data::json->>'Student Stream' as "student_stream"
,_airbyte_data::json->>'Student Mother Name' as "student_mother_name"
,_airbyte_data::json->>'Fair internships' as "fair_internships"
,_airbyte_data::json->>'Employer Internship Type' as "employer_internship_type"
,_airbyte_data::json->>'VT Email' as "vt_email"
,_airbyte_data::json->>'Student Phone number' as "student_phone_number"
,_airbyte_data::json->>'Student FirstName' as "student_first_name"
,_airbyte_data::json->>'Student Gender' as "student_gender"
,_airbyte_data::json->>'Student Attended Orientation?
 (Feedback Form)' as "student_attended_orientation____feedback"
,_airbyte_data::json->>'VT-Intership_Ratio' as "vt_intership_ratio"
,_airbyte_data::json->>'Devices Available at Student home' as "devices_available_at_student_home"
,_airbyte_data::json->>'Saftey Mesures Taken?
 (Internship Progress form)' as "saftey_mesures_taken____internship_progr"
,_airbyte_data::json->>'VT Gender' as "vt_gender"
,_airbyte_data::json->>'Good_Internship' as "good_internship"
,_airbyte_data::json->>'Student Email' as "student_email"
,_airbyte_data::json->>'VC Name' as "vc_name"
,_airbyte_data::json->>'Student Block' as "student_block"
,_airbyte_data::json->>'Total hrs by VT' as "total_hrs_by_vt"
,_airbyte_data::json->>'Student LastName' as "student_last_name"
,_airbyte_data::json->>'VT Sector' as "vt_sector"
,_airbyte_data::json->>'VT FullName' as "vt_full_name"
,_airbyte_data::json->>'Student Roll Number' as "student_roll_number"
FROM {{source('source_lahi','jharkhand_pathways_internship')}}
