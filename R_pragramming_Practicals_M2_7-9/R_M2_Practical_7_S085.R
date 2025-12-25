# Load library
library(dplyr)

# Import dataset
employee_data <- read.csv("employee_salary_dataset.csv")

# View data
head(employee_data)
str(employee_data)

# Convert Department to factor
employee_data$Department <- as.factor(employee_data$Department)

# Perform One-Way ANOVA
anova_result <- aov(Monthly_Salary ~ Department, data = employee_data)

# ANOVA summary
summary(anova_result)

# Post-hoc test
TukeyHSD(anova_result)
