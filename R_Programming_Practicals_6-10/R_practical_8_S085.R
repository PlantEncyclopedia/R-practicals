# Load libraries
library(dplyr)
library(tidyr)

# Import dataset (treat empty cells as NA)
cs_df <- read.csv("cs_student_performance.csv", na.strings = c("", "NA"))

print("Original Data (First 6 Rows)")
print(head(cs_df))

# Check missing value count
print(" Missing Values Per Column ")
print(colSums(is.na(cs_df)))

# METHOD A — Remove rows containing ANY missing values

clean_omit <- na.omit(cs_df)

print(" Data After Removing Missing Rows ")
print(paste("Original rows:", nrow(cs_df)))
print(paste("Rows after na.omit:", nrow(clean_omit)))

# METHOD B — Replace Missing Values

# Mean CGPA for replacement
avg_cgpa <- mean(cs_df$cgpa, na.rm = TRUE)

clean_replace <- cs_df %>%
  replace_na(list(
    name = "Unknown",
    age = median(cs_df$age, na.rm = TRUE),
    department = "Not Assigned",
    cgpa = avg_cgpa,
    python_marks = 0,
    java_marks = 0,
    ds_marks = 0,
    ml_marks = 0,
    attendance = 0
  ))

print(" Data After Replacing Missing Values ")
print(head(clean_replace))

# Remaining missing values
print(" Remaining NAs ")
print(colSums(is.na(clean_replace)))
