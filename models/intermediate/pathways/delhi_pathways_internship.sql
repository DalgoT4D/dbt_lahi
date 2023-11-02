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
,_airbyte_data::json->>'VT Remarks for student' as "vt_remarks_for_student"
,_airbyte_data::json->>'School State' as "school_state"
,_airbyte_data::json->>'Total Hours by VT' as "total_hours_by_vt"
,_airbyte_data::json->>'Internship Image4' as "internship_image4"
,_airbyte_data::json->>'Student Sector' as "student_sector"
,_airbyte_data::json->>'Employer Address' as "employer_address"
,_airbyte_data::json->>'Employer District' as "employer_district"
,_airbyte_data::json->>'Internship Certificate given by Employer to student?
(Internship progress Form)' as "internship_certificate_given_by_employer"
,_airbyte_data::json->>'Hours Per Day
(Internship Progress form)' as "hours_per_day__internship_progress_form_"
,_airbyte_data::json->>'Employer sector' as "employer_sector"
,_airbyte_data::json->>'School District' as "school_district"
,_airbyte_data::json->>'VTP Name' as "vtp_name"
,_airbyte_data::json->>'Udise' as "udise"
,_airbyte_data::json->>'Student School Name' as "student_school_name"
,_airbyte_data::json->>'Internship Type
(Internship Progress form)' as "internship_type__internship_progress_for"
,_airbyte_data::json->>'School Block' as "school_block"
,_airbyte_data::json->>'Employer Year of Establishment' as "employer_year_of_establishment"
,_airbyte_data::json->>'Student MiddleName' as "student_middle_name"
,_airbyte_data::json->>'Student Class' as "student_class"
,_airbyte_data::json->>'Student Stream' as "student_stream"
,_airbyte_data::json->>'Student School Category' as "student_school_category"
,_airbyte_data::json->>'Student Completed Internship?' as "student_completed_internship_"
,_airbyte_data::json->>'Student Daily Work Register maintained?' as "student_daily_work_register_maintained_"
,_airbyte_data::json->>'Student Mother Name' as "student_mother_name"
,_airbyte_data::json->>'Employer Internship Type' as "employer_internship_type"
,_airbyte_data::json->>'Student Date Of Birth' as "student_date_of_birth"
,_airbyte_data::json->>'Employer State' as "employer_state"
,_airbyte_data::json->>'VT Email' as "vt_email"
,_airbyte_data::json->>'Student Phone number' as "student_phone_number"
,_airbyte_data::json->>'School Village' as "school_village"
,_airbyte_data::json->>'Employer Last name' as "employer_last_name"
,_airbyte_data::json->>'Employer Email ID' as "employer_email_id"
,_airbyte_data::json->>'Student Full Name' as "student_full_name"
,_airbyte_data::json->>'Student FirstName' as "student_first_name"
,_airbyte_data::json->>'School Pincode' as "school_pincode"
,_airbyte_data::json->>'Student Gender' as "student_gender"
,_airbyte_data::json->>'Letter of Confirmation Signed by Employer & HoS?' as "letter_of_confirmation_signed_by_employe"
,_airbyte_data::json->>'Student Whatsapp number' as "student_whatsapp_number"
,_airbyte_data::json->>'Name of employer/shop/organization/company' as "name_of_employer_shop_organization_compa"
,_airbyte_data::json->>'Devices Available at Student home' as "devices_available_at_student_home"
,_airbyte_data::json->>'Student District' as "student_district"
,_airbyte_data::json->>'Internship Image1' as "internship_image1"
,_airbyte_data::json->>'Employer Block' as "employer_block"
,_airbyte_data::json->>'VT Gender' as "vt_gender"
,_airbyte_data::json->>'Employer Whatsapp number' as "employer_whatsapp_number"
,_airbyte_data::json->>'Employer Pincode' as "employer_pincode"
,_airbyte_data::json->>'Date Of Completion (Internship Progress)' as "date_of_completion__internship_progress_"
,_airbyte_data::json->>'Consent Form signed by Student and Parents/Local Guardian?' as "consent_form_signed_by_student_and_paren"
,_airbyte_data::json->>'Date Of Commencement (Internship Progress)' as "date_of_commencement__internship_progres"
,_airbyte_data::json->>'Employee count' as "employee_count"
,_airbyte_data::json->>'Employer First name' as "employer_first_name"
,_airbyte_data::json->>'Internship Image3' as "internship_image3"
,_airbyte_data::json->>'Total Days completed in Internship
(Internship Progress form)' as "total_days_completed_in_internship__inte"
,_airbyte_data::json->>'Student Email' as "student_email"
,_airbyte_data::json->>'Internship_hrs_category' as "internship_hrs_category"
,_airbyte_data::json->>'Student Attendance Sheet maintained?' as "student_attendance_sheet_maintained_"
,_airbyte_data::json->>'VC Name' as "vc_name"
,_airbyte_data::json->>'Employer Middle name' as "employer_middle_name"
,_airbyte_data::json->>'No of Students enrolled with employer' as "no_of_students_enrolled_with_employer"
,_airbyte_data::json->>'VT Mobile' as "vt_mobile"
,_airbyte_data::json->>'Employer City' as "employer_city"
,_airbyte_data::json->>'Student Father Name' as "student_father_name"
,_airbyte_data::json->>'Student Block' as "student_block"
,_airbyte_data::json->>'Internship Image2' as "internship_image2"
,_airbyte_data::json->>'Saftey Mesures Taken?
(Internship Progress form)' as "saftey_mesures_taken___internship_progre"
,_airbyte_data::json->>'Student LastName' as "student_last_name"
,_airbyte_data::json->>'VT Sector' as "vt_sector"
,_airbyte_data::json->>'Student Job Role' as "student_job_role"
,_airbyte_data::json->>'VT FullName' as "vt_full_name"
,_airbyte_data::json->>'Internship Report created by student?' as "internship_report_created_by_student_"
,_airbyte_data::json->>'Total Hours Covered
(Daily Dairy)' as "total_hours_covered__daily_dairy_"
,_airbyte_data::json->>'Employer Business Type' as "employer_business_type"
,_airbyte_data::json->>'Total Days completed in Internship
(Daily Dairy)' as "total_days_completed_in_internship__dail"
,_airbyte_data::json->>'Employer Mobile number' as "employer_mobile_number"
,_airbyte_data::json->>'Student Academic Year' as "student_academic_year"
,_airbyte_data::json->>'Student Roll Number' as "student_roll_number"
,_airbyte_data::json->>'Student School Management' as "student_school_management"
FROM {{source('source_lahi','delhi_pathways_internship')}}
