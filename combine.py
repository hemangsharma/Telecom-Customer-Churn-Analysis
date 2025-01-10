import pandas as pd

# Read the datasets with the correct encoding and handle potential issues
customer_churn_df = pd.read_csv("dataset/telecom_customer_churn.csv", encoding='utf-8', on_bad_lines='skip')
zipcode_population_df = pd.read_csv("dataset/telecom_zipcode_population.csv", encoding='utf-8')

# Check and ensure that column names match correctly
print("Customer churn columns:", customer_churn_df.columns)
print("Zipcode population columns:", zipcode_population_df.columns)

# Merge the datasets on the 'Zip Code' column
merged_df = pd.merge(customer_churn_df, zipcode_population_df, on="Zip Code", how="left")

# Display a summary of the merged DataFrame
print("Merged DataFrame info:")
print(merged_df.info())

# Save the merged data to a new CSV file (optional)
merged_df.to_csv("dataset/merged_telecom_data.csv", index=False)