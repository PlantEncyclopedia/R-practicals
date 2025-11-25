library(dplyr)
library(readr)

housing_data <- read_csv("Housing.csv")

cat("--- Initial Data Load ---\n")
print(head(housing_data))
cat("\n")

expensive_homes <- subset(housing_data, price > 8000000)
cat("--- 1. Highly Priced Homes (price > 8,000,000) ---\n")
cat("Number of homes with price > 8,000,000:", nrow(expensive_homes), "\n")
cat("Summary of prices:\n")
print(summary(expensive_homes$price))

furnished_homes <- subset(housing_data, furnishingstatus == "furnished")
cat("\n--- 2. Fully Furnished Homes (furnishingstatus == 'furnished') ---\n")
cat("Number of fully furnished homes:", nrow(furnished_homes), "\n")
print(head(furnished_homes))

special_homes <- subset(
  housing_data,
  area > 10000 | stories == 4
)
cat("\n--- 3. Special Homes (area > 10000 OR stories == 4) ---\n")
cat("Special homes (Large Area OR Max Stories):", nrow(special_homes), "\n")
print(head(special_homes))

low_cost_filter <- housing_data %>%
  filter(price < 3000000)
cat("\n--- 4. Low-Priced Homes (price < 3,000,000) ---\n")
cat("Number of homes with price < 3,000,000:", nrow(low_cost_filter), "\n")
cat("Summary of prices:\n")
print(summary(low_cost_filter$price))

pref_area_large <- housing_data %>%
  filter(prefarea == "yes", bedrooms > 3)
cat("\n--- 5. Homes in Preferred Area with > 3 Bedrooms ---\n")
cat("Count:", nrow(pref_area_large), "\n")
print(head(pref_area_large))

comfort_filter <- housing_data %>%
  filter(airconditioning == "yes" | hotwaterheating == "yes")
cat("\n--- 6. Homes with Air Conditioning or Hot Water Heating ---\n")
cat("Homes with comfort amenities count:", nrow(comfort_filter), "\n")
cat("Breakdown by Air Conditioning status:\n")
print(table(comfort_filter$airconditioning))