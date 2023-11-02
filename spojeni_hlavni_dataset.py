import pandas as pd

# načtení všech .csv souborů
one = pd.read_csv('D-1.csv')
two = pd.read_csv('D-2.csv')
three = pd.read_csv('D-3.csv')
four = pd.read_csv('D-4.csv')
five  = pd.read_csv('D-5.csv')
six = pd.read_csv('D-6.csv')
seven = pd.read_csv('D-7.csv')
eight = pd.read_csv('D-8.csv')
nine = pd.read_csv('D-9.csv')
ten = pd.read_csv('D-10.csv')
ten1 = pd.read_csv('D-11.csv')
ten2 = pd.read_csv('D-12.csv')
ten3 = pd.read_csv('D-13.csv')
ten4 = pd.read_csv('D-14.csv')
ten5 = pd.read_csv('D-15.csv')
ten6 = pd.read_csv('D-16.csv')
ten7 = pd.read_csv('D-17.csv')
ten8 = pd.read_csv('D-18.csv')
ten9 = pd.read_csv('D-19.csv')
twenty = pd.read_csv('D-20.csv')
twenty1 = pd.read_csv('D-21.csv')
twenty2 = pd.read_csv('D-22.csv')
twenty3 = pd.read_csv('D-23.csv')
twenty4 = pd.read_csv('D-24.csv')
twenty5 = pd.read_csv('D-25.csv')
twenty6 = pd.read_csv('D-26.csv')
twenty7 = pd.read_csv('D-27.csv')
twenty8 = pd.read_csv('D-28.csv')
twenty9 = pd.read_csv('D-29.csv')
thirty = pd.read_csv('D-30.csv')
thirty1 = pd.read_csv('D-31.csv')
thirty2 = pd.read_csv('D-32.csv')

# spojení všech .csv do jednoho souboru
projekt_data = pd.concat([one, two, three, four, five, six, seven, eight, nine, ten, ten1, ten2, ten3, ten4, ten5, ten6, ten7, ten8, ten9, twenty, twenty1, twenty2, twenty3, twenty4, twenty5, twenty6, twenty7, twenty8, twenty9, thirty, thirty1, thirty2], ignore_index=True)
#print(projekt_data)

# informce o dataframu - vypíše sloupce, řádky, not-null a typy objektu v daném sloupci
#one.info()
#two.info()
#three.info()
# ... ard.
#projekt_data.info()

# kontrola počet řádků a sloupců
print(one.shape)
print(two.shape)
print(three.shape)
print(projekt_data)
