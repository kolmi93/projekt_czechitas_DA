CREATE OR REPLACE TABLE "health_accessibility" AS
SELECT distinct 
    d."YEAR" as "YEAR" ,
    rf."ISO" as "ISO",
    cast (quality."UHC_service_coverage_index" as float) as "UHC_INDEX",
    cast (phy."Physicians_per_1_000_people" as float) as "PHYSICIANS_PER_1000",
    cast (spend."Domestic_general_government_health_expenditure_of_GDP" as float) as "GOV_HEALTH_XP_OF_GDP",
    cast (bed."Hospital_beds_per_1_000_people" as float) as "HOSP_BEDS_PER_1000"
        
from "deseases" as d
cross join 
    (select "ISO" from "rf_staty")  as rf

left join "health_access_quality" as quality
on rf."ISO" = quality."Code" AND d."YEAR" = quality."Year"

left join "physicians_per_1000_people" as phy
on rf."ISO" = phy."Code" AND d."YEAR" = phy."Year"

left join "public_healthcare_spengind_share_gdp" as spend
on rf."ISO" = spend."Code" AND d."YEAR" = spend."Year"

left join "hospital_beds_per_1000" as bed
on rf."ISO" = bed."Code" AND d."YEAR" = bed."Year"

order by d."YEAR", rf."ISO";