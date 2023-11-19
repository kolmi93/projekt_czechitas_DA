select *
from "w_religion";

UPDATE "w_religion"
SET "PERCENT_CHRISTIAN" = REGEXP_REPLACE("PERCENT_CHRISTIAN", '[<]|[<]|[> ]|[> ]|[%]|[ %]', ''),
    "PERCENT_MUSLIM" = REGEXP_REPLACE("PERCENT_MUSLIM", '[<]|[<]|[> ]|[> ]|[%]|[ %]', ''),
    "PERCENT_UNAFFIL" = REGEXP_REPLACE("PERCENT_UNAFFIL", '[<]|[<]|[> ]|[> ]|[%]|[ %]', ''),
    "PERCENT_HINDU" = REGEXP_REPLACE("PERCENT_HINDU", '[<]|[<]|[> ]|[> ]|[%]|[ %]', ''),
    "PERCENT_BUDDHIST" = REGEXP_REPLACE("PERCENT_BUDDHIST", '[<]|[<]|[> ]|[> ]|[%]|[ %]', ''),
    "PERCENT_FOLK_RELIGION" = REGEXP_REPLACE("PERCENT_FOLK_RELIGION", '[<]|[<]|[> ]|[> ]|[%]|[ %]', ''),
    "PERCENT_OTHER_RELIGION" = REGEXP_REPLACE("PERCENT_OTHER_RELIGION", '[<]|[<]|[> ]|[> ]|[%]|[ %]', ''),
    "PERCENT_JEWISH" = REGEXP_REPLACE("PERCENT_JEWISH", '[<]|[<]|[> ]|[> ]|[%]|[ %]', '')
WHERE 1 = 1;

ALTER TABLE "w_religion"
ADD COLUMN "krestanstvi" FLOAT;

UPDATE "w_religion"
SET "krestanstvi" = CAST("PERCENT_CHRISTIAN" AS FLOAT);

ALTER TABLE "w_religion"
ADD COLUMN "islam" FLOAT;

UPDATE "w_religion"
SET "islam" = CAST("PERCENT_MUSLIM" AS FLOAT);

ALTER TABLE "w_religion"
ADD COLUMN "unafill" FLOAT;

UPDATE "w_religion"
SET "unafill" = CAST("PERCENT_UNAFFIL" AS FLOAT);

ALTER TABLE "w_religion"
ADD COLUMN "hindu" FLOAT;

UPDATE "w_religion"
SET "hindu" = CAST("PERCENT_HINDU" AS FLOAT);

ALTER TABLE "w_religion"
ADD COLUMN "buddhist" FLOAT;

UPDATE "w_religion"
SET "buddhist" = CAST("PERCENT_BUDDHIST" AS FLOAT);

ALTER TABLE "w_religion"
ADD COLUMN "folk_religion" FLOAT;

UPDATE "w_religion"
SET "folk_religion" = CAST("PERCENT_FOLK_RELIGION" AS FLOAT);

ALTER TABLE "w_religion"
ADD COLUMN "other_religion" FLOAT;

UPDATE "w_religion"
SET "other_religion" = CAST("PERCENT_OTHER_RELIGION" AS FLOAT);

ALTER TABLE "w_religion"
ADD COLUMN "jewish" FLOAT;

UPDATE "w_religion"
SET "jewish" = CAST("PERCENT_JEWISH" AS FLOAT);

alter table "w_religion" drop column "PERCENT_CHRISTIAN";

alter table "w_religion" drop column "PERCENT_MUSLIM";

alter table "w_religion" drop column "PERCENT_UNAFFIL";

alter table "w_religion" drop column "PERCENT_HINDU";

alter table "w_religion" drop column "PERCENT_BUDDHIST";

alter table "w_religion" drop column "PERCENT_FOLK_RELIGION";

alter table "w_religion" drop column "PERCENT_OTHER_RELIGION";

alter table "w_religion" drop column "PERCENT_JEWISH";

alter table "w_religion" drop column "COUNTRY_POPULATION_2010";


alter table "w_religion" add "majoritni_nabozenstvi" varchar;

update "w_religion"
set "majoritni_nabozenstvi" =
    case
     when "krestanstvi">"islam" and "krestanstvi">"unafill" and "krestanstvi">"hindu" and "krestanstvi">"buddhist" and "krestanstvi">"folk_religion" and "krestanstvi">"other_religion" and "krestanstvi">"jewish" then 'křesťanství'
     when "islam">"krestanstvi" and "islam">"unafill" and "islam">"hindu" and "islam">"buddhist" and "islam">"folk_religion" and "islam">"other_religion" and "islam">"jewish" then 'islam'
     when "unafill">"krestanstvi" and "unafill">"islam" and "unafill">"hindu" and "unafill">"buddhist" and "unafill">"folk_religion" and "unafill">"other_religion" and "unafill">"jewish" then 'unaffil'
     when "hindu">"krestanstvi" and "hindu">"islam" and "hindu">"unafill" and "hindu">"buddhist" and "hindu">"folk_religion" and "hindu">"other_religion" and "hindu">"jewish" then 'hindu'
     when "buddhist">"krestanstvi" and "buddhist">"islam" and "buddhist">"unafill" and "buddhist">"hindu" and "buddhist">"folk_religion" and "buddhist">"other_religion" and "buddhist">"jewish" then 'buddhist'
     when "folk_religion">"krestanstvi" and "folk_religion">"islam" and "folk_religion">"unafill" and "folk_religion">"hindu" and "folk_religion">"buddhist" and "folk_religion">"other_religion" and "folk_religion">"jewish" then 'folk_religion'
     when "other_religion">"krestanstvi" and "other_religion">"islam" and "other_religion">"unafill" and "other_religion">"hindu" and "other_religion">"buddhist" and "other_religion">"folk_religion" and "other_religion">"jewish" then 'other_religion'
     else 'jewish'
     end;


UPDATE "w_religion" SET "COUNTRY"='Bosnia and Herzegovina' WHERE "COUNTRY"='Bosnia-Herzegovina';

UPDATE "w_religion" SET "COUNTRY"='Guinea-Bissau' WHERE "COUNTRY"='Guinea Bissau';

UPDATE "w_religion" SET "COUNTRY"='Northern Mariana Islands' WHERE "COUNTRY"='Northern Mariana Is.';

UPDATE "w_religion" SET "COUNTRY"='DR Congo' WHERE "COUNTRY"='Dem. Rep. of the Congo';

UPDATE "w_religion" SET "COUNTRY"='Saint Vincent and the Grenadines' WHERE "COUNTRY"='St. Vincent and the Gren.';

UPDATE "w_religion" SET "COUNTRY"='Palestine' WHERE "COUNTRY"='Palestinian territories';

CREATE OR REPLACE TABLE "rf_staty" AS
SELECT DISTINCT
    density."Code" as ISO, 
    density."Entity" as ENTITY, 
     CASE
        WHEN primorske."state" is null THEN 1
        ELSE 0
     END as SEA_FLAG,
    religion."majoritni_nabozenstvi" as MAJORITNI_NABOZENSTVI,
    cont."listOfCountriesByContinent_continent" as CONTINENT
from "deseases_data_full" as deseases
left join "population_density" as density
on 
  CASE
        WHEN deseases."location_name" = 'Bolivia (Plurinational State of)' THEN 'Bolivia'
        WHEN deseases."location_name" = 'Brunei Darussalam' THEN 'Brunei'
        WHEN deseases."location_name" = 'Cabo Verde' THEN 'Cape Verde'
        WHEN deseases."location_name" = 'Côte d\'Ivoire' THEN 'Cote d\'Ivoire'
        WHEN deseases."location_name" = 'Democratic People\'s Republic of Korea' THEN 'North Korea'
        WHEN deseases."location_name" = 'Democratic Republic of the Congo' THEN 'Democratic Republic of Congo'
        WHEN deseases."location_name" = 'Iran (Islamic Republic of)' THEN 'Iran'          
        WHEN deseases."location_name" = 'Lao People\'s Democratic Republic' THEN 'Laos'
        WHEN deseases."location_name" = 'Micronesia (Federated States of)' THEN 'Micronesia (country)'
        WHEN deseases."location_name" = 'Republic of Korea' THEN 'South Korea'
        WHEN deseases."location_name" = 'Republic of Moldova' THEN 'Moldova'
        WHEN deseases."location_name" = 'Russian Federation' THEN 'Russia'
        WHEN deseases."location_name" = 'Syrian Arab Republic' THEN 'Syria'
        WHEN deseases."location_name" = 'Taiwan (Province of China)' THEN 'Taiwan'
        WHEN deseases."location_name" = 'Timor-Leste' THEN 'East Timor'
        WHEN deseases."location_name" = 'United Republic of Tanzania' THEN 'Tanzania'
        WHEN deseases."location_name" = 'United States of America' THEN 'United States'
        WHEN deseases."location_name" = 'Venezuela (Bolivarian Republic of)' THEN 'Venezuela'
        WHEN deseases."location_name" = 'Viet Nam' THEN 'Vietnam'
   ELSE deseases."location_name"
   END = density."Entity"
left join "primorske" as primorske
on primorske."state" = density."Entity"
left join "w_religion" as religion
on density."Entity" = religion."COUNTRY"
left join "countries_by_continent" as cont
on 
    CASE
        WHEN density."Entity" = 'Micronesia (country)' THEN 'Micronesia'
        WHEN density."Entity" = 'East Timor' THEN 'Timor-Leste'
        WHEN density."Entity" = 'Congo' THEN 'Republic of the Congo'
        WHEN density."Entity" = 'Democratic Republic of Congo' THEN 'DR Congo'
        WHEN density."Entity" = 'Cote d\'Ivoire' THEN 'Ivory Coast'
        WHEN density."Entity" = 'Czechia' THEN 'Czech Republic'
    ELSE density."Entity"
    END = cont."country"
;