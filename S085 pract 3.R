
library(readr)   
library(psych)   

my_data <- read.csv("Shark Tank Brasil dataset.csv")

# View the first few rows
cat("\n--- head(my_data) ---\n")
print(head(my_data))

# View the last few rows
cat("\n--- tail(my_data) ---\n")
print(tail(my_data))

# Get the dimensions (rows and columns)
cat("\n--- dim(my_data) ---\n")
cat("Dimensions (Rows, Columns): ", dim(my_data), "\n")

# Check structure (types of variables)
cat("\n--- str(my_data) ---\n")
str(my_data)

# Summary of dataset
cat("\n--- summary(my_data) ---\n")
print(summary(my_data))

# Column names
cat("\n--- names(my_data) ---\n")
cat("Column Names: ", names(my_data), "\n")

# Detailed descriptive statistics (using the 'psych' package)
cat("\n--- describe(my_data) ---\n")
print(describe(my_data))