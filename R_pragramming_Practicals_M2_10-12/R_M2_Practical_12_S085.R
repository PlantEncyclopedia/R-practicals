install.packages("readr")
install.packages("dplyr")

library(readr)
library(dplyr)

student <- read_csv("student_performance.csv")

print(head(student))

numeric_data <- student %>%
  select(where(is.numeric))

correlation_matrix <- cor(
  numeric_data,
  use = "complete.obs",
  method = "pearson"
)

print(correlation_matrix)
