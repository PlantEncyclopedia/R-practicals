library(lubridate)
library(dplyr)
library(readr)

# 1. Load the data
df <- read_csv("BMW sales data (2010-2024).csv")

print("--- Data Loaded (First 6 Rows) ---")
print(head(df))

# ----------------------------------------------------------------------

print("--- OUTPUT OF str() ---")
str(df)

# ----------------------------------------------------------------------

print("--- OUTPUT OF summary() [Before Factor Conversion] ---")
summary(df)

# ----------------------------------------------------------------------

# 4. Convert character columns to factors to improve summary() output
df$Region <- as.factor(df$Region)
df$Fuel_Type <- as.factor(df$Fuel_Type)

print("--- OUTPUT OF summary() [After Factor Conversion] ---")
summary(df)

# ----------------------------------------------------------------------

# 5. Accessing Specific Summaries
# na.rm = TRUE handles any missing values, though the data is complete
avg_price <- mean(df$Price_USD, na.rm = TRUE)
max_sales_volume <- max(df$Sales_Volume, na.rm = TRUE)

print("--- Accessing Specific Summaries ---")
print(paste("Average Price (USD):", format(round(avg_price, 2), big.mark = ",")))
print(paste("Highest Sales Volume:", format(max_sales_volume, big.mark = ",")))

