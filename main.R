# Create the outputs/R directory if it doesn't exist
if (!dir.exists("outputs/R")) {
  dir.create("outputs/R", recursive = TRUE)
}

# Specify the output PDF file path
pdf("outputs/R/customer_churn_analysis.pdf", width = 8, height = 6)

# Load required libraries
library(ggplot2)
library(dplyr)

# Load the datasets
customer_churn_df <- read.csv("dataset/telecom_customer_churn.csv")
zipcode_population_df <- read.csv("dataset/telecom_zipcode_population.csv")

# Exploratory Data Analysis (EDA)

# 1. Data Overview
head(customer_churn_df)
str(customer_churn_df)
summary(customer_churn_df)

# 2. Churn Rate Analysis
churn_rate <- mean(customer_churn_df$Customer.Status == "Churned")
cat(sprintf("Overall Churn Rate: %.2f%%\n", churn_rate * 100))

# 3. Gender Distribution
ggplot(customer_churn_df, aes(x = Gender, fill = Customer.Status)) +
  geom_bar(position = "dodge") +
  ggtitle("Gender Distribution by Churn Status") +
  theme_minimal()

# 4. Age Distribution
ggplot(customer_churn_df, aes(x = Age, fill = Customer.Status)) +
  geom_histogram(binwidth = 5, position = "dodge", alpha = 0.7) +
  ggtitle("Age Distribution by Churn Status") +
  theme_minimal()

# 5. Tenure Analysis
ggplot(customer_churn_df, aes(x = Customer.Status, y = Tenure.in.Months)) +
  geom_boxplot() +
  ggtitle("Tenure in Months by Churn Status") +
  theme_minimal()

# 6. Service Usage Analysis
ggplot(customer_churn_df, aes(x = Internet.Service, fill = Customer.Status)) +
  geom_bar(position = "dodge") +
  ggtitle("Internet Service Usage by Churn Status") +
  theme_minimal()

# 7. Contract Type Analysis
ggplot(customer_churn_df, aes(x = Contract, fill = Customer.Status)) +
  geom_bar(position = "dodge") +
  ggtitle("Contract Type by Churn Status") +
  theme_minimal()

# 8. Payment Method Analysis
ggplot(customer_churn_df, aes(x = Payment.Method, fill = Customer.Status)) +
  geom_bar(position = "dodge") +
  ggtitle("Payment Method by Churn Status") +
  theme_minimal()


# Close the PDF device
dev.off()

cat("Plots saved in outputs/R/customer_churn_analysis.pdf\n")