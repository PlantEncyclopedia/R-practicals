# Practical 13: Linear Regression using lm()

# Install required packages (run once)
#install.packages("ggplot2")
#install.packages("readr")
#install.packages("rlang")
#install.packages("vctrs")

# Load libraries
library(ggplot2)
library(readr)

# Load the CSV file
student_data <- read_csv("data_science_student_marks.csv")

# View first few rows
head(student_data)

# Linear Regression Model
# Predicting python_marks using sql_marks and excel_marks
model <- lm(python_marks ~ sql_marks + excel_marks, data = student_data)

# Display model summary
summary(model)

# Scatter plot with regression line (SQL vs Python)
ggplot(student_data, aes(x = sql_marks, y = python_marks)) +
  geom_point() +
  geom_smooth(method = "lm", se = FALSE) +
  labs(
    title = "Linear Regression: SQL Marks vs Python Marks",
    x = "SQL Marks",
    y = "Python Marks"
  )
