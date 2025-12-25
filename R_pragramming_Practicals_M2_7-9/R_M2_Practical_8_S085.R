# Load library
library(dplyr)

# Import dataset
employee_data <- read.csv("employee_salary_dataset.csv")

# View structure
str(employee_data)

# Convert categorical variables to factors
employee_data$Department <- as.factor(employee_data$Department)
employee_data$Gender <- as.factor(employee_data$Gender)

# Two-Way ANOVA with interaction
anova_result <- aov(Monthly_Salary ~ Department * Gender, data = employee_data)

# Display ANOVA table
summary(anova_result)
