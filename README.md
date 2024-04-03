# Causes of death on a global scale

What do people die from? How do these causes differ over time, between continents, age groups, or genders? Our project, which focuses on causes of death worldwide from 1990 to 2019, aims to answer these questions and many more.

Our goal was to provide users with a tool to test their hypotheses - both globally and locally. At the same time, the project further explores causes of death for the age group of children under 5 years old.
Data for the project was gathered from IHME, Our World in Data, Pew Research Center, and Kaggle.

We combined the main diseases dataset using pandas and uploaded it to Keboola. This was followed by a search for additional data to enrich our main dataset. As a result, we had 6 datasets: diseases, rf_staty, health_accesibility, popul_density, economic_data, and daylight. We cleaned them using SQL in Keboola in the Snowflake environment. Working in Keboola has its specifics, e.g. all table and column names must be enclosed in quotation marks. Therefore, do not be alarmed when you see them in the codes.

The project resulted in 4 interactive dashboards created in Tableau.
1. Global causes of death (differences between continents)
2. Local view of the user-selected country, causes of death. It shows the distribution by gender, age groups, and economic data.
3. Demographic distribution of mortality within continents, a more detailed view of the mortality trend of the observed group (children under 5 years old) and their most common causes of death.
4. Mortality on individual continents - 1990 vs. 2019.
More about the project in the links below.

Article -> https://bit.ly/dadpp23projekt01
Tableau Public -> https://bit.ly/viz_causes_of_death

### Digital Academy:DATA
This project is the final project of the intensive retraining course Digital Data Academy from the non-profit organization Czechitas. The project was completed in pairs under the supervision of mentors.

In the academy, we learned data modeling, cleaning, analysis, and visualization. We programmed in Python and SQL. The main tools we used were: Snowflake, Keboola, VS Code, Tableau, and Lucidchart. We also learned about Git, GitHub, Power BI, and others.

# Příčiny úmrtí v celosvětovém měřítku

Na co lidé umírají? Jak se liší tyto příčiny v čase, mezi kontinenty, věkovými skupinami nebo třeba pohlavími? Na tyto otázky a mnoho dalších, odpovídá náš projekt, věnující se příčinám úmrtí v celosvětovém pohledu mezi lety 1990 až 2019.

Cílem projektu bylo poskytnout uživateli nástroj, ve kterém si může otestovat své hypotézy — ať už na globální nebo lokální úrovni. Zároveň projekt hlouběji mapuje příčiny úmrtí pro věkovou skupinu dětí do 5 let.
Data pro projekt jsme čerpaly z IHME, Our World in Data, Pew Research Center a Kaggle.

Hlavní dataset deseases jsme spojily pomocí pandas a nahrály do Kebooly. Následovalo hledání dalších dat, kterými bychom mohly náš hlavní dataset obohatit. Ve výsledku jsme měly 6 datasetů: deseases, rf_staty (náš číselník), health_accesibility, popul_density, economic_data a daylight. Jejich čištění jsme dělaly pomocí SQL v Keboole v prostředí Snowflake. Práce v Keboole má svá specifika, např. veškeré názvy tablek a sloupců musí být uvedena v uvozovkách. Proto se nelekejte, když je v kódech uvidíte.

Výsledkem projektu jsou 4 interaktiní dashboardy vytvořené v Tableau.
 1. globální přičiny úmrtí (rozdíly mezi kontinenty)
 2. lokální pohled na uživatelem vybraný stát, příčiny úmrtí. Jsou zde zobrazené rozložení v ramci pohlaví, věkových skupin, ekonomická data.
 3. Demografické rozložení úmrtnosti v rámci kontinentů, detailnější pohled vývoje úmrtnosti sledované skupiny (děti do 5 let) a jejich nejčastější přičiny úmrtí.
 4. Úmrtnost na jednotlivých kontinentech - 1990 vs. 2019.
Více o projektu v odkazech níže.

článek -> https://bit.ly/dadpp23projekt01
Tableau Public -> https://bit.ly/viz_causes_of_death

### Digitální akademie: DATA
Tento projekt je závěrečných projektem intenzivního rekvalifikačního kurzu Digitální akadmeie: Data od neziskovéorganizace Czechitas. Projekt byl zpracován ve dvojici pod dohledem mentorů.
V akademii jsme se učily datové modelování, čištění, analyzování a vizualizaci dat. Programovaly jsme v Pythonu a SQL. Hlavní nástroje, které jsme k tomu používaly byly: Snowflake, Keboola, VS Code, Tableau a Lucidchart. Také jsme se učily s Git, GitHub, Power BI a dalšími.
