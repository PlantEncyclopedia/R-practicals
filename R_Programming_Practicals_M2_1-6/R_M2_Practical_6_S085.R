#install.packages("ggplot2")
#install.packages("tidyr") 

library(dplyr)
library(ggplot2)
library(tidyr)


data <- read.csv("StudentsPerformance.csv", stringsAsFactors = TRUE)

head(data)

# Paired t-tests
t.test(data$math.score, data$reading.score, paired = TRUE)
t.test(data$math.score, data$writing.score, paired = TRUE)
t.test(data$reading.score, data$writing.score, paired = TRUE)

# Convert data to long format for visualization
score_data <- data %>%
  select(math.score, reading.score, writing.score) %>%
  pivot_longer(cols = everything(),
               names_to = "Subject",
               values_to = "Score")

# Boxplot to compare score distributions
ggplot(score_data, aes(x = Subject, y = Score)) +
  geom_boxplot() +
  labs(title = "Comparison of Student Scores Across Subjects",
       x = "Subject",
       y = "Score") +
  theme_minimal()

# Line plot showing paired nature of scores
ggplot(data, aes(x = math.score, y = reading.score)) +
  geom_point() +
  geom_abline(slope = 1, intercept = 0, linetype = "dashed") +
  labs(title = "Math vs Reading Scores (Paired Comparison)",
       x = "Math Score",
       y = "Reading Score") +
  theme_minimal()
