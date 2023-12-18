--DBT AUTOMATION has generated this model, please DO NOT EDIT 
--Please make sure you dont change the model name 

{{ 
  config(
    materialized='table'
  ) 
}}

with cte as ({{ dbt_utils.union_relations(
        relations=[
                ref('delhi_pathways_internship'),
                ref('maharashtra_pathways_internship'),
                ref('jharkhand_pathways_internship'),
                ref('gujarat_pathways_internship')
            ]
) }})


select 
    school_state,
    total_hours_by_vt,
    student_sector,
    employer_district,
    internship_certificate_given_by_employer,
    hours_per_day__internship_progress_form_ as hours_per_day_internship_progress_form,
    employer_sector,
    school_district,
    vtp_name,
    udise,
    student_school_name,
    internship_type__internship_progress_for as internship_type_internship_progress_for,
    school_block,
    student_middle_name,
    student_class,
    student_stream,
    student_school_category,
    student_completed_internship_ as student_completed_internship,
    student_daily_work_register_maintained_ as student_daily_work_register_maintained,
    employer_internship_type,
    student_date_of_birth,
    employer_state,
    student_phone_number,
    employer_last_name,
    student_full_name,
    student_first_name,
    school_pincode,
    student_gender,
    student_whatsapp_number,
    name_of_employer_shop_organization_compa,
    student_district,
    internship_image1,
    vt_gender,
    date_of_completion__internship_progress_ as date_of_completion_internship_progress,
    date_of_commencement__internship_progres as date_of_commencement_internship_progres,
    employee_count,
    employer_first_name,
    internship_image3,
    total_days_completed_in_internship__inte as total_days_completed_in_internship_inte,
    internship_hrs_category,
    employer_middle_name,
    no_of_students_enrolled_with_employer,
    employer_city,
    student_father_name,
    student_block,
    internship_image2,
    saftey_mesures_taken___internship_progre as saftey_mesures_taken_internship_progre,
    student_last_name,
    vt_sector,
    student_job_role,
    vt_full_name,
    total_hours_covered__daily_dairy_ as total_hours_covered_daily_dairy,
    employer_business_type,
    total_days_completed_in_internship__dail as total_days_completed_in_internship_dail,
    employer_mobile_number,
    student_academic_year,
    student_roll_number,
    student_school_management
from cte
