import pandas as pd

# Seznam názvů datasetů
dataset_names = ["D-1.csv", "D-2.csv", "D-3.csv", "D-4.csv", "D-5.csv", "D-6.csv", "D-7.csv", "D-8.csv", "D-9.csv", "D-10.csv", "D-11.csv", "D-12.csv", "D-13.csv", "D-14.csv", "D-15.csv", "D-16.csv","D-17.csv"]

# Připojení datasetů
joined_dataset = pd.concat(
    [pd.read_csv(dataset_name) for dataset_name in dataset_names], ignore_index=True
)

print(joined_dataset)