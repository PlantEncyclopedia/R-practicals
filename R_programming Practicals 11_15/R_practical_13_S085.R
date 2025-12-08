library(dplyr)

# Load CSV
data <- read.csv("customer.csv")

print("--- Original Dataset ---")
print(data)

# Identify duplicates
duplicates_report <- data %>% 
  group_by(across(everything())) %>% 
  count() %>% 
  filter(n > 1)

print("--- Duplicate Rows ---")
print(duplicates_report)

# Remove exact duplicates
clean_exact <- data %>% distinct()
print("--- Exact Duplicates Removed ---")
print(clean_exact)

# Keep unique customers (first occurrence)
unique_customers <- data %>% 
  distinct(customer_name, .keep_all = TRUE)

print("--- Unique Customers ---")
print(unique_customers)
