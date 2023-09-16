{{ config(
  materialized='table',
    schema='intermediate'

) }}


SELECT *,
    CASE 
        WHEN sector_trade = 'IT/ITes' THEN 'IT-ITeS'
        WHEN sector_trade = 'IT/ITeS' THEN 'IT-ITeS'
        WHEN sector_trade = 'IT/ITES' THEN 'IT-ITeS'
        WHEN TRIM(sector_trade) = 'Apparels , Made ups & Home Furnishing' THEN 'Apparels, Made Ups & Home Furnishing'
        WHEN sector_trade = 'Apparel, Made-Ups & Home Furnishing' THEN 'Apparels, Made Ups & Home Furnishing'
        WHEN sector_trade = 'AUTOMOTIVE' THEN 'Automotive'
        WHEN sector_trade = 'Banking, Financial Services and Insurance' THEN 'Banking, Financial Services & Insurance'
        WHEN sector_trade = 'Financial Markets Management (CBSE)' THEN 'Banking, Financial Services & Insurance'
        WHEN sector_trade = 'BEAUTY & WELLNESS' THEN 'Beauty & Wellness'
        WHEN sector_trade = 'Electronic Technology (CBSE)' THEN 'Electronics & Hardware'
        WHEN sector_trade = 'Food Production (CBSE)' THEN 'Food Processing'
        WHEN sector_trade = 'Multi Skill Foundation Course' THEN 'Multiskilling'
        WHEN sector_trade = 'Plumber' THEN 'Plumbing'
        WHEN sector_trade = 'Private security' THEN 'Private Security'
        WHEN sector_trade = 'PRIVATE SECURITY' THEN 'Private Security'
        WHEN sector_trade = 'RETAIL' THEN 'Retail'
        WHEN sector_trade = 'Tourism & HospitalitY' THEN 'Tourism & Hospitality'
        WHEN sector_trade = 'TOURISM & HOSPITALITY' THEN 'Retail'
        WHEN sector_trade = 'Travel and Tourism (CBSE)' THEN 'Retail'
        ELSE sector_trade
    END AS sector
FROM
    dev_intermediate.union_state
-- WHERE 
--     sector_trade IS NOT NULL