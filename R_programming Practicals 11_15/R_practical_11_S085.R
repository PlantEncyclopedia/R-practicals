library(dplyr)
library(tidyr)
library(stringr)

# reading dataset
data <- read.csv("Amazon.csv",na.strings = c("","NA")) %>%
  mutate(OrderID = row_number()) %>%
  select(OrderID,CustomerID,Category,UnitPrice,Discount)

print("1.Original Wide Data")
print(head(data))

# 2.PIVOT_Longer (wide to Long)

long_data <- data %>%
  pivot_longer(
    cols = c(UnitPrice, Discount),
    names_to = "Metric",
    values_to = "Value"
  )

# 3. PIVOT_WIDER (Long to Wide)

wide_data <- long_data %>%
  pivot_wider(
    names_from = Metric,
    values_from = Value
  )
print("3. Wide Format (Back to Original)")
print(head(wide_data))

# 4. ADVANCED EXAMPLE (Reshaping for Reporting)

data_clean <- data %>%
  mutate(Category = ifelse(is.na(Category), "Unknown", Category))
category_pivot <- data_clean %>%
  select(OrderID, Category, UnitPrice) %>%
  pivot_wider(
    names_from = Category,
    values_from = UnitPrice
  )
print("4. Category Pivot (Spreading Categories)")
print(head(category_pivot))

