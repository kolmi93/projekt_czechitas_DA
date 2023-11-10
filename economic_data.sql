Create or replace table economic_data as
SELECT distinct 
      rf.ISO as ISO,
      d.YEAR as YEAR, 
      cast (gdp.GDP_per_capita_PPP_constant_2017_international as float) as GDP_PER_CAPITA,
      cast (gni.GNI_per_capita_PPP_constant_2017_international as float) as GNI_PER_CAPITA,
      class.World_Bank_income_classification as WB_INCOME_CLASS
 
from deseases as d
cross join 
    (select ISO from rf_staty)  as rf

left join gdp_per_capita_full as gdp
on rf.ISO = gdp.Code AND d.YEAR = gdp.Year 

left join GNI_per_capita as gni
on rf.ISO = gni.Code AND d.YEAR = gni.Year 

left join income_classification as class
on rf.ISO = class.Code AND d.YEAR = class.Year

order by ISO, YEAR;