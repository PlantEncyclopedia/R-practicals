# Install required packages

install.packages("dplyr")
install.packages("psych")

# Load libraries

library(dplyr)
library(psych)

# Load the CSV dataset from working directory

df <- read.csv("data_science_student_marks.csv")

# Calculate total marks obtained by each student

df$Total_Marks <- df$sql_marks +
  df$excel_marks +
  df$python_marks +
  df$power_bi_marks +
  df$english_marks

# Calculate percentage from total marks

df$Percentage <- (df$Total_Marks / 500) * 100

# Create performance group based on percentage

df$Performance_Group <- ifelse(df$Percentage >= 80, "High", "Low")

# Display descriptive statistics using summary()

summary(df$Total_Marks)
summary(df$Percentage)

# Display detailed descriptive statistics using describe()

describe(df$python_marks)
describe(df$Total_Marks)
