library(dplyr)
library(readr)

fraud_data <- read_csv("synthetic_fraud_dataset.csv")

cat("--- Initial Data Load ---\n")
print(head(fraud_data))
cat("\n")

fraud_sorted_amount <- fraud_data |>
  arrange(amount)
cat("--- 1. Top 5 Lowest Transaction Amounts ---\n")
print(head(fraud_sorted_amount, 5))

fraud_sorted_amount_desc <- fraud_data |>
  arrange(desc(amount))
cat("\n--- 2. Top 5 Highest Transaction Amounts ---\n")
print(head(fraud_sorted_amount_desc, 5))

fraud_sorted_category_amount <- fraud_data |>
  arrange(merchant_category, desc(amount))
cat("\n--- 3. Top 10 Transactions: Sorted by Category, then by highest Amount ---\n")
print(head(fraud_sorted_category_amount, 10))

high_risk_sorted_country <- fraud_data |>
  filter(device_risk_score > 0.95) |> 
  arrange(country)
cat("\n--- 4. Transactions with Device Risk > 0.95, sorted by Country ---\n")
print(head(high_risk_sorted_country))

low_ip_risk_sorted <- fraud_data |>
  arrange(ip_risk_score)
cat("\n--- 5. Top 5 Lowest IP Risk Scores ---\n")
print(head(low_ip_risk_sorted, 5))