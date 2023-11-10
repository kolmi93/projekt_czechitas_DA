CREATE OR REPLACE TABLE DAYLIGHT AS
SELECT RF.ISO, RF.ENTITY AS COUNTRY, D.City AS CITY, D.Daylight_year AS DAYLIGHT_YEAR
FROM daylight AS D
LEFT JOIN rf_staty AS RF
ON
    CASE  
        WHEN D.Country = 'Ivory Coast' THEN 'Cote d\'Ivoire'
    ELSE D.Country
    END = RF.ENTITY;