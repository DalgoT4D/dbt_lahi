{{ config(
  materialized='table',
  schema='intermediate'
) }}

SELECT 
    COUNT(DISTINCT CASE WHEN "state_job_role_9_and_10" NOT IN ('NA', 'No information available', 'Not available') THEN "state_job_role_9_and_10" END) as job_roles_9th_10th,
    COUNT(DISTINCT CASE WHEN "state_job_role_11_and_12" NOT IN ('NA', 'No information available', 'Not available') THEN "state_job_role_11_and_12" END) as job_roles_11th_12th,
    COUNT(DISTINCT CASE WHEN "sector_trade" NOT IN ('NA', 'No information available', 'Not available') THEN "sector_trade" END) as sector_trade,
    COUNT(CASE WHEN "school_id_udi" NOT IN ('NA', 'No information available', 'Not available') THEN "school_id_udi" END) as ve_schools,
    COUNT(CASE WHEN "vtp" NOT IN ('NA', 'No information available', 'Not available') THEN "vtp" END) as vtp,
    COUNT(CASE WHEN "vt_name" NOT IN ('NA', 'No information available', 'Not available') THEN "vt_name" END) as vt,
    COUNT(CASE 
    WHEN "school_category" = 'Composite (9-12)' AND 
         "school_category" NOT IN ('NA', 'No information available', 'Not available') 
    THEN "school_category" 
    END) as school_category_composite_9_to_12,
    COUNT(CASE 
    WHEN "school_category" = 'Non-Composite (9-10)' AND 
         "school_category" NOT IN ('NA', 'No information available', 'Not available') 
    THEN "school_category" 
    END) as school_category_noncomposite_9_to_10,
    COUNT(CASE 
    WHEN "school_category" = 'Composite' AND 
         "school_category" NOT IN ('NA', 'No information available', 'Not available') 
    THEN "school_category" 
    END) as school_category_composite,
    COUNT(CASE 
    WHEN "lab" = 'Available' AND 
         "lab" NOT IN ('NA', 'No information available') 
    THEN "lab" 
    END) as lab_available,
    COUNT(CASE 
    WHEN "lab" = 'Not Available' AND 
         "lab" NOT IN ('NA', 'No information available') 
    THEN "lab" 
    END) as lab_not_available,
    COALESCE(SUM(NULLIF("grand_total", 'NA')::INTEGER), 0) AS grand_total_across_states,
    COALESCE(SUM(NULLIF("total_boys", 'NA')::INTEGER), 0) AS total_boys_across_states,
    COALESCE(SUM(NULLIF("total_girls", 'NA')::INTEGER), 0) AS total_girls_across_states
FROM dev_intermediate.union_state