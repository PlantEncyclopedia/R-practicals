library(lubridate)
library(dplyr)

# Load dataset
amazon_df <- read.csv("Amazon.csv")

date_col <- "Date"     # Example: "Order_Date", "Purchase_Date", etc.

# Convert date column to Date type and extract components
processed_data <- amazon_df %>%
  mutate(
    Actual_Date = ymd(.data[[OrderDate]]),
    Year_Num = year(Actual_Date),
    Month_Num = month(Actual_Date),
    Month_Name = month(Actual_Date, label = TRUE),
    Day_Num = day(Actual_Date),
    Weekday_Num = wday(Actual_Date),
    Weekday_Name = wday(Actual_Date, label = TRUE, abbr = FALSE),
    Quarter = quarter(Actual_Date),
    Day_of_Year = yday(Actual_Date)
  )

print(" Data with Extracted Date Components")
print(processed_data)

# System date extraction
current_time <- now()
print(paste("Current Year:", year(current_time)))
print(paste("Current Hour:", hour(current_time)))
print(paste("Current Minute:", minute(current_time)))


