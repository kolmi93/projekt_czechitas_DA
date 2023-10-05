import pandas as pd

# načtení všech .csv souborů
pop1990 = pd.read_csv('Population\IHME_GBD_2019_POP_1990_Y2020M10D15.CSV')
pop1991 = pd.read_csv('Population\IHME_GBD_2019_POP_1991_Y2020M10D15.CSV')
pop1992 = pd.read_csv('Population\IHME_GBD_2019_POP_1992_Y2020M10D15.CSV')
pop1993 = pd.read_csv('Population\IHME_GBD_2019_POP_1993_Y2020M10D15.CSV')
pop1994 = pd.read_csv('Population\IHME_GBD_2019_POP_1994_Y2020M10D15.CSV')
pop1995 = pd.read_csv('Population\IHME_GBD_2019_POP_1995_Y2020M10D15.CSV')
pop1996 = pd.read_csv('Population\IHME_GBD_2019_POP_1996_Y2020M10D15.CSV')
pop1997 = pd.read_csv('Population\IHME_GBD_2019_POP_1997_Y2020M10D15.CSV')
pop1998 = pd.read_csv('Population\IHME_GBD_2019_POP_1998_Y2020M10D15.CSV')
pop1999 = pd.read_csv('Population\IHME_GBD_2019_POP_1999_Y2020M10D15.CSV')
pop2000 = pd.read_csv('Population\IHME_GBD_2019_POP_2000_Y2020M10D15.CSV')
pop2001 = pd.read_csv('Population\IHME_GBD_2019_POP_2001_Y2020M10D15.CSV')
pop2002 = pd.read_csv('Population\IHME_GBD_2019_POP_2002_Y2020M10D15.CSV')
pop2003 = pd.read_csv('Population\IHME_GBD_2019_POP_2003_Y2020M10D15.CSV')
pop2004 = pd.read_csv('Population\IHME_GBD_2019_POP_2004_Y2020M10D15.CSV')
pop2005 = pd.read_csv('Population\IHME_GBD_2019_POP_2005_Y2020M10D15.CSV')
pop2006 = pd.read_csv('Population\IHME_GBD_2019_POP_2006_Y2020M10D15.CSV')
pop2007 = pd.read_csv('Population\IHME_GBD_2019_POP_2007_Y2020M10D15.CSV')
pop2008 = pd.read_csv('Population\IHME_GBD_2019_POP_2008_Y2020M10D15.CSV')
pop2009 = pd.read_csv('Population\IHME_GBD_2019_POP_2009_Y2020M10D15.CSV')
pop2010 = pd.read_csv('Population\IHME_GBD_2019_POP_2010_Y2020M10D15.CSV')
pop2011 = pd.read_csv('Population\IHME_GBD_2019_POP_2011_Y2020M10D15.CSV')
pop2012 = pd.read_csv('Population\IHME_GBD_2019_POP_2012_Y2020M10D15.CSV')
pop2013 = pd.read_csv('Population\IHME_GBD_2019_POP_2013_Y2020M10D15.CSV')
pop2014 = pd.read_csv('Population\IHME_GBD_2019_POP_2014_Y2020M10D15.CSV')
pop2015 = pd.read_csv('Population\IHME_GBD_2019_POP_2015_Y2020M10D15.CSV')
pop2016 = pd.read_csv('Population\IHME_GBD_2019_POP_2016_Y2020M10D15.CSV')
pop2017 = pd.read_csv('Population\IHME_GBD_2019_POP_2017_Y2020M10D15.CSV')
pop2018 = pd.read_csv('Population\IHME_GBD_2019_POP_2018_Y2020M10D15.CSV')
pop2019 = pd.read_csv('Population\IHME_GBD_2019_POP_2019_Y2020M10D15.CSV')





# spojení všech .csv do jednoho souboru
population_data = pd.concat([pop1990,pop1991,pop1992,pop1993,pop1994,pop1995,pop1996,pop1997,pop1998,pop1999,pop2000,pop2001,pop2002,pop2003,pop2004,pop2005,pop2006,pop2007,pop2008,pop2009,pop2010,pop2011,pop2012,pop2013,pop2014,pop2015,pop2016,pop2017,pop2018,pop2019
], ignore_index=True)

# uložení do souboru
#population_data.to_csv('population_data.csv', index=False)
#print(population_data.info())
print(population_data.columns)
print(population_data.head(30))