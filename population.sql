CREATE OR REPLACE TABLE population AS 
SELECT 
    distinct rf.ISO,
    des.year as YEAR,
    des.sex_name as SEX_NAME,
    des.age_name as AGE_GROUP,
    CAST(pop.val as FLOAT) as POPULATION
FROM rf_staty as rf
left join deseases_data_full as des
on       
  CASE
        WHEN des.location_name = 'Bolivia (Plurinational State of)' THEN 'Bolivia'
        WHEN des.location_name = 'Brunei Darussalam' THEN 'Brunei'
        WHEN des.location_name = 'Cabo Verde' THEN 'Cape Verde'
        WHEN des.location_name = 'Côte d\'Ivoire' THEN 'Cote d\'Ivoire'
        WHEN des.location_name = 'Democratic People\'s Republic of Korea' THEN 'North Korea'
        WHEN des.location_name = 'Democratic Republic of the Congo' THEN 'Democratic Republic of Congo'
        WHEN des.location_name = 'Iran (Islamic Republic of)' THEN 'Iran'          
        WHEN des.location_name = 'Lao People\'s Democratic Republic' THEN 'Laos'
        WHEN des.location_name = 'Micronesia (Federated States of)' THEN 'Micronesia (country)'
        WHEN des.location_name = 'Republic of Korea' THEN 'South Korea'
        WHEN des.location_name = 'Republic of Moldova' THEN 'Moldova'
        WHEN des.location_name = 'Russian Federation' THEN 'Russia'
        WHEN des.location_name = 'Syrian Arab Republic' THEN 'Syria'
        WHEN des.location_name = 'Taiwan (Province of China)' THEN 'Taiwan'
        WHEN des.location_name = 'Timor-Leste' THEN 'East Timor'
        WHEN des.location_name = 'United Republic of Tanzania' THEN 'Tanzania'
        WHEN des.location_name = 'United States of America' THEN 'United States'
        WHEN des.location_name = 'Venezuela (Bolivarian Republic of)' THEN 'Venezuela'
        WHEN des.location_name = 'Viet Nam' THEN 'Vietnam'
   ELSE des.location_name
   END = rf.ENTITY 
left join population_data_full as pop
on des.location_name = pop.location_name 
    AND des.year = pop.year_id
    AND des.age_id = pop.age_group_id
    AND des.sex_id = pop.sex_id
order by ISO, YEAR, AGE_GROUP;