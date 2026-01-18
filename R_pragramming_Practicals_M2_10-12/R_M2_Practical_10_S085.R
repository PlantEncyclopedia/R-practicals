#installing libraries
install.packages("ggplot2")
install.packages("dplyr")
install.packages("readr")

# Loading required libraries
library(ggplot2)
library(dplyr)
library(readr)

# Loading dataset
employee <- read_csv("employee_salary_dataset.csv")

#showing some data

print(head("employee"))

#Plotting  Scatter Plot: Experience vs Monthly Salary
ggplot(employee,
       aes(x = Experience_Years,
           y = Monthly_Salary,
           color = Department)) +
  geom_point(alpha = 0.7, size = 2) +
  labs(
    title = "Monthly Salary vs Experience",
    x = "Experience (Years)",
    y = "Monthly Salary",
    color = "Department"
  ) +
  theme_minimal()

# plotting Pie Chart: Employee Distribution by Department
employee %>%
  group_by(Department) %>%
  summarise(total_employees = n()) %>%
  ggplot(aes(x = "", y = total_employees, fill = Department)) +
  geom_bar(stat = "identity", width = 1) +
  coord_polar("y") +
  labs(
    title = "Employee Distribution by Department",
    fill = "Department"
  ) +
  theme_void()

# plotting High–Low Chart: Salary Range by Department
employee %>%
  group_by(Department) %>%
  summarise(
    min_salary = min(Monthly_Salary, na.rm = TRUE),
    max_salary = max(Monthly_Salary, na.rm = TRUE)
  ) %>%
  ggplot(aes(
    x = Department,
    ymin = min_salary,
    ymax = max_salary
  )) +
  geom_linerange(size = 2, color = "steelblue") +
  geom_point(aes(y = min_salary), color = "red", size = 3) +
  geom_point(aes(y = max_salary), color = "darkgreen", size = 3) +
  labs(
    title = "High–Low Salary Chart by Department",
    x = "Department",
    y = "Monthly Salary"
  ) +
  theme_minimal()
