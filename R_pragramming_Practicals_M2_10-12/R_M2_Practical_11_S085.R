#imporitng libraries

library(ggplot2)
library(dplyr)
library(readr)

#loading datasets

employee <- read_csv("employee_salary_dataset.csv")

#printing some data

head(employee)

#plotting histogram

ggplot(employee, aes(x = Monthly_Salary)) +
  geom_histogram(bins = 10, fill = "skyblue", color = "black") +
  labs(
    title = "Histogram of Monthly Salary",
    x = "Monthly Salary",
    y = "Frequency"
  ) +
  theme_minimal()

#plotting box plot

ggplot(employee, aes(x = Department, y = Monthly_Salary, fill = Department)) +
  geom_boxplot() +
  labs(
    title = "Box Plot of Monthly Salary by Department",
    x = "Department",
    y = "Monthly Salary"
  ) +
  theme_minimal() +
  theme(legend.position = "none")
