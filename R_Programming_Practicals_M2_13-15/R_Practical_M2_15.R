library(writexl)

# Load dataset
data <- read.csv("student_performance_dataset.csv")


linear_model <- lm(
  final_score ~ study_hours + attendance_percentage + previous_score + practice_tests,
  data = data
)

linear_summary <- summary(linear_model)

linear_results <- data.frame(
  Model = "Linear Regression",
  Term = rownames(linear_summary$coefficients),
  Estimate = linear_summary$coefficients[, 1],
  Std_Error = linear_summary$coefficients[, 2],
  stat_value = linear_summary$coefficients[, 3],  # t-value
  p_value = linear_summary$coefficients[, 4]
)

logistic_model <- glm(
  passed ~ study_hours + attendance_percentage + previous_score + practice_tests,
  data = data,
  family = binomial
)

logistic_summary <- summary(logistic_model)

logistic_results <- data.frame(
  Model = "Logistic Regression",
  Term = rownames(logistic_summary$coefficients),
  Estimate = logistic_summary$coefficients[, 1],
  Std_Error = logistic_summary$coefficients[, 2],
  stat_value = logistic_summary$coefficients[, 3], # z-value
  p_value = logistic_summary$coefficients[, 4]
)

final_results <- rbind(
  linear_results,
  logistic_results
)

# -----------------------------
# EXPORT RESULTS
# -----------------------------
write.csv(
  final_results,
  "calculations.csv",
  row.names = FALSE
)

write_xlsx(
  final_results,
  "calculations.xlsx"
)

print("Linear and Logistic Regression calculations exported successfully.")
