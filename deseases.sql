create or replace table "deseases" as
select 
    rf.ISO as ISO,
    deseases.year as YEAR,
    deseases.sex_name as SEX_NAME,
    deseases.age_name as AGE_GROUP,
    deseases.cause_name as CAUSE_NAME,
    cast (deseases.val as float) as COUNT_DEATH
    
from deseases_data_full as deseases
// napojíme ISO - skrze rf_staty
left join rf_staty as rf
on 
  CASE
        WHEN deseases.location_name = 'Bolivia (Plurinational State of)' THEN 'Bolivia'
        WHEN deseases.location_name = 'Brunei Darussalam' THEN 'Brunei'
        WHEN deseases.location_name = 'Cabo Verde' THEN 'Cape Verde'
        WHEN deseases.location_name = 'Côte d\'Ivoire' THEN 'Cote d\'Ivoire'
        WHEN deseases.location_name = 'Democratic People\'s Republic of Korea' THEN 'North Korea'
        WHEN deseases.location_name = 'Democratic Republic of the Congo' THEN 'Democratic Republic of Congo'
        WHEN deseases.location_name = 'Iran (Islamic Republic of)' THEN 'Iran'          
        WHEN deseases.location_name = 'Lao People\'s Democratic Republic' THEN 'Laos'
        WHEN deseases.location_name = 'Micronesia (Federated States of)' THEN 'Micronesia (country)'
        WHEN deseases.location_name = 'Republic of Korea' THEN 'South Korea'
        WHEN deseases.location_name = 'Republic of Moldova' THEN 'Moldova'
        WHEN deseases.location_name = 'Russian Federation' THEN 'Russia'
        WHEN deseases.location_name = 'Syrian Arab Republic' THEN 'Syria'
        WHEN deseases.location_name = 'Taiwan (Province of China)' THEN 'Taiwan'
        WHEN deseases.location_name = 'Timor-Leste' THEN 'East Timor'
        WHEN deseases.location_name = 'United Republic of Tanzania' THEN 'Tanzania'
        WHEN deseases.location_name = 'United States of America' THEN 'United States'
        WHEN deseases.location_name = 'Venezuela (Bolivarian Republic of)' THEN 'Venezuela'
        WHEN deseases.location_name = 'Viet Nam' THEN 'Vietnam'
   ELSE deseases.location_name
   END = rf.ENTITY
;

ALTER TABLE deseases
ADD DESEASE_CATEGORY VARCHAR(100);

UPDATE deseases
SET DESEASE_CATEGORY =
  CASE
    WHEN CAUSE_NAME IN ('Respiratory infections and tuberculosis','Maternal and neonatal disorders','Enteric infections','HIV/AIDS and sexually transmitted infections','Neglected tropical diseases and malaria','Other infectious diseases','Nutritional deficiencies') THEN 'Communicable, maternal, neonatal, and nutritional diseases'
    
    WHEN CAUSE_NAME IN ('Cardiovascular diseases','Neoplasms','Chronic respiratory diseases','Diabetes and kidney diseases','Digestive diseases','Neurological disorders','Other non-communicable diseases','Substance use disorders','Musculoskeletal disorders','Skin and subcutaneous diseases','Eating disorders') THEN 'Non-communicable diseases'
    WHEN CAUSE_NAME IN ('Exposure to forces of nature','Environmental heat and cold exposure','Falls','Drowning','Fire, heat, and hot substances','Poisonings','Exposure to mechanical forces','Adverse effects of medical treatment','Animal contact','Foreign body','Other unintentional injuries', 'Transport injuries','Conflict and terrorism','Self-harm','Interpersonal violence','Executions and police conflict') THEN 'Injuries'
    ELSE 'Nezařazeno'
  END;